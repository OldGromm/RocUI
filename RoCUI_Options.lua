RoCUI_Options_Category_Main, RoCUI_Options_Layout_Main = Settings.RegisterVerticalLayoutCategory(RoCUI_Text_Options_Category_Title)
RoCUI_Options_Category_Sub_general = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_General)
RoCUI_Options_Category_Sub_main = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_Main)
RoCUI_Options_Category_Sub_sun = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_Sundial)
RoCUI_Options_Category_Sub_additional1 = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_Additional_01)
RoCUI_Options_Category_Sub_additional2 = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_Additional_02)
RoCUI_Options_Category_Sub_additional3 = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_Additional_03)
RoCUI_Options_Category_Sub_additional4 = Settings.RegisterVerticalLayoutSubcategory(RoCUI_Options_Category_Main, RoCUI_Text_Options_Category_Additional_04)




local function OnSettingChanged_General(setting, value)
	if setting.variable == "RoCUI_Options_Minimap_Button" then
	    RoCUI_ToggleMinimapButton()
	elseif setting.variable == "RoCUI_Options_Skin" then
	    RoCUI_Update_RefreshFactionSkin()
	elseif setting.variable == "RoCUI_Options_ToggleDisplay" then
	    RoCUI_ToggleDisplay()
	else
	end
end

local function OnSettingChanged_Frames(setting, value)
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
	    else
        end
    end
end








-- create all the standard customization entries for each mayor frame. Any additional option will be added below.
---- functions
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




---- create options
for i, v in ipairs(RoCUI_Table_Options_Frametypes) do
    RoCUI_CreateOptions_Visibility(v)
    RoCUI_CreateOptions_Strata(v)
    RoCUI_CreateOptions_Scale(v)
    RoCUI_CreateOptions_Width(v)
    RoCUI_CreateOptions_Height(v)
    RoCUI_CreateOptions_Coordinates_X(v)
    RoCUI_CreateOptions_Coordinates_Y(v)
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


-- minimap button
do
	local name = RoCUI_Text_Options_MinimapButton_Title
	local variable = "RoCUI_Options_Minimap_Button"
	local variableKey = "Minimap_Button"
	local tooltip = RoCUI_Text_Options_MinimapButton_Description

	local setting = Settings.RegisterAddOnSetting(RoCUI_Options_Category_Sub_general, variable, variableKey, RoCUIDB_Options, Settings.VarType.Boolean, name, Settings.Default.True)
	setting:SetValueChangedCallback(OnSettingChanged_General)

	Settings.CreateCheckbox(RoCUI_Options_Category_Sub_general, setting, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, true)
end

-- add-on messages
do
	local name = RoCUI_Text_Options_AddonMessages_Title
	local variable = "RoCUI_Options_Addon_Messages"
	local variableKey = "Addon_Messages"
	local tooltip = RoCUI_Text_Options_AddonMessages_Description
	
	local setting = Settings.RegisterAddOnSetting(RoCUI_Options_Category_Sub_general, variable, variableKey, RoCUIDB_Options, Settings.VarType.Boolean, name, Settings.Default.True)
	setting:SetValueChangedCallback(OnSettingChanged_General)

	Settings.CreateCheckbox(RoCUI_Options_Category_Sub_general, setting, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, true)
end

-- faction skin
do
    local name = RoCUI_Text_Options_Skins_Title
    local variable = "RoCUI_Options_Skin"
	local variableKey = "Skin"
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

do
	local name = RoCUI_Text_Options_ToggleDisplay_Title
	local variable = "RoCUI_Options_ToggleDisplay"
	local variableKey = "ToggleDisplay"
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



Settings.RegisterAddOnCategory(RoCUI_Options_Category_Main)