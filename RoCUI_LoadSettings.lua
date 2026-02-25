-- The add-on creates all the custom frames on the "PLAYER_ENTERING_WORLD" event.
-- This way, we can use the settings variables as defaults (if no prior user data exists).

function RoCUI_CreateCustomFramesAfterAddonLoad()
	RoCUI_CreateCustomFrame("main", "BOTTOM", "")
    RoCUI_CreateCustomFrame("sun", "TOP", "")
	RoCUI_CreateCustomFrame("portraitplayer", "CENTER", "")
    RoCUI_CreateCustomFrame("infoplayer", "CENTER", "backdrop")
    RoCUI_CreateCustomFrame("top1", "TOP", "")
    RoCUI_CreateCustomFrame("top2", "TOP", "")
    RoCUI_CreateCustomFrame("top3", "TOP", "")
    RoCUI_CreateCustomFrame("top4", "TOP", "")
    RoCUI_CreateCustomFrame("top5", "TOP", "")
    RoCUI_CreateCustomFrame("top6", "TOP", "")
    RoCUI_CreateCustomFrame("top7", "TOP", "")
    RoCUI_CreateCustomFrame("top8", "TOP", "")
    RoCUI_CreateCustomFrame("additional1", "CENTER", "backdrop")
    RoCUI_CreateCustomFrame("additional2", "CENTER", "backdrop")
    RoCUI_CreateCustomFrame("additional3", "CENTER", "backdrop")
    RoCUI_CreateCustomFrame("additional4", "CENTER", "backdrop")
	RoCUI_CreateCustomFrame_DayandNightCycle()
	RoCUI_CreateCustomFrame_PortraitPlayer()
	RoCUI_CreateCustomFrame_MenuButton()
	for i=1, 8 do
	    local RoCUI_Temp_Menubutton = ("menubutton"..tostring(i))
		local RoCUI_Temp_Top = ("top"..tostring(i))
		local RoCUI_Temp_Options = ("TopMenuChoice_"..RoCUI_Temp_Top)
		local RoCUI_Temp_Choice = RoCUIDB_Options[RoCUI_Temp_Options]
		RoCUI_ButtonTextUpdate(RoCUI_Temp_Menubutton, RoCUI_Temp_Choice)
	end
	RoCUI_CreateCustomFrame_InfoPlayer()
	
	for i, v in ipairs(RoCUI_Table_SoundOverrides) do
	    local RoCUI_Temp_Variable = ("RoCUI_Options_SoundOverride_"..v)
	    local RoCUI_Temp_VariableKey = ("SoundOverride_"..v)
	    RoCUI_SoundReplacements(RoCUI_Temp_Variable, RoCUIDB_Options[RoCUI_Temp_VariableKey])
	end
	
	RoCUI_ToggleMinimapButton()
	
	-- portrait
	RoCUI_UpdatePlayerStats_Health()
	RoCUI_UpdatePlayerStats_Power()
	
	-- infopanel
	RoCUI_Infopanel_CheckPlayerEquipment("weapon")
    RoCUI_Infopanel_CheckPlayerEquipment("armor")
    RoCUI_Infopanel_UpdateStatIcon()
	RoCUI_Infopanel_UpdateStatText()
	
	-- update frame widtg and height separately after frame creation
    for i, v in ipairs(RoCUI_Table_Options_Frametypes) do
        local RoCUI_Temp_VariableName_Width = ("FrameWidth_"..v)
        local RoCUI_Temp_VariableName_Height = ("FrameHeight_"..v)
        RoCUI_Update_FrameDimensions_Width(RoCUI_Temp_VariableName_Width, v)
        RoCUI_Update_FrameDimensions_Height(RoCUI_Temp_VariableName_Height, v)
    end
end
