function RoCUI_CombatLockdown_CheckIfPlayerHasChanged()
    if RoCUIDB_Cache["Name"] == RoCUI_PlayerStats_PlayerID then
        
    else
        RoCUIDB_Cache["CombatLockdown"] = {}
    end
end




function RoCUI_CombatLockdown_SendMessage(input_type)
    local Message = ""
    local Trigger = _G["RoCUI_Text_CombatLockdown_Trigger_"..input_type]
	local Reason = ""
    local ChatLockdownIsActive = C_ChatInfo.InChatMessagingLockdown()
	local LockdownIndex = -1
	local Proceed = false


    RoCUI_CombatLockdown_CheckIfPlayerHasChanged()

    ---- determine error type (also check for how often the current error type has been triggered)
    for i, v in ipairs(RoCUI_CombatLockdown_MessageType) do
	    LockdownIndex = LockdownIndex + 1
		if C_RestrictedActions.IsAddOnRestrictionActive(LockdownIndex) == true then
		    Reason = _G["RoCUI_Text_CombatLockdown_Reason_"..v]

			if RoCUIDB_Cache["CombatLockdown"][v] == nil then
			    RoCUIDB_Cache["CombatLockdown"][v] = 0
				Proceed = true
			else
			    RoCUIDB_Cache["CombatLockdown"][v] = RoCUIDB_Cache["CombatLockdown"][v] + 1
			end

		end
	end


    ---- prepare text message
    if Reason == "" then
	    Reason = _G["RoCUI_Text_CombatLockdown_Reason_"..input_type]
	end

    Message = (Trigger.."\n"..RoCUI_Text_CombatLockdown_Reason..": "..Reason)




    ---- never show the message, or only once, or all the time (depending on the player setting)
	if RoCUI_PV("Load", "Other_CombatLockdown") == "Never" then
        Proceed = false
	elseif RoCUI_PV("Load", "Other_CombatLockdown") == "Once" then
	
	elseif RoCUI_PV("Load", "Other_CombatLockdown") == "Always" then
	    Proceed = true
	else
	end


    ---- run the actual message
    if Proceed == false then
	
	else

	    RoCUI_General_PlaySoundFile(567415, false)

        if RoCUI_CombatLockdown_Message_Cooldown == false then
	        RoCUI_CombatLockdown_Message_Cooldown = true

            if ChatLockdownIsActive == false then
                RoCUI_General_SendChatMessage(Message)
            elseif ChatLockdownIsActive == true then
                if RoCUI_CombatLockdown_Message_Count == 0 then
                    RoCUI_CombatLockdown_Message_Count = RoCUI_CombatLockdown_Message_Count + 1
                    RoCUI_Frames_CombatLockdown["Message_1"]:SetText(Message)
                    C_Timer.After(7.0, function()
                        RoCUI_Frames_CombatLockdown["Message_1"]:SetText("")
                        RoCUI_CombatLockdown_Message_Count = RoCUI_CombatLockdown_Message_Count - 1
                    end)
                elseif RoCUI_CombatLockdown_Message_Count == 1 then
                    RoCUI_CombatLockdown_Message_Count = RoCUI_CombatLockdown_Message_Count + 1
                    RoCUI_Frames_CombatLockdown["Message_2"]:SetText(Message)
                    C_Timer.After(7.0, function()
                        RoCUI_Frames_CombatLockdown["Message_2"]:SetText("")
                        RoCUI_CombatLockdown_Message_Count = RoCUI_CombatLockdown_Message_Count - 1
                    end)
                elseif RoCUI_CombatLockdown_Message_Count == 2 then
                    RoCUI_CombatLockdown_Message_Count = RoCUI_CombatLockdown_Message_Count + 1
                    RoCUI_Frames_CombatLockdown["Message_3"]:SetText(Message)
                    C_Timer.After(7.0, function()
                        RoCUI_Frames_CombatLockdown["Message_3"]:SetText("")
                        RoCUI_CombatLockdown_Message_Count = RoCUI_CombatLockdown_Message_Count - 1
                    end)
                else
                end
            else
            end
    
    		C_Timer.After(1.0, function() RoCUI_CombatLockdown_Message_Cooldown = false end)
    	end
	
	end

end