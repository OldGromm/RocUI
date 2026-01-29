-- general
---- chat messages
function RoCUI_SendChatMessage(input)
    if not PlayerIsInCombat() then
	    if RoCUIDB_Options["Addon_Messages"] == true then
	        print(WrapTextInColorCode("RoC UI", "FFE6D30A").." - "..input)
		end
    end
end




-- frame creation
---- variable names
function RoCUI_FetchVariableBaseName(input)
    local RoCUI_Temp_String_FirstPart = "RoCUI_CustomFrame_Base_"
    local RoCUI_Temp_String_SecondPart = input
    local RoCUI_Temp_String_Final = (RoCUI_Temp_String_FirstPart..RoCUI_Temp_String_SecondPart)
return RoCUI_Temp_String_Final
end

function RoCUI_FetchVariableTextureName(input)
    local RoCUI_Temp_String_FirstPart = "RoCUI_CustomFrame_Texture_"
    local RoCUI_Temp_String_SecondPart = input
    local RoCUI_Temp_String_Final = (RoCUI_Temp_String_FirstPart..RoCUI_Temp_String_SecondPart)
return RoCUI_Temp_String_Final
end


-- frame names
function RoCUI_FetchFrameWindowName(input)
    local RoCUI_Temp_String_FirstPart = "RoCUI_FrameWindowName_"
    local RoCUI_Temp_String_SecondPart = input
    local RoCUI_Temp_String_Final = (RoCUI_Temp_String_FirstPart..RoCUI_Temp_String_SecondPart)
return RoCUI_Temp_String_Final
end

function RoCUI_FetchFrameTextureName(input)
    local RoCUI_Temp_String_FirstPart = "RoCUI_FrameTextureName_"
    local RoCUI_Temp_String_SecondPart = input
    local RoCUI_Temp_String_Final = (RoCUI_Temp_String_FirstPart..RoCUI_Temp_String_SecondPart)
return RoCUI_Temp_String_Final
end


-- texture filepaths
function RoCUI_FetchTextureFilepath(input_frametype)
    local RoCUI_Temp_FactionSkinID = RoCUIDB_Options["Skin"]
	local RoCUI_Temp_FactionSkinString = RoCUI_Table_SkinNames[RoCUI_Temp_FactionSkinID]
    local RoCUI_Temp_String_Final = ("Interface\\AddOns\\RoCUI\\images\\"..input_frametype.."\\"..RoCUI_Temp_FactionSkinString)
return RoCUI_Temp_String_Final
end




-- options menu
---- show/hide frame
function RoCUI_Update_FrameVisibility(input_settingsname, input_framename)
    local RoCUI_Temp_VariableBaseName = RoCUI_FetchVariableBaseName(input_framename)
	if RoCUIDB_Options[input_settingsname] == true then
	    if RoCUIDB_Options["ToggleDisplay"] == true then
	    _G[RoCUI_Temp_VariableBaseName]:Show()
		end
	elseif RoCUIDB_Options[input_settingsname] == false then
	    _G[RoCUI_Temp_VariableBaseName]:Hide()
	else
	end
end


-- strata
function RoCUI_Update_FrameStrata(input_settingsname, input_framename)
    local RoCUI_Temp_VariableBaseName = RoCUI_FetchVariableBaseName(input_framename)
    local RoCUI_Temp_Index = RoCUIDB_Options[input_settingsname]
    local RoCUI_Temp_Strata = RoCUI_Table_StrataNames[RoCUI_Temp_Index]
    _G[RoCUI_Temp_VariableBaseName]:SetFrameStrata(RoCUI_Temp_Strata)
end


-- scale
function RoCUI_Update_FrameScale(input_settingsname, input_framename)
    local RoCUI_Temp_VariableBaseName = RoCUI_FetchVariableBaseName(input_framename)
    local RoCUI_Temp_Scale = RoCUIDB_Options[input_settingsname]
    _G[RoCUI_Temp_VariableBaseName]:SetScale(RoCUI_Temp_Scale)
end


-- dimensions
function RoCUI_Update_FrameDimensions_Width(input_settingsname, input_framename)
    local RoCUI_Temp_VariableBaseName = RoCUI_FetchVariableBaseName(input_framename)
	local RoCUI_Temp_Width_Percentage = RoCUIDB_Options[input_settingsname]
	local RoCUI_Temp_Width = RoCUI_Table_Options_Default_Width[input_framename]
	local RoCUI_Temp_Width_Final = (RoCUI_Temp_Width*RoCUI_Temp_Width_Percentage)
	_G[RoCUI_Temp_VariableBaseName]:SetWidth(RoCUI_Temp_Width_Final)
	if input_framename == "sun" then
        local RoCUI_Temp_SunCycle_Width = 256
        local RoCUI_Temp_SunCycle_Width_Final = (RoCUI_Temp_SunCycle_Width*RoCUI_Temp_Width_Percentage)
        _G["RoCUI_CustomFrame_Texture_suncycle"]:SetWidth(RoCUI_Temp_SunCycle_Width_Final)
	end
end

function RoCUI_Update_FrameDimensions_Height(input_settingsname, input_framename)
    local RoCUI_Temp_VariableBaseName = RoCUI_FetchVariableBaseName(input_framename)
	local RoCUI_Temp_Height_Percentage = RoCUIDB_Options[input_settingsname]
	local RoCUI_Temp_Height = RoCUI_Table_Options_Default_Height[input_framename]
	local RoCUI_Temp_Height_Final = (RoCUI_Temp_Height*RoCUI_Temp_Height_Percentage)
    _G[RoCUI_Temp_VariableBaseName]:SetHeight(RoCUI_Temp_Height_Final)
	if input_framename == "sun" then
        local RoCUI_Temp_SunCycle_Height = 128
        local RoCUI_Temp_SunCycle_Height_Final = (RoCUI_Temp_SunCycle_Height*RoCUI_Temp_Height_Percentage)
        _G["RoCUI_CustomFrame_Texture_suncycle"]:SetHeight(RoCUI_Temp_SunCycle_Height_Final)
	end
end


-- position
function RoCUI_Update_FramePosition(input_settingsname, input_framename)
    local RoCUI_Temp_VariableBaseName = RoCUI_FetchVariableBaseName(input_framename)
	local RoCUI_Temp_X = RoCUIDB_Options["FramePosition_X_"..input_framename]
	local RoCUI_Temp_Y = RoCUIDB_Options["FramePosition_Y_"..input_framename]
    local RoCUI_Temp_Point, _, _, _, _ = _G[RoCUI_Temp_VariableBaseName]:GetPoint()
    _G[RoCUI_Temp_VariableBaseName]:SetPoint(RoCUI_Temp_Point, RoCUI_Temp_X, RoCUI_Temp_Y)
end




function RoCUI_ToggleDisplay()
    local RoCUI_Temp_VariableBaseName = ""
	for i, v in ipairs(RoCUI_Table_Options_Frametypes) do
	    RoCUI_Temp_VariableBaseName = RoCUI_FetchVariableBaseName(v)
        if RoCUIDB_Options["ToggleDisplay"] == true then
            if RoCUIDB_Options[("FrameVisibility_"..v)] == true then
			    _G[RoCUI_Temp_VariableBaseName]:Show()
			end
	    elseif RoCUIDB_Options["ToggleDisplay"] == false then
	        _G[RoCUI_Temp_VariableBaseName]:Hide()
	    else
	    end
	end
end


function RoCUI_ToggleDisplay_Binding()
    if RoCUIDB_Options["ToggleDisplay"] == true then
        Settings.SetValue("RoCUI_Options_ToggleDisplay", false, true)
	elseif RoCUIDB_Options["ToggleDisplay"] == false then
        Settings.SetValue("RoCUI_Options_ToggleDisplay", true, true)
    else
	end
end




-- refresh faction skin textures
function RoCUI_Update_FactionSkin(input_framename, input_backdrop)
    local RoCUI_Temp_VariableBaseName = RoCUI_FetchVariableBaseName(input_framename)
    local RoCUI_Temp_VariableTextureName = RoCUI_FetchVariableTextureName(input_framename)
    local RoCUI_Temp_TextureFilepath = RoCUI_FetchTextureFilepath(input_framename)
	if input_backdrop == "Backdrop" then
		_G[RoCUI_Temp_VariableBaseName]:SetBackdrop(RoCUI_CustomBackdrop_Options_Menu_Border)
    else
        _G[RoCUI_Temp_VariableTextureName]:SetTexture(RoCUI_Temp_TextureFilepath)
	end
end




-- check all frames
function RoCUI_Update_RefreshFactionSkin()
    RoCUI_UpdateBackdrop()
    RoCUI_Update_FactionSkin("main", "")
    RoCUI_Update_FactionSkin("sun", "")
	RoCUI_Update_FactionSkin("additional1", "Backdrop")
	RoCUI_Update_FactionSkin("additional2", "Backdrop")
	RoCUI_Update_FactionSkin("additional3", "Backdrop")
	RoCUI_Update_FactionSkin("additional4", "Backdrop")
end




-- Save and restore default settings
function RoCUI_SaveDefaultSetting(input_variable, input_variablekey, input_value)
    table.insert(RoCUI_DefaultDatabase_Variables, input_variable)
	table.insert(RoCUI_DefaultDatabase_VariableKeys, input_variable)
    RoCUI_DefaultDatabase_Values[input_variable] = input_value
end

function RoCUI_RestoreDefaultSetting()
    for i, v in ipairs(RoCUI_DefaultDatabase_Variables) do
	    Settings.SetValue(v, RoCUI_DefaultDatabase_Values[v], true)
	end
end