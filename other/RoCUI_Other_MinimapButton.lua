function RoCUI_Other_CreateMinimapButton()
    local RoCUI_LDB = LibStub("LibDataBroker-1.1"):NewDataObject("RoCUI_Minimap", {  
    	type = "data source",
    	icon = "Interface\\Addons\\RoCUI\\images\\other\\RoCUI_Icon.blp",
    	OnClick = function(clickedframe, button)
            if button == "LeftButton" then
                RoCUI_Frames_ToggleUI()
            elseif button == "MiddleButton" then
			    
			elseif button == "RightButton" then
			    RoCUI_General_ToggleOptionsMenu()
            else
            end
        end,
        OnTooltipShow = function(tip)
        tip:AddLine(RoCUI_Text_Options_Category_Title, 1, 1, 1)
        tip:AddLine(RoCUI_Text_Compartment_UIVisibility.."\n\n"..RoCUI_Text_Compartment_MenuOptions)
		tip:Show()
        end 
    })

    RoCUI_LibDBIcon:Register("RoCUI_Minimap", RoCUI_LDB, RoCUIDB_MinimapButton)
end