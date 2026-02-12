RoCUI_CustomSound_QuestAccepted = "Interface\\AddOns\\RoCUI\\sounds\\quests\\QuestNew.ogg"
RoCUI_CustomSound_QuestCompleted = "Interface\\AddOns\\RoCUI\\sounds\\quests\\QuestCompleted.ogg"
RoCUI_CustomSound_PlayerDies = "Interface\\AddOns\\RoCUI\\sounds\\quests\\QuestFailed.ogg"
RoCUI_CustomSound_Queue = "Interface\\AddOns\\RoCUI\\sounds\\interface\\GameFound.ogg"


RoCUI_Event_QuestAccepted = CreateFrame("Frame")
RoCUI_Event_QuestAccepted:RegisterEvent("QUEST_ACCEPTED")
RoCUI_Event_QuestAccepted:SetScript("OnEvent", function(_, event, questId)
    PlaySoundFile(RoCUI_CustomSound_QuestAccepted, "SFX")
end)

RoCUI_Event_QuestCompleted = CreateFrame("Frame")
RoCUI_Event_QuestCompleted:RegisterEvent("QUEST_TURNED_IN")
RoCUI_Event_QuestCompleted:SetScript("OnEvent", function(_, event, questID, xpReward, moneyReward)
    PlaySoundFile(RoCUI_CustomSound_QuestCompleted, "SFX")
end)

RoCUI_Event_PlayerDies = CreateFrame("Frame")
RoCUI_Event_PlayerDies:RegisterEvent("PLAYER_DEAD")
RoCUI_Event_PlayerDies:SetScript("OnEvent", function(_, event)
    PlaySoundFile(RoCUI_CustomSound_PlayerDies, "SFX")
end)

RoCUI_Event_Queue = CreateFrame("Frame")
RoCUI_Event_Queue:RegisterEvent("LFG_PROPOSAL_SHOW")
RoCUI_Event_Queue:SetScript("OnEvent", function(_, event, isRequeue)
    PlaySoundFile(RoCUI_CustomSound_Queue, "SFX")
end)




function RoCUI_SoundReplacements(input_settingsvariable, input_toggle)
	if input_settingsvariable == "RoCUI_Options_SoundOverride_QuestAccepted" then
	    if input_toggle == true then
		    RoCUI_CustomSound_QuestAccepted = "Interface\\AddOns\\RoCUI\\sounds\\quests\\QuestNew.ogg"
			MuteSoundFile(567400)
		else
		    RoCUI_CustomSound_QuestAccepted = ""
			UnmuteSoundFile(567400)
		end
	elseif input_settingsvariable == "RoCUI_Options_SoundOverride_QuestCompleted" then
	    if input_toggle == true then
		    RoCUI_CustomSound_QuestCompleted = "Interface\\AddOns\\RoCUI\\sounds\\quests\\QuestCompleted.ogg"
			MuteSoundFile(567439)
		else
		    RoCUI_CustomSound_QuestCompleted = ""
			UnmuteSoundFile(567439)
						print("unmuted")
		end
	elseif input_settingsvariable == "RoCUI_Options_SoundOverride_PlayerDies" then
	    if input_toggle == true then
		    RoCUI_CustomSound_PlayerDies = "Interface\\AddOns\\RoCUI\\sounds\\quests\\QuestFailed.ogg"
		else
		    RoCUI_CustomSound_PlayerDies = ""
		end
	elseif input_settingsvariable == "RoCUI_Options_SoundOverride_Queue" then
	    if input_toggle == true then
		    RoCUI_CustomSound_Queue = "Interface\\AddOns\\RoCUI\\sounds\\interface\\GameFound.ogg"
			MuteSoundFile(567478)
		else
		    RoCUI_CustomSound_Queue = ""
			UnmuteSoundFile(567478)
		end
	else
	end
end