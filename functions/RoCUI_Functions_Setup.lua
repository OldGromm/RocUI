function RoCUI_Setup_CheckProfileData()
    -- check if all profile slots have data.
    for i=1, 10 do
        local profileindex = RoCUI_Profiles_ProfileIndexTextstring(i)
        if RoCUIDB_Profiles[profileindex] == nil then
            RoCUIDB_Profiles[profileindex] = CopyTable(RoCUIDB_Profiles_Default)
        end
    end


    -- load current character data.
    if RoCUIDB_Characters[RoCUI_PlayerStats_PlayerID] == nil then
        RoCUIDB_Characters[RoCUI_PlayerStats_PlayerID] = 1
    end
	
	RoCUI_Options_CurrentProfile = RoCUIDB_Characters[RoCUI_PlayerStats_PlayerID]
end




function RoCUI_Setup_MissingPlayerDataFallback(input_type)
    local UseBackup = false
	local Output = nil

    if input_type == "Name" then
        Output = UnitGUID("player")
    elseif input_type == "Race" then
        Output = C_PlayerInfo.GetRace(RoCUI_PlayerStats_CurrentPlayer)
    elseif input_type == "Class" then
        Output = select(3, C_PlayerInfo.GetClass(RoCUI_PlayerStats_CurrentPlayer))
	end


	if Output == nil then
	    UseBackup = true
	end
	if issecretvalue(Output) == true then
	    UseBackup = true
	end


	if input_type == "Name" then
	    if UseBackup == true then
		    Output = "TEMP"
		    RoCUI_Variables_UseTempProfileName = true
		elseif UseBackup == false then
		    RoCUIDB_Cache["Name"] = Output
		end
	else
        if UseBackup == true then
            if RoCUIDB_Cache[input_type] == nil then
                RoCUI_PlayerDataError = true
            else
                if RoCUIDB_Cache["Name"] == RoCUI_PlayerStats_PlayerID then
                    Output = RoCUIDB_Cache[input_type]
                else
                    RoCUI_PlayerDataError = true
                end
    		end
    	elseif UseBackup == false then
            RoCUIDB_Cache[input_type] = Output
    	    RoCUIDB_Cache["Name"] = RoCUI_PlayerStats_PlayerID
    	end
    end

    return Output

end




function RoCUI_Setup_PlayerStats()
    RoCUI_PlayerStats_CurrentPlayer = PlayerLocation:CreateFromUnit("player")

    RoCUI_PlayerStats_PlayerID = RoCUI_Setup_MissingPlayerDataFallback("Name")
    RoCUI_PlayerStats_CurrentRace = RoCUI_Setup_MissingPlayerDataFallback("Race")
    RoCUI_PlayerStats_CurrentClass = RoCUI_Setup_MissingPlayerDataFallback("Class")


	if RoCUI_Variables_UseTempProfileName == true then
	    RoCUI_General_SendChatMessage(RoCUI_Text_MissingCharacterName)
	end
	if RoCUI_PlayerDataError == true then
	    RoCUI_General_SendChatMessage(RoCUI_Text_MissingPlayerData)
	end

    
	-- For Classic and Forever, we need to use a pre-determined primary stat, since
	-- there are no pre-defined specializations with primary stats.
	-- The primary stat from the a class's Warcraft III hero counterpart are being
	-- used where applicable.
	for i, v in pairs (RoCUI_Database_ClassicPrimaryStats) do
	    if v["ClassID"] == RoCUI_PlayerStats_CurrentClass then
		    RoCUI_PlayerStats_ClassicPrimaryStat = v["Stat"]
		end
	end

end




function RoCUI_Setup_DetermineDefaultFactionSkin()
    for i, v in pairs(RoCUI_Database_FactionSkin) do
	    if v["ID"] == RoCUI_PlayerStats_CurrentRace then
		    RoCUI_PV("Save", "General_FactionSkin", v["Skin"])
			RoCUI_PV("Save", "Sounds_Victory", v["Skin"])
	        RoCUI_PV("Save", "Sounds_Defeat", v["Skin"])
		end
	end

end




function RoCUI_Setup_DetectGameVersion()
	if WOW_PROJECT_ID == 18 and LE_EXPANSION_LEVEL_CURRENT == 0 then -- Forever
        RoCUI_WoWVersion = "Forever"
    elseif WOW_PROJECT_ID == 1 and LE_EXPANSION_LEVEL_CURRENT == 12 then -- The Last Titan
        RoCUI_WoWVersion = "Retail"
    elseif WOW_PROJECT_ID == 1 and LE_EXPANSION_LEVEL_CURRENT == 11 then -- Midnight
        RoCUI_WoWVersion = "Retail"
    elseif WOW_PROJECT_ID == 19 and LE_EXPANSION_LEVEL_CURRENT == 4 then -- Mists of Pandaria
        RoCUI_WoWVersion = "MoP"
    elseif WOW_PROJECT_ID == 11 and LE_EXPANSION_LEVEL_CURRENT == 2 then -- Wrath of the Lich King (Titan Reforged)
        RoCUI_WoWVersion = "Classic"
		RoCUI_WoWVersion_Sub_Classic = "Wrath"
    elseif WOW_PROJECT_ID == 5 and LE_EXPANSION_LEVEL_CURRENT == 1 then -- The Burning Crusade
        RoCUI_WoWVersion = "Classic"
		RoCUI_WoWVersion_Sub_Classic = "TBC"
    elseif WOW_PROJECT_ID == 2 and LE_EXPANSION_LEVEL_CURRENT == 0 then -- Classic Era
        RoCUI_WoWVersion = "Classic"
		RoCUI_WoWVersion_Sub_Classic = "Vanilla"
    else
    end
end




function RoCUI_Setup_GameVersionAdjustments()
    -- enable challenge mode/mythic+ event
	if RoCUI_WoWVersion == "Retail" or RoCUI_WoWVersion == "MoP" then
		RoCUI_Event_Sound_ChallengeModeCompleted:RegisterEvent("CHALLENGE_MODE_COMPLETED")
	end
	
	---- different combat lockdown messages
	if RoCUI_WoWVersion == "Retail" or RoCUI_WoWVersion == "MoP" then
	    RoCUI_CombatLockdown_MessageType = {"Combat", "Encounter", "MythicPlus", "PvP"}
	else
	    RoCUI_CombatLockdown_MessageType = {"Combat", "Encounter", "ChallengeMode", "PvP"}
	end
end




function RoCUI_Setup_DetermineDefaultLanguage()
    local GameClientLocale = GetLocale()
	
    ---- check if variable is empty
    if RoCUI_PV("Load", "General_Language") == nil then
        ---- check if the player's game client locale is supported by the add-on.
        for _, v in pairs(RoCUI_Database_Locales) do
            if GameClientLocale == v["locale"] then
				RoCUI_PV("Save", "General_Language", v["locale"])
	        end
        end
		---- make English the default language if no supported locale could be found.
		if RoCUI_PV("Load", "General_Language") == nil then
            RoCUI_PV("Save", "General_Language", "enUS")
		end
	end

end