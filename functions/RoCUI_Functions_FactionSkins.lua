function RoCUI_FactionSkins_Update()
    local NewBackdrop = RoCUI_Backdrop_Update()
    local ButtonTexture_Normal = RoCUI_General_FetchTextureFilepath_Button("normal")
    local ButtonTexture_Highlight = RoCUI_General_FetchTextureFilepath_Button("highlight")
    local ButtonTexture_Pushed = RoCUI_General_FetchTextureFilepath_Button("pushed")
    local ButtonTexture_Disabled = RoCUI_General_FetchTextureFilepath_Button("disabled")


    for _, v in pairs(RoCUI_Database_FramesDefaultSettings) do
        local FrameName = v["Name"]
        local TextureFilepath = ""

        if v["Name"] == "Sundial" then
            TextureFilepath = RoCUI_General_FetchTextureFilepath("sun")
            RoCUI_Frames_Backgrounds[FrameName]:SetTexture(TextureFilepath)
        elseif v["ButtonID"] ~= nil then
            TextureFilepath = RoCUI_General_FetchTextureFilepath("top")
            RoCUI_Frames_Backgrounds[FrameName]:SetTexture(TextureFilepath)
            RoCUI_Frames_Buttons[FrameName]:SetNormalTexture(ButtonTexture_Normal)
            RoCUI_Frames_Buttons[FrameName]:SetHighlightTexture(ButtonTexture_Highlight)
            RoCUI_Frames_Buttons[FrameName]:SetPushedTexture(ButtonTexture_Pushed)
            RoCUI_Frames_Buttons[FrameName]:SetDisabledTexture(ButtonTexture_Disabled)
        elseif v["Name"] == "Portrait" then
            TextureFilepath = RoCUI_General_FetchTextureFilepath("portrait")
            RoCUI_Frames_Backgrounds[FrameName]:SetTexture(TextureFilepath)
        else
            RoCUI_Frames_Backgrounds[FrameName]:SetBackdrop(NewBackdrop)
        end

    end


    -- options menu buttons
	for _, v in pairs(RoCUI_Factions_ButtonList) do
        RoCUI_Frames_Buttons[v]:SetNormalTexture(ButtonTexture_Normal)
        RoCUI_Frames_Buttons[v]:SetHighlightTexture(ButtonTexture_Highlight)
        RoCUI_Frames_Buttons[v]:SetPushedTexture(ButtonTexture_Pushed)
        RoCUI_Frames_Buttons[v]:SetDisabledTexture(ButtonTexture_Disabled)
	end
	

    -- slider pin
	local TextureFilepathSlider = RoCUI_General_FetchTextureFilepath("optionsmenu_sliderpin")
	for _, v in ipairs(RoCUI_Frames_SlidersList) do
        RoCUI_Frames_OptionsEntry[v]:SetThumbTexture(TextureFilepathSlider)
	end

end