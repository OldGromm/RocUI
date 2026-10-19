function RoCUI_Frames_OptionsMenuProfileReactions(input_profileID)
    if RoCUI_Options_Timeout == false then
	    RoCUI_Options_Timeout = true

        RoCUI_Options_CurrentProfile = input_profileID
		RoCUIDB_Characters[RoCUI_PlayerStats_PlayerID] = input_profileID

        local NewProfileIndex = RoCUI_Profiles_ProfileIndexTextstring(input_profileID)
        local NewProfileName = RoCUIDB_Profiles[NewProfileIndex]["Name"]
        RoCUI_Frames_OptionsEntry["Profiles_EditBox"]:SetText(NewProfileName)

        RoCUI_Setup_DetermineDefaultLanguage()
        RoCUI_Profiles_UpdateUI()

		RunNextFrame(function()
			RoCUI_Options_Timeout = false
		end)
	end
end




function RoCUI_Frames_OptionsMenuCheckboxReactions(input_checkboxID, input_state)
    if RoCUI_Options_Timeout == false then
	    RoCUI_Options_Timeout = true

        RoCUI_PV("Save", input_checkboxID, input_state)

        if input_checkboxID == "General_MinimapButton" then
    		RoCUI_General_ToggleMinimapButton()
    	elseif input_checkboxID == "General_FactionSkin" then
    	    RoCUI_FactionSkins_Update()
    	elseif input_checkboxID == "Sounds_Override_QUEST_ACCEPTED" then	
            RoCUI_Sounds_ToggleReplacements(input_checkboxID, input_state)
    	elseif input_checkboxID == "Sounds_Override_QUEST_TURNED_IN" then
            RoCUI_Sounds_ToggleReplacements(input_checkboxID, input_state)
    	elseif input_checkboxID == "Sounds_Override_LFG_PROPOSAL_SHOW" then
            RoCUI_Sounds_ToggleReplacements(input_checkboxID, input_state)
    	elseif input_checkboxID == "Sounds_Override_PLAYER_DEAD" then
            RoCUI_Sounds_ToggleReplacements(input_checkboxID, input_state)
    	elseif input_checkboxID == "Portrait_HealthAbbreviate" then
    	    RoCUI_Portrait_UpdatePlayerStats_Health()
    	elseif input_checkboxID == "Portrait_PowerAbbreviate" then
    	    RoCUI_Portrait_UpdatePlayerStats_Power()
    	elseif input_checkboxID == "Infopanel_ShowTitle" then
    	    RoCUI_Infopanel_UpdatePlayerNameAndTitle()
    	elseif input_checkboxID == "Infopanel_ShowSpecName" then
    	    RoCUI_Infopanel_UpdatePlayerSpecAndLevel()
    	elseif input_checkboxID == "Infopanel_UseSpecIcon" then
    	    RoCUI_Infopanel_UpdateStatIcon()
    	elseif input_checkboxID == "Infopanel_UseWC3Icons" then
    	    RoCUI_Infopanel_CheckPlayerEquipment("weapon")
    	    RoCUI_Infopanel_CheckPlayerEquipment("armor")
    		RoCUI_Infopanel_UpdateStatIcon()
    	elseif input_checkboxID == "Infopanel_StatsAbbreviate" then
    	    RoCUI_UnitStats_UpdateStatText()
    	elseif input_checkboxID == "Infopanel_StatsPercentage" then
    	    RoCUI_UnitStats_UpdateStatText()
    	end

		RunNextFrame(function()
			RoCUI_Options_Timeout = false
		end)
	end
end







function RoCUI_Frames_OptionsMenuDropdownReactions(input_dropdownID, input_choice)
    if RoCUI_Options_Timeout == false then
	    RoCUI_Options_Timeout = true

        RoCUI_PV("Save", input_dropdownID, input_choice)

        if input_dropdownID == "General_Language" then
    		RoCUI_Profiles_UpdateUI()
    	elseif input_dropdownID == "General_FactionSkin" then
    	    RoCUI_FactionSkins_Update()
        elseif input_dropdownID == "Portrait_HealthDisplayType" then
            RoCUI_Portrait_UpdatePlayerStats_Health()
        elseif input_dropdownID == "Portrait_PowerDisplayType" then
            RoCUI_Portrait_UpdatePlayerStats_Power()
    	elseif input_dropdownID == "Portrait_PowerType" then
    		RoCUI_Portrait_UpdatePlayerStats_Power()
    	elseif input_dropdownID == "Infopanel_ForeverName" then
    	    RoCUI_Infopanel_UpdatePlayerNameAndTitle()
    	elseif input_dropdownID == "Infopanel_StatType_Offensive" then
            RoCUI_UnitStats_UpdateStatText()
    	elseif input_dropdownID == "Infopanel_StatType_Defensive" then
            RoCUI_UnitStats_UpdateStatText()
    	elseif input_dropdownID == "Infopanel_StatType_Other_1" then
            RoCUI_UnitStats_UpdateStatText()
    	elseif input_dropdownID == "Infopanel_StatType_Other_2" then
            RoCUI_UnitStats_UpdateStatText()
    	elseif input_dropdownID == "Infopanel_StatType_Other_3" then
            RoCUI_UnitStats_UpdateStatText()
    	end

		RunNextFrame(function()
			RoCUI_Options_Timeout = false
		end)
	end
end




function RoCUI_Frames_OptionsMenuSliderReactions(input_sliderID, input_value)
    if RoCUI_Options_Timeout == false then
	    RoCUI_Options_Timeout = true

        if RoCUI_PV("Load", input_sliderID) == input_value then
	
    	else
            RoCUI_PV("Save", input_sliderID, input_value)

            if input_sliderID == "General_Skin_Background" then
                RoCUI_FactionSkins_Update()
            elseif input_sliderID == "General_Skin_Border" then
                RoCUI_FactionSkins_Update()
            elseif input_sliderID == "Portrait_HealthSize" then
    		    RoCUI_Portrait_UpdateTextSize()
    		elseif input_sliderID == "Portrait_PowerSize" then
    		    RoCUI_Portrait_UpdateTextSize()
            end
    	end

		RunNextFrame(function()
			RoCUI_Options_Timeout = false
		end)
	end
end




function RoCUI_Frames_OptionsMenuButtonReactions(input_buttonID)
    if RoCUI_Options_Timeout == false then
	    RoCUI_Options_Timeout = true

        for i=1, 8 do
            local FrameName = ("Menu_"..tostring(i))
            RoCUI_Frames_OptionsMenuPage[FrameName]:Hide()
        end
        local FrameNameOpen = ("Menu_"..tostring(input_buttonID))
    	RoCUI_Frames_OptionsMenuPage[FrameNameOpen]:Show()
    	PlaySoundFile("Interface\\AddOns\\RoCUI\\sounds\\interface\\BigButtonClick.ogg", "SFX")

		RunNextFrame(function()
			RoCUI_Options_Timeout = false
		end)
	end
end




function RoCUI_Frames_CreateOptionsMenuEntries(input_submenuID, input_type, input_entry, input_buttonID, input_slidermin, input_slidermax, input_sliderstep)
    local VariableName_Title = ("RoCUI_Text_Options_OptionsMenu_"..input_entry)
	local FrameText = _G[VariableName_Title]
	local Position_Y = 0
	local Position_Y_Textstring = 0


    -- position of the options entry
	local VariableName = ("Position"..tostring(input_submenuID))
    if RoCUI_Frames_OptionsEntryPosition[VariableName] == nil then
	    RoCUI_Frames_OptionsEntryPosition[VariableName] = 0
	end
	
	RoCUI_Frames_OptionsEntryPosition[VariableName] = RoCUI_Frames_OptionsEntryPosition[VariableName] + 1
	Position_Y = (-30 + (-40 * RoCUI_Frames_OptionsEntryPosition[VariableName]))
	Position_Y_Textstring = (Position_Y-8)


	local FrameName = ("Menu_"..tostring(input_submenuID))
	local SubFrame = RoCUI_Frames_OptionsMenuPage[FrameName]


	if input_type == "Header" then
		local Textstring = SubFrame:CreateFontString(nil, "OVERLAY", "RoCUIOptionsMenuHeaderFont")
		RoCUI_Frames_OptionsEntryText[input_entry] = Textstring
        Textstring:SetPoint("TOP", SubFrame, "TOP", 0, -40)
        Textstring:SetText(FrameText)
    elseif input_type == "Checkbox" then
	    local Textstring = SubFrame:CreateFontString(nil, "OVERLAY", "RoCUIOptionsMenuFont")
		RoCUI_Frames_OptionsEntryText[input_entry] = Textstring
        Textstring:SetPoint("TOPLEFT", SubFrame, "TOPLEFT", 75, Position_Y_Textstring)
        Textstring:SetText(FrameText)

	    local Checkbox = CreateFrame("CheckButton", nil, SubFrame, "RoCUICheckboxTemplate")
		RoCUI_Frames_OptionsEntry[input_entry] = Checkbox
        Checkbox:SetPoint("TOPLEFT", SubFrame, "TOPLEFT", 40, Position_Y)
		Checkbox:SetSize(32, 32)
		Checkbox:HookScript("OnClick", function()
		    local CheckboxState = Checkbox:GetChecked()
            RoCUI_Frames_OptionsMenuCheckboxReactions(input_entry, CheckboxState)
        end)
    elseif input_type == "Dropdown" then
        local Textstring = SubFrame:CreateFontString(nil, "OVERLAY", "RoCUIOptionsMenuFont")
		RoCUI_Frames_OptionsEntryText[input_entry] = Textstring
        Textstring:SetPoint("TOPLEFT", SubFrame, "TOPLEFT", 40, Position_Y_Textstring)
        Textstring:SetText(FrameText..":")

        local DropdownFrame = CreateFrame("DropdownButton", nil, SubFrame, "RoCUIOptionsMenuDropdownTemplate")
		RoCUI_Frames_OptionsEntry[input_entry] = DropdownFrame
        DropdownFrame:SetPoint("TOPRIGHT", SubFrame, "TOPRIGHT", -40, Position_Y)
        DropdownFrame:SetupMenu(function(dropdown, rootDescription)
		
		    local DropdownVariableName = ("RoCUI_Dropdown_"..input_entry)
		    local DropdownTable = _G[DropdownVariableName]
            for i, v in ipairs(DropdownTable) do
                rootDescription:CreateButton(v, function()
				    DropdownFrame:SetDefaultText(v)
                    RoCUI_Frames_OptionsMenuDropdownReactions(input_entry, i)
                end)
            end
		end)
    elseif input_type == "DropdownLanguage" then
        local Textstring = SubFrame:CreateFontString(nil, "OVERLAY", "RoCUIOptionsMenuFont")
		RoCUI_Frames_OptionsEntryText[input_entry] = Textstring
        Textstring:SetPoint("TOPLEFT", SubFrame, "TOPLEFT", 40, Position_Y_Textstring)
        Textstring:SetText(FrameText..":")

        local DropdownFrame = CreateFrame("DropdownButton", nil, SubFrame, "RoCUIOptionsMenuDropdownTemplate")
		RoCUI_Frames_OptionsEntry[input_entry] = DropdownFrame
        DropdownFrame:SetPoint("TOPRIGHT", SubFrame, "TOPRIGHT", -40, Position_Y)
        DropdownFrame:SetupMenu(function(dropdown, rootDescription)
            for _, v in pairs(RoCUI_Database_Locales) do
                rootDescription:CreateButton(v["DropdownMenuEntry"], function()
                    RoCUI_Frames_OptionsMenuDropdownReactions(input_entry, v["locale"])
                end)
            end
		end)
    elseif input_type == "DropdownPowerType" then
        local Textstring = SubFrame:CreateFontString(nil, "OVERLAY", "RoCUIOptionsMenuFont")
		RoCUI_Frames_OptionsEntryText[input_entry] = Textstring
        Textstring:SetPoint("TOPLEFT", SubFrame, "TOPLEFT", 40, Position_Y_Textstring)
        Textstring:SetText(FrameText..":")

        local DropdownFrame = CreateFrame("DropdownButton", nil, SubFrame, "RoCUIOptionsMenuDropdownTemplate")
		RoCUI_Frames_OptionsEntry[input_entry] = DropdownFrame
        DropdownFrame:SetPoint("TOPRIGHT", SubFrame, "TOPRIGHT", -40, Position_Y)
        DropdownFrame:SetupMenu(function(dropdown, rootDescription)
            for _, v in pairs(RoCUI_Database_PowerTypes) do
			    if RoCUI_Portrait_PowerTypeCheck(v["ID"]) == true then
                    local VariableName = ("RoCUI_Text_Options_OptionsMenu_Infopanel_PowerType_"..v["Type"])
                    local Variable = _G[VariableName]
					rootDescription:CreateButton(Variable, function()
						DropdownFrame:SetDefaultText(Variable)
                        RoCUI_Frames_OptionsMenuDropdownReactions(input_entry, v["Type"])
                    end)
                end
            end
		end)
    elseif input_type == "DropdownStats" then
        local Textstring = SubFrame:CreateFontString(nil, "OVERLAY", "RoCUIOptionsMenuFont")
		RoCUI_Frames_OptionsEntryText[input_entry] = Textstring
        Textstring:SetPoint("TOPLEFT", SubFrame, "TOPLEFT", 40, Position_Y_Textstring)
        Textstring:SetText(FrameText..":")

        local DropdownFrame = CreateFrame("DropdownButton", nil, SubFrame, "RoCUIOptionsMenuDropdownTemplate")
		RoCUI_Frames_OptionsEntry[input_entry] = DropdownFrame
        DropdownFrame:SetPoint("TOPRIGHT", SubFrame, "TOPRIGHT", -40, Position_Y)
        DropdownFrame:SetupMenu(function(dropdown, rootDescription)
		
		    local DropdownVariableName = ("RoCUI_Dropdown_"..input_entry)
		    local DropdownTable = _G[DropdownVariableName]
            for i, v in ipairs(DropdownTable) do
                local DropdownVariableName = ("RoCUI_Text_Options_OptionsMenu_Infopanel_StatType_"..v)
				local DropdownName = _G[DropdownVariableName]
                rootDescription:CreateButton(DropdownName, function()
				    DropdownFrame:SetDefaultText(DropdownName)
                    RoCUI_Frames_OptionsMenuDropdownReactions(input_entry, v)
                end)
            end
		end)
    elseif input_type == "DropdownStatsOther" then
        local Textstring = SubFrame:CreateFontString(nil, "OVERLAY", "RoCUIOptionsMenuFont")
		RoCUI_Frames_OptionsEntryText[input_entry] = Textstring
        Textstring:SetPoint("TOPLEFT", SubFrame, "TOPLEFT", 40, Position_Y_Textstring)

        local DropdownFrame = CreateFrame("DropdownButton", nil, SubFrame, "RoCUIOptionsMenuDropdownTemplate")
		RoCUI_Frames_OptionsEntry[input_entry] = DropdownFrame
        DropdownFrame:SetPoint("TOPRIGHT", SubFrame, "TOPRIGHT", -40, Position_Y)
        DropdownFrame:SetupMenu(function(dropdown, rootDescription)

            for i, v in ipairs(RoCUI_Dropdown_Infopanel_StatType_Other) do
                local DropdownVariableName = ("RoCUI_Text_Options_OptionsMenu_Infopanel_StatType_"..v)
				local DropdownName = _G[DropdownVariableName]
                rootDescription:CreateButton(DropdownName, function()
				    DropdownFrame:SetDefaultText(DropdownName)
                    RoCUI_Frames_OptionsMenuDropdownReactions(input_entry, v)
                end)
            end
		end)
    elseif input_type == "DropdownTopMenu" then
        local DropdownFrame = CreateFrame("DropdownButton", nil, SubFrame, "RoCUIOptionsMenuDropdownTemplate")
		RoCUI_Frames_OptionsEntry[input_entry] = DropdownFrame
        DropdownFrame:SetPoint("TOP", SubFrame, "TOP", 0, Position_Y)
        DropdownFrame:SetupMenu(function(dropdown, rootDescription)
            for _, v in ipairs(RoCUI_TopMenuButtons_List) do
                local TextVariableName = ("RoCUI_Text_Options_TopMenu_SubmenuType_"..v)
                local TextVariable = _G[TextVariableName]
                rootDescription:CreateButton(TextVariable, function()
                    local VariableName = ("TopMenuButtons_"..input_buttonID)
                    RoCUI_PV("Save", VariableName, v)
					RoCUI_TopMenuButtons_UpdateText(input_buttonID, v)
                end)
            end
		end)
    elseif input_type == "DropdownCombatLockdown" then
        local Textstring = SubFrame:CreateFontString(nil, "OVERLAY", "RoCUIOptionsMenuFont")
		RoCUI_Frames_OptionsEntryText[input_entry] = Textstring
        Textstring:SetPoint("TOPLEFT", SubFrame, "TOPLEFT", 40, Position_Y_Textstring)
        Textstring:SetText(FrameText..":")

        local DropdownFrame = CreateFrame("DropdownButton", nil, SubFrame, "RoCUIOptionsMenuDropdownTemplate")
		RoCUI_Frames_OptionsEntry[input_entry] = DropdownFrame
        DropdownFrame:SetPoint("TOPRIGHT", SubFrame, "TOPRIGHT", -40, Position_Y)
        DropdownFrame:SetupMenu(function(dropdown, rootDescription)
            for _, v in ipairs(RoCUI_CombatLockdown_TypeList) do
                local LockdownTextVariable = ("RoCUI_Text_Options_OptionsMenu_Other_CombatLockdown_"..v)
                local LockdownText = _G[LockdownTextVariable]
                rootDescription:CreateButton(LockdownText, function()
					DropdownFrame:SetDefaultText(LockdownText)
                    RoCUI_Frames_OptionsMenuDropdownReactions(input_entry, v)
                end)
            end
		end)
	elseif input_type == "Slider" then
        local Textstring = SubFrame:CreateFontString(nil, "OVERLAY", "RoCUIOptionsMenuFont")
		RoCUI_Frames_OptionsEntryText[input_entry] = Textstring
        Textstring:SetPoint("TOPLEFT", SubFrame, "TOPLEFT", 40, Position_Y_Textstring)
        Textstring:SetText(FrameText..":")

        local SliderFrame = CreateFrame("Slider", nil, SubFrame, "RoCUISliderTemplate")
		RoCUI_Frames_OptionsEntry[input_entry] = SliderFrame
		tinsert(RoCUI_Frames_SlidersList, input_entry)
        SliderFrame:SetPoint("TOPRIGHT", SubFrame, "TOPRIGHT", -40, Position_Y)
        SliderFrame:SetSize(128, 32)
        SliderFrame:SetMinMaxValues(input_slidermin, input_slidermax)
		SliderFrame:SetValueStep(input_sliderstep)
        SliderFrame:SetObeyStepOnDrag(true)
        SliderFrame:SetScript("OnValueChanged", function(self, value)
            RoCUI_Frames_OptionsMenuSliderReactions(input_entry, value)
        end)
    elseif input_type == "Button" then
		local ButtonFrame = CreateFrame("Button", nil, SubFrame, "RoCUITopMenuButtonTemplate")
        ButtonFrame:SetSize(134, 30)
        ButtonFrame:SetText(FrameText)
        if input_entry == "Back" then
		    ButtonFrame:SetPoint("BOTTOM", SubFrame, "BOTTOM", 0, 35)
			local BackName = ("Back"..tostring(input_submenuID))
			RoCUI_Frames_OptionsEntry[BackName] = ButtonFrame

			local BackButtonName = (input_entry..tostring(input_submenuID))
			RoCUI_Frames_Buttons[BackButtonName] = ButtonFrame
			tinsert(RoCUI_Factions_ButtonList, BackButtonName)
		else
		    ButtonFrame:SetPoint("TOP", SubFrame, "TOP", 0, Position_Y)
			RoCUI_Frames_OptionsEntry[input_entry] = ButtonFrame

            RoCUI_Frames_Buttons[input_entry] = ButtonFrame
			tinsert(RoCUI_Factions_ButtonList, input_entry)
		end

    	ButtonFrame:SetScript("OnClick", function(self, button)
            RoCUI_Frames_OptionsMenuButtonReactions(input_buttonID)
        end)
    elseif input_type == "ButtonColor" then
		local ButtonFrame = CreateFrame("Button", nil, SubFrame, "RoCUITopMenuButtonTemplate")
        RoCUI_Frames_Buttons[input_entry] = ButtonFrame
        tinsert(RoCUI_Factions_ButtonList, input_entry)
		RoCUI_Frames_OptionsEntry[input_entry] = ButtonFrame
        ButtonFrame:SetSize(134, 30)
        ButtonFrame:SetText(FrameText)
		ButtonFrame:SetPoint("TOPLEFT", SubFrame, "TOPLEFT", 40, Position_Y)

    	ButtonFrame:SetScript("OnClick", function(self, button)
            local Red = RoCUI_PV("Load", "Other_MessageColor_Red")
            local Green = RoCUI_PV("Load", "Other_MessageColor_Green")
            local Blue = RoCUI_PV("Load", "Other_MessageColor_Blue")
            RoCUI_General_ShowColorPicker(Red, Green, Blue)
        end)
    elseif input_type == "ProfilesList" then
        local DropdownFrame = CreateFrame("DropdownButton", nil, SubFrame, "RoCUIOptionsMenuDropdownTemplate")
        RoCUI_Frames_OptionsEntry[input_entry] = DropdownFrame
        DropdownFrame:SetPoint("TOPLEFT", SubFrame, "TOPLEFT", 40, Position_Y)
        DropdownFrame:SetupMenu(function(dropdown, rootDescription)
            for i=1, 10 do
            	local profileindex = RoCUI_Profiles_ProfileIndexTextstring(i)
		    	local profilename = RoCUIDB_Profiles[profileindex]["Name"]
		    	if profilename == nil then
		    	    profilename = ""
		    	end
		    	local displayname = (profileindex.." "..profilename)
            	rootDescription:CreateButton(displayname, function()
                    DropdownFrame:SetDefaultText(profileindex)
					RoCUI_Frames_OptionsMenuProfileReactions(i)
            	end)
            end
		
		end)

        local EditFieldBackground = CreateFrame("Frame", nil, SubFrame, "BackdropTemplate")
		EditFieldBackground:SetPoint("TOPLEFT", SubFrame, "TOPLEFT", 250, Position_Y)
		EditFieldBackground:SetSize(150, 30)
		EditFieldBackground:SetBackdrop(BACKDROP_SLIDER_8_8)

        local EditFieldInput = CreateFrame("EditBox", nil, SubFrame, "RoCUIInputBoxTemplate")
		RoCUI_Frames_OptionsEntry["Profiles_EditBox"] = EditFieldInput
		EditFieldInput:SetPoint("TOPLEFT", SubFrame, "TOPLEFT", 250, Position_Y)
		EditFieldInput:SetSize(150, 30)
        EditFieldInput:SetFontObject("RoCUIOptionsMenuFont")
        EditFieldInput:SetAutoFocus(false)
        EditFieldInput:SetTextInsets(5, 0, 0, 0) 
        EditFieldInput:SetJustifyH("LEFT")
        EditFieldInput:SetScript("OnTextChanged", function(self)
            if RoCUI_Options_EditBox_Timeout == false then
        	    local profileindex = RoCUI_Profiles_ProfileIndexTextstring(RoCUI_Options_CurrentProfile)
                local text = EditFieldInput:GetText()
        	    local count = strlenutf8(text)
        	    if count > 20 then
        		    RoCUI_Options_EditBox_Timeout = true
        	        local textnew = string.sub(text, 0, 20)
        		    EditFieldInput:SetText(textnew)
        		    RoCUIDB_Profiles[profileindex]["Name"] = textnew
        			RunNextFrame(function()
                        RoCUI_Options_EditBox_Timeout = false
                    end)
        	    else
        	        RoCUIDB_Profiles[profileindex]["Name"] = EditFieldInput:GetText()
        		end
        	end
        end)
	end
end




function RoCUI_Frames_CreateOptionsMenu()
    RoCUI_Frames["OptionsMenu"]:SetFrameLevel(1)
    RoCUI_Frames_Backgrounds["OptionsMenu"]:SetFrameLevel(2)
	
	local BaseFrame = RoCUI_Frames["OptionsMenu"]
	
	for i=1, 8 do
	    local NewFrame = CreateFrame("Frame", nil, BaseFrame)
		NewFrame:SetSize(500, 650)
		NewFrame:SetPoint("CENTER", "RoCUI_FrameWindowName_OptionsMenu", "CENTER", 0, 0)
		NewFrame:SetFrameLevel(3)
		NewFrame:Hide()
	
	    local FrameName = ("Menu_"..tostring(i))
	    RoCUI_Frames_OptionsMenuPage[FrameName] = NewFrame
	end
	RoCUI_Frames_OptionsMenuPage["Menu_1"]:Show()


    RoCUI_Frames_CreateOptionsMenuEntries(1, "Header", "Main_WindowTitle")
    RoCUI_Frames_CreateOptionsMenuEntries(1, "Button", "Main_General", 2)
    RoCUI_Frames_CreateOptionsMenuEntries(1, "Button", "Main_Sounds", 3)
    RoCUI_Frames_CreateOptionsMenuEntries(1, "Button", "Main_Portrait", 4)
    RoCUI_Frames_CreateOptionsMenuEntries(1, "Button", "Main_Infopanel", 5)
    RoCUI_Frames_CreateOptionsMenuEntries(1, "Button", "Main_TopMenu", 6)
    RoCUI_Frames_CreateOptionsMenuEntries(1, "Button", "Main_Other", 7)
    RoCUI_Frames_CreateOptionsMenuEntries(1, "Button", "Main_Profiles", 8)


    RoCUI_Frames_CreateOptionsMenuEntries(2, "Header", "General_WindowTitle")
	RoCUI_Frames_CreateOptionsMenuEntries(2, "Checkbox", "General_MinimapButton")

	if RoCUI_WoWVersion == "Retail" or RoCUI_WoWVersion == "Forever" then
	    RoCUI_Frames_CreateOptionsMenuEntries(2, "Checkbox", "General_Compartment")
	end

    RoCUI_Frames_CreateOptionsMenuEntries(2, "DropdownLanguage", "General_Language")
    RoCUI_Frames_CreateOptionsMenuEntries(2, "Dropdown", "General_FactionSkin")
	RoCUI_Frames_CreateOptionsMenuEntries(2, "Slider", "General_Skin_Background", nil, 1, 3, 1)
	RoCUI_Frames_CreateOptionsMenuEntries(2, "Slider", "General_Skin_Border", nil, 1, 3, 1)
	RoCUI_Frames_CreateOptionsMenuEntries(2, "Button", "Back", 1)


    RoCUI_Frames_CreateOptionsMenuEntries(3, "Header", "Sounds_WindowTitle")
	RoCUI_Frames_CreateOptionsMenuEntries(3, "Dropdown", "Sounds_Channel")
	RoCUI_Frames_CreateOptionsMenuEntries(3, "Checkbox", "Sounds_DayAndNightCycle")
    RoCUI_Frames_CreateOptionsMenuEntries(3, "Checkbox", "Sounds_Override_QUEST_ACCEPTED")
    RoCUI_Frames_CreateOptionsMenuEntries(3, "Checkbox", "Sounds_Override_QUEST_TURNED_IN")
    RoCUI_Frames_CreateOptionsMenuEntries(3, "Checkbox", "Sounds_Override_LFG_PROPOSAL_SHOW")
    RoCUI_Frames_CreateOptionsMenuEntries(3, "Checkbox", "Sounds_Override_PLAYER_DEAD")
    RoCUI_Frames_CreateOptionsMenuEntries(3, "Dropdown", "Sounds_Victory")
    RoCUI_Frames_CreateOptionsMenuEntries(3, "Dropdown", "Sounds_Defeat")
	RoCUI_Frames_CreateOptionsMenuEntries(3, "Button", "Back", 1)


    RoCUI_Frames_CreateOptionsMenuEntries(4, "Header", "Portrait_WindowTitle")
    RoCUI_Frames_CreateOptionsMenuEntries(4, "Dropdown", "Portrait_HealthDisplayType")
    RoCUI_Frames_CreateOptionsMenuEntries(4, "Checkbox", "Portrait_HealthAbbreviate")
    RoCUI_Frames_CreateOptionsMenuEntries(4, "Slider", "Portrait_HealthSize", nil, 0.5, 1.5, 0.1)
    RoCUI_Frames_CreateOptionsMenuEntries(4, "Dropdown", "Portrait_PowerDisplayType")
    RoCUI_Frames_CreateOptionsMenuEntries(4, "Checkbox", "Portrait_PowerAbbreviate")
    RoCUI_Frames_CreateOptionsMenuEntries(4, "Slider", "Portrait_PowerSize", nil, 0.5, 1.5, 0.1)
    RoCUI_Frames_CreateOptionsMenuEntries(4, "DropdownPowerType", "Portrait_PowerType")
	RoCUI_Frames_CreateOptionsMenuEntries(4, "Button", "Back", 1)


    RoCUI_Frames_CreateOptionsMenuEntries(5, "Header", "Infopanel_WindowTitle")
	RoCUI_Frames_CreateOptionsMenuEntries(5, "Checkbox", "Infopanel_ShowTitle")

	if RoCUI_WoWVersion == "Forever" then
        RoCUI_Frames_CreateOptionsMenuEntries(5, "Dropdown", "Infopanel_ForeverName")
    end

    RoCUI_Frames_CreateOptionsMenuEntries(5, "Checkbox", "Infopanel_UseWC3Icons")

	if RoCUI_WoWVersion == "Retail" or RoCUI_WoWVersion == "MoP" then
        RoCUI_Frames_CreateOptionsMenuEntries(5, "Checkbox", "Infopanel_ShowSpecName")
		RoCUI_Frames_CreateOptionsMenuEntries(5, "Checkbox", "Infopanel_UseSpecIcon")
	end

    RoCUI_Frames_CreateOptionsMenuEntries(5, "Checkbox", "Infopanel_StatsAbbreviate")
    RoCUI_Frames_CreateOptionsMenuEntries(5, "Checkbox", "Infopanel_StatsPercentage")
    RoCUI_Frames_CreateOptionsMenuEntries(5, "DropdownStats", "Infopanel_StatType_Offensive")
    RoCUI_Frames_CreateOptionsMenuEntries(5, "DropdownStats", "Infopanel_StatType_Defensive")
    RoCUI_Frames_CreateOptionsMenuEntries(5, "DropdownStatsOther", "Infopanel_StatType_Other_1", 1)
	RoCUI_Frames_CreateOptionsMenuEntries(5, "DropdownStatsOther", "Infopanel_StatType_Other_2", 2)
	RoCUI_Frames_CreateOptionsMenuEntries(5, "DropdownStatsOther", "Infopanel_StatType_Other_3", 3)
	RoCUI_Frames_CreateOptionsMenuEntries(5, "Button", "Back", 1)


	RoCUI_Frames_CreateOptionsMenuEntries(6, "Header", "TopMenuButtons_WindowTitle")
	RoCUI_Frames_CreateOptionsMenuEntries(6, "DropdownTopMenu", "TopMenuButtons_1", 1)
	RoCUI_Frames_CreateOptionsMenuEntries(6, "DropdownTopMenu", "TopMenuButtons_2", 2)
	RoCUI_Frames_CreateOptionsMenuEntries(6, "DropdownTopMenu", "TopMenuButtons_3", 3)
	RoCUI_Frames_CreateOptionsMenuEntries(6, "DropdownTopMenu", "TopMenuButtons_4", 4)
	RoCUI_Frames_CreateOptionsMenuEntries(6, "DropdownTopMenu", "TopMenuButtons_5", 5)
	RoCUI_Frames_CreateOptionsMenuEntries(6, "DropdownTopMenu", "TopMenuButtons_6", 6)
	RoCUI_Frames_CreateOptionsMenuEntries(6, "DropdownTopMenu", "TopMenuButtons_7", 7)
	RoCUI_Frames_CreateOptionsMenuEntries(6, "DropdownTopMenu", "TopMenuButtons_8", 8)
	RoCUI_Frames_CreateOptionsMenuEntries(6, "Button", "Back", 1)


	RoCUI_Frames_CreateOptionsMenuEntries(7, "Header", "Other_WindowTitle")
	RoCUI_Frames_CreateOptionsMenuEntries(7, "Checkbox", "Other_MessageEnable")
	RoCUI_Frames_CreateOptionsMenuEntries(7, "ButtonColor", "Other_MessageColor")
	RoCUI_Frames_CreateOptionsMenuEntries(7, "DropdownCombatLockdown", "Other_CombatLockdown")
	RoCUI_Frames_CreateOptionsMenuEntries(7, "Button", "Back", 1)


	RoCUI_Frames_CreateOptionsMenuEntries(8, "Header", "Profiles_WindowTitle")
	RoCUI_Frames_CreateOptionsMenuEntries(8, "ProfilesList", "Profiles_Dropdown")
	RoCUI_Frames_CreateOptionsMenuEntries(8, "Button", "Back", 1)
end