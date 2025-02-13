local string_gsub, floor, pairs = string.gsub, math.floor, pairs
local CreateFrame, SetPortraitTexture = CreateFrame, SetPortraitTexture
local UnitHealthMax, UnitHealth, UnitGUID = UnitHealthMax, UnitHealth, UnitGUID

local Gladdy = LibStub("Gladdy")
local L = Gladdy.L
local Pets = Gladdy:NewModule("Pets", nil, {
    petEnabled = true,
    petWidth = 128,
    petHeight = 20,
    petPortraitEnabled = true,
    petPortraitBorderStyle = "Interface\\AddOns\\Gladdy\\Images\\Border_rounded_blp",
    petHealthBarFont = "DorisPP",
    petHealthBarHeight = 60,
    petHealthBarTexture = "Smooth",
    petHealthBarBorderStyle = "Gladdy Tooltip round",
    petHealthBarBorderSize = 9,
    petHealthBarBorderColor = { r = 0, g = 0, b = 0, a = 1 },
    petHealthBarColor = { r = 0, g = 1, b = 0, a = 1 },
    petHealthBarBgColor = { r = 0, g = 0, b = 0, a = 0.4 },
    petHealthBarFontColor = { r = 1, g = 1, b = 1, a = 1 },
    petHealthBarFontSize = 12,
    petHealthPercentage = true,
    petXOffset = 1,
    petYOffset = -62,
})

function Pets:Initialize()
    self.frames = {}
    self:RegisterMessage("JOINED_ARENA")
    self:RegisterMessage("PET_SPOTTED")
    self:RegisterMessage("PET_DESTROYED")
    self:RegisterMessage("PET_STEALTH")
    self:RegisterMessage("ENEMY_SPOTTED")
end

function Pets:JOINED_ARENA()
    for k,v in pairs(self.frames) do
        v.healthBar:SetAlpha(0)
    end
    if Gladdy.db.petEnabled then
        self:RegisterEvent("UNIT_PET")
        self:SetScript("OnEvent", function(self, event, unitId)
            if event == "UNIT_PET" then
                local unit = Gladdy.guids[UnitGUID(unitId)]
                if unit then
                    Pets:CheckUnitPet(unit)
                end
            end
        end)
    end
end

function Pets:ResetUnit(unitId)
    local unit = string_gsub(unitId, "%d$", "pet%1")
    local petFrame = self.frames[unit]
    if (not petFrame) then
        return
    end
    petFrame.healthBar:SetAlpha(0)
    petFrame.healthBar:SetScript("OnUpdate", nil)
    self:UnregisterEvent("UNIT_PET")
end

function Pets:PET_SPOTTED(unit)
    if Gladdy.db.petEnabled then
        self.frames[unit].healthBar:SetAlpha(1)
        self.frames[unit].healthBar.hp:SetStatusBarColor(Gladdy.db.petHealthBarColor.r, Gladdy.db.petHealthBarColor.g, Gladdy.db.petHealthBarColor.b, Gladdy.db.petHealthBarColor.a)
        self.frames[unit].healthBar:SetScript("OnUpdate", function(self)
            self.hp:SetValue(UnitHealth(self.unit))
            Pets:SetHealthText(self, UnitHealth(unit), UnitHealthMax(unit))
        end)
    end
end

function Pets:PET_DESTROYED(unit)
    if Gladdy.db.petEnabled then
        self.frames[unit].healthBar:SetAlpha(0)
        self.frames[unit].healthBar:SetScript("OnUpdate", nil)
    end
end

function Pets:PET_STEALTH(unit)
    if Gladdy.db.petEnabled then
        self.frames[unit].healthBar.hp:SetStatusBarColor(0.66, 0.66, 0.66, 1)
    end
end

function Pets:ENEMY_SPOTTED(unit)
    if Gladdy.db.petEnabled then
        self:CheckUnitPet(unit)
    end
end

function Pets:CheckUnitPet(unitId)
    local unit = string_gsub(unitId, "%d$", "pet%1")
    local petFrame = self.frames[unit]
    if (not petFrame) then
        return
    end
    if ( UnitGUID(unit)) then
        petFrame.healthBar:SetAlpha(1)
        petFrame.healthBar.hp:SetMinMaxValues(0, UnitHealthMax(unit))
        petFrame.healthBar.hp:SetValue(UnitHealth(unit))
        Pets:SetHealthText(petFrame.healthBar, UnitHealth(unit), UnitHealthMax(unit))
        petFrame.healthBar:SetScript("OnUpdate", function(self)
            self.hp:SetValue(UnitHealth(self.unit))
            Pets:SetHealthText(self, UnitHealth(unit), UnitHealthMax(unit))
        end)
    else
        petFrame.healthBar:SetAlpha(0)
        petFrame.healthBar:SetScript("OnUpdate", nil)
    end
end

function Pets:Test(unitId)
    if Gladdy.db.petEnabled then
        local unit = string_gsub(unitId, "%d$", "pet%1")
        local petFrame = self.frames[unit]
        if (not petFrame) then
            return
        end
        petFrame.healthBar:SetAlpha(1)
        petFrame.healthBar.hp:SetMinMaxValues(0, 6200)
        petFrame.healthBar.hp:SetValue(2000)
        Pets:SetHealthText(petFrame.healthBar, 2000, 6200)
        SetPortraitTexture(petFrame.healthBar.portrait, "player")
    end
end

function Pets:CreateFrame(unitId)
    local unit = string_gsub(unitId, "%d$", "pet%1")
    if self.frames[unit] then
        return
    end
    local button = CreateFrame("Frame", "GladdyButtonFramePet" .. unit, Gladdy.frame)
    --button:SetAlpha(0)
    button:SetPoint("LEFT", Gladdy.buttons[unitId].healthBar, "RIGHT", Gladdy.db.petXOffset, Gladdy.db.petYOffset)

    local secure = CreateFrame("Button", "GladdyButton" .. unit, button, "SecureActionButtonTemplate, SecureHandlerEnterLeaveTemplate")
    secure:RegisterForClicks("AnyUp")
    secure:RegisterForClicks("AnyDown")
    secure:SetAttribute("*type1", "target")
    secure:SetAttribute("*type2", "focus")
    secure:SetAttribute("unit", unit)
    secure:SetAllPoints(button)

    button.unit = unit
    button.secure = secure

    local healthBar = CreateFrame("Frame", nil, button, BackdropTemplateMixin and "BackdropTemplate")
    healthBar:SetBackdrop({ edgeFile = Gladdy.LSM:Fetch("border", Gladdy.db.petHealthBarBorderStyle),
                            edgeSize = Gladdy.db.petHealthBarBorderSize })
    healthBar:SetBackdropBorderColor(Gladdy.db.petHealthBarBorderColor.r, Gladdy.db.petHealthBarBorderColor.g, Gladdy.db.petHealthBarBorderColor.b, Gladdy.db.petHealthBarBorderColor.a)
    healthBar:SetFrameLevel(1)
    healthBar:SetAllPoints(button)
    healthBar:SetAlpha(0)

    healthBar.portrait = healthBar:CreateTexture(nil, "BACKGROUND")
    healthBar.portrait:SetPoint("LEFT", healthBar, "RIGHT")
    healthBar.portrait:SetTexCoord(0.1, 0.9, 0.1, 0.9)
    SetPortraitTexture(healthBar.portrait, "player")
    healthBar.portrait.border = healthBar:CreateTexture(nil, "OVERLAY")
    healthBar.portrait.border:SetAllPoints(healthBar.portrait)
    healthBar.portrait.border:SetTexture(Gladdy.db.classIconBorderStyle)
    healthBar.portrait.border:SetVertexColor(Gladdy.db.petHealthBarBorderColor.r, Gladdy.db.petHealthBarBorderColor.g, Gladdy.db.petHealthBarBorderColor.b, Gladdy.db.petHealthBarBorderColor.a)


    healthBar.hp = CreateFrame("StatusBar", nil, healthBar)
    healthBar.hp:SetStatusBarTexture(Gladdy.LSM:Fetch("statusbar", Gladdy.db.petHealthBarTexture))
    healthBar.hp:SetStatusBarColor(Gladdy.db.petHealthBarColor.r, Gladdy.db.petHealthBarColor.g, Gladdy.db.petHealthBarColor.b, Gladdy.db.petHealthBarColor.a)
    healthBar.hp:SetMinMaxValues(0, 100)
    healthBar.hp:SetFrameLevel(0)
    healthBar.hp:SetAllPoints(healthBar)

    healthBar.bg = healthBar.hp:CreateTexture(nil, "BACKGROUND")
    healthBar.bg:SetTexture(Gladdy.LSM:Fetch("statusbar", Gladdy.db.petHealthBarTexture))
    healthBar.bg:ClearAllPoints()
    healthBar.bg:SetAllPoints(healthBar.hp)
    healthBar.bg:SetAlpha(1)
    healthBar.bg:SetVertexColor(Gladdy.db.petHealthBarBgColor.r, Gladdy.db.petHealthBarBgColor.g, Gladdy.db.petHealthBarBgColor.b, Gladdy.db.petHealthBarBgColor.a)

    healthBar.nameText = healthBar:CreateFontString(nil, "LOW", "GameFontNormalSmall")
    if (Gladdy.db.petHealthBarFontSize < 1) then
        healthBar.nameText:SetFont(Gladdy.LSM:Fetch("font", Gladdy.db.petHealthBarFont), 1)
        healthBar.nameText:Hide()
    else
        healthBar.nameText:SetFont(Gladdy.LSM:Fetch("font", Gladdy.db.petHealthBarFont), Gladdy.db.petHealthBarFontSize)
        healthBar.nameText:Show()
    end
    healthBar.nameText:SetTextColor(Gladdy.db.petHealthBarFontColor.r, Gladdy.db.petHealthBarFontColor.g, Gladdy.db.petHealthBarFontColor.b, Gladdy.db.petHealthBarFontColor.a)
    healthBar.nameText:SetShadowOffset(1, -1)
    healthBar.nameText:SetShadowColor(0, 0, 0, 1)
    healthBar.nameText:SetJustifyH("CENTER")
    healthBar.nameText:SetPoint("LEFT", 5, 0)

    healthBar.healthText = healthBar:CreateFontString(nil, "LOW")
    if (Gladdy.db.petHealthBarFontSize < 1) then
        healthBar.healthText:SetFont(Gladdy.LSM:Fetch("font", Gladdy.db.petHealthBarFont), 1)
        healthBar.healthText:Hide()
    else
        healthBar.healthText:SetFont(Gladdy.LSM:Fetch("font", Gladdy.db.petHealthBarFont), Gladdy.db.petHealthBarFontSize)
        healthBar.healthText:Hide()
    end
    healthBar.healthText:SetTextColor(Gladdy.db.petHealthBarFontColor.r, Gladdy.db.petHealthBarFontColor.g, Gladdy.db.petHealthBarFontColor.b, Gladdy.db.petHealthBarFontColor.a)
    healthBar.healthText:SetShadowOffset(1, -1)
    healthBar.healthText:SetShadowColor(0, 0, 0, 1)
    healthBar.healthText:SetJustifyH("CENTER")
    healthBar.healthText:SetPoint("RIGHT", -5, 0)

    healthBar.unit = unit
    button.healthBar = healthBar

    healthBar:RegisterUnitEvent("UNIT_HEALTH", unit)
    healthBar:RegisterUnitEvent("UNIT_MAXHEALTH", unit)
    healthBar:RegisterUnitEvent("UNIT_PORTRAIT_UPDATE", unit)
    healthBar:RegisterUnitEvent("UNIT_NAME_UPDATE", unit)
    healthBar:SetScript("OnEvent", Pets.OnEvent)

    button:SetWidth(Gladdy.db.petWidth)
    button:SetHeight(Gladdy.db.petHeight)

    self.frames[unit] = button
end

function Pets.OnEvent(self, event, unit)
    if event == "UNIT_PORTRAIT_UPDATE" then
        SetPortraitTexture(self.portrait, unit)
    end
    local health = UnitHealth(unit)
    local healthMax = UnitHealthMax(unit)
    self.hp:SetMinMaxValues(0, healthMax)
    self.hp:SetValue(health)
    Pets:SetHealthText(self, health, healthMax)
end

function Pets:UpdateFrame(unitId)
    local unit = string_gsub(unitId, "%d$", "pet%1")
    local healthBar = self.frames[unit].healthBar
    if (not healthBar) then
        return
    end

    if not Gladdy.db.petEnabled then
        self.frames[unit]:Hide()
    else
        self.frames[unit]:Show()
    end

    self.frames[unit]:SetWidth(Gladdy.db.petWidth)
    self.frames[unit]:SetHeight(Gladdy.db.petHeight)
    self.frames[unit]:SetPoint("LEFT", Gladdy.buttons[unitId].healthBar, "RIGHT", Gladdy.db.petXOffset, Gladdy.db.petYOffset)

    healthBar.portrait:SetHeight(Gladdy.db.petHeight)
    healthBar.portrait:SetWidth(Gladdy.db.petHeight)
    if not Gladdy.db.petPortraitEnabled then
        healthBar.portrait:Hide()
        healthBar.portrait.border:Hide()
    else
        healthBar.portrait:Show()
        healthBar.portrait.border:Show()
    end
    healthBar.portrait.border:SetTexture(Gladdy.db.petPortraitBorderStyle)
    healthBar.portrait.border:SetVertexColor(Gladdy.db.petHealthBarBorderColor.r, Gladdy.db.petHealthBarBorderColor.g, Gladdy.db.petHealthBarBorderColor.b, Gladdy.db.petHealthBarBorderColor.a)

    healthBar.bg:SetTexture(Gladdy.LSM:Fetch("statusbar", Gladdy.db.petHealthBarTexture))
    healthBar.bg:SetVertexColor(Gladdy.db.petHealthBarBgColor.r, Gladdy.db.petHealthBarBgColor.g, Gladdy.db.petHealthBarBgColor.b, Gladdy.db.petHealthBarBgColor.a)

    healthBar:SetBackdrop({ edgeFile = Gladdy.LSM:Fetch("border", Gladdy.db.petHealthBarBorderStyle),
                            edgeSize = Gladdy.db.petHealthBarBorderSize })
    healthBar:SetBackdropBorderColor(Gladdy.db.petHealthBarBorderColor.r, Gladdy.db.petHealthBarBorderColor.g, Gladdy.db.petHealthBarBorderColor.b, Gladdy.db.petHealthBarBorderColor.a)

    healthBar.hp:SetStatusBarTexture(Gladdy.LSM:Fetch("statusbar", Gladdy.db.petHealthBarTexture))
    healthBar.hp:SetStatusBarColor(Gladdy.db.petHealthBarColor.r, Gladdy.db.petHealthBarColor.g, Gladdy.db.petHealthBarColor.b, Gladdy.db.petHealthBarColor.a)
    healthBar.hp:ClearAllPoints()
    healthBar.hp:SetPoint("TOPLEFT", healthBar, "TOPLEFT", (Gladdy.db.petHealthBarBorderSize/Gladdy.db.statusbarBorderOffset), -(Gladdy.db.petHealthBarBorderSize/Gladdy.db.statusbarBorderOffset))
    healthBar.hp:SetPoint("BOTTOMRIGHT", healthBar, "BOTTOMRIGHT", -(Gladdy.db.petHealthBarBorderSize/Gladdy.db.statusbarBorderOffset), (Gladdy.db.petHealthBarBorderSize/Gladdy.db.statusbarBorderOffset))

    if (Gladdy.db.petHealthBarFontSize < 1) then
        healthBar.nameText:SetFont(Gladdy.LSM:Fetch("font", Gladdy.db.petHealthBarFont), 1)
        healthBar.healthText:SetFont(Gladdy.LSM:Fetch("font", Gladdy.db.petHealthBarFont), 1)
        healthBar.nameText:Hide()
        healthBar.healthText:Hide()
    else
        healthBar.nameText:SetFont(Gladdy.LSM:Fetch("font", Gladdy.db.petHealthBarFont), Gladdy.db.petHealthBarFontSize)
        healthBar.nameText:Show()
        healthBar.healthText:SetFont(Gladdy.LSM:Fetch("font", Gladdy.db.petHealthBarFont), Gladdy.db.petHealthBarFontSize)
        healthBar.healthText:Show()
    end
    healthBar.nameText:SetTextColor(Gladdy.db.petHealthBarFontColor.r, Gladdy.db.petHealthBarFontColor.g, Gladdy.db.petHealthBarFontColor.b, Gladdy.db.petHealthBarFontColor.a)
    healthBar.healthText:SetTextColor(Gladdy.db.petHealthBarFontColor.r, Gladdy.db.petHealthBarFontColor.g, Gladdy.db.petHealthBarFontColor.b, Gladdy.db.petHealthBarFontColor.a)
end

function Pets:SetHealthText(healthBar, health, healthMax)

    local healthText = ""
    if healthMax ~= 0 then
        local healthPercentage = floor(health * 100 / healthMax)

        if (Gladdy.db.petHealthPercentage) then
            healthText = ("%d%%"):format(healthPercentage)
        end
    else
        healthText = "DEAD"
    end

    healthBar.healthText:SetText(healthText)
end

local function option(params)
    local defaults = {
        get = function(info)
            local key = info.arg or info[#info]
            return Gladdy.dbi.profile[key]
        end,
        set = function(info, value)
            local key = info.arg or info[#info]
            Gladdy.dbi.profile[key] = value
            Gladdy.options.args.Pets.args.group.args.border.args.petHealthBarBorderSize.max = Gladdy.db.petHeight/2
            if Gladdy.db.petHealthBarBorderSize > Gladdy.db.petHeight/2 then
                Gladdy.db.petHealthBarBorderSize = Gladdy.db.petHeight/2
            end
            Gladdy:UpdateFrame()
        end,
    }

    for k, v in pairs(params) do
        defaults[k] = v
    end

    return defaults
end

function Pets:GetOptions()
    return {
        header = {
            type = "header",
            name = L["Pets"],
            order = 2,
        },
        petEnabled = Gladdy:option({
            type = "toggle",
            name = L["Enabled"],
            desc = L["Enables Pets module"],
            order = 3,
        }),
        group = {
            type = "group",
            childGroups = "tree",
            name = L["Frame"],
            order = 3,
            args = {
                general = {
                    type = "group",
                    name = L["General"],
                    order = 1,
                    args = {
                        headerAuras = {
                            type = "header",
                            name = L["General"],
                            order = 1,
                        },
                        petHeight = option({
                            type = "range",
                            name = L["Bar height"],
                            desc = L["Height of the bar"],
                            order = 3,
                            min = 10,
                            max = 100,
                            step = 1,
                            width = "full",
                        }),
                        petWidth = option({
                            type = "range",
                            name = L["Bar width"],
                            desc = L["Width of the bar"],
                            order = 4,
                            min = 10,
                            max = 300,
                            step = 1,
                            width = "full",
                        }),
                        petHealthBarTexture = option({
                            type = "select",
                            name = L["Bar texture"],
                            desc = L["Texture of the bar"],
                            order = 5,
                            dialogControl = "LSM30_Statusbar",
                            values = AceGUIWidgetLSMlists.statusbar,
                        }),
                        petHealthBarColor = Gladdy:colorOption({
                            type = "color",
                            name = L["Health color"],
                            desc = L["Color of the status bar"],
                            order = 6,
                            hasAlpha = true,
                        }),
                        petHealthBarBgColor = Gladdy:colorOption({
                            type = "color",
                            name = L["Background color"],
                            desc = L["Color of the status bar background"],
                            order = 7,
                            hasAlpha = true,
                        }),
                    },
                },
                portrait = {
                    type = "group",
                    name = L["Portrait"],
                    order = 2,
                    args = {
                        headerAuras = {
                            type = "header",
                            name = L["Portrait"],
                            order = 1,
                        },
                        petPortraitEnabled = Gladdy:option({
                            type = "toggle",
                            name = L["Enabled"],
                            order = 2,
                        }),
                        petPortraitBorderStyle = Gladdy:option({
                            type = "select",
                            name = L["Border style"],
                            order = 3,
                            values = Gladdy:GetIconStyles()
                        }),

                    },
                },
                font = {
                    type = "group",
                    name = L["Font"],
                    order = 3,
                    args = {
                        header = {
                            type = "header",
                            name = L["Font"],
                            order = 1,
                        },
                        petHealthBarFont = option({
                            type = "select",
                            name = L["Font"],
                            desc = L["Font of the bar"],
                            order = 11,
                            dialogControl = "LSM30_Font",
                            values = AceGUIWidgetLSMlists.font,
                        }),
                        petHealthBarFontColor = Gladdy:colorOption({
                            type = "color",
                            name = L["Font color"],
                            desc = L["Color of the text"],
                            order = 12,
                            hasAlpha = true,
                        }),
                        petHealthBarFontSize = option({
                            type = "range",
                            name = L["Font size"],
                            desc = L["Size of the text"],
                            order = 13,
                            min = 0,
                            max = 20,
                            width = "full",
                        }),
                    },
                },
                border = {
                    type = "group",
                    name = L["Border"],
                    order = 4,
                    args = {
                        header = {
                            type = "header",
                            name = L["Border"],
                            order = 1,
                        },
                        petHealthBarBorderStyle = option({
                            type = "select",
                            name = L["Border style"],
                            order = 21,
                            dialogControl = "LSM30_Border",
                            values = AceGUIWidgetLSMlists.border,
                        }),
                        petHealthBarBorderSize = option({
                            type = "range",
                            name = L["Border size"],
                            desc = L["Size of the border"],
                            order = 22,
                            min = 0.5,
                            max = Gladdy.db.petHeight/2,
                            step = 0.5,
                            width = "full",
                        }),
                        petHealthBarBorderColor = Gladdy:colorOption({
                            type = "color",
                            name = L["Border color"],
                            desc = L["Color of the border"],
                            order = 23,
                            hasAlpha = true,
                        }),
                    },
                },
                position = {
                    type = "group",
                    name = L["Position"],
                    order = 5,
                    args = {
                        header = {
                            type = "header",
                            name = L["Position"],
                            order = 1,
                        },
                        petXOffset = Gladdy:option({
                            type = "range",
                            name = L["Horizontal offset"],
                            order = 22,
                            min = -600,
                            max = 600,
                            step = 0.1,
                            width = "full",
                        }),
                        petYOffset = Gladdy:option({
                            type = "range",
                            name = L["Vertical offset"],
                            order = 23,
                            min = -600,
                            max = 600,
                            step = 0.1,
                            width = "full",
                        }),
                    }
                },
                healthValues = {
                    type = "group",
                    name = L["Health Values"],
                    order = 6,
                    args = {
                        header = {
                            type = "header",
                            name = L["Health Values"],
                            order = 1,
                        },
                        petHealthPercentage = option({
                            type = "toggle",
                            name = L["Show health percentage"],
                            desc = L["Show health percentage on the health bar"],
                            order = 33,
                        }),
                    },
                },
            },
        },
    }
end