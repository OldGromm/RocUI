-- general
---- chat messages
function RoCUI_SendChatMessage(input)
    if not PlayerIsInCombat() then
	    if RoCUIDB_Options["General_AddonMessages"] == true then
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
    local RoCUI_Temp_FactionSkinID = RoCUIDB_Options["General_FactionSkin"]
	local RoCUI_Temp_FactionSkinString = RoCUI_Table_SkinNames[RoCUI_Temp_FactionSkinID]
    local RoCUI_Temp_String_Final = ("Interface\\AddOns\\RoCUI\\images\\"..input_frametype.."\\"..RoCUI_Temp_FactionSkinString)
return RoCUI_Temp_String_Final
end


-- texture filepaths (button)
function RoCUI_FetchTextureFilepath_Button(input_frametype)
    local RoCUI_Temp_FactionSkinID = RoCUIDB_Options["General_FactionSkin"]
	local RoCUI_Temp_FactionSkinString = RoCUI_Table_SkinNames[RoCUI_Temp_FactionSkinID]
    local RoCUI_Temp_String_Final = ("Interface\\AddOns\\RoCUI\\images\\buttons\\"..input_frametype.."\\"..RoCUI_Temp_FactionSkinString)
	if input_frametype == "disabled" then
	    RoCUI_Temp_String_Final = ("Interface\\AddOns\\RoCUI\\images\\buttons\\disabled\\disabled")
	end
return RoCUI_Temp_String_Final
end


-- options menu
---- show/hide frame
function RoCUI_Update_FrameVisibility(input_settingsname, input_framename)
    local RoCUI_Temp_VariableBaseName = RoCUI_FetchVariableBaseName(input_framename)
	if RoCUIDB_Options[input_settingsname] == true then
	    if RoCUIDB_Options["General_ToggleDisplay"] == true then
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
        _G["RoCUI_CustomFrame_Texture_suncycle"]:SetWidth(RoCUI_Temp_Width_Final)
        _G["RoCUI_CustomFrame_Texture_sunclock"]:SetWidth(RoCUI_Temp_Width_Final)
	elseif input_framename == "portraitplayer" then
        local RoCUI_Temp_PortraitPlayer_Width = 200
        local RoCUI_Temp_PortraitPlayer_Width_Final = (RoCUI_Temp_PortraitPlayer_Width*RoCUI_Temp_Width_Percentage)
        _G["RoCUI_CustomFrame_Texture_portraitplayerrender"]:SetWidth(RoCUI_Temp_PortraitPlayer_Width_Final)
		_G["RoCUI_CustomFrame_Texture_portraitplayermask"]:SetWidth(RoCUI_Temp_Width_Final)
	end
end

function RoCUI_Update_FrameDimensions_Height(input_settingsname, input_framename)
    local RoCUI_Temp_VariableBaseName = RoCUI_FetchVariableBaseName(input_framename)
	local RoCUI_Temp_Height_Percentage = RoCUIDB_Options[input_settingsname]
	local RoCUI_Temp_Height = RoCUI_Table_Options_Default_Height[input_framename]
	local RoCUI_Temp_Height_Final = (RoCUI_Temp_Height*RoCUI_Temp_Height_Percentage)
    _G[RoCUI_Temp_VariableBaseName]:SetHeight(RoCUI_Temp_Height_Final)
	if input_framename == "sun" then
        _G["RoCUI_CustomFrame_Texture_suncycle"]:SetHeight(RoCUI_Temp_Height_Final)
        _G["RoCUI_CustomFrame_Texture_sunclock"]:SetHeight(RoCUI_Temp_Height_Final)
	elseif input_framename == "portraitplayer" then
        local RoCUI_Temp_PortraitPlayer_Height = 200
        local RoCUI_Temp_PortraitPlayer_Height_Final = (RoCUI_Temp_PortraitPlayer_Height*RoCUI_Temp_Height_Percentage)
        _G["RoCUI_CustomFrame_Texture_portraitplayerrender"]:SetHeight(RoCUI_Temp_PortraitPlayer_Height_Final)
		_G["RoCUI_CustomFrame_Texture_portraitplayermask"]:SetHeight(RoCUI_Temp_Height_Final)
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




-- show or hide frames
function RoCUI_ToggleDisplay()
    local RoCUI_Temp_VariableBaseName = ""
	for i, v in ipairs(RoCUI_Table_Options_Frametypes) do
	    RoCUI_Temp_VariableBaseName = RoCUI_FetchVariableBaseName(v)
        if RoCUIDB_Options["General_ToggleDisplay"] == true then
            if RoCUIDB_Options[("FrameVisibility_"..v)] == true then
			    _G[RoCUI_Temp_VariableBaseName]:Show()
			end
	    elseif RoCUIDB_Options["General_ToggleDisplay"] == false then
	        _G[RoCUI_Temp_VariableBaseName]:Hide()
	    else
	    end
	end
end


function RoCUI_ToggleDisplay_Binding()
    if not PlayerIsInCombat() then
        if RoCUIDB_Options["General_ToggleDisplay"] == true then
            Settings.SetValue("RoCUI_Options_General_ToggleDisplay", false, true)
	    elseif RoCUIDB_Options["General_ToggleDisplay"] == false then
            Settings.SetValue("RoCUI_Options_General_ToggleDisplay", true, true)
        else
	    end
	else
	    RoCUI_SendChatMessage(RoCUI_Text_CombatWarning)
	end
end


function RoCUI_ToggleDisplay_Buttons(input_frametype, input_number)
    local RoCUI_Temp_VariableBaseName = ("RoCUI_CustomFrame_Base_"..input_frametype)
    if input_number == 20 then
        _G[RoCUI_Temp_VariableBaseName]:Hide()
    else
        _G[RoCUI_Temp_VariableBaseName]:Show()
    end
end




-- refresh faction skin textures
---- function to check each frame
function RoCUI_Update_FactionSkin(input_framename, input_texturetype)
    local RoCUI_Temp_VariableBaseName = RoCUI_FetchVariableBaseName(input_framename)
    local RoCUI_Temp_VariableTextureName = RoCUI_FetchVariableTextureName(input_framename)
    local RoCUI_Temp_TextureFilepath = RoCUI_FetchTextureFilepath(input_framename)
	local RoCUI_Temp_Top = ""

	if input_framename == "portraitplayer" then
        RoCUI_Temp_TextureFilepath = RoCUI_FetchTextureFilepath("portrait")
	end

	for i=1, 8 do
	    RoCUI_Temp_Top = ("top"..tostring(i))
		if input_framename == RoCUI_Temp_Top then
            RoCUI_Temp_TextureFilepath = RoCUI_FetchTextureFilepath("top")
	    end
	end
	


	if input_framename == "inventory" then
	    if RoCUIDB_Options["Inventory_ToggleSlots"] == true then
            RoCUI_Temp_TextureFilepath = RoCUI_FetchTextureFilepath("inventory_show")
		elseif RoCUIDB_Options["Inventory_ToggleSlots"] == false then
            RoCUI_Temp_TextureFilepath = RoCUI_FetchTextureFilepath("inventory_hide")
		end
	end


	if input_texturetype == "button" then
        local RoCUI_ButtonName = RoCUI_FetchVariableBaseName(input_framename)
	    local RoCUI_ButtonTexture_Normal = RoCUI_FetchTextureFilepath_Button("normal")
	    local RoCUI_ButtonTexture_Highlight = RoCUI_FetchTextureFilepath_Button("highlight")
	    local RoCUI_ButtonTexture_Pushed = RoCUI_FetchTextureFilepath_Button("pushed")
	    local RoCUI_ButtonTexture_Disabled = RoCUI_FetchTextureFilepath_Button("disabled")
		_G[RoCUI_ButtonName]:SetNormalTexture(RoCUI_ButtonTexture_Normal)
		_G[RoCUI_ButtonName]:SetHighlightTexture(RoCUI_ButtonTexture_Highlight)
		_G[RoCUI_ButtonName]:SetPushedTexture(RoCUI_ButtonTexture_Pushed)
		_G[RoCUI_ButtonName]:SetDisabledTexture(RoCUI_ButtonTexture_Disabled)
	elseif input_texturetype == "backdrop" then
	    local RoCUI_Temp_Backdrop = RoCUI_UpdateBackdrop(input_framename)
		_G[RoCUI_Temp_VariableBaseName]:SetBackdrop(RoCUI_Temp_Backdrop)
    else
        _G[RoCUI_Temp_VariableTextureName]:SetTexture(RoCUI_Temp_TextureFilepath)
	end
end


---- check all frames
function RoCUI_Update_RefreshFactionSkin()
    RoCUI_Update_FactionSkin("main", "")
    RoCUI_Update_FactionSkin("sun", "")
	RoCUI_Update_FactionSkin("portraitplayer", "")
	RoCUI_Update_FactionSkin("infoplayer", "backdrop")
	RoCUI_Update_FactionSkin("top1", "")
	RoCUI_Update_FactionSkin("top2", "")
	RoCUI_Update_FactionSkin("top3", "")
	RoCUI_Update_FactionSkin("top4", "")
	RoCUI_Update_FactionSkin("top5", "")
	RoCUI_Update_FactionSkin("top6", "")
	RoCUI_Update_FactionSkin("top7", "")
	RoCUI_Update_FactionSkin("top8", "")
	RoCUI_Update_FactionSkin("additional1", "backdrop")
	RoCUI_Update_FactionSkin("additional2", "backdrop")
	RoCUI_Update_FactionSkin("additional3", "backdrop")
	RoCUI_Update_FactionSkin("additional4", "backdrop")
	for i=1, 8 do
	    local RoCUI_Temp_Menubutton = ("menubutton"..tostring(i))
		local RoCUI_Temp_Top = ("top"..tostring(i))
		local RoCUI_Temp_Options = ("TopMenuChoice_"..RoCUI_Temp_Top)
		local RoCUI_Temp_Choice = RoCUIDB_Options[RoCUI_Temp_Options]
	    RoCUI_Update_FactionSkin(RoCUI_Temp_Menubutton, "button")
		RoCUI_ButtonTextUpdate(RoCUI_Temp_Menubutton, RoCUI_Temp_Choice)
	end
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




RoCUI_Event_PlayerEntersCombat = CreateFrame("Frame")
RoCUI_Event_PlayerEntersCombat:RegisterEvent("PLAYER_REGEN_DISABLED")
RoCUI_Event_PlayerEntersCombat:SetScript("OnEvent", function(_, event, isRequeue)
    for i=1, 8 do
        local RoCUI_Temp_ButtonName = ("RoCUI_CustomFrame_Base_menubutton"..tostring(i))
		_G[RoCUI_Temp_ButtonName]:Disable()
	end
end)



RoCUI_Event_PlayerLeavesCombat = CreateFrame("Frame")
RoCUI_Event_PlayerLeavesCombat:RegisterEvent("PLAYER_REGEN_ENABLED")
RoCUI_Event_PlayerLeavesCombat:SetScript("OnEvent", function(_, event, isRequeue)
    for i=1, 8 do
        local RoCUI_Temp_ButtonName = ("RoCUI_CustomFrame_Base_menubutton"..tostring(i))
		_G[RoCUI_Temp_ButtonName]:Enable()
	end
end)