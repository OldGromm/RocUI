-- create link for opening the options menu
RoCUI_SettingsLink = RoCUI_Options_Category_Main:GetID()

function RoCUI_OpenSettingsMenu()
    if not PlayerIsInCombat() then
        Settings.OpenToCategory(RoCUI_SettingsLink)
	else
	    RoCUI_SendChatMessage(RoCUI_Text_CombatWarning)
	end
end




-- Compartment
AddonCompartmentFrame:RegisterAddon({
    text = RoCUI_Text_Options_Compartment_Title,
    icon = "Interface\\Addons\\RoCUI\\images\\other\\RoCUI_Icon.blp",
    notCheckable = true,
    func = function(button, menuInputData, menu)
    local buttonName = menuInputData.buttonName;
        RoCUI_OpenSettingsMenu()
    end,
    funcOnEnter = function(button)
        MenuUtil.ShowTooltip(button, function(tooltip)
            tooltip:SetText(RoCUI_Text_Options_Compartment_Description)
        end)
    end,
    funcOnLeave = function(button)
        MenuUtil.HideTooltip(button)
    end,
})




-- Slash command
SLASH_ROCUI1 = "/RoCUI"
SLASH_ROCUI2 = "/reignofchaosui"
SlashCmdList.ROCUI = function()
    RoCUI_OpenSettingsMenu()
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