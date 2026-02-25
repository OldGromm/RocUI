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




-- reaction functions whenever the player changes an option
---- general category
local function OnSettingChanged_General(setting, value)
    if not RoCUI_CombatCheck() then
        if setting.variable == "RoCUI_Options_General_MinimapButton" then
	        RoCUI_ToggleMinimapButton()
	    elseif setting.variable == "RoCUI_Options_General_FactionSkin" then
	        RoCUI_Update_RefreshFactionSkin()
	    elseif setting.variable == "RoCUI_Options_General_ToggleDisplay" then
	        RoCUI_ToggleDisplay()
	    else
	    end
	else
	    RoCUI_SendAddonLockdownMessage()
	end
end

---- standard scaling and positioning shared by all mayor frames
local function OnSettingChanged_Frames(setting, value)
    if not RoCUI_CombatCheck() then
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
	    RoCUI_SendAddonLockdownMessage()
	end
end

---- top row buttons
local function OnSettingChanged_TopMenu(setting, value)
    if not RoCUI_CombatCheck() then
        for i, v in ipairs(RoCUI_Table_TopMenuVariableNames) do
		    local RoCUI_Temp_FrameTypeName = ("menubutton"..tostring(i))
	        if setting.variable == ("RoCUI_Options_TopMenuChoice_"..v) then
		        RoCUI_ButtonTextUpdate(RoCUI_Temp_FrameTypeName, value)
		    end
	    end
	else
	    RoCUI_SendAddonLockdownMessage()
	end
end

---- sound overrides
local function OnSettingChanged_SoundOverrides(setting, value)
    RoCUI_SoundReplacements(setting.variable, value)
end

---- portrait
local function OnSettingChanged_Portrait_Stats(setting, value)
    RoCUI_UpdatePlayerStats_Health()
	RoCUI_UpdatePlayerStats_Power()
end

local function OnSettingChanged_Portrait_TextSize(setting, value)
    RoCUI_UpdatePortraitTextSize()
end


---- infopanel (player)
local function OnSettingChanged_Infopanel_Player(setting, value)
    if setting.variable == "RoCUI_Options_Infopanel_Player_Title" then
        RoCUI_UpdatePlayerNameAndTitle()
	elseif setting.variable == "RoCUI_Options_Infopanel_ExperienceBarClassName_Title" then
        RoCUI_UpdatePlayerSpecAndLevel()
	elseif setting.variable == "RoCUI_Options_Infopanel_IconPreference" then
        RoCUI_Infopanel_CheckPlayerEquipment("weapon")
        RoCUI_Infopanel_CheckPlayerEquipment("armor")
		RoCUI_Infopanel_UpdateStatIcon()
	end
end


---- infopanel stats (player)
local function OnSettingChanged_Infopanel_Player_Stats(setting, value)
    RoCUI_Infopanel_UpdateStatText()
end




-- create all the standard customization entries for each mayor frame. Any additional option will be added below.
function RoCUI_CreateOptions_Visibility(input_frametype)
    local defaultvisibility = true
    for i, v in ipairs(RoCUI_Table_Options_Frametypes_HideByDefault) do
	    if input_frametype == v then
		    defaultvisibility = false
		end
	end

    local RoCUI_Temp_Categorystring = ("RoCUI_Options_Category_Sub_"..input_frametype)

	local name = RoCUI_Text_Options_Frames_Visibility_Title
	local variable = ("RoCUI_Options_FrameVisibility_"..input_frametype)
	local variableKey = ("FrameVisibility_"..input_frametype)
	local tooltip = RoCUI_Text_Options_Frames_Visibility_Description

	local setting = Settings.RegisterAddOnSetting(_G[RoCUI_Temp_Categorystring], variable, variableKey, RoCUIDB_Options, Settings.VarType.Boolean, name, defaultvisibility)
	setting:SetValueChangedCallback(OnSettingChanged_Frames)

	Settings.CreateCheckbox(_G[RoCUI_Temp_Categorystring], setting, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, defaultvisibility)
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
    local setting = Settings.RegisterAddOnSetting(_G[RoCUI_Temp_Categorystring], variable, variableKey, RoCUIDB_Options, Settings.VarType.Number, name, RoCUI_DefaultUIScale)
	setting:SetValueChangedCallback(OnSettingChanged_Frames)

	local options = Settings.CreateSliderOptions(minValue, maxValue, step)
	options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, FormatPercentage)
	Settings.CreateSlider(_G[RoCUI_Temp_Categorystring], setting, options, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, RoCUI_DefaultUIScale)
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
	local step = 5

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
	local step = 5

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
	local maxValue = 4
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
	local defaultbackdrop = 1
	
	if input_frametype == "infoplayer" then
	    defaultbackdrop = 2
	end

	local function GetValue()
		return RoCUIDB_Options[variableKey] or defaultValue
	end

	local function SetValue(value)
		RoCUIDB_Options[variableKey] = value
	end
    local setting = Settings.RegisterAddOnSetting(_G[RoCUI_Temp_Categorystring], variable, variableKey, RoCUIDB_Options, Settings.VarType.Number, name, defaultbackdrop)
	setting:SetValueChangedCallback(OnSettingChanged_Frames)

	local options = Settings.CreateSliderOptions(minValue, maxValue, step)
	options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right)
	Settings.CreateSlider(_G[RoCUI_Temp_Categorystring], setting, options, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, defaultbackdrop)
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

for i, v in ipairs(RoCUI_Table_Options_Frametypes_UseBackdrop) do
    RoCUI_CreateOptions_Backdropinfo_Border(v)
    RoCUI_CreateOptions_Backdropinfo_Background(v)
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
			if RoCUI_GameVersion > 1 then
                container:Add(3, RoCUI_Text_Options_TopMenu_SubmenuType_Professions)
			end
            container:Add(4, RoCUI_Text_Options_TopMenu_SubmenuType_Spellbook)
			if RoCUI_GameVersion == 1 then
                container:Add(5, RoCUI_Text_Options_TopMenu_SubmenuType_Skills)
				container:Add(6, RoCUI_Text_Options_TopMenu_SubmenuType_PvP)
			end
            container:Add(7, RoCUI_Text_Options_TopMenu_SubmenuType_Talents)
			if RoCUI_GameVersion == 3 then
                container:Add(8, RoCUI_Text_Options_TopMenu_SubmenuType_CooldownManager)
			end
			if RoCUI_GameVersion > 1 then
                container:Add(9, RoCUI_Text_Options_TopMenu_SubmenuType_Achievements)
			end
            container:Add(10, RoCUI_Text_Options_TopMenu_SubmenuType_Quests)
            container:Add(11, RoCUI_Text_Options_TopMenu_SubmenuType_Guild)
			if RoCUI_GameVersion > 1 then
			    container:Add(12, (RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder.." "..RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder_PvE))
			    container:Add(13, (RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder.." "..RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder_PvP))
			end
			if RoCUI_GameVersion == 3 then
			    container:Add(14, (RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder.." ".."("..RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder_MPlus..")"))
            end
			if RoCUI_GameVersion > 1 then
			    container:Add(15, RoCUI_Text_Options_TopMenu_SubmenuType_Mounts)
                container:Add(16, RoCUI_Text_Options_TopMenu_SubmenuType_Pets)
                container:Add(17, RoCUI_Text_Options_TopMenu_SubmenuType_Toys)
                container:Add(18, RoCUI_Text_Options_TopMenu_SubmenuType_Heirlooms)
                container:Add(19, RoCUI_Text_Options_TopMenu_SubmenuType_Appearances)
                container:Add(20, RoCUI_Text_Options_TopMenu_SubmenuType_Journal)
                container:Add(21, RoCUI_Text_Options_TopMenu_SubmenuType_Calendar)
			end
            container:Add(22, RoCUI_Text_Options_TopMenu_SubmenuType_Map)
			container:Add(23, RoCUI_Text_Options_TopMenu_SubmenuType_Social)
			if RoCUI_GameVersion == 3 then
                container:Add(24, RoCUI_Text_Options_TopMenu_SubmenuType_GreatVault)
			end
			container:Add(25, RoCUI_Text_Options_TopMenu_SubmenuType_Hide)
        return container:GetData()
    end

    local setting = Settings.RegisterAddOnSetting(_G[RoCUI_Temp_Categorystring], variable, variableKey, RoCUIDB_Options, Settings.VarType.Number, name, input_default)
	setting:SetValueChangedCallback(OnSettingChanged_TopMenu)

    Settings.CreateDropdown(_G[RoCUI_Temp_Categorystring], setting, GetOptions, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, input_default)
end



-- change default top row buttons depending on the game version
RoCUI_Table_TopButtonsDefaultSelections = {}
if RoCUI_GameVersion == 1 then
    RoCUI_Table_TopButtonsDefaultSelections = {23, 11, 1, 10, 2, 5, 4, 22}
else
    RoCUI_Table_TopButtonsDefaultSelections = {9, 11, 1, 10, 2, 7, 15, 20}
end

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
            container:Add(1, RoCUI_Text_Options_Skins_Human)
            container:Add(2, RoCUI_Text_Options_Skins_Undead)
            container:Add(3, RoCUI_Text_Options_Skins_Orc)
            container:Add(4, RoCUI_Text_Options_Skins_NightElf)
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




-- portrait

---- text display (health)
do
    local name = RoCUI_Text_Options_Portrait_TextFormatting_Health_Title
    local variable = "RoCUI_Options_Portrait_TextFormatting_Health"
	local variableKey = "Portrait_TextFormatting_Health"
    local tooltip = RoCUI_Text_Options_Portrait_TextFormatting_Health_Description

    local function GetOptions()
        local container = Settings.CreateControlTextContainer()
            container:Add(1, (RoCUI_Text_Options_Portrait_TextFormatting_Word_Current.." / "..RoCUI_Text_Options_Portrait_TextFormatting_Word_Maximum))
            container:Add(2, (RoCUI_Text_Options_Portrait_TextFormatting_Word_Current))
            container:Add(3, (RoCUI_Text_Options_Portrait_TextFormatting_Word_Percentage))
        return container:GetData()
    end

	local setting = Settings.RegisterAddOnSetting(RoCUI_Options_Category_Sub_portraitplayer, variable, variableKey, RoCUIDB_Options, Settings.VarType.Number, name, 1)
	setting:SetValueChangedCallback(OnSettingChanged_Portrait_Stats)

    Settings.CreateDropdown(RoCUI_Options_Category_Sub_portraitplayer, setting, GetOptions, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, 1)
end

---- text size (health)
do
    local name = RoCUI_Text_Options_Portrait_TextSize_Health_Title
    local variable = "RoCUI_Options_Portrait_TextSize_Health"
	local variableKey = "Portrait_TextSize_Health"
	local tooltip = RoCUI_Text_Options_Portrait_TextSize_Health_Description
	local minValue = 0.5
	local maxValue = 1.5
	local step = 0.1

	local function GetValue()
		return RoCUIDB_Options[variableKey] or defaultValue
	end

	local function SetValue(value)
		RoCUIDB_Options[variableKey] = value
	end
    local setting = Settings.RegisterAddOnSetting(RoCUI_Options_Category_Sub_portraitplayer, variable, variableKey, RoCUIDB_Options, Settings.VarType.Number, name, 1.0)
	setting:SetValueChangedCallback(OnSettingChanged_Portrait_TextSize)

	local options = Settings.CreateSliderOptions(minValue, maxValue, step)
	options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, FormatPercentage)
	Settings.CreateSlider(RoCUI_Options_Category_Sub_portraitplayer, setting, options, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, 1.0)
end

---- number abbreviation (health)
do
	local name = RoCUI_Text_Options_Portrait_TextFormatting_Health_Abbreviate_Title
	local variable = "RoCUI_Options_Portrait_TextFormatting_Health_Abbreviate"
	local variableKey = "Portrait_TextFormatting_Health_Abbreviate"
	local tooltip = RoCUI_Text_Options_Portrait_TextFormatting_Health_Abbreviate_Description

	local setting = Settings.RegisterAddOnSetting(RoCUI_Options_Category_Sub_portraitplayer, variable, variableKey, RoCUIDB_Options, Settings.VarType.Boolean, name, Settings.Default.True)
	setting:SetValueChangedCallback(OnSettingChanged_Portrait_Stats)

	Settings.CreateCheckbox(RoCUI_Options_Category_Sub_portraitplayer, setting, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, true)
end

---- text display (power)
do
    local name = RoCUI_Text_Options_Portrait_TextFormatting_Power_Title
    local variable = "RoCUI_Options_Portrait_TextFormatting_Power"
	local variableKey = "Portrait_TextFormatting_Power"
    local tooltip = RoCUI_Text_Options_Portrait_TextFormatting_Power_Description

    local function GetOptions()
        local container = Settings.CreateControlTextContainer()
            container:Add(1, (RoCUI_Text_Options_Portrait_TextFormatting_Word_Current.." / "..RoCUI_Text_Options_Portrait_TextFormatting_Word_Maximum))
            container:Add(2, (RoCUI_Text_Options_Portrait_TextFormatting_Word_Current))
            container:Add(3, (RoCUI_Text_Options_Portrait_TextFormatting_Word_Percentage))
        return container:GetData()
    end

	local setting = Settings.RegisterAddOnSetting(RoCUI_Options_Category_Sub_portraitplayer, variable, variableKey, RoCUIDB_Options, Settings.VarType.Number, name, 1)
	setting:SetValueChangedCallback(OnSettingChanged_Portrait_Stats)

    Settings.CreateDropdown(RoCUI_Options_Category_Sub_portraitplayer, setting, GetOptions, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, 1)
end

---- text size (power)
do
    local name = RoCUI_Text_Options_Portrait_TextSize_Power_Title
    local variable = "RoCUI_Options_Portrait_TextSize_Power"
	local variableKey = "Portrait_TextSize_Power"
	local tooltip = RoCUI_Text_Options_Portrait_TextSize_Power_Description
	local minValue = 0.5
	local maxValue = 1.5
	local step = 0.1

	local function GetValue()
		return RoCUIDB_Options[variableKey] or defaultValue
	end

	local function SetValue(value)
		RoCUIDB_Options[variableKey] = value
	end
    local setting = Settings.RegisterAddOnSetting(RoCUI_Options_Category_Sub_portraitplayer, variable, variableKey, RoCUIDB_Options, Settings.VarType.Number, name, 1.0)
	setting:SetValueChangedCallback(OnSettingChanged_Portrait_TextSize)

	local options = Settings.CreateSliderOptions(minValue, maxValue, step)
	options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, FormatPercentage)
	Settings.CreateSlider(RoCUI_Options_Category_Sub_portraitplayer, setting, options, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, 1.0)
end

---- number abbreviation (power)
do
	local name = RoCUI_Text_Options_Portrait_TextFormatting_Power_Abbreviate_Title
	local variable = "RoCUI_Options_Portrait_TextFormatting_Power_Abbreviate"
	local variableKey = "Portrait_TextFormatting_Power_Abbreviate"
	local tooltip = RoCUI_Text_Options_Portrait_TextFormatting_Powerh_Abbreviate_Description

	local setting = Settings.RegisterAddOnSetting(RoCUI_Options_Category_Sub_portraitplayer, variable, variableKey, RoCUIDB_Options, Settings.VarType.Boolean, name, Settings.Default.True)
	setting:SetValueChangedCallback(OnSettingChanged_Portrait_Stats)

	Settings.CreateCheckbox(RoCUI_Options_Category_Sub_portraitplayer, setting, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, true)
end

---- unit power display
do
    local name = RoCUI_Text_Options_Portrait_PowerDisplayType_Title
    local variable = "RoCUI_Options_Portrait_PowerDisplayType"
	local variableKey = "Portrait_PowerDisplayType"
    local tooltip = RoCUI_Text_Options_Portrait_PowerDisplayType_Description

    local function GetOptions()
        local container = Settings.CreateControlTextContainer()
			if RoCUI_PlayerCharacterClass == 1 then -- warrior
			elseif RoCUI_PlayerCharacterClass == 2 then -- paladin
			    container:Add(0, POWER_TYPE_MANA)
			    container:Add(9, HOLY_POWER)
			elseif RoCUI_PlayerCharacterClass == 3 then -- hunter
			elseif RoCUI_PlayerCharacterClass == 4 then -- rogue
			    container:Add(3, POWER_TYPE_ENERGY)
				container:Add(4, TUTORIAL_TITLE61_ROGUE)
			elseif RoCUI_PlayerCharacterClass == 5 then -- priest
	            if RoCUI_GameVersion == 3 then
			        container:Add(0, POWER_TYPE_MANA)
				    container:Add(13, POWER_TYPE_INSANITY)
	            end
			elseif RoCUI_PlayerCharacterClass == 6 then -- death knight
			    container:Add(5, RUNES)
                container:Add(6, RUNIC_POWER)
			elseif RoCUI_PlayerCharacterClass == 7 then -- shaman
	            if RoCUI_GameVersion == 3 then
			        container:Add(0, POWER_TYPE_MANA)
                    container:Add(11, POWER_TYPE_MAELSTROM)
	            end
			elseif RoCUI_PlayerCharacterClass == 8 then -- mage
	            if RoCUI_GameVersion == 3 then
			        container:Add(0, POWER_TYPE_MANA)
			        container:Add(16, POWER_TYPE_ARCANE_CHARGES)
	            end
			elseif RoCUI_PlayerCharacterClass == 9 then -- warlock
	            if RoCUI_GameVersion == 2 then
			        container:Add(0, POWER_TYPE_MANA)
			        container:Add(7, SOUL_SHARDS_POWER)
					container:Add(14, POWER_TYPE_BURNING_EMBERS)
					container:Add(15, POWER_TYPE_DEMONIC_FURY)
	            elseif RoCUI_GameVersion == 3 then
			        container:Add(0, POWER_TYPE_MANA)
			        container:Add(7, SOUL_SHARDS_POWER)
	            end
			elseif RoCUI_PlayerCharacterClass == 10 then -- monk
			    container:Add(0, POWER_TYPE_MANA)
			    container:Add(3, POWER_TYPE_ENERGY)
                container:Add(12, CHI)
			elseif RoCUI_PlayerCharacterClass == 11 then -- druid
			    container:Add(0, POWER_TYPE_MANA)
			    container:Add(1, POWER_TYPE_RED_POWER)
                container:Add(3, POWER_TYPE_ENERGY)
				container:Add(4, TUTORIAL_TITLE61_ROGUE)
                container:Add(8, POWER_TYPE_LUNAR_POWER)
			elseif RoCUI_PlayerCharacterClass == 12 then -- demon hunter
			elseif RoCUI_PlayerCharacterClass == 13 then -- evoker
			    container:Add(0, POWER_TYPE_MANA)
			    container:Add(19, POWER_TYPE_ESSENCE)
			else
			end
			container:Add(50, DEFAULT)
        return container:GetData()
    end

	local setting = Settings.RegisterAddOnSetting(RoCUI_Options_Category_Sub_portraitplayer, variable, variableKey, RoCUIDB_Options, Settings.VarType.Number, name, 50)
	setting:SetValueChangedCallback(OnSettingChanged_Portrait_Stats)

    Settings.CreateDropdown(RoCUI_Options_Category_Sub_portraitplayer, setting, GetOptions, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, 50)
end




-- infopanel (player)

---- player character title
do
	local name = RoCUI_Text_Options_Infopanel_CharacterTitle_Title
	local variable = "RoCUI_Options_Infopanel_Player_Title"
	local variableKey = "Infopanel_Player_Title"
	local tooltip = RoCUI_Text_Options_Infopanel_CharacterTitle_Description

	local setting = Settings.RegisterAddOnSetting(RoCUI_Options_Category_Sub_infoplayer, variable, variableKey, RoCUIDB_Options, Settings.VarType.Boolean, name, Settings.Default.True)
	setting:SetValueChangedCallback(OnSettingChanged_Infopanel_Player)

	Settings.CreateCheckbox(RoCUI_Options_Category_Sub_infoplayer, setting, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, true)
end

---- experience bar text
if RoCUI_GameVersion > 1 then
	local name = RoCUI_Text_Options_Infopanel_ExperienceBarClassName_Title
	local variable = "RoCUI_Options_Infopanel_ExperienceBarClassName_Title"
	local variableKey = "Infopanel_ExperienceBarClassName_Title"
	local tooltip = RoCUI_Text_Options_Infopanel_ExperienceBarClassName_Description

	local setting = Settings.RegisterAddOnSetting(RoCUI_Options_Category_Sub_infoplayer, variable, variableKey, RoCUIDB_Options, Settings.VarType.Boolean, name, Settings.Default.True)
	setting:SetValueChangedCallback(OnSettingChanged_Infopanel_Player)

	Settings.CreateCheckbox(RoCUI_Options_Category_Sub_infoplayer, setting, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, true)
end

---- icon display
do
	local name = RoCUI_Text_Options_Infopanel_IconPreference_Title
	local variable = "RoCUI_Options_Infopanel_IconPreference"
	local variableKey = "Infopanel_IconPreference"
	local tooltip = RoCUI_Text_Options_Infopanel_IconPreference_Description

	local setting = Settings.RegisterAddOnSetting(RoCUI_Options_Category_Sub_infoplayer, variable, variableKey, RoCUIDB_Options, Settings.VarType.Boolean, name, Settings.Default.True)
	setting:SetValueChangedCallback(OnSettingChanged_Infopanel_Player)

	Settings.CreateCheckbox(RoCUI_Options_Category_Sub_infoplayer, setting, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, true)
end

---- number abbreviation (stats)
do
	local name = RoCUI_Text_Options_Infopanel_TextFormatting_Stats_Abbreviate_Title
	local variable = "RoCUI_Options_Infopanel_TextFormatting_Stats_Abbreviate"
	local variableKey = "Infopanel_TextFormatting_Stats_Abbreviate"
	local tooltip = RoCUI_Text_Options_Infopanel_TextFormatting_Stats_Abbreviate_Description

	local setting = Settings.RegisterAddOnSetting(RoCUI_Options_Category_Sub_infoplayer, variable, variableKey, RoCUIDB_Options, Settings.VarType.Boolean, name, Settings.Default.True)
	setting:SetValueChangedCallback(OnSettingChanged_Infopanel_Player_Stats)

	Settings.CreateCheckbox(RoCUI_Options_Category_Sub_infoplayer, setting, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, true)
end

---- display as percentage
do
	local name = RoCUI_Text_Options_Infopanel_TextFormatting_Stats_Percentage_Title
	local variable = "RoCUI_Options_Infopanel_TextFormatting_Stats_Percentage"
	local variableKey = "Infopanel_TextFormatting_Stats_Percentage"
	local tooltip = RoCUI_Text_Options_Infopanel_TextFormatting_Stats_Percentage_Description

	local setting = Settings.RegisterAddOnSetting(RoCUI_Options_Category_Sub_infoplayer, variable, variableKey, RoCUIDB_Options, Settings.VarType.Boolean, name, Settings.Default.False)
	setting:SetValueChangedCallback(OnSettingChanged_Infopanel_Player_Stats)

	Settings.CreateCheckbox(RoCUI_Options_Category_Sub_infoplayer, setting, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, false)
end

---- offensive stat
do
    local name = RoCUI_Text_Options_Infopanel_StatType_Offensive_Title
    local variable = "RoCUI_Options_Infopanel_StatType_Offensive"
	local variableKey = "Infopanel_StatType_Offensive"
    local tooltip = RoCUI_Text_Options_Infopanel_StatType_Offensive_Description

    local function GetOptions()
        local container = Settings.CreateControlTextContainer()
		    container:Add(1, WEAPON)
            container:Add(2, ATTACK_POWER_TOOLTIP)
            container:Add(3, STAT_SPELLPOWER)
        return container:GetData()
    end

	local setting = Settings.RegisterAddOnSetting(RoCUI_Options_Category_Sub_infoplayer, variable, variableKey, RoCUIDB_Options, Settings.VarType.Number, name, 1)
	setting:SetValueChangedCallback(OnSettingChanged_Infopanel_Player_Stats)

    Settings.CreateDropdown(RoCUI_Options_Category_Sub_infoplayer, setting, GetOptions, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, 1)
end


---- defensive stat
do
    local name = RoCUI_Text_Options_Infopanel_StatType_Defensive_Title
    local variable = "RoCUI_Options_Infopanel_StatType_Defensive"
	local variableKey = "Infopanel_StatType_Defensive"
    local tooltip = RoCUI_Text_Options_Infopanel_StatType_Defensive_Description

    local function GetOptions()
        local container = Settings.CreateControlTextContainer()
            container:Add(1, ARMOR)
            container:Add(2, DODGE)
            container:Add(3, PARRY)
            container:Add(4, BLOCK)
			if RoCUI_GameVersion == 3 then
                container:Add(5, STAT_AVOIDANCE)
			end
			if RoCUI_GameVersion < 3 then
                container:Add(6, COMBAT_RATING_NAME2)
			end
			--container:Add(7, RESILIENCE) --currently dummied out until I've figured out all the stats in Classic
        return container:GetData()
    end

	local setting = Settings.RegisterAddOnSetting(RoCUI_Options_Category_Sub_infoplayer, variable, variableKey, RoCUIDB_Options, Settings.VarType.Number, name, 1)
	setting:SetValueChangedCallback(OnSettingChanged_Infopanel_Player_Stats)

    Settings.CreateDropdown(RoCUI_Options_Category_Sub_infoplayer, setting, GetOptions, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, 1)
end

---- other stats
for i=1, 3 do
    local tempnumber = tostring(i)
	local tempnumber_default = i
    local name = (RoCUI_Text_Options_Infopanel_StatType_Other_Title.." ("..tempnumber..")")
	local variable = ("RoCUI_Options_Infopanel_StatType_Other_"..tempnumber)
	local variableKey = ("Infopanel_StatType_Other_"..tempnumber)
    local tooltip = RoCUI_Text_Options_Infopanel_StatType_Other_Description

    local function GetOptions()
        local container = Settings.CreateControlTextContainer()
            container:Add(1, SPEC_FRAME_PRIMARY_STAT_STRENGTH)
            container:Add(2, SPEC_FRAME_PRIMARY_STAT_AGILITY)
            container:Add(3, SPEC_FRAME_PRIMARY_STAT_INTELLECT)
            container:Add(4, SPELL_STAT3_NAME)
            container:Add(5, STAT_CRITICAL_STRIKE)
            container:Add(6, STAT_HASTE)
			if RoCUI_GameVersion == 3 then
                container:Add(7, STAT_VERSATILITY)
			end
			if RoCUI_GameVersion > 1 then
                container:Add(8, STAT_MASTERY)
			end
			if RoCUI_GameVersion == 3 then
                container:Add(9, STAT_LIFESTEAL)
				container:Add(10, STAT_SPEED)
			end
        return container:GetData()
    end

	local setting = Settings.RegisterAddOnSetting(RoCUI_Options_Category_Sub_infoplayer, variable, variableKey, RoCUIDB_Options, Settings.VarType.Number, name, tempnumber_default)
	setting:SetValueChangedCallback(OnSettingChanged_Infopanel_Player_Stats)

    Settings.CreateDropdown(RoCUI_Options_Category_Sub_infoplayer, setting, GetOptions, tooltip)
	RoCUI_SaveDefaultSetting(variable, variableKey, tempnumber_default)
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