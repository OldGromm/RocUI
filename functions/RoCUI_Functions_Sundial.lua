function RoCUI_Sundial_CheckCurrentTimeofDay(input_mode)
	local ServerSeconds = C_DateAndTime.GetSecondsUntilDailyReset()
    local DayNightCycleCounter_Number = 1
    local DayNightCycleCounter_String = "" 
    local SoundFilepath = ""
	local TimeOfDay = ""
	local ClockNumber_String = ""
    local TextureFilepath = ""


    -- detect current day/night phase (divided into 16 hours, 8 for day and night each).

    ---- check current seconds left until weekly reset.
    ---- we're starting at nighttime_6 since the weekly reset happens at 5 o'clock (which is almost the end of nighttime).
	---- daytime starts at 8 o'clock.
	for i, v in ipairs(RoCUI_Sundial_SecondsUntilDailyReset) do
    	if ServerSeconds < v then
    	    DayNightCycleCounter_Number = DayNightCycleCounter_Number + 1
    	end
    end


    ---- show either sun or moon icon
    if DayNightCycleCounter_Number < 3 then
        RoCUI_Frames["Suncycle"]:SetTexture("Interface\\AddOns\\RoCUI\\images\\sun\\nighttime")
		SoundFilepath = "Interface\\AddOns\\RoCUI\\sounds\\daynightcycle\\duskwolf.ogg"
		TimeOfDay = "night"
    elseif DayNightCycleCounter_Number < 11 then
        RoCUI_Frames["Suncycle"]:SetTexture("Interface\\AddOns\\RoCUI\\images\\sun\\daytime")
		SoundFilepath = "Interface\\AddOns\\RoCUI\\sounds\\daynightcycle\\daybreakrooster.ogg"
		TimeOfDay = "day"
    else
        RoCUI_Frames["Suncycle"]:SetTexture("Interface\\AddOns\\RoCUI\\images\\sun\\nighttime")
		SoundFilepath = "Interface\\AddOns\\RoCUI\\sounds\\daynightcycle\\duskwolf.ogg"
		TimeOfDay = "night"
    end


    ---- show clock dots
	if DayNightCycleCounter_Number > 8 then
	    DayNightCycleCounter_Number = DayNightCycleCounter_Number - 8
	end
    ClockNumber_String = tostring(DayNightCycleCounter_Number)
    TextureFilepath = ("Interface\\AddOns\\RoCUI\\images\\sunclock\\clock_"..TimeOfDay.."time_"..ClockNumber_String)	
    RoCUI_Frames["Sunclock"]:SetTexture(TextureFilepath)


    ---- play sound
    if RoCUI_PV("Load", "Sounds_DayAndNightCycle") == true then
	    if input_mode == "FirstLogin" then
		    PlaySoundFile(SoundFilepath, "SFX")
		else
		    if RoCUIDB_DayNightCycle == TimeOfDay then
			else
			    PlaySoundFile(SoundFilepath, "SFX")
			end
		end
		RoCUIDB_DayNightCycle = TimeOfDay
    end

end