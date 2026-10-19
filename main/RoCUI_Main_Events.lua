-- check for combat restrictions
RoCUI_Event_RestrictionsBecomeActive = CreateFrame("Frame")
RoCUI_Event_RestrictionsBecomeActive:RegisterEvent("ADDON_RESTRICTION_STATE_CHANGED")
RoCUI_Event_RestrictionsBecomeActive:SetScript("OnEvent", function(_, event, type, state)
    for i=0, 3 do
	    if type == i then
		    if state == 1 then
			    for i=1, 8 do
                    local FrameName = ("Top"..tostring(i))
		            RoCUI_Frames_Buttons[FrameName]:Disable()
	            end
			elseif state == 0 then
			    for i=1, 8 do
                    local FrameName = ("Top"..tostring(i))
		            RoCUI_Frames_Buttons[FrameName]:Enable()
	            end
				if RoCUI_CombatLockdown_UpdateAfterCombatEnds == true then
                    RoCUI_UnitStats_UpdateStatText()
                    RoCUI_CombatLockdown_UpdateAfterCombatEnds = false
				end
			end
		end
	end
end)




-- check time of day for the chicken/wolf sound
RoCUI_Event_UpdateSundial = CreateFrame("Frame")
RoCUI_Event_UpdateSundial:RegisterEvent("PLAYER_ENTERING_WORLD")
RoCUI_Event_UpdateSundial:SetScript("OnEvent", function(_, event, isInitialLogin, isReloadingUi)
    if isInitialLogin == true then
        RoCUI_Sundial_CheckCurrentTimeofDay("FirstLogin")
    elseif isReloadingUi == true then
        RoCUI_Sundial_CheckCurrentTimeofDay("UIReload")
    else
    end
end)




-- sounds
---- overrides
RoCUI_Event_Sound_Overrides = CreateFrame("Frame")
RoCUI_Event_Sound_Overrides:RegisterEvent("QUEST_ACCEPTED")
RoCUI_Event_Sound_Overrides:RegisterEvent("QUEST_TURNED_IN")
RoCUI_Event_Sound_Overrides:RegisterEvent("LFG_PROPOSAL_SHOW")
RoCUI_Event_Sound_Overrides:RegisterEvent("PLAYER_DEAD")
RoCUI_Event_Sound_Overrides:SetScript("OnEvent", function(_, event, questID)
	RoCUI_Sounds_PlayOtherSound(event)
end)

---- end of battle
RoCUI_Event_Sound_EncounterEnd = CreateFrame("Frame")
RoCUI_Event_Sound_EncounterEnd:RegisterEvent("ENCOUNTER_END")
RoCUI_Event_Sound_EncounterEnd:SetScript("OnEvent", function(_, event, encounterID, _, difficultyID, _, success)
    if RoCUI_Sounds_CheckIfFakeVictory(encounterID) == true then  

	else
        if difficultyID == 8 then

        else
            if success == 1 then
                RoCUI_Sounds_PlayEncounterEndSound("Victory")
            elseif success == 0 then
			    RoCUI_Sounds_PlayEncounterEndSound("Defeat")
			end
        end
	end

end)

---- mythic+
RoCUI_Event_Sound_ChallengeModeCompleted = CreateFrame("Frame")
RoCUI_Event_Sound_ChallengeModeCompleted:SetScript("OnEvent", function(_, event)
	RoCUI_Sounds_PlayVictorySound()
end)




-- portrait
---- texture
RoCUI_Event_UpdatePortraitImage = CreateFrame("Frame")
RoCUI_Event_UpdatePortraitImage:RegisterEvent("PORTRAITS_UPDATED")
RoCUI_Event_UpdatePortraitImage:SetScript("OnEvent", function(_, event)
    RoCUI_Portrait_TextureUpdate()
end)

---- player health
RoCUI_Event_UpdatePlayerStats_Health = CreateFrame("Frame")
RoCUI_Event_UpdatePlayerStats_Health:RegisterUnitEvent("UNIT_HEALTH", "player")
RoCUI_Event_UpdatePlayerStats_Health:SetScript("OnEvent", function(_, event)
    RoCUI_Portrait_UpdatePlayerStats_Health()
end)

---- player power
RoCUI_Event_UpdatePlayerStats_Power = CreateFrame("Frame")
RoCUI_Event_UpdatePlayerStats_Power:RegisterUnitEvent("UNIT_POWER_UPDATE", "player")
RoCUI_Event_UpdatePlayerStats_Power:RegisterUnitEvent("UNIT_DISPLAYPOWER", "player")
RoCUI_Event_UpdatePlayerStats_Power:SetScript("OnEvent", function(_, event)
    RoCUI_Portrait_UpdatePlayerStats_Power()
end)

---- player name
RoCUI_Event_UpdatePlayerName = CreateFrame("Frame")
RoCUI_Event_UpdatePlayerName:RegisterUnitEvent("UNIT_NAME_UPDATE", "player")
RoCUI_Event_UpdatePlayerName:SetScript("OnEvent", function(_, event)
    RoCUI_Infopanel_UpdatePlayerNameAndTitle()
end)

---- experience bar
RoCUI_Event_UpdatePlayerExperience = CreateFrame("Frame")
RoCUI_Event_UpdatePlayerExperience:RegisterUnitEvent("PLAYER_XP_UPDATE")
RoCUI_Event_UpdatePlayerExperience:SetScript("OnEvent", function(_, event, unitTarget)
    RoCUI_Infopanel_UpdatePlayerExperienceBar()
end)




-- infopanel
---- player changes equipment
RoCUI_PlayerStats_Event_UpdateStats = CreateFrame("Frame")
RoCUI_PlayerStats_Event_UpdateStats:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
RoCUI_PlayerStats_Event_UpdateStats:SetScript("OnEvent", function(_, event, equipmentSlot, hasCurrent)
	RoCUI_Infopanel_CheckPlayerEquipment("weapon")
	RoCUI_Infopanel_CheckPlayerEquipment("armor")
    RoCUI_UnitStats_UpdateStatText()
end)

---- player changes current specialization
RoCUI_PlayerStats_Event_UpdateStats = CreateFrame("Frame")
RoCUI_PlayerStats_Event_UpdateStats:RegisterEvent("ACTIVE_PLAYER_SPECIALIZATION_CHANGED")
RoCUI_PlayerStats_Event_UpdateStats:SetScript("OnEvent", function(_, event)
    RoCUI_Infopanel_UpdateStatIcon()
	RoCUI_Infopanel_UpdatePlayerSpecAndLevel()
	RoCUI_UnitStats_UpdateStatText()
end)

---- player gains a level
RoCUI_PlayerStats_Event_UpdateStats = CreateFrame("Frame")
RoCUI_PlayerStats_Event_UpdateStats:RegisterEvent("PLAYER_LEVEL_CHANGED")
RoCUI_PlayerStats_Event_UpdateStats:SetScript("OnEvent", function(_, event)
	RoCUI_Infopanel_UpdatePlayerSpecAndLevel()
	RoCUI_UnitStats_UpdateStatText()
end)