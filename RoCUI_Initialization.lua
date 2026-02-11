-- load database variables
RoCUIDB_Options = RoCUIDB_Options or {}
RoCUIDB_MinimapIcon = RoCUIDB_MinimapIcon or {}
RoCUIDB_DayNightCycle = RoCUIDB_DayNightCycle or {}
RoCUI_DefaultDatabase_Variables = {}
RoCUI_DefaultDatabase_VariableKeys = {}
RoCUI_DefaultDatabase_Values = {}





-- setup other variables
RoCUI_Table_SkinNames = {"human", "undead", "orc", "nightelf"}
RoCUI_Table_StrataNames = {"TOOLTIP", "FULLSCREEN_DIALOG", "FULLSCREEN", "DIALOG", "HIGH", "MEDIUM", "LOW", "BACKGROUND"}
RoCUI_Table_Options_Frametypes = {"main", "sun", "portraitplayer", "top1", "top2", "top3", "top4", "top5", "top6", "top7", "top8", "infoplayer", "additional1", "additional2", "additional3", "additional4"}
RoCUI_Table_SecondsUntilReset = {77400, 72000, 66600, 61200, 55800, 50400, 45000, 39600, 34200, 28800, 23400, 18000, 12600, 7200, 1800, 0}
RoCUI_Table_TopMenuVariableNames = {"top1", "top2", "top3", "top4", "top5", "top6", "top7", "top8"}
RoCUI_Table_SoundOverrides = {"QuestAccepted", "QuestCompleted", "PlayerDies", "Queue"}


-- check for current version number (disable or change a few things if this is Classic)
RoCUI_InterfaceVersion = select(4, GetBuildInfo())
RoCUI_IsRetail = false
if RoCUI_InterfaceVersion > 100000 then
    RoCUI_IsRetail = true
end

---- change number of bag buttons depending on the game version (Retail has the reagent bag)
RoCUI_NumberofBags = 5
if RoCUI_IsRetail == true then
    RoCUI_NumberofBags = 6
end




-- set default skin depending on the player character's race
RoCUI_PlayerLocation = PlayerLocation:CreateFromUnit("player")
RoCUI_PlayerCharacterRace = C_PlayerInfo.GetRace(RoCUI_PlayerLocation)
RoCUIDB_Skin = ""
RoCUI_FactionSkinDefault = 1

for i=1, 85 do
    if RoCUI_PlayerCharacterRace == 1 then --Human
        RoCUIDB_Skin = "Human"
    elseif RoCUI_PlayerCharacterRace == 2 then --Orc
        RoCUIDB_Skin = "Orc"
	elseif RoCUI_PlayerCharacterRace == 3 then --Dwarf 
        RoCUIDB_Skin = "Human"
    elseif RoCUI_PlayerCharacterRace == 4 then --NightElf 
        RoCUIDB_Skin = "Nightelf"
    elseif RoCUI_PlayerCharacterRace == 5 then --Forsaken 
        RoCUIDB_Skin = "Undead"
    elseif RoCUI_PlayerCharacterRace == 6 then --Tauren 
        RoCUIDB_Skin = "Orc"
    elseif RoCUI_PlayerCharacterRace == 7 then --Gnome 
        RoCUIDB_Skin = "Human"
    elseif RoCUI_PlayerCharacterRace == 8 then --Troll 
        RoCUIDB_Skin = "Orc"
    elseif RoCUI_PlayerCharacterRace == 9 then --Goblin 
        RoCUIDB_Skin = "Orc"
    elseif RoCUI_PlayerCharacterRace == 10 then --BloodElf 
        RoCUIDB_Skin = "Human"
    elseif RoCUI_PlayerCharacterRace == 11 then --Draenei 
        RoCUIDB_Skin = "Nightelf"
    elseif RoCUI_PlayerCharacterRace == 12 then --Fel Orc 
        RoCUIDB_Skin = "Undead"
    elseif RoCUI_PlayerCharacterRace == 13 then --Naga 
        RoCUIDB_Skin = "Nightelf"
    elseif RoCUI_PlayerCharacterRace == 14 then --Broken 
        RoCUIDB_Skin = "Nightelf"
    elseif RoCUI_PlayerCharacterRace == 15 then --Skeleton 
        RoCUIDB_Skin = "Undead"
    elseif RoCUI_PlayerCharacterRace == 16 then --Vrykul 
        RoCUIDB_Skin = "Undead"
    elseif RoCUI_PlayerCharacterRace == 17 then --Tuskarr 
        RoCUIDB_Skin = "Human"
    elseif RoCUI_PlayerCharacterRace == 18 then --ForestTroll 
        RoCUIDB_Skin = "Orc"
    elseif RoCUI_PlayerCharacterRace == 19 then --Taunka 
        RoCUIDB_Skin = "Orc"
    elseif RoCUI_PlayerCharacterRace == 20 then --NorthrendSkeleton 
        RoCUIDB_Skin = "Undead"
    elseif RoCUI_PlayerCharacterRace == 21 then --IceTroll 
        RoCUIDB_Skin = "Orc"
    elseif RoCUI_PlayerCharacterRace == 22 then --Worgen 
        RoCUIDB_Skin = "Human"
    elseif RoCUI_PlayerCharacterRace == 23 then --Human 
        RoCUIDB_Skin = "Human"
    elseif RoCUI_PlayerCharacterRace == 24 then --Pandaren (Neutral)
        local RoCUI_RandomNumber = fastrandom(1, 2)
		if RoCUI_RandomNumber == 1 then
		    RoCUIDB_Skin = "Human"
		else
		    RoCUIDB_Skin = "Orc"
		end
    elseif RoCUI_PlayerCharacterRace == 25 then --Pandaren (Alliance)
        RoCUIDB_Skin = "Human"
    elseif RoCUI_PlayerCharacterRace == 26 then --Pandaren (Horde)
        RoCUIDB_Skin = "Human"
    elseif RoCUI_PlayerCharacterRace == 27 then --Nightborne 
        RoCUIDB_Skin = "Nightelf"
    elseif RoCUI_PlayerCharacterRace == 28 then --HighmountainTauren 
        RoCUIDB_Skin = "Orc"
    elseif RoCUI_PlayerCharacterRace == 29 then --VoidElf 
        RoCUIDB_Skin = "Human"
    elseif RoCUI_PlayerCharacterRace == 30 then --LightforgedDraenei 
        RoCUIDB_Skin = "Nightelf"
    elseif RoCUI_PlayerCharacterRace == 31 then --ZandalariTroll 
        RoCUIDB_Skin = "Orc"
    elseif RoCUI_PlayerCharacterRace == 32 then --KulTiran 
        RoCUIDB_Skin = "Human"
    elseif RoCUI_PlayerCharacterRace == 33 then --ThinHuman 
        RoCUIDB_Skin = "Human"
    elseif RoCUI_PlayerCharacterRace == 34 then --DarkIronDwarf 
        RoCUIDB_Skin = "Human"
    elseif RoCUI_PlayerCharacterRace == 35 then --Vulpera 
        RoCUIDB_Skin = "Orc"
    elseif RoCUI_PlayerCharacterRace == 36 then --MagharOrc 
        RoCUIDB_Skin = "Orc"
    elseif RoCUI_PlayerCharacterRace == 37 then --Mechagnome 
        RoCUIDB_Skin = "Human"
    elseif RoCUI_PlayerCharacterRace == 52 then --Dracthyr (Alliance)
        RoCUIDB_Skin = "Human"
    elseif RoCUI_PlayerCharacterRace == 70 then --Dracthyr (Horde)
        RoCUIDB_Skin = "Orc"
    elseif RoCUI_PlayerCharacterRace == 84 then --EarthenDwarf (Horde)
        RoCUIDB_Skin = "Orc"
    elseif RoCUI_PlayerCharacterRace == 85 then --EarthenDwarf (Alliance)
        RoCUIDB_Skin = "Human"
    elseif RoCUI_PlayerCharacterRace == nil then
        RoCUIDB_Skin = "Human"
	else
	end
end




-- determine the default value of the faction skin for the options menu
if RoCUIDB_Skin == "Human" then
    RoCUI_FactionSkinDefault = 1
elseif RoCUIDB_Skin == "Undead" then
    RoCUI_FactionSkinDefault = 2
elseif RoCUIDB_Skin == "Orc" then
    RoCUI_FactionSkinDefault = 3
elseif RoCUIDB_Skin == "Nightelf" then
    RoCUI_FactionSkinDefault = 4
else
end




-- fecht current player class
_, _, RoCUI_PlayerCharacterClass = C_PlayerInfo.GetClass(RoCUI_PlayerLocation)




-- create variables for later use, so they can be referenced via the _G function
RoCUI_CustomFrame_Base_main = {}
RoCUI_CustomFrame_Texture_main = {}

RoCUI_CustomFrame_Base_sun = {}
RoCUI_CustomFrame_Texture_sun = {}
RoCUI_CustomFrame_Texture_suncycle = {}
RoCUI_CustomFrame_Texture_sunclock = {}

RoCUI_CustomFrame_Base_top1 = {}
RoCUI_CustomFrame_Texture_top1 = {}
RoCUI_CustomFrame_Base_top2 = {}
RoCUI_CustomFrame_Texture_top2 = {}
RoCUI_CustomFrame_Base_top3 = {}
RoCUI_CustomFrame_Texture_top3 = {}
RoCUI_CustomFrame_Base_top4 = {}
RoCUI_CustomFrame_Texture_top4 = {}
RoCUI_CustomFrame_Base_top5 = {}
RoCUI_CustomFrame_Texture_top5 = {}
RoCUI_CustomFrame_Base_top6 = {}
RoCUI_CustomFrame_Texture_top6 = {}
RoCUI_CustomFrame_Base_top7 = {}
RoCUI_CustomFrame_Texture_top7 = {}
RoCUI_CustomFrame_Base_top8 = {}
RoCUI_CustomFrame_Texture_top8 = {}

RoCUI_CustomFrame_Base_menubutton1 = {}
RoCUI_CustomFrame_Base_menubutton2 = {}
RoCUI_CustomFrame_Base_menubutton3 = {}
RoCUI_CustomFrame_Base_menubutton4 = {}
RoCUI_CustomFrame_Base_menubutton5 = {}
RoCUI_CustomFrame_Base_menubutton6 = {}
RoCUI_CustomFrame_Base_menubutton7 = {}
RoCUI_CustomFrame_Base_menubutton8 = {}

RoCUI_CustomFrame_Base_portraitplayer = {}
RoCUI_CustomFrame_Texture_portraitplayer = {}
RoCUI_CustomFrame_Texture_portraitplayerrender = {}
RoCUI_CustomFrame_Texture_portraitplayermask = {}
RoCUI_CustomFrame_Portrait_Health = {}
RoCUI_CustomFrame_Portrait_Mana = {}

RoCUI_CustomFrame_Base_infoplayer = {}
RoCUI_CustomFrame_Texture_infoplayer = {}
RoCUI_CustomFrame_infoplayer_name = {}
RoCUI_CustomFrame_infoplayer_damage_icon = {}
RoCUI_CustomFrame_infoplayer_damage_title = {}
RoCUI_CustomFrame_infoplayer_damage_number = {}

RoCUI_CustomFrame_Base_additional1 = {}
RoCUI_CustomFrame_Texture_additional1 = {}
RoCUI_CustomFrame_Base_additional2 = {}
RoCUI_CustomFrame_Texture_additional2 = {}
RoCUI_CustomFrame_Base_additional3 = {}
RoCUI_CustomFrame_Texture_additional3 = {}
RoCUI_CustomFrame_Base_additional4 = {}
RoCUI_CustomFrame_Texture_additional4 = {}

RoCUI_CustomFrame_Base_inventory = {}
RoCUI_CustomFrame_Texture_inventory = {}
RoCUI_CustomFrame_Base_inventoryslot1 = {}
RoCUI_CustomFrame_Texture_inventoryslot1 = {}
RoCUI_CustomFrame_Base_inventoryslot2 = {}
RoCUI_CustomFrame_Texture_inventoryslot2 = {}
RoCUI_CustomFrame_Base_inventoryslot3 = {}
RoCUI_CustomFrame_Texture_inventoryslot3 = {}
RoCUI_CustomFrame_Base_inventoryslot4 = {}
RoCUI_CustomFrame_Texture_inventoryslot4 = {}
RoCUI_CustomFrame_Base_inventoryslot5 = {}
RoCUI_CustomFrame_Texture_inventoryslot5 = {}
RoCUI_CustomFrame_Base_inventoryslot6 = {}
RoCUI_CustomFrame_Texture_inventoryslot6 = {}