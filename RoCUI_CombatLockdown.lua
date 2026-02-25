-- combat lockdown message


---- variables 
RoCUI_Frame_Base_CombatLockdownMessage = {}
RoCUI_Frame_String_CombatLockdownMessage_1 = {}
RoCUI_Frame_String_CombatLockdownMessage_2 = {}
RoCUI_Frame_String_CombatLockdownMessage_3 = {}
RoCUI_CombatLockdownMessage_Count = 0




---- message frame
CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
RoCUI_Frame_Base_CombatLockdownMessage = CreateFrame("Frame", nil, UIParent)
RoCUI_Frame_Base_CombatLockdownMessage:SetPoint("LEFT", 30, 0)
RoCUI_Frame_Base_CombatLockdownMessage:SetSize(20, 60)
RoCUI_Frame_Base_CombatLockdownMessage:SetIgnoreParentScale(true)
RoCUI_Frame_String_CombatLockdownMessage_1 = RoCUI_Frame_Base_CombatLockdownMessage:CreateFontString(nil, "OVERLAY", "GameTooltipText")
RoCUI_Frame_String_CombatLockdownMessage_1:SetPoint("TOPLEFT", 0, 0)
RoCUI_Frame_String_CombatLockdownMessage_1:SetText("")
RoCUI_Frame_String_CombatLockdownMessage_2 = RoCUI_Frame_Base_CombatLockdownMessage:CreateFontString(nil, "OVERLAY", "GameTooltipText")
RoCUI_Frame_String_CombatLockdownMessage_2:SetPoint("TOPLEFT", 0, 20)
RoCUI_Frame_String_CombatLockdownMessage_2:SetText("")
RoCUI_Frame_String_CombatLockdownMessage_3 = RoCUI_Frame_Base_CombatLockdownMessage:CreateFontString(nil, "OVERLAY", "GameTooltipText")
RoCUI_Frame_String_CombatLockdownMessage_3:SetPoint("TOPLEFT", 0, 40)
RoCUI_Frame_String_CombatLockdownMessage_3:SetText("")




---- chat messages
function RoCUI_SendChatMessage(input)
    local RoCUI_ChatLockdownIsActive, _ = C_ChatInfo.InChatMessagingLockdown()
	
	if RoCUI_ChatLockdownIsActive == false then
	    if RoCUIDB_Options["General_AddonMessages"] == true then
	        print(WrapTextInColorCode("RoC UI", "FFE6D30A").." - "..input)
		end
    end
end




---- check if player is in combat or an active mythic+ run
function RoCUI_CombatCheck()
    local RoCUI_PlayerIsInCombat = false

	if PlayerIsInCombat() == true then
	    RoCUI_PlayerIsInCombat = true
	end

	if C_ChallengeMode.IsChallengeModeActive() == true then
	    RoCUI_PlayerIsInCombat = true
	end

    return RoCUI_PlayerIsInCombat
end




---- add-on lockdown message
RoCUI_LockdownMessage_Cooldown = false
function RoCUI_SendAddonLockdownMessage()
    local RoCUI_ChatLockdownIsActive = ""
	local RoCUI_ChatLockdownType = ""
	local RoCUI_Message = ""
	
	if RoCUI_LockdownMessage_Cooldown == false then
	    RoCUI_LockdownMessage_Cooldown = true

        if RoCUIDB_Options["General_AddonMessages"] == true then
            if RoCUI_GameVersion == 3 then
        	    RoCUI_ChatLockdownIsActive, RoCUI_ChatLockdownType = C_ChatInfo.InChatMessagingLockdown()
        	else
        	    RoCUI_ChatLockdownIsActive = InCombatLockdown()
        	    RoCUI_ChatLockdownType = 0
        	end
        
        
            if RoCUI_ChatLockdownType == 0 then
                RoCUI_Message = (RoCUI_Text_CombatWarning_FirstPart..RoCUI_Text_CombatWarning_Type0)
            elseif RoCUI_ChatLockdownType == 1 then
                RoCUI_Message = (RoCUI_Text_CombatWarning_FirstPart..RoCUI_Text_CombatWarning_Type1)
            elseif RoCUI_ChatLockdownType == 2 then
        		RoCUI_Message = (RoCUI_Text_CombatWarning_FirstPart..RoCUI_Text_CombatWarning_Type2)
        	else
        	    RoCUI_Message = (RoCUI_Text_CombatWarning_FirstPart..RoCUI_Text_CombatWarning_Type0)
        	end
        
    	    PlaySoundFile("Interface\\AddOns\\RoCUI\\sounds\\interface\\Error.ogg", "SFX")
            if RoCUI_ChatLockdownIsActive == false then
               RoCUI_SendChatMessage(RoCUI_Message)
            elseif RoCUI_ChatLockdownIsActive == true then
                RoCUI_CombatLockdownMessage_Count = RoCUI_CombatLockdownMessage_Count + 1
                if RoCUI_CombatLockdownMessage_Count == 1 then
                    RoCUI_Frame_String_CombatLockdownMessage_1:SetText(RoCUI_Message)
        		    C_Timer.After(7.0, function()
        		        RoCUI_Frame_String_CombatLockdownMessage_1:SetText("")
        		        RoCUI_CombatLockdownMessage_Count = RoCUI_CombatLockdownMessage_Count - 1
        		    end)
                elseif RoCUI_CombatLockdownMessage_Count == 2 then
        		    RoCUI_Frame_String_CombatLockdownMessage_2:SetText(RoCUI_Message)
        		    C_Timer.After(7.0, function()
        		        RoCUI_Frame_String_CombatLockdownMessage_2:SetText("")
        		        RoCUI_CombatLockdownMessage_Count = RoCUI_CombatLockdownMessage_Count - 1
        		    end)
                elseif RoCUI_CombatLockdownMessage_Count == 3 then
        		    RoCUI_Frame_String_CombatLockdownMessage_3:SetText(RoCUI_Message)
        		    C_Timer.After(7.0, function()
        		        RoCUI_Frame_String_CombatLockdownMessage_3:SetText("")
        		        RoCUI_CombatLockdownMessage_Count = RoCUI_CombatLockdownMessage_Count - 1
        		    end)
        	    else
        	    end
        	else
        	end
    	end
		
		C_Timer.After(1.0, function() RoCUI_LockdownMessage_Cooldown = false end)
	else
	end
end