SLASH_ROCUI1 = "/RoCUI"
SLASH_ROCUI2 = "/reignofchaosui"
SlashCmdList.ROCUI = function()
    RoCUI_General_ToggleOptionsMenu()
end




SLASH_ROCUIVISIBILITY1 = "/RoCUIToggle"
SlashCmdList.ROCUIVISIBILITY = function()
    RoCUI_Frames_ToggleUI()
end




-- Warcraft III easter egg
RoCUI_EasterEggSoundisPlaying = false
RoCUI_EasterEggSoundHandle = ""
SLASH_WC3CHEAT1 = "/TenthLevelTaurenChieftain"
SlashCmdList.WC3CHEAT = function()
    if RoCUI_EasterEggSoundisPlaying == false then
        willPlay, RoCUI_EasterEggSoundHandle = PlaySoundFile(53438, "Talking Head")
	    RoCUI_EasterEggSoundisPlaying = true
	else
	    StopSound(RoCUI_EasterEggSoundHandle, 2500)
	    RoCUI_EasterEggSoundisPlaying = false
	end
end