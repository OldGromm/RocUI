-- load database variables
RoCUIDB_Options = RoCUIDB_Options or {}
RoCUIDB_MinimapIcon = RoCUIDB_MinimapIcon or {}
RoCUI_DefaultDatabase_Variables = {}
RoCUI_DefaultDatabase_VariableKeys = {}
RoCUI_DefaultDatabase_Values = {}




-- create variables for use when creating the custom UI frames later
RoCUI_CustomFrame_Base_main = {}
RoCUI_CustomFrame_Texture_main = {}
RoCUI_CustomFrame_Base_sun = {}
RoCUI_CustomFrame_Texture_sun = {}
RoCUI_CustomFrame_Base_suncycle = {}
RoCUI_CustomFrame_Texture_suncycle = {}
RoCUI_CustomFrame_Base_additional1 = {}
RoCUI_CustomFrame_Texture_additional1 = {}
RoCUI_CustomFrame_Base_additional2 = {}
RoCUI_CustomFrame_Texture_additional2 = {}
RoCUI_CustomFrame_Base_additional3 = {}
RoCUI_CustomFrame_Texture_additional3 = {}
RoCUI_CustomFrame_Base_additional4 = {}
RoCUI_CustomFrame_Texture_additional4 = {}




-- setup other variables
RoCUI_Table_SkinNames = {"human", "undead", "orc", "nightelf"}
RoCUI_Table_StrataNames = {"TOOLTIP", "FULLSCREEN_DIALOG", "FULLSCREEN", "DIALOG", "HIGH", "MEDIUM", "LOW", "BACKGROUND"}
RoCUI_Table_Options_Frametypes = {"main", "sun", "additional1", "additional2", "additional3", "additional4"}
RoCUI_NightandDayCycle = 0




-- Set default skin depending on the player character's race
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