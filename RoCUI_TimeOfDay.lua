function RoCUI_CheckCurrentTimeofDay(input_mode)
	local RoCUI_Seconds = C_DateAndTime.GetSecondsUntilDailyReset()
    local RoCUI_Counter_DayNightCycleCounter = 1
    local RoCUI_String_DayNightCycleCounter = ""
    local RoCUI_String_DayNightCycleCounter_Final = ""  
    local RoCUI_String_DayNightSound = ""
	local RoCUI_DayNightCycle_CurrentHour = ""
	local RoCUI_String_Clock_Number = ""
    local RoCUI_String_Clock_Final = ""


    -- detect current day/night phase (divided into 16 hours, 8 for day and night each).

    ---- check current seconds left until weekly reset.
    ---- we're starting at nighttime_6 since the weekly reset happens at 5 o'clock (which is almost the end of nighttime).
	---- daytime starts at 8 o'clock
	for i, v in ipairs(RoCUI_Table_SecondsUntilReset) do
    	if RoCUI_Seconds < v then
    	    RoCUI_Counter_DayNightCycleCounter = RoCUI_Counter_DayNightCycleCounter + 1
    	end
    end


    ---- show either sun or moon icon
    if RoCUI_Counter_DayNightCycleCounter < 3 then
        RoCUI_CustomFrame_Texture_suncycle:SetTexture("Interface\\AddOns\\RoCUI\\images\\sun\\nighttime")
		RoCUI_String_DayNightSound = "Interface\\AddOns\\RoCUI\\sounds\\daynightcycle\\duskwolf.ogg"
		RoCUI_DayNightCycle_CurrentHour = "night"
    elseif RoCUI_Counter_DayNightCycleCounter < 11 then
        RoCUI_CustomFrame_Texture_suncycle:SetTexture("Interface\\AddOns\\RoCUI\\images\\sun\\daytime")
		RoCUI_String_DayNightSound = "Interface\\AddOns\\RoCUI\\sounds\\daynightcycle\\daybreakrooster.ogg"
		RoCUI_DayNightCycle_CurrentHour = "day"
    else
        RoCUI_CustomFrame_Texture_suncycle:SetTexture("Interface\\AddOns\\RoCUI\\images\\sun\\nighttime")
		RoCUI_String_DayNightSound = "Interface\\AddOns\\RoCUI\\sounds\\daynightcycle\\duskwolf.ogg"
		RoCUI_DayNightCycle_CurrentHour = "night"
    end


    ---- show clock dots
	if RoCUI_Counter_DayNightCycleCounter > 8 then
	    RoCUI_Counter_DayNightCycleCounter = RoCUI_Counter_DayNightCycleCounter - 8
	end
    RoCUI_String_Clock_Number = tostring(RoCUI_Counter_DayNightCycleCounter)
    RoCUI_String_Clock_Final = ("Interface\\AddOns\\RoCUI\\images\\sunclock\\clock_"..RoCUI_DayNightCycle_CurrentHour.."time_"..RoCUI_String_Clock_Number)	
    RoCUI_CustomFrame_Texture_sunclock:SetTexture(RoCUI_String_Clock_Final)


    ---- play sound
    if RoCUIDB_Options["Sun_Sound"] == true then
	    if input_mode == "FirstLogin" then
		    PlaySoundFile(RoCUI_String_DayNightSound, "SFX")
		else
		    if RoCUIDB_DayNightCycle == RoCUI_DayNightCycle_CurrentHour then
			else
			    PlaySoundFile(RoCUI_String_DayNightSound, "SFX")
			end
		end
		RoCUIDB_DayNightCycle = RoCUI_DayNightCycle_CurrentHour
    end

end




RoCUI_Event_UpdateSundial = CreateFrame("Frame")
RoCUI_Event_UpdateSundial:RegisterEvent("PLAYER_ENTERING_WORLD")
RoCUI_Event_UpdateSundial:SetScript("OnEvent", function(_, event, isInitialLogin, isReloadingUi)
    if isInitialLogin == true then
        RoCUI_CheckCurrentTimeofDay("FirstLogin")
    elseif isReloadingUi == true then
        RoCUI_CheckCurrentTimeofDay("UIReload")
    else
    end
end)