-- Database Variables
RoCUIDB_Characters = RoCUIDB_Characters or {}
RoCUIDB_Profiles = RoCUIDB_Profiles or {}
RoCUIDB_MinimapButton = RoCUIDB_MinimapButton or {}
RoCUIDB_EditMode = RoCUIDB_EditMode or {}
RoCUIDB_Cache = RoCUIDB_Cache or {}
RoCUIDB_Cache["CombatLockdown"] = RoCUIDB_Cache["CombatLockdown"] or {}
RoCUIDB_DayNightCycle = RoCUIDB_DayNightCycle or {}




-- Initialization
RoCUI_WoWVersion = ""
RoCUI_WoWVersion_Sub_Classic = ""
RoCUI_Compartment_Enable = false
RoCUI_InstanceList = {}
RoCUI_InstanceData = {}
RoCUI_PlayerDataError = false
RoCUI_SetupComplete = false




-- Variables
RoCUI_Variables_Categories = { "General", "SpecChange", "RepairMessage", "Sounds", "Mounts", "Hearthstone" }
RoCUI_Variables_NonStandardEntries = { "ChoiceCurrent", "ChoiceOverride", "OrderType", "ListOrder_Random", "ListOrder_Sequential", "ListOrder_NoRepeats" }
RoCUI_Variables_UseTempProfileName = false




-- Library Add-ons
RoCUI_LibDBIcon = LibStub("LibDBIcon-1.0")
local _, ns = ...
RoCUI_LibEditMode = ns.LibEditMode




-- Player Stats
RoCUI_PlayerStats_PlayerID = {}
RoCUI_PlayerStats_CurrentPlayer = {}
RoCUI_PlayerStats_CurrentRace = {}
RoCUI_PlayerStats_CurrentClass = {}
RoCUI_PlayerStats_ClassicPrimaryStat = 0




-- Frames
RoCUI_Frames = {}
RoCUI_Frames_Backgrounds = {}
RoCUI_Frames_Buttons = {}
RoCUI_Frames_SlidersList = {}
RoCUI_Frames_Infopanel = {}
RoCUI_Frames_Portrait = {}
RoCUI_Frames_CombatLockdown = {}
RoCUI_Frames_OptionsMenuPage = {}
RoCUI_Frames_OptionsEntry = {}
RoCUI_Frames_OptionsEntryText = {}
RoCUI_Frames_OptionsEntryPosition = {}
RoCUI_Frames_List = {}




-- Dropdown
RoCUI_Dropdown_General_FactionSkin = {}
RoCUI_Dropdown_General_Skin_Background = { "1", "2", "3"}
RoCUI_Dropdown_General_Skin_Border = { "1", "2", "3"}
RoCUI_Dropdown_Sounds_Channel = {}
RoCUI_Dropdown_Sounds_Defeat = {}
RoCUI_Dropdown_Sounds_Victory = {}
RoCUI_Dropdown_Portrait_HealthDisplayType = {}
RoCUI_Dropdown_Portrait_PowerDisplayType = {}
RoCUI_Dropdown_Portrait_PowerType = {}
RoCUI_Dropdown_Infopanel_ForeverName = {}
RoCUI_Dropdown_Infopanel_StatType_Defensive = {}
RoCUI_Dropdown_Infopanel_StatType_Offensive = {}
RoCUI_Dropdown_Infopanel_StatType_Other = {}
RoCUI_Dropdown_Other_CombatLockdown = {}
RoCUI_Dropdown_TopMenuButtons = {}




-- Factions
RoCUI_Factions_FilepathNames = {"human", "undead", "orc", "nightelf", "generic"}
RoCUI_Factions_ButtonList = {}




-- Backdrop
RoCUI_Backdrop_Inset_Horizontal = {14, 10, 14}
RoCUI_Backdrop_Inset_Vertical = {14, 28, 14}
RoCUI_Backdrop_Inset_Tilesize = {64, 128, 128}
RoCUI_Backdrop_StrataNames = {"TOOLTIP", "FULLSCREEN_DIALOG", "FULLSCREEN", "DIALOG", "HIGH", "MEDIUM", "LOW", "BACKGROUND"}




-- Sundial
RoCUI_Sundial_SecondsUntilDailyReset = {77400, 72000, 66600, 61200, 55800, 50400, 45000, 39600, 34200, 28800, 23400, 18000, 12600, 7200, 1800, 0}




-- Sounds
RoCUI_SoundHandle = {}
RoCUI_SoundHandle_PlayedSomeMusicBefore = false
RoCUI_Sounds_ChannelList = { "Master", "Music", "SFX", "Ambience", "Dialog" }
RoCUI_CustomSound = {}
RoCUI_Sounds_FakeVictoryList = { 3515, 3556 }




-- Infopanel
RoCUI_Infopanel_SubitemType_Weapon = { "axe", "axe", "arrow", "gun", "hammer", "hammer", "polearm", "sword", "sword", "glaive", "staff", "claw", "claw", "fist", "sword", "dagger", "dagger", "polearm", "arrow", "staff", "fish"}
RoCUI_Infopanel_SubitemType_Armor = {"unarmored", "cloth", "leather", "mail", "plate", "unarmored", "shield", "libram", "idol", "totem", "sigil", "relic"}
RoCUI_Infopanel_SubitemType_Armor_NoQualityVariants = {"unarmored", "libram", "idol", "totem", "sigil", "relic"}




-- Combat Lockdown
RoCUI_CombatLockdown_Message_Cooldown = false
RoCUI_CombatLockdown_Message_Count = 0
RoCUI_CombatLockdown_MessageType = {}
RoCUI_CombatLockdown_TypeList = { "Once", "Never", "Always" }
RoCUI_CombatLockdown_UpdateAfterCombatEnds = false




-- Top Menu Buttons
RoCUI_TopMenuButtons_List = {}




-- Options Menu
RoCUI_Options = {}
RoCUI_Options_Timeout = false
RoCUI_Options_CurrentProfile = 1
RoCUI_Options_EditBox_Timeout = false