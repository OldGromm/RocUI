RoCUI_Options_Category_Main, RoCUI_Options_Layout_Main = Settings.RegisterVerticalLayoutCategory(RoCUI_Text_Options_Category_Title)
RoCUI_Options_Category_Sub_general = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_General)
RoCUI_Options_Category_Sub_main = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_Main)
RoCUI_Options_Category_Sub_sun = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_Sundial)
RoCUI_Options_Category_Sub_sound = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_Sound)
RoCUI_Options_Category_Sub_portraitplayer = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_PlayerPortrait)
RoCUI_Options_Category_Sub_infoplayer = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_PlayerInfo)
RoCUI_Options_Category_Sub_top1 = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_Top_01)
RoCUI_Options_Category_Sub_top2 = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_Top_02)
RoCUI_Options_Category_Sub_top3 = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_Top_03)
RoCUI_Options_Category_Sub_top4 = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_Top_04)
RoCUI_Options_Category_Sub_top5 = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_Top_05)
RoCUI_Options_Category_Sub_top6 = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_Top_06)
RoCUI_Options_Category_Sub_top7 = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_Top_07)
RoCUI_Options_Category_Sub_top8 = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_Top_08)
RoCUI_Options_Category_Sub_additional1 = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_Additional_01)
RoCUI_Options_Category_Sub_additional2 = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_Additional_02)
RoCUI_Options_Category_Sub_additional3 = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_Additional_03)
RoCUI_Options_Category_Sub_additional4 = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_Additional_04)




local function OnSettingChanged_General(setting, value)
    if not PlayerIsInCombat() then
        if setting.variable == "RoCUI_Options_General_MinimapButton" then
	        RoCUI_ToggleMinimapButton()
	    elseif setting.variable == "RoCUI_Options_General_FactionSkin" then
	        RoCUI_Update_RefreshFactionSkin()
	    elseif setting.variable == "RoCUI_Options_General_ToggleDisplay" then
	        RoCUI_ToggleDisplay()
	    else
	    end
	else
	    RoCUI_SendChatMessage(RoCUI_Text_CombatWarning)
	end
end

local function OnSettingChanged_Frames(setting, value)
    if not PlayerIsInCombat() then
        for i, v in ipairs(RoCUI_Table_Options_Frametypes) do
	        if setting.variable == ("RoCUI_Options_FrameVisibility_"..v) then
                RoCUI_Update_FrameVisibility(setting.variableKey, v)
	        elseif setting.variable == ("RoCUI_Options_FrameStrata_"..v) then
                RoCUI_Update_FrameStrata(setting.variableKey, v)
	        elseif setting.variable == ("RoCUI_Options_FrameScale_"..v) then
                RoCUI_Update_FrameScale(setting.variableKey, v)
	        elseif setting.variable == ("RoCUI_Options_FrameWidth_"..v) then
                RoCUI_Update_FrameDimensions_Width(setting.variableKey, v)
	        elseif setting.variable == ("RoCUI_Options_FrameHeight_"..v) then
                RoCUI_Update_FrameDimensions_Height(setting.variableKey, v)
	        elseif setting.variable == ("RoCUI_Options_FramePosition_X_"..v) then
                RoCUI_Update_FramePosition(setting.variableKey, v)
	        elseif setting.variable == ("RoCUI_Options_FramePosition_Y_"..v) then
                RoCUI_Update_FramePosition(setting.variableKey, v)
	        elseif setting.variable == ("RoCUI_Options_Backdropinfo_Border_"..v) then
                RoCUI_Update_FactionSkin(v, "backdrop")
	        elseif setting.variable == ("RoCUI_Options_Backdropinfo_Background_"..v) then
                RoCUI_Update_FactionSkin(v, "backdrop")
	        else
            end
        end
	else
	    RoCUI_SendChatMessage(RoCUI_Text_CombatWarning)
	end
end


local function OnSettingChanged_TopMenu(setting, value)
    if not PlayerIsInCombat() then
        for i, v in ipairs(RoCUI_Table_TopMenuVariableNames) do
		    local RoCUI_Temp_FrameTypeName = ("menubutton"..tostring(i))
	        if setting.variable == ("RoCUI_Options_TopMenuChoice_"..v) then
		        RoCUI_ButtonTextUpdate(RoCUI_Temp_FrameTypeName, value)
		    end
	    end
	else
	    RoCUI_SendChatMessage(RoCUI_Text_CombatWarning)
	end
end


local function OnSettingChanged_SoundOverrides(setting, value)
    if not PlayerIsInCombat() then
        RoCUI_SoundReplacements(setting.variable, value)
	else
	    RoCUI_SendChatMessage(RoCUI_Text_CombatWarning)
	end
end


local function OnSettingChanged_PortraitPowerType(setting, value)
    if not PlayerIsInCombat() then
        RoCUI_UpdatePlayerStats_Mana()
	else
	    RoCUI_SendChatMessage(RoCUI_Text_CombatWarning)
	end
end


-- create all the standard customization entries for each mayor frame. Any additional option will be added below.
function RoCUI_CreateOptions_Visibility(input_frametype)
    local RoCUI_Temp_Categorystring = ("RoCUI_Options_Category_Sub_"..input_frametype)

	local name = RoCUI_Text_Options_Frames_Visibility_Title
	local variable = ("RoCUI_Options_FrameVisibility_"..input_frametype)
	local variableKey = ("FrameVisibility_"..input_frametype)
	local tooltip = RoCUI_Text_Options_Frames_Visibility_Description

	local setting = Settings.RegisterAddOnSetting(_G[RoCUI_Temp_Categorystring], variable, variableKey, RoCUIDB_Options, Settings.VarType.Boolean, name, Settings.Default.True)
	setting:SetValueChangedCallback(OnSettingChanged_Frames)

	Settings.CreateCheckbox(_G[RoCUI_Temp_Categorystring], setting, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, true)
end

function RoCUI_CreateOptions_Visibility_HiddenByDefault(input_frametype)
    local RoCUI_Temp_Categorystring = ("RoCUI_Options_Category_Sub_"..input_frametype)

	local name = RoCUI_Text_Options_Frames_Visibility_Title
	local variable = ("RoCUI_Options_FrameVisibility_"..input_frametype)
	local variableKey = ("FrameVisibility_"..input_frametype)
	local tooltip = RoCUI_Text_Options_Frames_Visibility_Description

	local setting = Settings.RegisterAddOnSetting(_G[RoCUI_Temp_Categorystring], variable, variableKey, RoCUIDB_Options, Settings.VarType.Boolean, name, Settings.Default.False)
	setting:SetValueChangedCallback(OnSettingChanged_Frames)

	Settings.CreateCheckbox(_G[RoCUI_Temp_Categorystring], setting, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, false)
end

function RoCUI_CreateOptions_Strata(input_frametype)
    local RoCUI_Temp_Categorystring = ("RoCUI_Options_Category_Sub_"..input_frametype)

	local name = RoCUI_Text_Options_Frames_Strata_Title
	local variable = ("RoCUI_Options_FrameStrata_"..input_frametype)
	local variableKey = ("FrameStrata_"..input_frametype)
	local tooltip = RoCUI_Text_Options_Frames_Strata_Description
	local minValue = 1
	local maxValue = 8
	local step = 1

	local function GetValue()
		return RoCUIDB_Options[variableKey] or defaultValue
	end

	local function SetValue(value)
		RoCUIDB_Options[variableKey] = value
	end
    local setting = Settings.RegisterAddOnSetting(_G[RoCUI_Temp_Categorystring], variable, variableKey, RoCUIDB_Options, Settings.VarType.Number, name, minValue)
	setting:SetValueChangedCallback(OnSettingChanged_Frames)

	local options = Settings.CreateSliderOptions(minValue, maxValue, step)
	options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right)
	Settings.CreateSlider(_G[RoCUI_Temp_Categorystring], setting, options, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, minValue)
end

function RoCUI_CreateOptions_Scale(input_frametype)
    local RoCUI_Temp_Categorystring = ("RoCUI_Options_Category_Sub_"..input_frametype)

	local name = RoCUI_Text_Options_Frames_Scale_Title
	local variable = ("RoCUI_Options_FrameScale_"..input_frametype)
	local variableKey = ("FrameScale_"..input_frametype)
	local tooltip = RoCUI_Text_Options_Frames_Scale_Description
	local minValue = 0.5
	local maxValue = 3.0
	local step = 0.01

	local function GetValue()
		return RoCUIDB_Options[variableKey] or defaultValue
	end

	local function SetValue(value)
		RoCUIDB_Options[variableKey] = value
	end
    local setting = Settings.RegisterAddOnSetting(_G[RoCUI_Temp_Categorystring], variable, variableKey, RoCUIDB_Options, Settings.VarType.Number, name, 0.8)
	setting:SetValueChangedCallback(OnSettingChanged_Frames)

	local options = Settings.CreateSliderOptions(minValue, maxValue, step)
	options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, FormatPercentage)
	Settings.CreateSlider(_G[RoCUI_Temp_Categorystring], setting, options, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, 0.8)
end

function RoCUI_CreateOptions_Width(input_frametype)
    local RoCUI_Temp_Categorystring = ("RoCUI_Options_Category_Sub_"..input_frametype)

    local name = RoCUI_Text_Options_Frames_Width_Title
	local variable = ("RoCUI_Options_FrameWidth_"..input_frametype)
	local variableKey = ("FrameWidth_"..input_frametype)
	local tooltip = RoCUI_Text_Options_Frames_Width_Description
	local minValue = 0.5
	local maxValue = 4.0
	local step = 0.05

	local function GetValue()
		return RoCUIDB_Options[variableKey] or defaultValue
	end

	local function SetValue(value)
		RoCUIDB_Options[variableKey] = value
	end
    local setting = Settings.RegisterAddOnSetting(_G[RoCUI_Temp_Categorystring], variable, variableKey, RoCUIDB_Options, Settings.VarType.Number, name, 1.0)
	setting:SetValueChangedCallback(OnSettingChanged_Frames)

	local options = Settings.CreateSliderOptions(minValue, maxValue, step)
	options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, FormatPercentage)
	Settings.CreateSlider(_G[RoCUI_Temp_Categorystring], setting, options, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, 1.0)
end

function RoCUI_CreateOptions_Height(input_frametype)
    local RoCUI_Temp_Categorystring = ("RoCUI_Options_Category_Sub_"..input_frametype)

    local name = RoCUI_Text_Options_Frames_Height_Title
	local variable = ("RoCUI_Options_FrameHeight_"..input_frametype)
	local variableKey = ("FrameHeight_"..input_frametype)
	local tooltip = RoCUI_Text_Options_Frames_Height_Description
	local minValue = 0.5
	local maxValue = 4.0
	local step = 0.05

	local function GetValue()
		return RoCUIDB_Options[variableKey] or defaultValue
	end

	local function SetValue(value)
		RoCUIDB_Options[variableKey] = value
	end
    local setting = Settings.RegisterAddOnSetting(_G[RoCUI_Temp_Categorystring], variable, variableKey, RoCUIDB_Options, Settings.VarType.Number, name, 1.0)
	setting:SetValueChangedCallback(OnSettingChanged_Frames)

	local options = Settings.CreateSliderOptions(minValue, maxValue, step)
	options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, FormatPercentage)
	Settings.CreateSlider(_G[RoCUI_Temp_Categorystring], setting, options, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, 1.0)
end

function RoCUI_CreateOptions_Coordinates_X(input_frametype)
    local RoCUI_Temp_Categorystring = ("RoCUI_Options_Category_Sub_"..input_frametype)

    local name = RoCUI_Text_Options_Frames_Position_X_Title
	local variable = ("RoCUI_Options_FramePosition_X_"..input_frametype)
	local variableKey = ("FramePosition_X_"..input_frametype)
    local tooltip = RoCUI_Text_Options_Frames_Position_X_Description
	local minValue = RoCUI_Table_Options_X_Min[input_frametype]
	local maxValue = RoCUI_Table_Options_X_Max[input_frametype]
	local defValue = RoCUI_Table_Options_X_Default[input_frametype]
	local step = 10

	local function GetValue()
		return RoCUIDB_Options[variableKey] or defaultValue
	end

	local function SetValue(value)
		RoCUIDB_Options[variableKey] = value
	end
    local setting = Settings.RegisterAddOnSetting(_G[RoCUI_Temp_Categorystring], variable, variableKey, RoCUIDB_Options, Settings.VarType.Number, name, defValue)
	setting:SetValueChangedCallback(OnSettingChanged_Frames)

	local options = Settings.CreateSliderOptions(minValue, maxValue, step)
	options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right)
	Settings.CreateSlider(_G[RoCUI_Temp_Categorystring], setting, options, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, defValue)
end

function RoCUI_CreateOptions_Coordinates_Y(input_frametype)
    local RoCUI_Temp_Categorystring = ("RoCUI_Options_Category_Sub_"..input_frametype)

    local name = RoCUI_Text_Options_Frames_Position_Y_Title
	local variable = ("RoCUI_Options_FramePosition_Y_"..input_frametype)
	local variableKey = ("FramePosition_Y_"..input_frametype)
    local tooltip = RoCUI_Text_Options_Frames_Position_Y_Description
	local minValue = RoCUI_Table_Options_Y_Min[input_frametype]
	local maxValue = RoCUI_Table_Options_Y_Max[input_frametype]
	local defValue = RoCUI_Table_Options_Y_Default[input_frametype]
	local step = 10

	local function GetValue()
		return RoCUIDB_Options[variableKey] or defaultValue
	end

	local function SetValue(value)
		RoCUIDB_Options[variableKey] = value
	end
    local setting = Settings.RegisterAddOnSetting(_G[RoCUI_Temp_Categorystring], variable, variableKey, RoCUIDB_Options, Settings.VarType.Number, name, defValue)
	setting:SetValueChangedCallback(OnSettingChanged_Frames)

	local options = Settings.CreateSliderOptions(minValue, maxValue, step)
	options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right)
	Settings.CreateSlider(_G[RoCUI_Temp_Categorystring], setting, options, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, defValue)
end

function RoCUI_CreateOptions_Backdropinfo_Border(input_frametype)
    local RoCUI_Temp_Categorystring = ("RoCUI_Options_Category_Sub_"..input_frametype)

	local name = RoCUI_Text_Options_Frames_Backdropinfo_Border_Title
	local variable = ("RoCUI_Options_Backdropinfo_Border_"..input_frametype)
	local variableKey = ("Backdropinfo_Border_"..input_frametype)
	local tooltip = RoCUI_Text_Options_Frames_Backdropinfo_Border_Description
	local minValue = 1
	local maxValue = 3
	local step = 1

	local function GetValue()
		return RoCUIDB_Options[variableKey] or defaultValue
	end

	local function SetValue(value)
		RoCUIDB_Options[variableKey] = value
	end
    local setting = Settings.RegisterAddOnSetting(_G[RoCUI_Temp_Categorystring], variable, variableKey, RoCUIDB_Options, Settings.VarType.Number, name, minValue)
	setting:SetValueChangedCallback(OnSettingChanged_Frames)

	local options = Settings.CreateSliderOptions(minValue, maxValue, step)
	options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right)
	Settings.CreateSlider(_G[RoCUI_Temp_Categorystring], setting, options, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, minValue)
end

function RoCUI_CreateOptions_Backdropinfo_Background(input_frametype)
    local RoCUI_Temp_Categorystring = ("RoCUI_Options_Category_Sub_"..input_frametype)

	local name = RoCUI_Text_Options_Frames_Backdropinfo_Background_Title
	local variable = ("RoCUI_Options_Backdropinfo_Background_"..input_frametype)
	local variableKey = ("Backdropinfo_Background_"..input_frametype)
	local tooltip = RoCUI_Text_Options_Frames_Backdropinfo_Background_Description
	local minValue = 1
	local maxValue = 3
	local step = 1

	local function GetValue()
		return RoCUIDB_Options[variableKey] or defaultValue
	end

	local function SetValue(value)
		RoCUIDB_Options[variableKey] = value
	end
    local setting = Settings.RegisterAddOnSetting(_G[RoCUI_Temp_Categorystring], variable, variableKey, RoCUIDB_Options, Settings.VarType.Number, name, minValue)
	setting:SetValueChangedCallback(OnSettingChanged_Frames)

	local options = Settings.CreateSliderOptions(minValue, maxValue, step)
	options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right)
	Settings.CreateSlider(_G[RoCUI_Temp_Categorystring], setting, options, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, minValue)
end





---- create options
for i, v in ipairs(RoCUI_Table_Options_Frametypes) do
    if i > 11 then
        RoCUI_CreateOptions_Visibility_HiddenByDefault(v)
	else
		RoCUI_CreateOptions_Visibility(v)
	end
    RoCUI_CreateOptions_Strata(v)
    RoCUI_CreateOptions_Scale(v)
    RoCUI_CreateOptions_Width(v)
    RoCUI_CreateOptions_Height(v)
    RoCUI_CreateOptions_Coordinates_X(v)
    RoCUI_CreateOptions_Coordinates_Y(v)
	if i > 11 then
	    RoCUI_CreateOptions_Backdropinfo_Border(v)
	    RoCUI_CreateOptions_Backdropinfo_Background(v)
	end
end




-- create dropdowns for custom menues at the top
function RoCUI_CreateOptions_TopMenu_SubmenuType(input_frametype, input_default)
    local RoCUI_Temp_Categorystring = ("RoCUI_Options_Category_Sub_"..input_frametype)

    local name = RoCUI_Text_Options_Frames_TopButton_MenuType_Title
	local variable = ("RoCUI_Options_TopMenuChoice_"..input_frametype)
	local variableKey = ("TopMenuChoice_"..input_frametype)
	local tooltip = RoCUI_Text_Options_Frames_TopButton_MenuType_Description

    local function GetOptions()
        local container = Settings.CreateControlTextContainer()
            container:Add(1, RoCUI_Text_Options_TopMenu_SubmenuType_ESC)
            container:Add(2, RoCUI_Text_Options_TopMenu_SubmenuType_Character)
            container:Add(3, RoCUI_Text_Options_TopMenu_SubmenuType_Professions)
            container:Add(4, RoCUI_Text_Options_TopMenu_SubmenuType_Spellbook)
            container:Add(5, RoCUI_Text_Options_TopMenu_SubmenuType_Talents)
            container:Add(6, RoCUI_Text_Options_TopMenu_SubmenuType_CooldownManager)
            container:Add(7, RoCUI_Text_Options_TopMenu_SubmenuType_Achievements)
            container:Add(8, RoCUI_Text_Options_TopMenu_SubmenuType_Quests)
            container:Add(9, RoCUI_Text_Options_TopMenu_SubmenuType_Guild)
			container:Add(10, (RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder.." "..RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder_PvE))
			container:Add(11, (RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder.." "..RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder_PvP))
			container:Add(12, (RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder.." ".."("..RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder_MPlus..")"))
            container:Add(13, RoCUI_Text_Options_TopMenu_SubmenuType_Mounts)
            container:Add(14, RoCUI_Text_Options_TopMenu_SubmenuType_Pets)
            container:Add(15, RoCUI_Text_Options_TopMenu_SubmenuType_Toys)
            container:Add(16, RoCUI_Text_Options_TopMenu_SubmenuType_Heirlooms)
            container:Add(17, RoCUI_Text_Options_TopMenu_SubmenuType_Appearances)
            container:Add(18, RoCUI_Text_Options_TopMenu_SubmenuType_Journal)
            container:Add(19, RoCUI_Text_Options_TopMenu_SubmenuType_Calendar)
            container:Add(20, RoCUI_Text_Options_TopMenu_SubmenuType_Hide)
        return container:GetData()
    end

    local setting = Settings.RegisterAddOnSetting(_G[RoCUI_Temp_Categorystring], variable, variableKey, RoCUIDB_Options, Settings.VarType.Number, name, input_default)
	setting:SetValueChangedCallback(OnSettingChanged_TopMenu)

    Settings.CreateDropdown(_G[RoCUI_Temp_Categorystring], setting, GetOptions, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, input_default)
end

RoCUI_Table_TopButtonsDefaultSelections = {7, 9, 1, 8, 2, 5, 13, 18}
for i, v in ipairs(RoCUI_Table_TopButtonsDefaultSelections) do
    local RoCUI_Temp_VariableName = ("top"..tostring(i))
	RoCUI_CreateOptions_TopMenu_SubmenuType(RoCUI_Temp_VariableName, v)
end








-- general
local function RoCUI_OnButtonClick()
	RoCUI_RestoreDefaultSetting()
end


---- reset add-on settings
do
	local initializer = CreateSettingsButtonInitializer(RoCUI_Text_Options_Reset_Title, RESET, RoCUI_OnButtonClick, RoCUI_Text_Options_Reset_Description, false, newTagID, gameDataFunc)
	RoCUI_Options_Layout_Main:AddInitializer(initializer)
end


---- minimap button
do
	local name = RoCUI_Text_Options_MinimapButton_Title
	local variable = "RoCUI_Options_General_MinimapButton"
	local variableKey = "General_MinimapButton"
	local tooltip = RoCUI_Text_Options_MinimapButton_Description

	local setting = Settings.RegisterAddOnSetting(RoCUI_Options_Category_Sub_general, variable, variableKey, RoCUIDB_Options, Settings.VarType.Boolean, name, Settings.Default.True)
	setting:SetValueChangedCallback(OnSettingChanged_General)

	Settings.CreateCheckbox(RoCUI_Options_Category_Sub_general, setting, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, true)
end


---- add-on messages
do
	local name = RoCUI_Text_Options_AddonMessages_Title
	local variable = "RoCUI_Options_General_AddonMessages"
	local variableKey = "General_AddonMessages"
	local tooltip = RoCUI_Text_Options_AddonMessages_Description
	
	local setting = Settings.RegisterAddOnSetting(RoCUI_Options_Category_Sub_general, variable, variableKey, RoCUIDB_Options, Settings.VarType.Boolean, name, Settings.Default.True)
	setting:SetValueChangedCallback(OnSettingChanged_General)

	Settings.CreateCheckbox(RoCUI_Options_Category_Sub_general, setting, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, true)
end


---- faction skin
do
    local name = RoCUI_Text_Options_Skins_Title
    local variable = "RoCUI_Options_General_FactionSkin"
	local variableKey = "General_FactionSkin"
    local tooltip = RoCUI_Text_Options_Skins_Description

    local function GetOptions()
        local container = Settings.CreateControlTextContainer()
            container:Add(1, (RoCUI_Text_Options_Skins_Human.." / "..CreateSimpleTextureMarkup(5838131, 20, 20, 0, 0)) )
            container:Add(2, (RoCUI_Text_Options_Skins_Undead.." / "..CreateSimpleTextureMarkup(6048999, 20, 20, 0, 0)) )
            container:Add(3, (RoCUI_Text_Options_Skins_Orc.." / "..CreateSimpleTextureMarkup(5882347, 20, 20, 0, 0)) )
            container:Add(4, (RoCUI_Text_Options_Skins_NightElf.." / "..CreateSimpleTextureMarkup(5846671, 20, 20, 0, 0)) )
        return container:GetData()
    end

	local setting = Settings.RegisterAddOnSetting(RoCUI_Options_Category_Sub_general, variable, variableKey, RoCUIDB_Options, Settings.VarType.Number, name, RoCUI_FactionSkinDefault)
	setting:SetValueChangedCallback(OnSettingChanged_General)

    Settings.CreateDropdown(RoCUI_Options_Category_Sub_general, setting, GetOptions, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, RoCUI_FactionSkinDefault)
end


---- show/hide all add-on frames
do
	local name = RoCUI_Text_Options_ToggleDisplay_Title
	local variable = "RoCUI_Options_General_ToggleDisplay"
	local variableKey = "General_ToggleDisplay"
	local tooltip = RoCUI_Text_Options_ToggleDisplay_Description

	local setting = Settings.RegisterAddOnSetting(RoCUI_Options_Category_Sub_general, variable, variableKey, RoCUIDB_Options, Settings.VarType.Boolean, name, Settings.Default.True)
	setting:SetValueChangedCallback(OnSettingChanged_General)

	Settings.CreateCheckbox(RoCUI_Options_Category_Sub_general, setting, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, true)
end




-- day and night cycle
do
	local name = RoCUI_Text_Options_Sundial_Sound_Title
	local variable = "RoCUI_Options_Sun_Sound"
	local variableKey = "Sun_Sound"
	local tooltip = RoCUI_Text_Options_Sundial_Sound_Description

	local setting = Settings.RegisterAddOnSetting(RoCUI_Options_Category_Sub_sun, variable, variableKey, RoCUIDB_Options, Settings.VarType.Boolean, name, Settings.Default.True)
	setting:SetValueChangedCallback(OnSettingChanged_General)

	Settings.CreateCheckbox(RoCUI_Options_Category_Sub_sun, setting, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, true)
end




-- portrait (unit power display)
local RoCUI_CreateOptionEntry_PowerTypes = true
local RoCUI_Table_ClassesWithNoAdditionalPowerType = {1, 3, 4, 6, 9, 12}
for i, v in ipairs(RoCUI_Table_ClassesWithNoAdditionalPowerType) do
    if RoCUI_PlayerCharacterClass == v then
        RoCUI_CreateOptionEntry_PowerTypes = false
	end
end

if RoCUI_CreateOptionEntry_PowerTypes == true then
    do
        local name = RoCUI_Text_Options_Portrait_PowerDisplayType_Title
        local variable = "RoCUI_Options_Portrait_PowerDisplayType"
    	local variableKey = "Portrait_PowerDisplayType"
        local tooltip = RoCUI_Text_Options_Portrait_PowerDisplayType_Description
    
        local function GetOptions()
            local container = Settings.CreateControlTextContainer()
                container:Add(0, POWER_TYPE_MANA)
    			if RoCUI_PlayerCharacterClass == 2 then
    			    container:Add(9, HOLY_POWER)
    			elseif RoCUI_PlayerCharacterClass == 5 then
    			    container:Add(13, POWER_TYPE_INSANITY)
    			elseif RoCUI_PlayerCharacterClass == 7 then
                    container:Add(11, POWER_TYPE_MAELSTROM)
    			elseif RoCUI_PlayerCharacterClass == 8 then
    			    container:Add(16, POWER_TYPE_ARCANE_CHARGES)
    			elseif RoCUI_PlayerCharacterClass == 10 then
    			    container:Add(3, POWER_TYPE_ENERGY)
                    container:Add(12, CHI)
    			elseif RoCUI_PlayerCharacterClass == 11 then
    			container:Add(1, POWER_TYPE_RED_POWER)
                container:Add(3, POWER_TYPE_ENERGY)
                container:Add(8, POWER_TYPE_LUNAR_POWER)
    			elseif RoCUI_PlayerCharacterClass == 13 then
    			    container:Add(19, POWER_TYPE_ESSENCE)
    			else
    			end
    			container:Add(50, DEFAULT)
            return container:GetData()
        end
    
    	local setting = Settings.RegisterAddOnSetting(RoCUI_Options_Category_Sub_portraitplayer, variable, variableKey, RoCUIDB_Options, Settings.VarType.Number, name, 50)
    	setting:SetValueChangedCallback(OnSettingChanged_PortraitPowerType)
    
        Settings.CreateDropdown(RoCUI_Options_Category_Sub_portraitplayer, setting, GetOptions, tooltip)
    	RoCUI_SaveDefaultSetting(variable, variableKey, 50)
    end
else
end




-- sound overrides
for i, v in ipairs(RoCUI_Table_SoundOverrides) do
    local tempname = "RoCUI_Text_Options_SoundOverride_"..v.."_Title"
	local tempdescription = "RoCUI_Text_Options_SoundOverride_"..v.."_Description"
	local name = _G[tempname]
	local variable = ("RoCUI_Options_SoundOverride_"..v)
	local variableKey = ("SoundOverride_"..v)
	local tooltip = _G[tempdescription]

	local setting = Settings.RegisterAddOnSetting(RoCUI_Options_Category_Sub_sound, variable, variableKey, RoCUIDB_Options, Settings.VarType.Boolean, name, Settings.Default.True)
	setting:SetValueChangedCallback(OnSettingChanged_SoundOverrides)

	Settings.CreateCheckbox(RoCUI_Options_Category_Sub_sound, setting, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, true)
end




Settings.RegisterAddOnCategory(RoCUI_Options_Category_Main)