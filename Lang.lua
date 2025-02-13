local setmetatable = setmetatable
local C_CreatureInfo = C_CreatureInfo

local GetLocale = GetLocale

local L = {}

-- Classes
L["Druid"] = C_CreatureInfo.GetClassInfo(11).className
L["Hunter"] = C_CreatureInfo.GetClassInfo(3).className
L["Mage"] = C_CreatureInfo.GetClassInfo(8).className
L["Paladin"] = C_CreatureInfo.GetClassInfo(2).className
L["Priest"] = C_CreatureInfo.GetClassInfo(5).className
L["Rogue"] = C_CreatureInfo.GetClassInfo(4).className
L["Shaman"] = C_CreatureInfo.GetClassInfo(7).className
L["Warlock"] = C_CreatureInfo.GetClassInfo(9).className
L["Warrior"] = C_CreatureInfo.GetClassInfo(1).className

-- Races
L["Human"] = C_CreatureInfo.GetRaceInfo(1).raceName
L["Orc"] = C_CreatureInfo.GetRaceInfo(2).raceName
L["Dwarf"] = C_CreatureInfo.GetRaceInfo(3).raceName
L["Night Elf"] = C_CreatureInfo.GetRaceInfo(4).raceName
L["Undead"] = C_CreatureInfo.GetRaceInfo(5).raceName
L["Tauren"] = C_CreatureInfo.GetRaceInfo(6).raceName
L["Gnome"] = C_CreatureInfo.GetRaceInfo(7).raceName
L["Troll"] = C_CreatureInfo.GetRaceInfo(8).raceName
L["Blood Elf"] = C_CreatureInfo.GetRaceInfo(10).raceName
L["Draenei"] = C_CreatureInfo.GetRaceInfo(11).raceName

if (GetLocale() == "ruRU") then
    -- Specs
    L["Balance"] = "Баланс"
    L["Feral"] = "Сила зверя"
    L["Restoration"] = "Исцеление"
    L["Beast Mastery"] = "Повелитель зверей"
    L["Marksmanship"] = "Стрельба"
    L["Survival"] = "Выживание"
    L["Arcane"] = "Тайная магия"
    L["Fire"] = "Огонь"
    L["Frost"] = "Лед"
    L["Holy"] = "Свет"
    L["Protection"] = "Защита"
    L["Retribution"] = "Возмездие"
    L["Discipline"] = "Послушание"
    L["Shadow"] = "Тьма"
    L["Assassination"] = "Ликвидация"
    L["Combat"] = "Бой"
    L["Subtlety"] = "Скрытность"
    L["Elemental"] = "Cтихии"
    L["Enhancement"] = "Совершенствование"
    L["Affliction"] = "Колдовство"
    L["Demonology"] = "Демонология"
    L["Destruction"] = "Разрушение"
    L["Arms"] = "Оружие"
    L["Fury"] = "Неистовство"

    -- Gladdy.lua
    L["Welcome to Gladdy!"] = "Вас приветствует Gladdy!"
    L["First run has been detected, displaying test frame."] = "Обнаружен первый запуск, показываем тестовое окно."
    L["Valid slash commands are:"] = "Валидные команды:"
    L["If this is not your first run please lock or move the frame to prevent this from happening."] = "Если это не первый запуск, переместите, либо закрепите окно во избежание показа окна."

    -- Frame.lua
    L["Gladdy - drag to move"] = "Gladdy - тащите для перемещения"

    -- Options.lua
    L["Announcements"] = "Оповещения"
    L["Announcement settings"] = "Настройки оповещения"
    L["Auras"] = "Ауры"
    L["Auras settings"] = "Настройки аур"
    L["Castbar"] = "Полоса применения"
    L["Castbar settings"] = "Настройки полосы применения"
    L["Classicon"] = "Иконка класса"
    L["Classicon settings"] = "Настройки иконки класса"
    L["Clicks"] = "Клики"
    L["Clicks settings"] = "Настройки кликов"
    L["Diminishings"] = "Диминишинги"
    L["Diminishings settings"] = "Настройки диминишингов"
    L["Healthbar"] = "Полоса жизней"
    L["Healthbar settings"] = "Настройки полосы жизней"
    L["Highlight"] = "Подсветка"
    L["Highlight settings"] = "Настройки подсветки"
    L["Nameplates"] = "Индикаторы здоровья"
    L["Nameplates settings"] = "Настройки индикаторов здоровья "
    L["Powerbar"] = "Полоса маны"
    L["Powerbar settings"] = "Настройки полосы маны"
    L["Score"] = "Счет"
    L["Score settings"] = "Настройки счета"
    L["Trinket"] = "Тринкет"
    L["Trinket settings"] = "Настройки тринкета"
    L["Reset module"] = "Сбросить настройки"
    L["Reset module to defaults"] = "Сбросить настройки модуля к начальным"
    L["No settings"] = "Нет настроек"
    L["Module has no settings"] = "Модуль не имеет настроек"
    L["General"] = "Основные"
    L["General settings"] = "Основные настройки"
    L["Lock frame"] = "Закрепить фрейм"
    L["Toggle if frame can be moved"] = "Включите, если фрейм можно двигать"
    L["Grow frame upwards"] = "Расти вверх"
    L["If enabled the frame will grow upwards instead of downwards"] = "Если включено, то фрейм будет расти вверх, а не вниз"
    L["Frame scale"] = "Масштаб фрейма"
    L["Scale of the frame"] = "Масштаб фрейма"
    L["Frame padding"] = "Отступы фрейма"
    L["Padding of the frame"] = "Отступы фрейма"
    L["Frame color"] = "Цвет фрейма"
    L["Color of the frame"] = "Цвет фрейма"
    L["Bar width"] = "Ширина полос"
    L["Width of the bars"] = "Ширина полос"
    L["Bottom margin"] = "Нижняя граница полосы"
    L["Margin between each button"] = "Отступ до следующей полосы"

    -- Announcements.lua
    L["RESURRECTING: %s (%s)"] = "ВОСКРЕШАЕТ: %s (%s)"
    L["SPEC DETECTED: %s - %s (%s)"] = "СПЕЦИАЛИЗАЦИЯ ОПРЕДЕЛЕНА: %s - %s (%s)"
    L["LOW HEALTH: %s (%s)"] = "МАЛО ЗДОРОВЬЯ: %s (%s)"
    L["TRINKET USED: %s (%s)"] = "ТРИНКЕТ ИСПОЛЬЗОВАН: %s (%s)"
    L["TRINKET READY: %s (%s)"] = "ТРИНКЕТ ГОТОВ: %s (%s)"
    L["DRINKING: %s (%s)"] = "ПЬЁТ: %s (%s)"
    L["Self"] = "Сам"
    L["Party"] = "Группа"
    L["Raid Warning"] = "Объявление рейду"
    L["Blizzard's Floating Combat Text"] = "Стандартный текст боя"
    L["MikScrollingBattleText"] = "MikScrollingBattleText"
    L["Scrolling Combat Text"] = "Scrolling Combat Text"
    L["Parrot"] = "Parrot"
    L["Drinking"] = "Питьё"
    L["Announces when enemies sit down to drink"] = "Оповещать, когда вражеский игрок начинает пить"
    L["Resurrection"] = "Воскрешение"
    L["Announces when an enemy tries to resurrect a teammate"] = "Оповещать, когда вражеский игрок начинает воскрешать союзника"
    L["New enemies"] = "Новые враги"
    L["Announces when new enemies are discovered"] = "Оповещать о найденных вражеских игроках"
    L["Spec Detection"] = "Обнаружение специализации"
    L["Announces when the spec of an enemy was detected"] = "Оповещать, когда обнаружена специализация вражеского игрока"
    L["Low health"] = "Мало жизней"
    L["Announces when an enemy drops below a certain health threshold"] = "Оповещать, когда уровень здоровья вражеского игрока падает ниже определенного количества"
    L["Low health threshold"] = "Процент малого количества здоровья"
    L["Choose how low an enemy must be before low health is announced"] = "Укажите процент здоровья вражеского игрока, когда нужно показать оповещение"
    L["Trinket used"] = "Использование пвп-тринкета"
    L["Announce when an enemy's trinket is used"] = "Оповещать об использовании пвп-тринкета вражеским игроком"
    L["Trinket ready"] = "Готовность пвп-тринкета"
    L["Announce when an enemy's trinket is ready again"] = "Оповещать, когда пвп-тринкет вражеского игрока готов"
    L["Destination"] = "Вариант оповещений"
    L["Choose how your announcements are displayed"] = "Выберать, как показывать оповещения"

    -- Auras.lua
    L["Font color"] = "Цвет текста"
    L["Color of the text"] = "Цвет текста"
    L["Font size"] = "Размер текста"
    L["Size of the text"] = "Размер текста"

    -- Castbar.lua
    L["Bar height"] = "Высота полосы"
    L["Height of the bar"] = "Высота полосы"
    L["Bar texture"] = "Текстура полосы"
    L["Texture of the bar"] = "Текстура полосы"
    L["Bar color"] = "Цвет полосы"
    L["Color of the cast bar"] = "Цвет полосы применений"
    L["Background color"] = "Цвет фона полосы"
    L["Color of the cast bar background"] = "Цвет фона полосы применений"
    L["Icon position"] = "Расположение значка трансляции"

    -- Diminishings.lua
    L["DR Cooldown position"] = "Позиция ДР таймеров"
    L["Position of the cooldown icons"] = "Позиция ДР таймеров"
    L["Left"] = "Слева"
    L["Right"] = "Справа"
    L["Icon Size"] = "Размер иконок"
    L["Size of the DR Icons"] = "Размер ДР иконок"

    -- Healthbar.lua
    L["Show the actual health"] = "Показывать текущее здоровье"
    L["Show the actual health on the health bar"] = "Показывать текущее здоровье на полосе жизней"
    L["Show max health"] = "Показывать максимальное здоровье"
    L["Show max health on the health bar"] = "Показывать максимальное здоровье на полосе жизней"
    L["Show health percentage"] = "Показывать здоровье в процентах"
    L["Show health percentage on the health bar"] = "Показывать здоровье в процентах на полосе жизней"

    -- Highlight.lua
    L["Border size"] = "Размер границы"
    L["Target border color"] = "Цвет контура цели"
    L["Color of the selected targets border"] = "Цвет контура цели"
    L["Focus border color"] = "Цвет контура фокуса"
    L["Color of the focus border"] = "Цвет контура фокуса"
    L["Raid leader border color"] = "Цвет контура цели рейд лидера"
    L["Color of the raid leader border"] = "Цвет контура цели рейд лидера"
    L["Highlight target"] = "Подсвечивать цель"
    L["Toggle if the selected target should be highlighted"] = "Включите, если необходима подсветка цели"
    L["Show border around target"] = "Показывать контур вокруг цели"
    L["Toggle if a border should be shown around the selected target"] = "Включите, если необходимо показывать контур вокруг цели"
    L["Show border around focus"] = "Показывать контур вокруг фокуса"
    L["Toggle of a border should be shown around the current focus"] = "Включите, если необходимо показывать контур вокруг фокуса"
    L["Show border around raid leader"] = "Показывать контур вокруг цели рейд лидера"
    L["Toggle if a border should be shown around the raid leader"] = "Включите, если необходимо показывать контур вокруг цели рейд лидера"

    -- Powerbar.lua
    L["Show the actual power"] = "Показывать текущую ману"
    L["Show the actual power on the power bar"] = "Показывать текущую ману на полосе маны"
    L["Show max power"] = "Показывать максимальную ману"
    L["Show max power on the power bar"] = "Показывать максимальную ману на полосе маны"
    L["Show power percentage"] = "Показывать ману в процентах"
    L["Show power percentage on the power bar"] = "Показывать ману в процентах на полосе маны"
    L["Color of the status bar background"] = "Цвет фона строки состояния"

    -- Trinket.lua
    L["No cooldown count (OmniCC)"] = "Не показывать кулдаун (OmniCC)"
    L["Disable cooldown timers by addons (reload UI to take effect)"] = "Отключить таймер кулдаунов для аддонов (необходима перезагрузка интерфейса)"
elseif GetLocale() == "deDE" then
    -- Announcements.lua
    L["Announcements"] = "Meldungen"
    L["RESURRECTING: %s (%s)"] = "Wiederbeleben: %s (%s) "
    L["SPEC DETECTED: %s - %s (%s)"] = "Talenspezalisierung entdeckt: %s - %s (%s)"
    L["LOW HEALTH: %s (%s)"] = "Niedriges Leben: %s (%s)"
    L["TRINKET USED: %s (%s)"] = "Insiginie benutzt: %s (%s)"
    L["TRINKET READY: %s (%s)"] = "Insignie bereit: %s (%s)"
    L["DRINKING: %s (%s)"] = "Trinken: %s (%s)"
    L["Self"] = "Selbst"
    L["Party"] = "Gruppe"
    L["Raid Warning"] = "Schlachtzugwarnung"
    L["Blizzard's Floating Combat Text"] = "Blizzard Kampftext"
    L["Trinket used"] = "Insignie benutzt"
    L["Announce when an enemy's trinket is used"] = "Warnt, wenn ein Gegner seine Insignie benutzt"
    L["Trinket ready"] = "Insignie bereit"
    L["Announce when an enemy's trinket is ready again"] = "Warnt wenn die Insignie eines Gegner wieder bereit ist"
    L["Drinking"] = "Trinken"
    L["Announces when enemies sit down to drink"] = "Warnt wenn Gegner sich zum Trinken hinsetzen"
    L["Resurrection"] = "Wiederbelebung"
    L["Announces when an enemy tries to resurrect a teammate"] = "Warnt wenn Gegner versuchen Teammitglieder wiederzubeleben"
    L["New enemies"] = "Neue Gegner"
    L["Announces when new enemies are discovered"] = "Gibt an, wenn neue Gegner entdeckt wurden"
    L["Spec Detection"] = "Talent Entdeckung"
    L["Announces when the spec of an enemy was detected"] = "Gibt an, wenn Talente eines Gegners entdeckt wurden"
    L["Low health"] = "Wenig Leben"
    L["Announces when an enemy drops below a certain health threshold"] = "Warnt, wenn das Leben eines Gegners unter einen bestimmten Prozentwert fällt"
    L["Low health threshold"] = "Prozentwert: Wenig Leben"
    L["Choose how low an enemy must be before low health is announced"] = "Bestimme wie wenig Leben ein Gegner haben muss, damit vor wenig Leben gewarnt wird"
    L["Destination"] = "Ziel"
    L["Choose how your announcements are displayed"] = "Bestimme wo Warnungen dargestellt werden"

    -- ArenaCountDown.lua
    L["Arena Countdown"] = "Arena Countdown"
    L["Turns countdown before the start of an arena match on/off."] = ""
    L["Size"] = "Größe"

    -- Auras.lua
    L["Auras"] = "Auren"
    L["Frame"] = "Frame"
    L["Cooldown"] = "Abklingzeit"
    L["No Cooldown Circle"] = "Verstecke Abklingzeitzirkel"
    L["Cooldown circle alpha"] = "Abklingzeitzirkel Alpha"
    L["Font"] = "Schrift"
    L["Font of the cooldown"] = "Schrift der Abklingzeit"
    L["Font scale"] = "Schriftskalierung"
    L["Scale of the text"] = "Skalierungfaktor des Texts"
    L["Font color"] = "Schriftfarbe"
    L["Color of the text"] = "Farbe des Texts"
    L["Border"] = "Rahmen"
    L["Border style"] = "Rahmen Stil"
    L["Buff color"] = "Buff Farbe"
    L["Debuff color"] = "Debuff Farbe"
    L["Check All"] = "Alle auswählen"
    L["Uncheck All"] = "Alle abwählen"
    L["Enabled"] = "Eingeschaltet"
    L["Priority"] = "Priorität"

    -- BuffsDebuffs.lua
    L["Buffs and Debuffs"] = "Buffs und Debuffs"
    L["Enabled Buffs and Debuffs module"] = "Buffs und Debuffs Modul einschalten"
    L["Show CC"] = "Zeige Crowdcontrol"
    L["Shows all debuffs, which are displayed on the ClassIcon as well"] = "Zeigt alle Buffs & Debuffs, die auch auf dem Klassensymbol dargestellt werden"
    L["Buffs"] = "Buffs"
    L["Size & Padding"] = "Größe und Abstand"
    L["Icon Size"] = "Symbol Größe"
    L["Size of the DR Icons"] = "Größe der DR Symbole"
    L["Icon Width Factor"] = "Symbol Breitenfaktor"
    L["Stretches the icon"] = "Streckt das Symbol"
    L["Icon Padding"] = "Symbol Abstand"
    L["Space between Icons"] = "Abstand zwischen den Symbolen"
    L["Position"] = "Position"
    L["Aura Position"] = "Aura Position"
    L["Position of the aura icons"] = "Position der Aura Symbole"
    L["Top"] = "Oben"
    L["Bottom"] = "Unten"
    L["Left"] = "Links"
    L["Right"] = "Rechts"
    L["Grow Direction"] = "Richtung"
    L["Grow Direction of the aura icons"] = "In welche Richtung die Symbole wachsen"
    L["Horizontal offset"] = "Horizontaler Offset"
    L["Vertical offset"] = "Vertikaler Offset"
    L["Alpha"] = "Alpha"
    L["Debuffs"] = "Debuffs"
    L["Dynamic Timer Color"] = "Dynamische Textfarbe"
    L["Show dynamic color on cooldown numbers"] = "Verändert die Farbe des Textes dynamisch"
    L["Color of the cooldown timer and stacks"] = "Farbe der Abklingzeit und Stapel"
    L["Spell School Colors"] = "Zauberart Farbe"
    L["Spell School Colors Enabled"] = "Zauberart Farbe Eingeschaltet"
    L["Show border colors by spell school"] = "Färbt den Rahmen entspechend der Zauberart"
    L["Curse"] = "Fluch"
    L["Color of the border"] = "Farbe des Rahmens"
    L["Magic"] = "Magie"
    L["Poison"] = "Gift"
    L["Physical"] = "Physisch"
    L["Immune"] = "Immun"
    L["Disease"] = "Erkrankung"
    L["Aura"] = "Aura"
    L["Form"] = "Form"

    -- Castbar.lua
    L["Cast Bar"] = "Zauberleiste"
    L["Bar"] = "Balken"
    L["Bar Size"] = "Balken Größe"
    L["Bar height"] = "Balken Höhe"
    L["Height of the bar"] = "Höhe des Balken"
    L["Bar width"] = "Balken Weite"
    L["Width of the bars"] = "Weite des Balken"
    L["Texture"] = "Textur"
    L["Bar texture"] = "Balken Textur"
    L["Texture of the bar"] = "Textur des Balken"
    L["Bar color"] = "Balken Farbe"
    L["Color of the cast bar"] = "Farbe des Balken"
    L["Background color"] = "Hintergrundfarbe"
    L["Color of the cast bar background"] = "Hinergrundfarbe des Zauberbalkens"
    L["Border size"] = "Rahmen Größe"
    L["Status Bar border"] = "Balken Rahmen"
    L["Status Bar border color"] = "Balken Rahmen Farbe"
    L["Icon"] = "Symbol"
    L["Icon size"] = "Symbolgröße"
    L["Icon border"] = "Symbolrahmen"
    L["Icon border color"] = "Farbe Symbolrahmen"
    L["Spark"] = "Funke"
    L["Spark enabled"] = "Funke eingeschaltet"
    L["Spark color"] = "Funkenfarbe"
    L["Color of the cast bar spark"] = "Farbe des Zauberleisten Funke"
    L["Font of the castbar"] = "Schriftart der Zauberleiste"
    L["Font size"] = "Schriftgröße"
    L["Size of the text"] = "Schriftgröße"
    L["Format"] = "Darstellung"
    L["Timer Format"] = "Zeitdarstellung"
    L["Remaining"] = "Verbleibend"
    L["Total"] = "Total"
    L["Both"] = "Beides"
    L["Castbar position"] = "Zauberleistenposition"
    L["Icon position"] = "Symbolposition"
    L["Offsets"] = "Offsets"

    -- Classicon.lua
    L["Class Icon"] = "Klassensymbol"
    L["Balance"] = "Gleichgewicht"
    L["Feral"] = "Wilder Kampf"
    L["Restoration"] = "Wiederherstellung"
    L["Beast Mastery"] = "Tierherrschaft"
    L["Marksmanship"] = "Treffsicherheit"
    L["Survival"] = "Überleben"
    L["Arcane"] = "Arkan"
    L["Fire"] = "Feuer"
    L["Frost"] = "Frost"
    L["Holy"] = "Heilig"
    L["Protection"] = "Schutz"
    L["Retribution"] = "Vergeltung"
    L["Discipline"] = "Disziplin"
    L["Shadow"] = "Schatten"
    L["Assassination"] = "Meucheln"
    L["Combat"] = "Kampf"
    L["Subtlety"] = "Täuschung"
    L["Elemental"] = "Elemental"
    L["Enhancement"] = "Verstärkung"
    L["Affliction"] = "Gebrechen"
    L["Demonology"] = "Demonologie"
    L["Destruction"] = "Zerstörung"
    L["Arms"] = "Waffen"
    L["Fury"] = "Furor"
    L["Show Spec Icon"] = "Zeige Spezialisierungssymbol"
    L["Shows Spec Icon once spec is detected"] = "Zeigt das Talentspezialisierungs Symbol sobald die Spezialisierung erkannt wurde"
    L["Icon width factor"] = "Symbol Breitenfaktor"
    L["This changes positions with trinket"] = "Das tauscht die Position mit dem Trinket, wenn auf der gleichen Seite."
    L["Border color"] = "Rahmenfarbe"

    --CombatIndicator.lua
    L["Combat Indicator"] = "Kampfindikator"
    L["Enable Combat Indicator icon"] = "Schalte Kampfindikator ein"
    L["Anchor"] = "Anker"
    L["This changes the anchor of the ci icon"] = "Dies ändert den Anker des Kampfindikatorsymbols"
    L["This changes position relative to its anchor of the ci icon"] = "Dies ändert die Position relativ zum Anker"

    -- Cooldowns.lua
    L["Cooldowns"] = "Abklingzeiten"
    L["Enabled cooldown module"] = ""
    L["Cooldown size"] = "Abklingzeit Größe"
    L["Size of each cd icon"] = "Größe eines einzelnen Symbols"
    L["Max Icons per row"] = "Maximale Anzahl an Symbolen pro Reihe"
    L["Scale of the font"] = "Skalierung der Schrift"
    L["Anchor of the cooldown icons"] = "Anker der Abklingzeiten Symbole"
    L["Grow Direction of the cooldown icons"] = "Richtung der Abklingzeiten Symbole"
    L["Offset"] = "Offset"

    -- Diminishings.lua
    L["Diminishings"] = "DR"
    L["Enabled DR module"] = "DR einschalten"
    L["DR Cooldown position"] = "DR Position"
    L["Position of the cooldown icons"] = "Position der Symbole"
    L["DR Border Colors"] = "DR Rahmen Farbe"
    L["Dr Border Colors Enabled"] = "DR Rahmen Farben eingeschaltet"
    L["Colors borders of DRs in respective DR-color below"] = "Färbt die Rahmen der DR Symbole je nach Stärke der Verminderung"
    L["Half"] = "Hälfte"
    L["Quarter"] = "Viertel"
    L["Categories"] = "Kategorien"
    L["Force Icon"] = "Erzwinge Symbol"
    L["Icon of the DR"] = "Symbol des DR"

    -- ExportImport.lua
    L["Export Import"] = "Exportieren Importieren"
    L["Profile Export Import"] = "Profile Exportieren Importieren"

    -- Healthbar.lua
    L["Health Bar"] = "Lebensbalken"
    L["DEAD"] = "TOT"
    L["LEAVE"] = "VERLASSEN"
    L["General"] = "Allgemein"
    L["Color of the status bar background"] = "Farbe des Balkenhintergrunds"
    L["Font of the bar"] = "Schriftart des Balken"
    L["Name font size"] = "Schriftgröße des Namen"
    L["Size of the name text"] = "Schriftgröße des Namen"
    L["Health font size"] = "Schriftgröße der Gesundheit"
    L["Size of the health text"] = "Schriftgröße der Gesundheit"
    L["Size of the border"] = "Rahmengröße"
    L["Health Bar Text"] = "Lebensbalken Text"
    L["Show name text"] = "Namen zeigen"
    L["Show the units name"] = "Zeige den Namen des Gegners"
    L["Show ArenaX"] = "ArenaX zeigen"
    L["Show 1-5 as name instead"] = "Zeigt 1-5 anstatt des Namens"
    L["Show the actual health"] = "Zeige die momentane Gesundheit"
    L["Show the actual health on the health bar"] = "Zeigt die momentane Gesundheit"
    L["Show max health"] = "Zeige maximale Gesundheit"
    L["Show max health on the health bar"] = "Zeige maximale Gesundheit"
    L["Show health percentage"] = "Zeige Prozentwert"
    L["Show health percentage on the health bar"] = "Zeige Prozentwert der Gesundheit"

    -- Highlight.lua
    L["Highlight"] = "Hervorhebung"
    L["Show Inside"] = "Zeige innen"
    L["Show Highlight border inside of frame"] = "Zeige die Hervorhebung innerhalb des Frames"
    L["Colors"] = "Farben"
    L["Target border color"] = "Rahmenfarbe deines Ziels"
    L["Color of the selected targets border"] = "Rahmenfarbe deines momentanen Ziels"
    L["Focus border color"] = "Rahmenfarbe deines Fokus"
    L["Color of the focus border"] = "Rahmenfarbe deines momentanen Fokus"
    L["Highlight target"] = "Hervorhebung des Ziels"
    L["Toggle if the selected target should be highlighted"] = "Ziel hervorheben ein/ausschalten"
    L["Show border around target"] = "Zeige Rahmen um dein Ziel"
    L["Toggle if a border should be shown around the selected target"] = "Zeigt Rahmen um dein momentanes Ziel"
    L["Show border around focus"] = "Zeige Rahmen um dein Fokus"
    L["Toggle of a border should be shown around the current focus"] = "Zeigt Rahmen um dein Fokusziel"

    -- Pets.lua
    L["Pets"] = "Begleiter"
    L["Enables Pets module"] = "Schaltet das Begleiter Modul ein"
    L["Width of the bar"] = "Breite des Balkens"
    L["Health color"] = "Gesundheitsfarbe"
    L["Color of the status bar"] = "Farbe des Balkens"
    L["Portrait"] = "Portrait"
    L["Health Values"] = "Gesundheitswerte"

    -- Powerbar.lua
    L["Power Bar"] = "Mana/Energie Balken"
    L["Power Bar Text"] = "Mana/Energie Balken Text"
    L["Power Texts"] = "Mana/Energie Balken Texte"
    L["Show race"] = "Rasse zeigen"
    L["Show spec"] = "Spezialisierung zeigen"
    L["Show the actual power"] = "Zeige das momentane Mana"
    L["Show the actual power on the power bar"] = "Zeige das momentane Mana"
    L["Show max power"] = "Zeige das maximale Mana"
    L["Show max power on the power bar"] = "Zeige das maximale Mana"
    L["Show power percentage"] = "Zeige Prozentwert"
    L["Show power percentage on the power bar"] = "Zeige Prozentwert"

    -- Racial.lua
    L["Racial"] = "Rassenfertigkeit"
    L["Enable racial icon"] = "Rassenfertigkeit einschalten"
    L["This changes the anchor of the racial icon"] = "Dies ändert den Anker des Rassenfertigkeitssymbols"
    L["This changes position relative to its anchor of the racial icon"] = "Dies ändert doe Position relativ zu seinem Anker"

    -- TotemPlates.lua
    L["Totem Plates"] = "Totem Symbole"
    L["Customize Totems"] = "Individuelle Totemeinstellungen"
    L["Custom totem name"] = "Individueller Totem Name"
    L["Totem General"] = "Totems Allgemein"
    L["Turns totem icons instead of nameplates on or off. (Requires reload)"] = ""
    L["Show friendly"] = "Zeige für freundliche"
    L["Show enemy"] = "Zeige für feindliche"
    L["Totem size"] = "Totem Größe"
    L["Size of totem icons"] = "Größe der Totemsymbole"
    L["Font of the custom totem name"] = "Schriftart der benutzerdefinierten Totem Namen"
    L["Apply alpha when no target"] = "Wende den Alpha-Wert an, wenn kein Ziel anvisiert ist"
    L["Always applies alpha, even when you don't have a target. Else it is 1."] = "Alpha immer anwenden, auch wenn man kein Ziel anvisiert hat. Sonst ist der Alpha-Wert 1"
    L["Apply alpha when targeted"] = "Wende den Alpha-Wert an, wenn das Totem als Ziel anvisiert ist"
    L["Always applies alpha, even when you target the totem. Else it is 1."] = "Alpha immer anwenden, auch wenn das Totem als Ziel anvisiert ist. Sonst ist der Alpha-Wert 1"
    L["All totem border alphas (configurable per totem)"] = "Alpha aller Totems"
    L["Totem icon border style"] = "Totem Rahmenstil"
    L["All totem border color"] = "Rahmenfarbe aller Totems"

    -- Trinket.lua
    L["Trinket"] = "Insignie"
    L["Enable trinket icon"] = "Insignie einschalten"
    L["This changes positions of the trinket"] = "Dies ändert die Position der Insignie"

    -- XiconProfiles.lua
    L["Profile"] = "Profil"

    -- Frame.lua
    L["Gladdy - drag to move"] = "Gladdy - ziehe um zu bewegen"

    -- Gladdy.lua
    L["Welcome to Gladdy!"] = "Willkommen bei Gladdy!"
    L["First run has been detected, displaying test frame."] = "Erster Start wurde entdeckt, zeige Testbild an."
    L["Valid slash commands are:"] = "Gültige slash Befehle sind:"
    L["If this is not your first run please lock or move the frame to prevent this from happening."] = "Wenn dies nicht dein erster Start ist, sperre oder bewege das Bild um diese Meldung zu verhindern."

    -- Options.lua
    L["settings"] = "Einstellungen"
    L["Reset module"] = "Modul zurücksetzen"
    L["Reset module to defaults"] = "Setze das Modul auf seine Standardwerte zurück"
    L["No settings"] = "Keine Einstellungen"
    L["Module has no settings"] = "Modul hat keine Einstellungen"
    L["General settings"] = "Allgemeine Einstellungen"
    L["Lock frame"] = "Sperre Frame"
    L["Toggle if frame can be moved"] = "Aktivieren falls das Frame bewegt werden kann"
    L["Grow frame upwards"] = "Frame von unten nach oben aufbauen"
    L["If enabled the frame will grow upwards instead of downwards"] = "Falls aktiviert, wird das Frame von unten nach oben aufgebaut"
    L["Down"] = "Runter"
    L["Up"] = "Hoch"
    L["Frame General"] = "Frame Allgemein"
    L["Frame scale"] = "Frame Skalierung"
    L["Scale of the frame"] = "Skalierung des Frames"
    L["Frame padding"] = "Symbolabstand"
    L["Padding of the frame"] = "Abstand zwischen den Elementen des Frames"
    L["Frame width"] = "Frame Breite"
    L["Margin"] = "Frame Abstand"
    L["Margin between each button"] = "Abstand zwischen den Arena Einheiten"
    L["Cooldown General"] = "Abklingzeiten Allgemein"
    L["Font General"] = "Schriftart Allgemein"
    L["General Font"] = "Allgemeine Schriftart"
    L["Font color text"] = "Schriftfarbe von text"
    L["Font color timer"] = "Schriftfarbe von Abklingzeiten"
    L["Color of the timers"] = "Farbe der Abklingzeiten"
    L["Icons General"] = "Symbol Allgemein"
    L["Icon border style"] = "Rahmenstil"
    L["This changes the border style of all icons"] = "Dies ändert den Rahmenstil aller Symbole"
    L["This changes the border color of all icons"] = "Dies ändert die Rahmenfarbe aller Symbole"
    L["Statusbar General"] = "Balken Allgemein"
    L["Statusbar texture"] = "Balken Textur"
    L["This changes the texture of all statusbar frames"] = "Dies ändert die Textur aller Balken"
    L["Statusbar border style"] = "Balken Rahmenstil"
    L["This changes the border style of all statusbar frames"] = "Dies ändert den Rahmenstil aller Balken"
    L["Statusbar border offset divider (smaller is higher offset)"] = "Rahmenstil offset Quotient"
    L["Offset of border to statusbar (in case statusbar shows beyond the border)"] = "Offset des Rahmens zur Statusbar (falls der Balken hinter dem Rahmen erscheint)"
    L["Statusbar border color"] = "Balken Rahmenfarbe"
    L["This changes the border color of all statusbar frames"] = "Dies ändert die Rahmenfarbe aller Balken"
end



-- Superhack allowing use key as value if not present in table
LibStub("Gladdy").L = setmetatable(L, {
    __index = function(t, k)
        return k
    end
})