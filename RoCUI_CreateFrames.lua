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
    _G[RoCUI_Temp_VariableBaseName]:SetIgnoreParentScale(true)

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




-- create additional frames that each have their own unique function (but do not change their texture depending on the faction skin choice).


---- day and night cycle
function RoCUI_CreateCustomFrame_DayandNightCycle()
    RoCUI_CustomFrame_Texture_suncycle = RoCUI_CustomFrame_Base_sun:CreateTexture()
    RoCUI_CustomFrame_Texture_suncycle:SetPoint("TOP", RoCUI_FrameWindowName_sun, "TOP", 0, 0)
	RoCUI_CustomFrame_Texture_suncycle:SetSize(RoCUI_Table_Options_Default_Width["sun"], RoCUI_Table_Options_Default_Height["sun"])
	

    RoCUI_CustomFrame_Texture_sunclock = RoCUI_CustomFrame_Base_sun:CreateTexture()
    RoCUI_CustomFrame_Texture_sunclock:SetPoint("TOP", RoCUI_FrameWindowName_sun, "TOP", 0, 0)
	RoCUI_CustomFrame_Texture_sunclock:SetSize(RoCUI_Table_Options_Default_Width["sun"], RoCUI_Table_Options_Default_Height["sun"])
	
    RoCUI_CustomFrame_Texture_sunclock:SetDrawLayer("BACKGROUND", 3)
    RoCUI_CustomFrame_Texture_sun:SetDrawLayer("BACKGROUND", 2)
    RoCUI_CustomFrame_Texture_suncycle:SetDrawLayer("BACKGROUND", 1)
end




---- top row - menu buttons
function RoCUI_CreateCustomFrame_MenuButton()
	for i=1, 8 do
        local RoCUI_Temp_FrameWindowName = ("RoCUI_FrameWindowName_top"..tostring(i))
	    local RoCUI_Temp_ButtonName = ("RoCUI_CustomFrame_Base_menubutton"..tostring(i))
        local RoCUI_Temp_FrameType = ("menubutton"..tostring(i))
		local RoCUI_Temp_FrameType_Top = ("top"..tostring(i))

        _G[RoCUI_Temp_ButtonName] = CreateFrame("Button", nil, _G[RoCUI_Temp_FrameWindowName], "RoCUIButtonTemplate")
        _G[RoCUI_Temp_ButtonName]:SetPoint("TOP", _G[RoCUI_Temp_FrameWindowName], "TOP", 0, -3)
        _G[RoCUI_Temp_ButtonName]:SetSize(RoCUI_Table_Options_Default_Width["topbutton"], RoCUI_Table_Options_Default_Height["topbutton"])
        _G[RoCUI_Temp_ButtonName]:SetText("")

        RoCUI_Update_FactionSkin(RoCUI_Temp_FrameType, "button")

	    _G[RoCUI_Temp_ButtonName]:SetScript("OnClick", function(self, button)
		    if not RoCUI_CombatCheck() then
                RoCUI_ButtonReaction(RoCUI_Temp_FrameType_Top)
	        else
	            RoCUI_SendAddonLockdownMessage()
	        end
        end)
	end
end




---- portrait
function RoCUI_CreateCustomFrame_PortraitPlayer()
    RoCUI_CustomFrame_Texture_portraitplayerrender = RoCUI_CustomFrame_Base_portraitplayer:CreateTexture("RoCUI_Portrait_Player")
    RoCUI_CustomFrame_Texture_portraitplayerrender:SetTexture("Interface\\AddOns\\RoCUI\\images\\portrait\\background")
    RoCUI_CustomFrame_Texture_portraitplayerrender:SetSize(RoCUI_Table_Options_Default_Width["portraitplayer_render"], RoCUI_Table_Options_Default_Height["portraitplayer_render"])
    RoCUI_CustomFrame_Texture_portraitplayerrender:SetPoint("BOTTOM", RoCUI_FrameWindowName_portraitplayer, "BOTTOM", 0, 28)
	SetPortraitTexture(RoCUI_CustomFrame_Texture_portraitplayerrender, "player")

    RoCUI_CustomFrame_Texture_portraitplayermask = RoCUI_CustomFrame_Base_portraitplayer:CreateMaskTexture()
    RoCUI_CustomFrame_Texture_portraitplayermask:SetTexture("Interface\\AddOns\\RoCUI\\images\\portrait\\mask", "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
    RoCUI_CustomFrame_Texture_portraitplayermask:SetPoint("BOTTOM", RoCUI_FrameWindowName_portraitplayer, "BOTTOM", 0, 0)
    RoCUI_CustomFrame_Texture_portraitplayermask:SetSize(RoCUI_Table_Options_Default_Width["portraitplayer"], RoCUI_Table_Options_Default_Height["portraitplayer"])
    RoCUI_CustomFrame_Texture_portraitplayerrender:AddMaskTexture(RoCUI_CustomFrame_Texture_portraitplayermask)

    RoCUI_CustomFrame_Texture_portraitplayer:SetDrawLayer("BACKGROUND", 2)
    RoCUI_CustomFrame_Texture_portraitplayerrender:SetDrawLayer("BACKGROUND", 1)

	RoCUI_CustomFrame_Portrait_Health = RoCUI_CustomFrame_Base_portraitplayer:CreateFontString(nil, "OVERLAY", "RoCUIHealthFont")
    RoCUI_CustomFrame_Portrait_Health:SetPoint("BOTTOM", RoCUI_FrameWindowName_portraitplayer, "BOTTOM", 0, 28)
    RoCUI_CustomFrame_Portrait_Health:SetSize(140, 20)
    RoCUI_CustomFrame_Portrait_Health:SetText("")

    RoCUI_CustomFrame_Portrait_Power = RoCUI_CustomFrame_Base_portraitplayer:CreateFontString(nil, "OVERLAY", "RoCUIPowerFont")
    RoCUI_CustomFrame_Portrait_Power:SetPoint("BOTTOM", RoCUI_FrameWindowName_portraitplayer, "BOTTOM", 0, 4)
    RoCUI_CustomFrame_Portrait_Power:SetSize(140, 20)
    RoCUI_CustomFrame_Portrait_Power:SetText("")
end




---- player infopanel
function RoCUI_CreateCustomFrame_InfoPlayer()

    ---- player name	
	RoCUI_CustomFrame_infoplayer_name = RoCUI_CustomFrame_Base_infoplayer:CreateFontString(nil, "OVERLAY", "RoCUIInfopanelPlayerName")
    RoCUI_CustomFrame_infoplayer_name:SetPoint("TOP", RoCUI_FrameWindowName_infoplayer, "TOP", 0, -38)
    RoCUI_CustomFrame_infoplayer_name:SetSize(RoCUI_Table_Options_Default_Width["infoplayer"], 20)
    RoCUI_CustomFrame_infoplayer_name:SetTextToFit("")
	RoCUI_UpdatePlayerNameAndTitle()


    ---- experience bar
    RoCUI_CustomFrame_infoplayer_experiencebar = CreateFrame("StatusBar", nil, RoCUI_CustomFrame_Base_infoplayer)
    RoCUI_CustomFrame_infoplayer_experiencebar:SetPoint("TOP", RoCUI_FrameWindowName_infoplayer, "TOP", 0, -61)
    RoCUI_CustomFrame_infoplayer_experiencebar:SetSize(RoCUI_Table_Options_Default_Width["infoplayer_experiencebar"], RoCUI_Table_Options_Default_Height["infoplayer_experiencebar"])
    RoCUI_CustomFrame_infoplayer_experiencebar:SetStatusBarTexture("Interface\\AddOns\\RoCUI\\images\\infopanel\\expbar")
    RoCUI_CustomFrame_infoplayer_experiencebar:SetStatusBarColor(0.529, 0, 0.498)
    RoCUI_CustomFrame_infoplayer_experiencebar:SetMinMaxValues(0, 100)
	RoCUI_UpdatePlayerExperienceBar()
	
	RoCUI_CustomFrame_infoplayer_experiencebar_title = RoCUI_CustomFrame_Base_infoplayer:CreateFontString(nil, "OVERLAY", "RoCUIInfopanelExperienceBarText")
    RoCUI_CustomFrame_infoplayer_experiencebar_title:SetPoint("TOP", RoCUI_FrameWindowName_infoplayer, "TOP", 0, -61)
    RoCUI_CustomFrame_infoplayer_experiencebar_title:SetSize(RoCUI_Table_Options_Default_Width["infoplayer_experiencebar"], RoCUI_Table_Options_Default_Height["infoplayer_experiencebar"])
    RoCUI_UpdatePlayerSpecAndLevel()

    RoCUI_CustomFrame_infoplayer_experiencebar_border = CreateFrame("Frame", nil, RoCUI_CustomFrame_Base_infoplayer, "BackdropTemplate")
	RoCUI_CustomFrame_infoplayer_experiencebar_border:SetPoint("TOP", RoCUI_FrameWindowName_infoplayer, "TOP", 0, -56)
    RoCUI_CustomFrame_infoplayer_experiencebar_border:SetSize(RoCUI_Table_Options_Default_Width["infoplayer_experiencebar_border"], RoCUI_Table_Options_Default_Height["infoplayer_experiencebar_border"])
    RoCUI_CustomFrame_infoplayer_experiencebar_border:SetBackdrop(RoCUI_CustomBackdrop_Infopanel_ExperienceBar)




    ---- weapon icon and text
	RoCUI_CustomFrame_infoplayer_weapon_icon = RoCUI_CustomFrame_Base_infoplayer:CreateTexture(nil, "ARTWORK")
	RoCUI_CustomFrame_infoplayer_weapon_icon:SetPoint("TOPLEFT", RoCUI_FrameWindowName_infoplayer, "TOPLEFT", 42, -100)
	RoCUI_CustomFrame_infoplayer_weapon_icon:SetSize(50, 50)
	RoCUI_CustomFrame_infoplayer_weapon_icon:SetTexture("Interface\\AddOns\\RoCUI\\images\\infopanel\\placeholder")

	RoCUI_CustomFrame_infoplayer_weapon_border = RoCUI_CustomFrame_Base_infoplayer:CreateTexture(nil, "ARTWORK")
	RoCUI_CustomFrame_infoplayer_weapon_border:SetPoint("TOPLEFT", RoCUI_FrameWindowName_infoplayer, "TOPLEFT", 42, -100)
	RoCUI_CustomFrame_infoplayer_weapon_border:SetSize(50, 50)
	RoCUI_CustomFrame_infoplayer_weapon_border:SetTexture("Interface\\AddOns\\RoCUI\\images\\infopanel\\generaliconborder")

	RoCUI_CustomFrame_infoplayer_weapon_title = RoCUI_CustomFrame_Base_infoplayer:CreateFontString(nil, "OVERLAY", "RoCUIInfopanelStatNormal")
    RoCUI_CustomFrame_infoplayer_weapon_title:SetPoint("TOPLEFT", RoCUI_FrameWindowName_infoplayer, "TOPLEFT", 100, -100)
    RoCUI_CustomFrame_infoplayer_weapon_title:SetSize(130, 70)
    RoCUI_CustomFrame_infoplayer_weapon_title:SetText("")


    ---- armor icon and text
	RoCUI_CustomFrame_infoplayer_armor_icon = RoCUI_CustomFrame_Base_infoplayer:CreateTexture(nil, "ARTWORK")
	RoCUI_CustomFrame_infoplayer_armor_icon:SetPoint("TOPLEFT", RoCUI_FrameWindowName_infoplayer, "TOPLEFT", 42, -170)
	RoCUI_CustomFrame_infoplayer_armor_icon:SetSize(50, 50)
	RoCUI_CustomFrame_infoplayer_armor_icon:SetTexture("Interface\\AddOns\\RoCUI\\images\\infopanel\\placeholder")

	RoCUI_CustomFrame_infoplayer_armor_border = RoCUI_CustomFrame_Base_infoplayer:CreateTexture(nil, "ARTWORK")
	RoCUI_CustomFrame_infoplayer_armor_border:SetPoint("TOPLEFT", RoCUI_FrameWindowName_infoplayer, "TOPLEFT", 42, -170)
	RoCUI_CustomFrame_infoplayer_armor_border:SetSize(50, 50)
	RoCUI_CustomFrame_infoplayer_armor_border:SetTexture("Interface\\AddOns\\RoCUI\\images\\infopanel\\generaliconborder")

	RoCUI_CustomFrame_infoplayer_armor_title = RoCUI_CustomFrame_Base_infoplayer:CreateFontString(nil, "OVERLAY", "RoCUIInfopanelStatNormal")
    RoCUI_CustomFrame_infoplayer_armor_title:SetPoint("TOPLEFT", RoCUI_FrameWindowName_infoplayer, "TOPLEFT", 100, -170)
    RoCUI_CustomFrame_infoplayer_armor_title:SetSize(130, 70)
    RoCUI_CustomFrame_infoplayer_armor_title:SetText("")


    ---- stat icon and text
	RoCUI_CustomFrame_infoplayer_stats_icon = RoCUI_CustomFrame_Base_infoplayer:CreateTexture(nil, "ARTWORK")
	RoCUI_CustomFrame_infoplayer_stats_icon:SetPoint("TOPRIGHT", RoCUI_FrameWindowName_infoplayer, "TOPRIGHT", -142, -135)
	RoCUI_CustomFrame_infoplayer_stats_icon:SetSize(50, 50)
	RoCUI_CustomFrame_infoplayer_stats_icon:SetTexture("Interface\\AddOns\\RoCUI\\images\\infopanel\\placeholder")

	RoCUI_CustomFrame_infoplayer_stats_border = RoCUI_CustomFrame_Base_infoplayer:CreateTexture(nil, "ARTWORK")
	RoCUI_CustomFrame_infoplayer_stats_border:SetPoint("TOPRIGHT", RoCUI_FrameWindowName_infoplayer, "TOPRIGHT", -142, -135)
	RoCUI_CustomFrame_infoplayer_stats_border:SetSize(50, 50)
	RoCUI_CustomFrame_infoplayer_stats_border:SetTexture("Interface\\AddOns\\RoCUI\\images\\infopanel\\generaliconborder")

	RoCUI_CustomFrame_infoplayer_stats_title = RoCUI_CustomFrame_Base_infoplayer:CreateFontString(nil, "OVERLAY", "RoCUIInfopanelStatNormal")
    RoCUI_CustomFrame_infoplayer_stats_title:SetPoint("TOPRIGHT", RoCUI_FrameWindowName_infoplayer, "TOPRIGHT", -5, -100)
    RoCUI_CustomFrame_infoplayer_stats_title:SetSize(130, 300)
    RoCUI_CustomFrame_infoplayer_stats_title:SetText("")
	
	
	---- set layer for each frame
	RoCUI_CustomFrame_infoplayer_experiencebar_border:SetFrameLevel(2)
    RoCUI_CustomFrame_infoplayer_experiencebar:SetFrameLevel(1)
	RoCUI_CustomFrame_infoplayer_weapon_icon:SetDrawLayer("ARTWORK", 1)
	RoCUI_CustomFrame_infoplayer_weapon_border:SetDrawLayer("ARTWORK", 2)
	RoCUI_CustomFrame_infoplayer_armor_icon:SetDrawLayer("ARTWORK", 1)
	RoCUI_CustomFrame_infoplayer_armor_border:SetDrawLayer("ARTWORK", 2)
	RoCUI_CustomFrame_infoplayer_stats_icon:SetDrawLayer("ARTWORK", 1)
	RoCUI_CustomFrame_infoplayer_stats_border:SetDrawLayer("ARTWORK", 2)
end