-- portrait frame


---- character image
function RoCUI_PortraitUpdate()
    SetPortraitTexture(RoCUI_CustomFrame_Texture_portraitplayerrender, "player")
end


---- shorten number
function RoCUI_ShortenNumber_Portrait(input_number)
    local RoCUI_Temp_NewNumber = input_number
	local RoCUI_Temp_NewString = ""
	if input_number > 1000000 then
	    RoCUI_Temp_NewNumber = (input_number / 100)
	elseif input_number > 100000 then
	    RoCUI_Temp_NewNumber = (input_number / 10)
	else
	end
	RoCUI_Temp_NewString = string.format("%.0f", RoCUI_Temp_NewNumber)
    return RoCUI_Temp_NewString
end




---- health value
function RoCUI_UpdatePlayerStats_Health()
        local RoCUI_Temp_PlayerHealth_Current = UnitHealth("player")
        local RoCUI_Temp_PlayerHealth_Maximum = UnitHealthMax("player")
        local RoCUI_PlayerHealth_Current_Final = ""
        local RoCUI_PlayerHealth_Maximum_Final = ""
	    local RoCUI_Temp_PlayerHealth_Percent = 0


		if RoCUIDB_Options["Portrait_TextFormatting_Health"] == 3 then
			if RoCUI_GameVersion == 3 then
                RoCUI_Temp_PlayerHealth_Percent = UnitHealthPercent("player", nil, CurveConstants.ScaleTo100)
	        else
	            RoCUI_Temp_PlayerHealth_Percent = ((RoCUI_Temp_PlayerHealth_Current/RoCUI_Temp_PlayerHealth_Maximum)*100)
	        end
		else
		    if RoCUIDB_Options["Portrait_TextFormatting_Health_Abbreviate"] == true then
		        if RoCUI_GameVersion == 3 then
                    RoCUI_PlayerHealth_Current_Final = AbbreviateNumbers(RoCUI_Temp_PlayerHealth_Current, RoCUI_CustomAbbreviationData_Portrait)
			        RoCUI_PlayerHealth_Maximum_Final = AbbreviateNumbers(RoCUI_Temp_PlayerHealth_Maximum, RoCUI_CustomAbbreviationData_Portrait)
			    else
                    RoCUI_PlayerHealth_Current_Final = RoCUI_ShortenNumber_Portrait(RoCUI_Temp_PlayerHealth_Current)
                    RoCUI_PlayerHealth_Maximum_Final = RoCUI_ShortenNumber_Portrait(RoCUI_Temp_PlayerHealth_Maximum)
			    end
			else
			    RoCUI_PlayerHealth_Current_Final = string.format("%.0f", RoCUI_Temp_PlayerHealth_Current)
                RoCUI_PlayerHealth_Maximum_Final = string.format("%.0f", RoCUI_Temp_PlayerHealth_Maximum)
		    end
        end


	    if RoCUIDB_Options["Portrait_TextFormatting_Health"] == 1 then
            RoCUI_CustomFrame_Portrait_Health:SetText(RoCUI_PlayerHealth_Current_Final.." / "..RoCUI_PlayerHealth_Maximum_Final)
	    elseif RoCUIDB_Options["Portrait_TextFormatting_Health"] == 2 then
            RoCUI_CustomFrame_Portrait_Health:SetText(RoCUI_PlayerHealth_Current_Final)
	    elseif RoCUIDB_Options["Portrait_TextFormatting_Health"] == 3 then
		    RoCUI_CustomFrame_Portrait_Health:SetFormattedText("%.0f%%", RoCUI_Temp_PlayerHealth_Percent)
	    else
	        RoCUI_CustomFrame_Portrait_Health:SetText(RoCUI_PlayerHealth_Current_Final.." / "..RoCUI_PlayerHealth_Maximum_Final)
	    end
end




---- power value
function RoCUI_UpdatePlayerStats_Power()
        local RoCUI_Temp_PlayerPower_Current = 0
        local RoCUI_Temp_PlayerPower_Maximum = 0
        local RoCUI_PlayerPower_Current_Final = ""
        local RoCUI_PlayerPower_Maximum_Final = ""
        local RoCUI_Temp_PlayerPower_Percent = 0
		local RoCUI_PowerType = 0
		local RoCUI_HigherPrecision = false


		if RoCUIDB_Options["Portrait_PowerDisplayType"] == 7 or 14 then
		    RoCUI_HigherPrecision = true
		end
		
		if RoCUIDB_Options["Portrait_PowerDisplayType"] == 50 then
		    RoCUI_PowerType = nil
		else
		    RoCUI_PowerType = RoCUIDB_Options["Portrait_PowerDisplayType"]
		end

        RoCUI_Temp_PlayerPower_Current = UnitPower("player", RoCUI_PowerType, RoCUI_HigherPrecision)
        RoCUI_Temp_PlayerPower_Maximum = UnitPowerMax("player", RoCUI_PowerType, RoCUI_HigherPrecision)


		if RoCUIDB_Options["Portrait_TextFormatting_Power"] == 3 then
			if RoCUI_GameVersion == 3 then
                RoCUI_Temp_PlayerPower_Percent = UnitPowerPercent("player", RoCUI_PowerType, false, CurveConstants.ScaleTo100)
	        else
	            RoCUI_Temp_PlayerPower_Percent = ((RoCUI_Temp_PlayerPower_Current/RoCUI_Temp_PlayerPower_Maximum)*100)
	        end
		else
		    if RoCUIDB_Options["Portrait_TextFormatting_Power_Abbreviate"] == true then
		        if RoCUI_GameVersion == 3 then
                    RoCUI_PlayerPower_Current_Final = AbbreviateNumbers(RoCUI_Temp_PlayerPower_Current, RoCUI_CustomAbbreviationData_Portrait)
			        RoCUI_PlayerPower_Maximum_Final = AbbreviateNumbers(RoCUI_Temp_PlayerPower_Maximum, RoCUI_CustomAbbreviationData_Portrait)
			    else
                    RoCUI_PlayerPower_Current_Final = RoCUI_ShortenNumber_Portrait(RoCUI_Temp_PlayerPower_Current)
                    RoCUI_PlayerPower_Maximum_Final = RoCUI_ShortenNumber_Portrait(RoCUI_Temp_PlayerPower_Maximum)
			    end
			else
			    RoCUI_PlayerPower_Current_Final = string.format("%.0f", RoCUI_Temp_PlayerPower_Current)
                RoCUI_PlayerPower_Maximum_Final = string.format("%.0f", RoCUI_Temp_PlayerPower_Maximum)
		    end
        end


	    if RoCUIDB_Options["Portrait_TextFormatting_Power"] == 1 then
            RoCUI_CustomFrame_Portrait_Power:SetText(RoCUI_PlayerPower_Current_Final.." / "..RoCUI_PlayerPower_Maximum_Final)
	    elseif RoCUIDB_Options["Portrait_TextFormatting_Power"] == 2 then
            RoCUI_CustomFrame_Portrait_Power:SetText(RoCUI_PlayerPower_Current_Final)
	    elseif RoCUIDB_Options["Portrait_TextFormatting_Power"] == 3 then
	    	RoCUI_CustomFrame_Portrait_Power:SetFormattedText("%.0f%%", RoCUI_Temp_PlayerPower_Percent)
	    else
	        RoCUI_CustomFrame_Portrait_Power:SetText(RoCUI_PlayerPower_Current_Final.." / "..RoCUI_PlayerPower_Maximum_Final)
	    end
end




---- text scale
function RoCUI_UpdatePortraitTextSize()
RoCUI_CustomFrame_Portrait_Health:SetTextScale(RoCUIDB_Options["Portrait_TextSize_Health"])
RoCUI_CustomFrame_Portrait_Power:SetTextScale(RoCUIDB_Options["Portrait_TextSize_Power"])
end