function RoCUI_Frames_CreateBaseline()
    for _, v in pairs(RoCUI_Database_FramesDefaultSettings) do
        -- fetch variable and frame name.
		local FrameName = v["Name"]
        local FrameWindowName = ("RoCUI_FrameWindowName_"..v["Name"])
        local NewFrame = CreateFrame("Frame", FrameWindowName, UIParent)
		NewFrame:SetSize(v["Width"], v["Height"])
		NewFrame:SetIgnoreParentScale(true)
		NewFrame:SetScale(1.0)
		RoCUI_Frames[FrameName] = NewFrame


        -- create frame with a backgroudn image.
		-- either use the backdrop template or a regular texture frame.
		local BackgroundFrame = {}
		if v["UsesBackdrop"] == true then
            BackgroundFrame = CreateFrame("Frame", nil, NewFrame, "BackdropTemplate")
		else
            BackgroundFrame = NewFrame:CreateTexture(nil, "ARTWORK")
		end
        BackgroundFrame:SetAllPoints()
        RoCUI_Frames_Backgrounds[FrameName] = BackgroundFrame

		
		if v["Name"] == "OptionsMenu" then
		    tinsert(UISpecialFrames, NewFrame:GetName())
		elseif v["Name"] == "Sundial" then
            local Suncycle = NewFrame:CreateTexture()
			RoCUI_Frames["Suncycle"] = Suncycle
            Suncycle:SetPoint("TOP", FrameWindowName, "TOP", 0, 0)
            Suncycle:SetSize(v["Width"], v["Height"])

            local Sunclock = NewFrame:CreateTexture()
			RoCUI_Frames["Sunclock"] = Sunclock
            Sunclock:SetPoint("TOP", FrameWindowName, "TOP", 0, 0)
            Sunclock:SetSize(v["Width"], v["Height"])

            Sunclock:SetDrawLayer("BACKGROUND", 3)
            BackgroundFrame:SetDrawLayer("BACKGROUND", 2)
            Suncycle:SetDrawLayer("BACKGROUND", 1)
		elseif v["ButtonID"] ~= nil then
            local ButtonFrame = CreateFrame("Button", nil, NewFrame, "RoCUITopMenuButtonTemplate")
            ButtonFrame:SetPoint("TOP", FrameWindowName, "TOP", 0, -3)
            ButtonFrame:SetSize(134, 30)
            ButtonFrame:SetText("")


            RoCUI_Frames_Buttons[FrameName] = ButtonFrame

    	    ButtonFrame:SetScript("OnClick", function(self, button)
                if not RoCUI_General_CombatCheck() then
                    RoCUI_TopMenuButtons_ButtonReaction(v["ButtonID"])
                else
                    RoCUI_CombatLockdown_SendMessage("Buttons")
                end
            end)
		elseif v["Name"] == "Portrait" then
		    local PortraitRender = NewFrame:CreateTexture("RoCUI_Portrait_Player")
            PortraitRender:SetTexture("Interface\\AddOns\\RoCUI\\images\\portrait\\background")
            PortraitRender:SetSize(180, 180)
            PortraitRender:SetPoint("BOTTOM", FrameWindowName, "BOTTOM", 0, 28)
        	SetPortraitTexture(PortraitRender, "player")
			RoCUI_Frames_Portrait["Texture"] = PortraitRender

            local PortraitMask = NewFrame:CreateMaskTexture()
            PortraitMask:SetTexture("Interface\\AddOns\\RoCUI\\images\\portrait\\mask", "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
            PortraitMask:SetPoint("CENTER", FrameWindowName, "CENTER", 0, 0)
            PortraitRender:AddMaskTexture(PortraitMask)

            BackgroundFrame:SetDrawLayer("BACKGROUND", 2)
            PortraitRender:SetDrawLayer("BACKGROUND", 1)

        	local PortraitHealth = NewFrame:CreateFontString(nil, "OVERLAY", "RoCUIHealthFont")
            PortraitHealth:SetPoint("BOTTOM", FrameWindowName, "BOTTOM", 0, 28)
            PortraitHealth:SetSize(140, 20)
            PortraitHealth:SetText("")
			RoCUI_Frames_Portrait["Health"] = PortraitHealth

            local PortraitPower = NewFrame:CreateFontString(nil, "OVERLAY", "RoCUIPowerFont")
            PortraitPower:SetPoint("BOTTOM", FrameWindowName, "BOTTOM", 0, 4)
            PortraitPower:SetSize(140, 20)
            PortraitPower:SetText("")
			RoCUI_Frames_Portrait["Power"] = PortraitPower
        elseif v["Name"] == "Infopanel_Player" then
            -- text layer
            local InfopanelTextFrame = CreateFrame("Frame", nil, NewFrame)
			InfopanelTextFrame:SetSize(v["Width"], v["Height"])
			InfopanelTextFrame:SetAllPoints()

            ---- player name            
            local InfopanelName = InfopanelTextFrame:CreateFontString(nil, "OVERLAY", "RoCUIInfopanelPlayerName")
            InfopanelName:SetPoint("TOP", FrameWindowName, "TOP", 0, -38)
            InfopanelName:SetSize(v["Width"], 20)
            InfopanelName:SetTextToFit("")
			RoCUI_Frames_Infopanel["Player_Name"] = InfopanelName


            ---- experience bar
            local InfopanelExperienceBar = CreateFrame("StatusBar", nil, NewFrame)
            InfopanelExperienceBar:SetPoint("TOP", FrameWindowName, "TOP", 0, -61)
            InfopanelExperienceBar:SetSize(310, 30)
            InfopanelExperienceBar:SetStatusBarTexture("Interface\\AddOns\\RoCUI\\images\\infopanel\\expbar")
            InfopanelExperienceBar:SetStatusBarColor(0.529, 0, 0.498)
            InfopanelExperienceBar:SetMinMaxValues(0, 100)
			RoCUI_Frames_Infopanel["Player_Experience"] = InfopanelExperienceBar
            
            local InfopanelExperienceBarTitle = InfopanelTextFrame:CreateFontString(nil, "OVERLAY", "RoCUIInfopanelExperienceBarText")
            InfopanelExperienceBarTitle:SetPoint("TOP", FrameWindowName, "TOP", 0, -61)
            InfopanelExperienceBarTitle:SetSize(310, 30)
			RoCUI_Frames_Infopanel["Player_Spec"] = InfopanelExperienceBarTitle
            
            local InfopanelExperienceBarBorder = CreateFrame("Frame", nil, NewFrame, "BackdropTemplate")
            InfopanelExperienceBarBorder:SetPoint("TOP", FrameWindowName, "TOP", 0, -56)
            InfopanelExperienceBarBorder:SetSize(320, 40)
            InfopanelExperienceBarBorder:SetBackdrop(RoCUI_Backdrop_Infopanel_ExperienceBar)


            ---- weapon icon and text
            local InfopanelWeaponIcon = NewFrame:CreateTexture(nil, "OVERLAY")
            InfopanelWeaponIcon:SetPoint("TOPLEFT", FrameWindowName, "TOPLEFT", 42, -100)
            InfopanelWeaponIcon:SetSize(50, 50)
            InfopanelWeaponIcon:SetTexture("Interface\\AddOns\\RoCUI\\images\\infopanel\\placeholder")
			RoCUI_Frames_Infopanel["Player_Weapon_Icon"] = InfopanelWeaponIcon

            local InfopanelWeaponBorder = NewFrame:CreateTexture(nil, "OVERLAY")
            InfopanelWeaponBorder:SetPoint("TOPLEFT", FrameWindowName, "TOPLEFT", 42, -100)
            InfopanelWeaponBorder:SetSize(50, 50)
            InfopanelWeaponBorder:SetTexture("Interface\\AddOns\\RoCUI\\images\\infopanel\\generaliconborder")

            local InfopanelWeaponTitle = InfopanelTextFrame:CreateFontString(nil, "OVERLAY", "RoCUIInfopanelStatNormal")
            InfopanelWeaponTitle:SetPoint("TOPLEFT", FrameWindowName, "TOPLEFT", 100, -100)
            InfopanelWeaponTitle:SetSize(130, 70)
            InfopanelWeaponTitle:SetText("")
			RoCUI_Frames_Infopanel["PlayerStats_Offensive"] = InfopanelWeaponTitle


            ---- armor icon and text
            local InfopanelArmorIcon = NewFrame:CreateTexture(nil, "OVERLAY")
            InfopanelArmorIcon:SetPoint("TOPLEFT", FrameWindowName, "TOPLEFT", 42, -170)
            InfopanelArmorIcon:SetSize(50, 50)
            InfopanelArmorIcon:SetTexture("Interface\\AddOns\\RoCUI\\images\\infopanel\\placeholder")
			RoCUI_Frames_Infopanel["Player_Armor_Icon"] = InfopanelArmorIcon

            local InfopanelArmorBorder = NewFrame:CreateTexture(nil, "OVERLAY")
            InfopanelArmorBorder:SetPoint("TOPLEFT", FrameWindowName, "TOPLEFT", 42, -170)
            InfopanelArmorBorder:SetSize(50, 50)
            InfopanelArmorBorder:SetTexture("Interface\\AddOns\\RoCUI\\images\\infopanel\\generaliconborder")

            local InfopanelArmorTitle = InfopanelTextFrame:CreateFontString(nil, "OVERLAY", "RoCUIInfopanelStatNormal")
            InfopanelArmorTitle:SetPoint("TOPLEFT", FrameWindowName, "TOPLEFT", 100, -170)
            InfopanelArmorTitle:SetSize(130, 70)
            InfopanelArmorTitle:SetText("")
			RoCUI_Frames_Infopanel["PlayerStats_Defensive"] = InfopanelArmorTitle


            ---- stat icon and text
            local InfopanelStatsIcon = NewFrame:CreateTexture(nil, "OVERLAY")
            InfopanelStatsIcon:SetPoint("TOPRIGHT", FrameWindowName, "TOPRIGHT", -142, -135)
            InfopanelStatsIcon:SetSize(50, 50)
            InfopanelStatsIcon:SetTexture("Interface\\AddOns\\RoCUI\\images\\infopanel\\placeholder")
			RoCUI_Frames_Infopanel["Player_Stats_Icon"] = InfopanelStatsIcon

            local InfopanelStatsBorder = NewFrame:CreateTexture(nil, "OVERLAY")
            InfopanelStatsBorder:SetPoint("TOPRIGHT", FrameWindowName, "TOPRIGHT", -142, -135)
            InfopanelStatsBorder:SetSize(50, 50)
            InfopanelStatsBorder:SetTexture("Interface\\AddOns\\RoCUI\\images\\infopanel\\generaliconborder")

            local InfopanelStatsTitle = InfopanelTextFrame:CreateFontString(nil, "OVERLAY", "RoCUIInfopanelStatNormal")
            InfopanelStatsTitle:SetPoint("TOPRIGHT", FrameWindowName, "TOPRIGHT", -5, -100)
            InfopanelStatsTitle:SetSize(130, 300)
            InfopanelStatsTitle:SetText("")
			RoCUI_Frames_Infopanel["PlayerStats_Other"] = InfopanelStatsTitle
            
            
            ---- set layer for each frame
			BackgroundFrame:SetFrameLevel(1)
            InfopanelExperienceBar:SetFrameLevel(9)
            InfopanelExperienceBarBorder:SetFrameLevel(10)
			InfopanelTextFrame:SetFrameLevel(15)
            InfopanelWeaponIcon:SetDrawLayer("OVERLAY", 1)
            InfopanelWeaponBorder:SetDrawLayer("OVERLAY", 2)
			InfopanelWeaponTitle:SetDrawLayer("OVERLAY", 3)
            InfopanelArmorIcon:SetDrawLayer("OVERLAY", 1)
            InfopanelArmorBorder:SetDrawLayer("OVERLAY", 2)
			InfopanelArmorTitle:SetDrawLayer("OVERLAY", 3)
            InfopanelStatsIcon:SetDrawLayer("OVERLAY", 1)
            InfopanelStatsBorder:SetDrawLayer("OVERLAY", 2)
			InfopanelStatsTitle:SetDrawLayer("OVERLAY", 3)
		end
	end
end




function RoCUI_Frames_ToggleUI()
    for _, v in pairs(RoCUI_Database_FramesDefaultSettings) do
		local FrameName = v["Name"]
		if FrameName ~= "OptionsMenu" then
            if RoCUI_PV("Load", "General_UIToggle") == true then
                RoCUI_Frames[FrameName]:Hide()
            elseif RoCUI_PV("Load", "General_UIToggle") == false then
                local CurrentLayoutName = RoCUI_LibEditMode:GetActiveLayoutName()
                local FrameVisibility = RoCUIDB_EditMode[FrameName][CurrentLayoutName]["Visibility"]
                if FrameVisibility == true then
                    RoCUI_Frames[FrameName]:Show()
                end
            end
		end
	end
	if RoCUI_PV("Load", "General_UIToggle") == true then
	    RoCUI_PV("Save", "General_UIToggle", false)
	elseif RoCUI_PV("Load", "General_UIToggle") == false then
	    RoCUI_PV("Save", "General_UIToggle", true)
	end
end