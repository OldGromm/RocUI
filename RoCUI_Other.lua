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
    icon = "Interface\\Addons\\RoCUI\\images\\other\\RoCUI_icon.blp",
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
SLASH_RoCUI1 = "/RoCUI"
SLASH_RoCUI2 = "/reignofchaosui"
SlashCmdList.RoCUI = function()
    RoCUI_OpenSettingsMenu()
end