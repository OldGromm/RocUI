function RoCUI_SoundReplacements(input_settingsvariable, input_toggle)
	if input_settingsvariable == "RoCUI_Options_SoundOverride_QuestAccepted" then
	    if input_toggle == true then
		    RoCUI_CustomSound["QUEST_ACCEPTED"] = "Interface\\AddOns\\RoCUI\\sounds\\quests\\QuestNew.ogg"
			MuteSoundFile(567400)
		else
		    RoCUI_CustomSound["QUEST_ACCEPTED"] = ""
			UnmuteSoundFile(567400)
		end
	elseif input_settingsvariable == "RoCUI_Options_SoundOverride_QuestCompleted" then
	    if input_toggle == true then
		    RoCUI_CustomSound["QUEST_TURNED_IN"] = "Interface\\AddOns\\RoCUI\\sounds\\quests\\QuestCompleted.ogg"
			MuteSoundFile(567439)
		else
		    RoCUI_CustomSound["QUEST_TURNED_IN"] = ""
			UnmuteSoundFile(567439)
		end
	elseif input_settingsvariable == "RoCUI_Options_SoundOverride_PlayerDies" then
	    if input_toggle == true then
		    RoCUI_CustomSound["PLAYER_DEAD"] = "Interface\\AddOns\\RoCUI\\sounds\\quests\\QuestFailed.ogg"
		else
		    RoCUI_CustomSound["PLAYER_DEAD"] = ""
		end
	elseif input_settingsvariable == "RoCUI_Options_SoundOverride_Queue" then
	    if input_toggle == true then
		    RoCUI_CustomSound["LFG_PROPOSAL_SHOW"] = "Interface\\AddOns\\RoCUI\\sounds\\interface\\GameFound.ogg"
			MuteSoundFile(567478)
		else
		    RoCUI_CustomSound["LFG_PROPOSAL_SHOW"] = ""
			UnmuteSoundFile(567478)
		end
	else
	end
end




function RoCUI_SoundPlayer(soundtype)
    local RoCUI_Temp_SoundHandle = RoCUI_SoundHandle[soundtype]
	local RoCUI_Temp_SoundID = RoCUI_CustomSound[soundtype]
	local RoCUI_Temp_Proceed = false
	local RoCUI_Temp_Channel_Index = RoCUIDB_Options["Sounds_Channel"]
	local RoCUI_Temp_Channel = RoCUI_SoundChannel[RoCUI_Temp_Channel_Index]
	
	if RoCUI_Temp_SoundHandle == nil then
	    RoCUI_Temp_Proceed = true
	else
		if C_Sound.IsPlaying(RoCUI_Temp_SoundHandle) == false then
            RoCUI_Temp_Proceed = true    
        end
	end

    if RoCUI_Temp_Proceed == true then
	    _, RoCUI_SoundHandle[soundtype] = PlaySoundFile(RoCUI_Temp_SoundID, RoCUI_Temp_Channel)
	end
end




function RoCUI_EndofBattleSounds(input_type)
    local RoCUI_Temp_Choice = ""
	local RoCUI_Temp_Fixed = 0
	local RoCUI_Temp_Random = math.random(1, 5)

	if input_type == "Victory" then
        RoCUI_Temp_Fixed = RoCUIDB_Options["Sounds_EndofBattle_Victory"]
	elseif input_type == "Defeat" then
        RoCUI_Temp_Fixed = RoCUIDB_Options["Sounds_EndofBattle_Defeat"]
	else
	end

    if RoCUI_Temp_Choice == 6 then
	    RoCUI_Temp_Choice = RoCUI_EndofBattleSound_Filename[RoCUI_Temp_Random]
	else
	    RoCUI_Temp_Choice = RoCUI_EndofBattleSound_Filename[RoCUI_Temp_Fixed]
	end



	RoCUI_CustomSound[input_type] = ("Interface\\AddOns\\RoCUI\\sounds\\endofbattle\\"..RoCUI_Temp_Choice..input_type..".ogg")
end