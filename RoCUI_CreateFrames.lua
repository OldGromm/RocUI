
-- create all standard frames whose faction skin can be changed in the options menu
function RoCUI_CreateCustomFrame(input_frametype, input_anchor, input_backdrop)
    -- fetch variable and frame name
    local RoCUI_Temp_VariableBaseName = RoCUI_FetchVariableBaseName(input_frametype)
    local RoCUI_Temp_VariableTextureName = RoCUI_FetchVariableTextureName(input_frametype)
    local RoCUI_Temp_FrameWindowName = RoCUI_FetchFrameWindowName(input_frametype)
    local RoCUI_Temp_FrameTextureName = RoCUI_FetchFrameTextureName(input_frametype)




	-- create the frame
    _G[RoCUI_Temp_VariableBaseName] = CreateFrame("Frame", RoCUI_Temp_FrameWindowName, UIParent, "BackdropTemplate")


    -- anchor and coordinates
	local RoCUI_Temp_X = RoCUIDB_Options["FramePosition_X_"..input_frametype]
	local RoCUI_Temp_Y = RoCUIDB_Options["FramePosition_Y_"..input_frametype]
	_G[RoCUI_Temp_VariableBaseName]:SetPoint(input_anchor, UIParent, input_anchor, RoCUI_Temp_X, RoCUI_Temp_Y)


    ---- size
	local RoCUI_Temp_Width_Percentage = RoCUIDB_Options["FrameWidth_"..input_frametype]
	local RoCUI_Temp_Height_Percentage = RoCUIDB_Options["FrameHeight_"..input_frametype]
	local RoCUI_Temp_Width = RoCUI_Table_Options_Default_Width[input_frametype]
	local RoCUI_Temp_Height = RoCUI_Table_Options_Default_Height[input_frametype]
	local RoCUI_Temp_Width_Final = (RoCUI_Temp_Width*RoCUI_Temp_Width_Percentage)
	local RoCUI_Temp_Height_Final = (RoCUI_Temp_Height*RoCUI_Temp_Height_Percentage)
	
	_G[RoCUI_Temp_VariableBaseName]:SetSize(RoCUI_Temp_Width, RoCUI_Temp_Height)


    ---- scale
    _G[RoCUI_Temp_VariableBaseName]:SetScale(RoCUIDB_Options["FrameScale_"..input_frametype])


    ---- strata
	local RoCUI_Temp_Strata_Options = RoCUIDB_Options["FrameStrata_"..input_frametype]
	local RoCUI_Temp_Strata_Final = RoCUI_Table_StrataNames[RoCUI_Temp_Strata_Options]
    _G[RoCUI_Temp_VariableBaseName]:SetFrameStrata(RoCUI_Temp_Strata_Final)


    ---- show/hide frame
    if RoCUIDB_Options["FrameVisibility_"..input_frametype] == true then
	    _G[RoCUI_Temp_VariableBaseName]:Show()
	elseif RoCUIDB_Options["FrameVisibility_"..input_frametype] == false then
	    _G[RoCUI_Temp_VariableBaseName]:Hide()
	else
	end


    -- create texture frame for the main frame
	_G[RoCUI_Temp_VariableTextureName] = _G[RoCUI_Temp_VariableBaseName]:CreateTexture(RoCUI_Temp_FrameTextureName, "ARTWORK")
    _G[RoCUI_Temp_VariableTextureName]:SetAllPoints()
    RoCUI_Update_FactionSkin(input_frametype, input_backdrop)
end



-- create additional skins that each have their own unique function (but do not change their texture depending on the faction skin choice).
---- day and night cycle
function RoCUI_CreateCustomFrame_DayandNightCycle()

    --local RoCUI_Temp_Anchor = "TOP"
    --local RoCUI_Temp_Width = 64
    --local RoCUI_Temp_Height = 64
	--local RoCUI_Temp_X = 0
    --local RoCUI_Temp_Y = -12
	--RoCUI_CustomFrame_Base_suncycle = CreateFrame("Frame", "RoCUI_FrameWindowName_suncycle", RoCUI_FrameWindowName_sun)
	--RoCUI_CustomFrame_Base_suncycle:SetPoint(RoCUI_Temp_Anchor, RoCUI_FrameWindowName_sun, RoCUI_Temp_Anchor, RoCUI_Temp_X, RoCUI_Temp_Y)	
	--RoCUI_CustomFrame_Base_suncycle:SetSize(RoCUI_Temp_Width, RoCUI_Temp_Height)

	RoCUI_CustomFrame_Texture_suncycle = RoCUI_CustomFrame_Base_sun:CreateTexture("Interface\\AddOns\\RoCUI\\images\\suncycle\\RoCUI_Cycle_0", "BACKGROUND")
    --RoCUI_CustomFrame_Texture_suncycle:SetAllPoints()
	RoCUI_CustomFrame_Texture_suncycle:SetPoint("TOP", RoCUI_FrameWindowName_sun, "TOP", 0, 0)
end




function RoCUI_CreateCustomFramesAfterAddonLoad()
    RoCUI_UpdateBackdrop()
	RoCUI_CreateCustomFrame("main", "BOTTOM", "")
    RoCUI_CreateCustomFrame("sun", "TOP", "")
    RoCUI_CreateCustomFrame("additional1", "CENTER", "Backdrop")
    RoCUI_CreateCustomFrame("additional2", "CENTER", "Backdrop")
    RoCUI_CreateCustomFrame("additional3", "CENTER", "Backdrop")
    RoCUI_CreateCustomFrame("additional4", "CENTER", "Backdrop")
	RoCUI_CreateCustomFrame_DayandNightCycle()
end