RoCUI_CustomSound_QuestAccepted = "Interface\\AddOns\\RoCUI\\sounds\\quests\\QuestNew.ogg"
RoCUI_CustomSound_QuestCompleted = "Interface\\AddOns\\RoCUI\\sounds\\quests\\QuestCompleted.ogg"
RoCUI_CustomSound_PlayerDies = "Interface\\AddOns\\RoCUI\\sounds\\quests\\QuestFailed.ogg"
RoCUI_CustomSound_Queue = "Interface\\AddOns\\RoCUI\\sounds\\interface\\GameFound.ogg"




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