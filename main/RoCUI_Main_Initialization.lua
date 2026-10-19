RoCUI_Event_Setup_PlayerLogin = CreateFrame("Frame")
RoCUI_Event_Setup_PlayerLogin:RegisterEvent("PLAYER_LOGIN")
RoCUI_Event_Setup_PlayerLogin:SetScript("OnEvent", function(_, event)
	    if RoCUI_SetupComplete == false then
            RoCUI_Options_Timeout = true


            -- pre-options menu setup
			RoCUI_Setup_PlayerStats()
			RoCUI_Setup_CheckProfileData()
			RoCUI_Setup_DetermineDefaultFactionSkin()
			RoCUI_Setup_DetectGameVersion()
			RoCUI_Setup_GameVersionAdjustments()
			RoCUI_Setup_DetermineDefaultLanguage()
			RoCUI_Language_Update()


            -- create frames
            RoCUI_Frames_CreateBaseline()
			RoCUI_Frames_CreateOptionsMenu()
            RoCUI_Frames_CreateLockdownMessage()
            RoCUI_EditMode_RegisterFramesForEditMode()



            -- setup custom sound overrides
			RoCUI_Sounds_SetupCustomSounds()

            -- create minimap button
            RoCUI_Other_CreateMinimapButton()
            RoCUI_General_ToggleMinimapButton()


            -- create compartment button
	        if RoCUI_WoWVersion == "Retail" or RoCUI_WoWVersion == "Forever" then
                RoCUI_Other_CreateCompartmentButton()
	        end


            RoCUI_Profiles_UpdateUI("Initialization")


			RunNextFrame(function()
			    RoCUI_SetupComplete = true
				RoCUI_Options_Timeout = false
			end)
		end

end)