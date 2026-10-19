function RoCUI_Other_CreateCompartmentButton()
    if RoCUI_PV("Load", "General_Compartment") == true then
        AddonCompartmentFrame:RegisterAddon({
            text = RoCUI_Text_Options_Category_Title,
            icon = "Interface\\Addons\\RoCUI\\images\\other\\RoCUI_Icon.blp",
            notCheckable = true,
            func = function(button, menuInputData, menu)
                local MouseButtonType = menuInputData.buttonName
				if MouseButtonType == "LeftButton" then
                    RoCUI_General_ToggleOptionsMenu()
                elseif MouseButtonType == "MiddleButton" then
			        
				elseif MouseButtonType == "RightButton" then
				    RoCUI_Frames_ToggleUI()
                else
                end
            end,
            funcOnEnter = function(button)
                MenuUtil.ShowTooltip(button, function(tooltip)
                    tooltip:SetText(RoCUI_Text_Compartment_UIVisibility.."\n\n"..RoCUI_Text_Compartment_MenuOptions)

                end)
            end,
            funcOnLeave = function(button)
                MenuUtil.HideTooltip(button)
            end,
        })
   	end
end