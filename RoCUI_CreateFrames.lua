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




-- create additional frames that each have their own unique function (but do not change their texture depending on the faction skin choice).


---- day and night cycle
function RoCUI_CreateCustomFrame_DayandNightCycle()
    RoCUI_CustomFrame_Texture_suncycle = RoCUI_CustomFrame_Base_sun:CreateTexture()
    RoCUI_CustomFrame_Texture_suncycle:SetPoint("TOP", RoCUI_FrameWindowName_sun, "TOP", 0, 0)

    RoCUI_CustomFrame_Texture_sunclock = RoCUI_CustomFrame_Base_sun:CreateTexture()
    RoCUI_CustomFrame_Texture_sunclock:SetPoint("TOP", RoCUI_FrameWindowName_sun, "TOP", 0, 0)
	
    RoCUI_CustomFrame_Texture_sunclock:SetDrawLayer("BACKGROUND", 3)
    RoCUI_CustomFrame_Texture_sun:SetDrawLayer("BACKGROUND", 2)
    RoCUI_CustomFrame_Texture_suncycle:SetDrawLayer("BACKGROUND", 1)
end

---- portrait
function RoCUI_CreateCustomFrame_PortraitPlayer()
    RoCUI_CustomFrame_Texture_portraitplayerrender = RoCUI_CustomFrame_Base_portraitplayer:CreateTexture("RoCUI_Portrait_Player")
    RoCUI_CustomFrame_Texture_portraitplayerrender:SetTexture("Interface\\AddOns\\RoCUI\\images\\portrait\\background")
    RoCUI_CustomFrame_Texture_portraitplayerrender:SetSize(200, 200)
    RoCUI_CustomFrame_Texture_portraitplayerrender:SetPoint("BOTTOM", RoCUI_FrameWindowName_portraitplayer, "BOTTOM", 0, 30)

    RoCUI_CustomFrame_Texture_portraitplayermask = RoCUI_CustomFrame_Base_portraitplayer:CreateMaskTexture()
    RoCUI_CustomFrame_Texture_portraitplayermask:SetTexture("Interface\\AddOns\\RoCUI\\images\\portrait\\mask", "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
    RoCUI_CustomFrame_Texture_portraitplayermask:SetPoint("BOTTOM", RoCUI_FrameWindowName_portraitplayer, "BOTTOM", 0, 0)
    RoCUI_CustomFrame_Texture_portraitplayermask:SetSize(256, 512)
    RoCUI_CustomFrame_Texture_portraitplayerrender:AddMaskTexture(RoCUI_CustomFrame_Texture_portraitplayermask)

    RoCUI_CustomFrame_Texture_portraitplayer:SetDrawLayer("BACKGROUND", 2)
    RoCUI_CustomFrame_Texture_portraitplayerrender:SetDrawLayer("BACKGROUND", 1)

	RoCUI_CustomFrame_Portrait_Health = RoCUI_CustomFrame_Base_portraitplayer:CreateFontString(nil, "OVERLAY", "RoCUIHealthFont")
    RoCUI_CustomFrame_Portrait_Health:SetPoint("BOTTOM", RoCUI_FrameWindowName_portraitplayer, "BOTTOM", 0, 34)
    RoCUI_CustomFrame_Portrait_Health:SetSize(134, 20)
    RoCUI_CustomFrame_Portrait_Health:SetText("")

    RoCUI_CustomFrame_Portrait_Mana = RoCUI_CustomFrame_Base_portraitplayer:CreateFontString(nil, "OVERLAY", "RoCUIManaFont")
    RoCUI_CustomFrame_Portrait_Mana:SetPoint("BOTTOM", RoCUI_FrameWindowName_portraitplayer, "BOTTOM", 0, 5)
    RoCUI_CustomFrame_Portrait_Mana:SetSize(134, 20)
    RoCUI_CustomFrame_Portrait_Mana:SetText("")
end

---- top row - menu buttons
function RoCUI_CreateCustomFrame_MenuButton()
	for i=1, 8 do
        local RoCUI_Temp_FrameWindowName = ("RoCUI_FrameWindowName_top"..tostring(i))
	    local RoCUI_Temp_ButtonName = ("RoCUI_CustomFrame_Base_menubutton"..tostring(i))
        local RoCUI_Temp_FrameType = ("menubutton"..tostring(i))
		local RoCUI_Temp_FrameType_Top = ("top"..tostring(i))

        _G[RoCUI_Temp_ButtonName] = CreateFrame("Button", nil, _G[RoCUI_Temp_FrameWindowName], "RoCUIButtonTemplate")
        _G[RoCUI_Temp_ButtonName]:SetPoint("TOP", _G[RoCUI_Temp_FrameWindowName], "TOP", 0, -2)
        _G[RoCUI_Temp_ButtonName]:SetSize(154, 36)
        _G[RoCUI_Temp_ButtonName]:SetText("")

        RoCUI_Update_FactionSkin(RoCUI_Temp_FrameType, "button")

	    _G[RoCUI_Temp_ButtonName]:SetScript("OnClick", function(self, button)
            if not PlayerIsInCombat() then
                RoCUI_ButtonReaction(RoCUI_Temp_FrameType_Top)
	        else
	            RoCUI_SendChatMessage(RoCUI_Text_CombatWarning)
	        end
        end)
	end
end




function RoCUI_CreateCustomFrame_InfoPlayer()
   --- WIP
end




-- create all frames on start up
function RoCUI_CreateCustomFramesAfterAddonLoad()
    print("all loaded")
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

	for i, v in ipairs(RoCUI_Table_SoundOverrides) do
    local RoCUI_Temp_VariableName = ("RoCUI_Options_SoundOverride_"..v)
	local RoCUI_Temp_OptionsValue = RoCUIDB_Options["SoundOverride_"..v]
    RoCUI_SoundReplacements(RoCUI_Temp_VariableName, RoCUI_Temp_OptionsValue)
    end
end