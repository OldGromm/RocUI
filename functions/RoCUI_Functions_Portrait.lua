function RoCUI_Portrait_TextureUpdate()
    local TextureFrame = RoCUI_Frames_Portrait["Texture"]
    SetPortraitTexture(TextureFrame, "player")
end




function RoCUI_Portrait_UpdateTextSize()
    local HealthSize = RoCUI_PV("Load", "Portrait_HealthSize")
	local PowerSize = RoCUI_PV("Load", "Portrait_PowerSize")
    RoCUI_Frames_Portrait["Health"]:SetTextScale(HealthSize)
    RoCUI_Frames_Portrait["Power"]:SetTextScale(PowerSize)
end




function RoCUI_Portrait_ShortenNumber(input_number)
    local NewNumber = input_number
	local Textstring = ""
	if input_number > 1000000 then
	    NewNumber = (input_number / 100)
	elseif input_number > 100000 then
	    NewNumber = (input_number / 10)
	else
	end
	Textstring = string.format("%.0f", NewNumber)
    return Textstring
end




function RoCUI_Portrait_UpdatePlayerStats_Health()
        local PlayerHealth_Current = UnitHealth("player")
        local PlayerHealth_Maximum = UnitHealthMax("player")
	    local PlayerHealth_Percent = UnitHealthPercent("player", nil, CurveConstants.ScaleTo100)
        local PlayerHealth_Current_Final = AbbreviateNumbers(PlayerHealth_Current, RoCUI_Database_AbbreviationData_Portrait)
        local PlayerHealth_Maximum_Final = AbbreviateNumbers(PlayerHealth_Maximum, RoCUI_Database_AbbreviationData_Portrait)

		if RoCUI_PV("Load", "Portrait_HealthAbbreviate") == false then
            PlayerHealth_Current_Final = string.format("%.0f", PlayerHealth_Current)
            PlayerHealth_Maximum_Final = string.format("%.0f", PlayerHealth_Maximum)
        end


	    if RoCUI_PV("Load", "Portrait_HealthDisplayType") == 1 then
            RoCUI_Frames_Portrait["Health"]:SetText(PlayerHealth_Current_Final.." / "..PlayerHealth_Maximum_Final)
	    elseif RoCUI_PV("Load", "Portrait_HealthDisplayType") == 2 then
            RoCUI_Frames_Portrait["Health"]:SetText(PlayerHealth_Current_Final)
	    elseif RoCUI_PV("Load", "Portrait_HealthDisplayType") == 3 then
		    RoCUI_Frames_Portrait["Health"]:SetFormattedText("%.0f%%", PlayerHealth_Percent)
	    else
	        RoCUI_Frames_Portrait["Health"]:SetText(PlayerHealth_Current_Final.." / "..PlayerHealth_Maximum_Final)
	    end

end




---- power value
function RoCUI_Portrait_UpdatePlayerStats_Power()
        local PlayerPower_Current = 0
        local PlayerPower_Maximum = 0
        local PlayerPower_Current_Final = ""
        local PlayerPower_Maximum_Final = ""
        local PlayerPower_Percent = 0
		local HigherPrecision = false

        local UserPowerType = RoCUI_PV("Load", "Portrait_PowerType")
		local UserPowerTypeNumber = 0

		if UserPowerType == "SoulShards" or UserPowerType == "BurningEmbers" then
		    HigherPrecision = true
		end

		if UserPowerType == "Default" then
		    UserPowerTypeNumber = nil
		else
		    for i, v in pairs(RoCUI_Database_PowerTypes) do
                if UserPowerType == v["Type"] then
                    UserPowerTypeNumber = v["ID"]
				end
			end
		end

        PlayerPower_Current = UnitPower("player", UserPowerTypeNumber, HigherPrecision)
        PlayerPower_Maximum = UnitPowerMax("player", UserPowerTypeNumber, HigherPrecision)
		PlayerPower_Percent = UnitPowerPercent("player", UserPowerTypeNumber, false, CurveConstants.ScaleTo100)


        if RoCUI_PV("Load", "Portrait_PowerAbbreviate") == true then
            PlayerPower_Current_Final = AbbreviateNumbers(PlayerPower_Current, RoCUI_Database_AbbreviationData_Portrait)
            PlayerPower_Maximum_Final = AbbreviateNumbers(PlayerPower_Maximum, RoCUI_Database_AbbreviationData_Portrait)
        else
            PlayerPower_Current_Final = string.format("%.0f", PlayerPower_Current)
            PlayerPower_Maximum_Final = string.format("%.0f", PlayerPower_Maximum)
        end



	    if RoCUI_PV("Load", "Portrait_PowerDisplayType") == 1 then
            RoCUI_Frames_Portrait["Power"]:SetText(PlayerPower_Current_Final.." / "..PlayerPower_Maximum_Final)
	    elseif RoCUI_PV("Load", "Portrait_PowerDisplayType") == 2 then
            RoCUI_Frames_Portrait["Power"]:SetText(PlayerPower_Current_Final)
	    elseif RoCUI_PV("Load", "Portrait_PowerDisplayType") == 3 then
	    	RoCUI_Frames_Portrait["Power"]:SetFormattedText("%.0f%%", PlayerPower_Percent)
	    else
	        RoCUI_Frames_Portrait["Power"]:SetText(PlayerPower_Current_Final.." / "..PlayerPower_Maximum_Final)
	    end

end


function RoCUI_Portrait_PowerTypeCheck(input_powertype)
    local Proceed = false
	if input_powertype == 50 then
        Proceed = true
	elseif UnitHasPowerType("player", input_powertype) == true then
        Proceed = true
	end
	return Proceed
end