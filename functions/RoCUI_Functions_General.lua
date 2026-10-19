-- combat check
function RoCUI_General_CombatCheck()
    local RestrictionType = false
    for i=0, 3 do
	    if C_RestrictedActions.IsAddOnRestrictionActive(i) == true then
		    RestrictionType = true
		end
	end
	return RestrictionType
end




-- send add-on message in chat
function RoCUI_General_SendChatMessage(input_text)
    local ChatLockdownIsActive = C_ChatInfo.InChatMessagingLockdown()
	if RoCUI_PV("Load", "Other_MessageEnable") == true then
        if ChatLockdownIsActive == false then

            local Red = RoCUI_PV("Load", "Other_MessageColor_Red")
            local Green = RoCUI_PV("Load", "Other_MessageColor_Green")
            local Blue = RoCUI_PV("Load", "Other_MessageColor_Blue")
            local Color = CreateColor(Red, Green, Blue)
            Color:GenerateHexColor()

		    print(Color:WrapTextInColorCode(RoCUI_Text_AddonNameAbbreviated).." - "..input_text)
		end
	end
end




-- pick color for chat message
function RoCUI_General_ShowColorPicker(r, g, b)
    local function OnColorChanged()
        local newR, newG, newB = ColorPickerFrame:GetColorRGB()
        RoCUI_PV("Save", "Other_MessageColor_Red", newR)
        RoCUI_PV("Save", "Other_MessageColor_Green", newG)
        RoCUI_PV("Save", "Other_MessageColor_Blue", newB)
    end

    local function OnCancel()
        local newR, newG, newB = ColorPickerFrame:GetPreviousValues()
        RoCUI_PV("Save", "Other_MessageColor_Red", newR)
        RoCUI_PV("Save", "Other_MessageColor_Green", newG)
        RoCUI_PV("Save", "Other_MessageColor_Blue", newB)
    end

    local options = {
        swatchFunc = OnColorChanged,
        opacityFunc = OnColorChanged,
        cancelFunc = OnCancel,
        hasOpacity = false,
        opacity = a,
        r = r,
        g = g,
        b = b,
    }

    ColorPickerFrame:SetupColorPickerAndShow(options)
end




-- minimap button toggle
function RoCUI_General_ToggleMinimapButton()
    if RoCUI_PV("Load", "General_MinimapButton") == true then
	    RoCUI_LibDBIcon:Show("RoCUI_Minimap")
	else
	    RoCUI_LibDBIcon:Hide("RoCUI_Minimap")
	end
end




-- play sound file from either the RepairMessage or Sounds category
function RoCUI_General_PlaySoundFile(input_soundID, input_usesoundhandle)
    local SoundID = input_soundID
	local UseSoundhandle = input_usesoundhandle
	local ChannelIndex = RoCUI_PV("Load", "Sounds_Channel")
	local ChannelName = RoCUI_Sounds_ChannelList[ChannelIndex]

	if UseSoundhandle == true then
	    _, RoCUI_SoundHandle = PlaySoundFile(SoundID, ChannelName)
	else
	    PlaySoundFile(SoundID, ChannelName)
	end
end




-- options menu toggle
function RoCUI_General_ToggleOptionsMenu()
    if RoCUI_Frames["OptionsMenu"]:IsVisible() == true then
	    RoCUI_Frames["OptionsMenu"]:Hide()
		RoCUI_General_PlaySoundFile("Interface\\AddOns\\RoCUI\\sounds\\interface\\BigButtonClick.ogg")
	elseif RoCUI_Frames["OptionsMenu"]:IsVisible() == false then
	    RoCUI_Frames["OptionsMenu"]:Show()
		RoCUI_General_PlaySoundFile("Interface\\AddOns\\RoCUI\\sounds\\interface\\GamePause.ogg")
	end
end




-- texture filepaths
function RoCUI_General_FetchTextureFilepath(input_frametype)
    local FactionID = RoCUI_PV("Load", "General_FactionSkin")
	local Textstring_Faction = RoCUI_Factions_FilepathNames[FactionID]
    local Textstring_Final = ("Interface\\AddOns\\RoCUI\\images\\"..input_frametype.."\\"..Textstring_Faction)
return Textstring_Final
end




-- texture filepaths (button)
function RoCUI_General_FetchTextureFilepath_Button(input_frametype)
    local FactionID = RoCUI_PV("Load", "General_FactionSkin")
	local Textstring_Faction = RoCUI_Factions_FilepathNames[FactionID]
    local Textstring_Final = ("Interface\\AddOns\\RoCUI\\images\\buttons\\"..input_frametype.."\\"..Textstring_Faction)
	if input_frametype == "disabled" then
	    Textstring_Final = ("Interface\\AddOns\\RoCUI\\images\\buttons\\disabled\\disabled")
	end
return Textstring_Final
end




-- audio filepaths
function RoCUI_General_FetchAudioFilepath(input_soundchoice, input_type)
	local Textstring_Faction = RoCUI_Factions_FilepathNames[input_soundchoice]
    local Textstring_Final = ("Interface\\AddOns\\RoCUI\\sounds\\endofbattle\\"..Textstring_Faction.."_"..input_type..".ogg")
return Textstring_Final
end