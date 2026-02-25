-- event (load all settings, also updating the time of day)


RoCUI_Event_UpdateSundial = CreateFrame("Frame")
RoCUI_Event_UpdateSundial:RegisterEvent("PLAYER_ENTERING_WORLD")
RoCUI_Event_UpdateSundial:SetScript("OnEvent", function(_, event, isInitialLogin, isReloadingUi)
    if isInitialLogin == true then
	    RoCUI_CreateCustomFramesAfterAddonLoad()
        RoCUI_CheckCurrentTimeofDay("FirstLogin")
    elseif isReloadingUi == true then
	    RoCUI_CreateCustomFramesAfterAddonLoad()
        RoCUI_CheckCurrentTimeofDay("UIReload")
    else
    end
end)




-- event (portrait - player image)
RoCUI_Event_UpdatePortraitImage = CreateFrame("Frame")
RoCUI_Event_UpdatePortraitImage:RegisterEvent("PORTRAITS_UPDATED")
RoCUI_Event_UpdatePortraitImage:SetScript("OnEvent", function(_, event)
    RoCUI_PortraitUpdate()
end)




-- event (portrait - player health)
RoCUI_Event_UpdatePlayerStats_Health = CreateFrame("Frame")
RoCUI_Event_UpdatePlayerStats_Health:RegisterUnitEvent("UNIT_HEALTH", "player")
RoCUI_Event_UpdatePlayerStats_Health:SetScript("OnEvent", function(_, event)
    RoCUI_UpdatePlayerStats_Health()
end)




-- event (portrait - player power)
RoCUI_Event_UpdatePlayerStats_Power = CreateFrame("Frame")
RoCUI_Event_UpdatePlayerStats_Power:RegisterUnitEvent("UNIT_POWER_UPDATE", "player")
RoCUI_Event_UpdatePlayerStats_Power:RegisterUnitEvent("UNIT_DISPLAYPOWER", "player")
RoCUI_Event_UpdatePlayerStats_Power:SetScript("OnEvent", function(_, event)
    RoCUI_UpdatePlayerStats_Power()
end)




-- event (infopanel - player name)
RoCUI_Event_UpdatePlayerName = CreateFrame("Frame")
RoCUI_Event_UpdatePlayerName:RegisterUnitEvent("UNIT_NAME_UPDATE", "player")
RoCUI_Event_UpdatePlayerName:SetScript("OnEvent", function(_, event)
    RoCUI_UpdatePlayerNameAndTitle()
end)




-- event (infopanel - experience bar)
RoCUI_Event_UpdatePlayerExperience = CreateFrame("Frame")
RoCUI_Event_UpdatePlayerExperience:RegisterUnitEvent("PLAYER_XP_UPDATE")
RoCUI_Event_UpdatePlayerExperience:SetScript("OnEvent", function(_, event, unitTarget)
    RoCUI_UpdatePlayerExperienceBar()
end)




-- event (play sound - accept quest)
RoCUI_Event_Sound_QuestAccepted = CreateFrame("Frame")
RoCUI_Event_Sound_QuestAccepted:RegisterEvent("QUEST_ACCEPTED")
RoCUI_Event_Sound_QuestAccepted:SetScript("OnEvent", function(_, event, questId)
    PlaySoundFile(RoCUI_CustomSound_QuestAccepted, "SFX")
end)

-- event (play sound - complete quest)
RoCUI_Event_Sound_QuestCompleted = CreateFrame("Frame")
RoCUI_Event_Sound_QuestCompleted:RegisterEvent("QUEST_TURNED_IN")
RoCUI_Event_Sound_QuestCompleted:SetScript("OnEvent", function(_, event, questID, xpReward, moneyReward)
    PlaySoundFile(RoCUI_CustomSound_QuestCompleted, "SFX")
end)

-- event (play sound - player character dies)
RoCUI_Event_Sound_PlayerDies = CreateFrame("Frame")
RoCUI_Event_Sound_PlayerDies:RegisterEvent("PLAYER_DEAD")
RoCUI_Event_Sound_PlayerDies:SetScript("OnEvent", function(_, event)
    PlaySoundFile(RoCUI_CustomSound_PlayerDies, "SFX")
end)

-- event (play sound - LFG queue is ready)
RoCUI_Event_Sound_RandomGroupIsReady = CreateFrame("Frame")
RoCUI_Event_Sound_RandomGroupIsReady:RegisterEvent("LFG_PROPOSAL_SHOW")
RoCUI_Event_Sound_RandomGroupIsReady:SetScript("OnEvent", function(_, event, isRequeue)
    PlaySoundFile(RoCUI_CustomSound_Queue, "SFX")
end)




-- event (combat start)
RoCUI_Event_PlayerEntersCombat = CreateFrame("Frame")
RoCUI_Event_PlayerEntersCombat:RegisterEvent("PLAYER_REGEN_DISABLED")
RoCUI_Event_PlayerEntersCombat:SetScript("OnEvent", function(_, event, isRequeue)
    for i=1, 8 do
        local RoCUI_Temp_ButtonName = ("RoCUI_CustomFrame_Base_menubutton"..tostring(i))
		_G[RoCUI_Temp_ButtonName]:Disable()
	end
end)




-- event (combat end)
RoCUI_Event_PlayerLeavesCombat = CreateFrame("Frame")
RoCUI_Event_PlayerLeavesCombat:RegisterEvent("PLAYER_REGEN_ENABLED")
RoCUI_Event_PlayerLeavesCombat:SetScript("OnEvent", function(_, event, isRequeue)
    for i=1, 8 do
        local RoCUI_Temp_ButtonName = ("RoCUI_CustomFrame_Base_menubutton"..tostring(i))
		_G[RoCUI_Temp_ButtonName]:Enable()
	end
end)




-- player changes equipment
RoCUI_PlayerStats_Event_UpdateStats = CreateFrame("Frame")
RoCUI_PlayerStats_Event_UpdateStats:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
RoCUI_PlayerStats_Event_UpdateStats:SetScript("OnEvent", function(_, event, equipmentSlot, hasCurrent)
	RoCUI_Infopanel_CheckPlayerEquipment("weapon")
	RoCUI_Infopanel_CheckPlayerEquipment("armor")
    RoCUI_Infopanel_UpdateStatText()
end)




-- player changes current specialization
RoCUI_PlayerStats_Event_UpdateStats = CreateFrame("Frame")
RoCUI_PlayerStats_Event_UpdateStats:RegisterEvent("ACTIVE_PLAYER_SPECIALIZATION_CHANGED")
RoCUI_PlayerStats_Event_UpdateStats:SetScript("OnEvent", function(_, event)
    RoCUI_Infopanel_UpdateStatIcon()
	RoCUI_UpdatePlayerSpecAndLevel()
	RoCUI_Infopanel_UpdateStatText()
end)




-- player gains a level
RoCUI_PlayerStats_Event_UpdateStats = CreateFrame("Frame")
RoCUI_PlayerStats_Event_UpdateStats:RegisterEvent("PLAYER_LEVEL_CHANGED")
RoCUI_PlayerStats_Event_UpdateStats:SetScript("OnEvent", function(_, event)
	RoCUI_UpdatePlayerSpecAndLevel()
	RoCUI_Infopanel_UpdateStatText()
end)