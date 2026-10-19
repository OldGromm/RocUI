function RoCUI_Profiles_ProfileIndexTextstring(input_number)
    local textstring = string.format("%02d", input_number)
	return textstring
end




function RoCUI_PV(input_mode, input_variable, input_value) -- PV stands for Profile Variable
    local profileindex = RoCUI_Profiles_ProfileIndexTextstring(RoCUI_Options_CurrentProfile)

    if input_mode == "Load" then
	    local Value = RoCUIDB_Profiles[profileindex][input_variable]
		return Value
	elseif input_mode == "Save" then
	    RoCUIDB_Profiles[profileindex][input_variable] = input_value
	end

end




function RoCUI_Profiles_SetMenuEntrySetting(input_type, input_variable, input_number)
    local DescriptionVariableName = ("RoCUI_Text_Options_OptionsMenu_"..input_variable)
    local Description = _G[DescriptionVariableName]
    local Value = RoCUI_PV("Load", input_variable)

    if input_type == "Header" then
        RoCUI_Frames_OptionsEntryText[input_variable]:SetText(Description)
    elseif input_type == "Button" then
        RoCUI_Frames_OptionsEntry[input_variable]:SetText(Description)
    elseif input_type == "ButtonBack" then
        local BackButtonVariableName = ("RoCUI_Text_Options_OptionsMenu_Back")
        local BackButtonText = _G[BackButtonVariableName]
        RoCUI_Frames_OptionsEntry[input_variable]:SetText(BackButtonText)
    elseif input_type == "Checkbox" then
        RoCUI_Frames_OptionsEntryText[input_variable]:SetText(Description)
        RoCUI_Frames_OptionsEntry[input_variable]:SetChecked(Value)
    elseif input_type == "Dropdown" then
        local DropdownVariableName = ("RoCUI_Dropdown_"..input_variable)
        local DropdownList = _G[DropdownVariableName]
		local DropdownText = DropdownList[Value]
		local DescriptionText = (Description..":")
        RoCUI_Frames_OptionsEntryText[input_variable]:SetText(DescriptionText)
        RoCUI_Frames_OptionsEntry[input_variable]:SetDefaultText(DropdownText)
    elseif input_type == "DropdownLanguage" then
        for _, v in pairs(RoCUI_Database_Locales) do
            if Value == v["locale"] then
                RoCUI_Frames_OptionsEntry[input_variable]:SetDefaultText(v["DropdownMenuEntry"])
            end
        end
		local DescriptionText = (Description..":")
        RoCUI_Frames_OptionsEntryText[input_variable]:SetText(DescriptionText)
    elseif input_type == "DropdownPowerType" then
        local PowerTypeVariableName = ("RoCUI_Text_Options_OptionsMenu_Infopanel_PowerType_"..Value)
	    local DropdownText = _G[PowerTypeVariableName]
		local DescriptionText = (Description..":")
        RoCUI_Frames_OptionsEntryText[input_variable]:SetText(DescriptionText)
        RoCUI_Frames_OptionsEntry[input_variable]:SetDefaultText(DropdownText)
    elseif input_type == "DropdownStats" then		
		local StatVariableName = ("RoCUI_Text_Options_OptionsMenu_Infopanel_StatType_"..Value)
		local StatVariable = _G[StatVariableName]
		local DescriptionText = (Description..":")
        RoCUI_Frames_OptionsEntryText[input_variable]:SetText(DescriptionText)
        RoCUI_Frames_OptionsEntry[input_variable]:SetDefaultText(StatVariable)
    elseif input_type == "DropdownStatsOther" then		
		local StatVariableName = ("RoCUI_Text_Options_OptionsMenu_Infopanel_StatType_"..Value)
		local StatVariable = _G[StatVariableName]
		local DescriptionTextOther = (RoCUI_Text_Options_OptionsMenu_Infopanel_StatType_Other.." ("..tostring(input_number).."):")
        RoCUI_Frames_OptionsEntryText[input_variable]:SetText(DescriptionTextOther)
        RoCUI_Frames_OptionsEntry[input_variable]:SetDefaultText(StatVariable)
    elseif input_type == "DropdownTopMenu" then
        local DropdownTopMenuVariableName = ("RoCUI_Text_Options_TopMenu_SubmenuType_"..Value.."_Abbreviated")
        local DropdownTopMenuText = _G[DropdownTopMenuVariableName]
		local input_variable_special = "TopMenuButtons_1"
        RoCUI_Frames_OptionsEntry[input_variable]:SetDefaultText(DropdownTopMenuText)
    elseif input_type == "DropdownCombatLockdown" then
        local LockdownTextVariable = ("RoCUI_Text_Options_OptionsMenu_Other_CombatLockdown_"..Value)
        local LockdownText = _G[LockdownTextVariable]
		local DescriptionText = (Description..":")
        RoCUI_Frames_OptionsEntryText[input_variable]:SetText(DescriptionText)
        RoCUI_Frames_OptionsEntry[input_variable]:SetDefaultText(LockdownText)
    elseif input_type == "Slider" then
        RoCUI_Frames_OptionsEntryText[input_variable]:SetText(Description..":")
        RoCUI_Frames_OptionsEntry[input_variable]:SetValue(Value)
    end
end




function RoCUI_Profiles_UpdateUI(input_mode)
    if input_mode == "Initialization" then
        local NewProfileIndex = RoCUI_Profiles_ProfileIndexTextstring(RoCUI_Options_CurrentProfile)
        local NewProfileName = RoCUIDB_Profiles[NewProfileIndex]["Name"]
        RoCUI_Frames_OptionsEntry["Profiles_EditBox"]:SetText(NewProfileName)
		RoCUI_Frames_OptionsEntry["Profiles_Dropdown"]:SetDefaultText(NewProfileIndex)
	else
		RoCUI_Language_Update()
    end


    -- Faction Skin
    RoCUI_FactionSkins_Update()

    -- Top Menu Buttons
    RoCUI_TopMenuButtons_UpdateText_All()

    -- Infopanel
    RoCUI_Infopanel_UpdatePlayerNameAndTitle()
    RoCUI_Infopanel_UpdatePlayerSpecAndLevel()
    RoCUI_Infopanel_UpdatePlayerExperienceBar()
    RoCUI_Infopanel_CheckPlayerEquipment("weapon")
    RoCUI_Infopanel_CheckPlayerEquipment("armor")
	RoCUI_Portrait_UpdatePlayerStats_Health()
	RoCUI_Portrait_UpdatePlayerStats_Power()
    RoCUI_Infopanel_UpdateStatIcon()
    RoCUI_UnitStats_UpdateStatText()


    -- Options Menu
	---- Main Menu
    RoCUI_Profiles_SetMenuEntrySetting("Header", "Main_WindowTitle")
    RoCUI_Profiles_SetMenuEntrySetting("Button", "Main_General")
    RoCUI_Profiles_SetMenuEntrySetting("Button", "Main_Sounds")
    RoCUI_Profiles_SetMenuEntrySetting("Button", "Main_Portrait")
    RoCUI_Profiles_SetMenuEntrySetting("Button", "Main_Infopanel")
    RoCUI_Profiles_SetMenuEntrySetting("Button", "Main_TopMenu")
    RoCUI_Profiles_SetMenuEntrySetting("Button", "Main_Other")
    RoCUI_Profiles_SetMenuEntrySetting("Button", "Main_Profiles")
	
	---- Back Buttons
	for i=2, 7 do
	    local BackName = ("Back"..tostring(i))
		RoCUI_Profiles_SetMenuEntrySetting("ButtonBack", BackName)
	end
	
    ---- General
    RoCUI_Profiles_SetMenuEntrySetting("Header", "General_WindowTitle")
    RoCUI_Profiles_SetMenuEntrySetting("Checkbox", "General_MinimapButton")
	if RoCUI_WoWVersion == "Retail" or RoCUI_WoWVersion == "Forever" then
        RoCUI_Profiles_SetMenuEntrySetting("Checkbox", "General_Compartment")
	end
    RoCUI_Profiles_SetMenuEntrySetting("DropdownLanguage", "General_Language")
    RoCUI_Profiles_SetMenuEntrySetting("Dropdown", "General_FactionSkin")
    RoCUI_Profiles_SetMenuEntrySetting("Slider", "General_Skin_Background")
    RoCUI_Profiles_SetMenuEntrySetting("Slider", "General_Skin_Border")

    ---- Sounds
    RoCUI_Profiles_SetMenuEntrySetting("Header", "Sounds_WindowTitle")
    RoCUI_Profiles_SetMenuEntrySetting("Dropdown", "Sounds_Channel")
    RoCUI_Profiles_SetMenuEntrySetting("Checkbox", "Sounds_DayAndNightCycle")
    RoCUI_Profiles_SetMenuEntrySetting("Checkbox", "Sounds_Override_QUEST_ACCEPTED")
    RoCUI_Profiles_SetMenuEntrySetting("Checkbox", "Sounds_Override_QUEST_TURNED_IN")
    RoCUI_Profiles_SetMenuEntrySetting("Checkbox", "Sounds_Override_LFG_PROPOSAL_SHOW")
    RoCUI_Profiles_SetMenuEntrySetting("Checkbox", "Sounds_Override_PLAYER_DEAD")
    RoCUI_Profiles_SetMenuEntrySetting("Dropdown", "Sounds_Victory")
    RoCUI_Profiles_SetMenuEntrySetting("Dropdown", "Sounds_Defeat")

    ---- Portrait
    RoCUI_Profiles_SetMenuEntrySetting("Header", "Portrait_WindowTitle")
    RoCUI_Profiles_SetMenuEntrySetting("Dropdown", "Portrait_HealthDisplayType")
    RoCUI_Profiles_SetMenuEntrySetting("Checkbox", "Portrait_HealthAbbreviate")
    RoCUI_Profiles_SetMenuEntrySetting("Slider", "Portrait_HealthSize")
    RoCUI_Profiles_SetMenuEntrySetting("Dropdown", "Portrait_PowerDisplayType")
    RoCUI_Profiles_SetMenuEntrySetting("Checkbox", "Portrait_PowerAbbreviate")
    RoCUI_Profiles_SetMenuEntrySetting("Slider", "Portrait_PowerSize")
    RoCUI_Profiles_SetMenuEntrySetting("DropdownPowerType", "Portrait_PowerType")

    ---- Infopanel
    RoCUI_Profiles_SetMenuEntrySetting("Header", "Infopanel_WindowTitle")
    RoCUI_Profiles_SetMenuEntrySetting("Checkbox", "Infopanel_ShowTitle")
	if RoCUI_WoWVersion == "Forever" then
        RoCUI_Profiles_SetMenuEntrySetting("Dropdown", "Infopanel_ForeverName")
    end
	if RoCUI_WoWVersion == "Retail" or RoCUI_WoWVersion == "MoP" then
        RoCUI_Profiles_SetMenuEntrySetting("Checkbox", "Infopanel_ShowSpecName")
        RoCUI_Profiles_SetMenuEntrySetting("Checkbox", "Infopanel_UseSpecIcon")
	end
    RoCUI_Profiles_SetMenuEntrySetting("Checkbox", "Infopanel_UseWC3Icons")
    RoCUI_Profiles_SetMenuEntrySetting("Checkbox", "Infopanel_StatsAbbreviate")
    RoCUI_Profiles_SetMenuEntrySetting("Checkbox", "Infopanel_StatsPercentage")
    RoCUI_Profiles_SetMenuEntrySetting("DropdownStats", "Infopanel_StatType_Offensive")
    RoCUI_Profiles_SetMenuEntrySetting("DropdownStats", "Infopanel_StatType_Defensive")
    RoCUI_Profiles_SetMenuEntrySetting("DropdownStatsOther", "Infopanel_StatType_Other_1", 1)
    RoCUI_Profiles_SetMenuEntrySetting("DropdownStatsOther", "Infopanel_StatType_Other_2", 2)
    RoCUI_Profiles_SetMenuEntrySetting("DropdownStatsOther", "Infopanel_StatType_Other_3", 3)

    -- Top Menu
    RoCUI_Profiles_SetMenuEntrySetting("Header", "TopMenuButtons_WindowTitle")
    RoCUI_Profiles_SetMenuEntrySetting("DropdownTopMenu", "TopMenuButtons_1")
    RoCUI_Profiles_SetMenuEntrySetting("DropdownTopMenu", "TopMenuButtons_2")
    RoCUI_Profiles_SetMenuEntrySetting("DropdownTopMenu", "TopMenuButtons_3")
    RoCUI_Profiles_SetMenuEntrySetting("DropdownTopMenu", "TopMenuButtons_4")
    RoCUI_Profiles_SetMenuEntrySetting("DropdownTopMenu", "TopMenuButtons_5")
    RoCUI_Profiles_SetMenuEntrySetting("DropdownTopMenu", "TopMenuButtons_6")
    RoCUI_Profiles_SetMenuEntrySetting("DropdownTopMenu", "TopMenuButtons_7")
    RoCUI_Profiles_SetMenuEntrySetting("DropdownTopMenu", "TopMenuButtons_8")

    ---- Other
    RoCUI_Profiles_SetMenuEntrySetting("Header", "Other_WindowTitle")
    RoCUI_Profiles_SetMenuEntrySetting("Checkbox", "Other_MessageEnable")
    RoCUI_Profiles_SetMenuEntrySetting("Button", "Other_MessageColor")
    RoCUI_Profiles_SetMenuEntrySetting("DropdownCombatLockdown", "Other_CombatLockdown")

	---- Profiles
    RoCUI_Profiles_SetMenuEntrySetting("Header", "Profiles_WindowTitle")

end