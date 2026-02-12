-- Minimap button setup
local RoCUI_DBIcon = LibStub("LibDBIcon-1.0")




local RoCUI_LDB = LibStub("LibDataBroker-1.1"):NewDataObject("RoCUI_Minimap", {  
	type = "data source",
	icon = "Interface\\Addons\\RoCUI\\images\\other\\RoCUI_Icon.blp",
	OnClick = function() RoCUI_OpenSettingsMenu() end,
    OnTooltipShow = function(tip)
    tip:AddLine(RoCUI_Text_Options_Compartment_Title, 1, 1, 1)
	tip:AddLine(RoCUI_Text_Options_Compartment_Description)
    tip:Show()
    end 
})  

RoCUI_DBIcon:Register("RoCUI_Minimap", RoCUI_LDB, RoCUIDB_MinimapIcon)




-- Minimap button toggle
function RoCUI_ToggleMinimapButton()
    if RoCUIDB_Options["General_MinimapButton"] == true then
	    RoCUI_DBIcon:Show("RoCUI_Minimap")
	else
	    RoCUI_DBIcon:Hide("RoCUI_Minimap")
	end
end




-- Show or hide the minimap button after login
RoCUI_Event_AddonLoaded_Minimap = CreateFrame("Frame")
RoCUI_Event_AddonLoaded_Minimap:RegisterEvent("ADDON_LOADED")
RoCUI_Event_AddonLoaded_Minimap:SetScript("OnEvent", function(self, event)
    RoCUI_ToggleMinimapButton()
    RoCUI_Event_AddonLoaded_Minimap:UnregisterEvent("ADDON_LOADED")
end)




-- Slash command
SLASH_RoCUIMINIMAP1 = "/RoCUIicon"
SLASH_RoCUIMINIMAP2 = "/reignofchaosuiicon"
SlashCmdList.RoCUIMINIMAP = function()
    if RoCUIDB_Options["General_MinimapButton"] == true then
		Settings.SetValue("RoCUI_Options_General_MinimapButton", false, true)
	else
		Settings.SetValue("RoCUI_Options_General_MinimapButton", true, true)
	end
	RoCUI_ToggleMinimapButton()
end