function RoCUI_CheckCurrentTimeofDay(input_mode)
    local RoCUI_CalendarTime = C_DateAndTime.GetCurrentCalendarTime()
    local RoCUI_CurrentHourNumber = RoCUI_CalendarTime.hour
    local RoCUI_CurrentHourString = tostring(RoCUI_CurrentHourNumber)
    local RoCUI_FinalString = ("Interface\\AddOns\\RoCUI\\images\\suncycle\\RoCUI_Cycle_"..RoCUI_CurrentHourString)
    RoCUI_CustomFrame_Texture_suncycle:SetTexture(RoCUI_FinalString)


    if RoCUIDB_Options["Sun_Sound"] == true then
	    if input_mode == "FirstLogin" then
	        if RoCUI_CurrentHourNumber < 6 then
		        RoCUI_NightandDayCycle = 1
		        PlaySoundFile("Interface\\AddOns\\RoCUI\\sounds\\duskwolf.ogg", "SFX")
	        elseif RoCUI_CurrentHourNumber < 18 then
		        RoCUI_NightandDayCycle = 2
		        PlaySoundFile("Interface\\AddOns\\RoCUI\\sounds\\daybreakrooster.ogg", "SFX")
		    elseif RoCUI_CurrentHourNumber >= 18 then
		        RoCUI_NightandDayCycle = 1
		        PlaySoundFile("Interface\\AddOns\\RoCUI\\sounds\\duskwolf.ogg", "SFX")
		    else
		    end
        else
	        if RoCUI_CurrentHourNumber < 6 and RoCUI_NightandDayCycle == 2 then
		        RoCUI_NightandDayCycle = 1
		        PlaySoundFile("Interface\\AddOns\\RoCUI\\sounds\\duskwolf.ogg", "SFX")
	        elseif RoCUI_CurrentHourNumber < 18 and RoCUI_NightandDayCycle == 1 then
		        RoCUI_NightandDayCycle = 2
		        PlaySoundFile("Interface\\AddOns\\RoCUI\\sounds\\daybreakrooster.ogg", "SFX")
		    elseif RoCUI_CurrentHourNumber >= 18 and RoCUI_NightandDayCycle == 2 then
		        RoCUI_NightandDayCycle = 1
		        PlaySoundFile("Interface\\AddOns\\RoCUI\\sounds\\duskwolf.ogg", "SFX")
		    else
		    end
		end
	end
end





