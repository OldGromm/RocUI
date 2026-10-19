function RoCUI_Sounds_ToggleReplacements(input_audiotype, input_toggle)
	if input_audiotype == "Sounds_Override_QUEST_ACCEPTED" then
	    if input_toggle == true then
		    RoCUI_CustomSound["QUEST_ACCEPTED"] = "Interface\\AddOns\\RoCUI\\sounds\\quests\\QuestNew.ogg"
			MuteSoundFile(567400)
		else
		    RoCUI_CustomSound["QUEST_ACCEPTED"] = ""
			UnmuteSoundFile(567400)
		end
	elseif input_audiotype == "Sounds_Override_QUEST_TURNED_IN" then
	    if input_toggle == true then
		    RoCUI_CustomSound["QUEST_TURNED_IN"] = "Interface\\AddOns\\RoCUI\\sounds\\quests\\QuestCompleted.ogg"
			MuteSoundFile(567439)
		else
		    RoCUI_CustomSound["QUEST_TURNED_IN"] = ""
			UnmuteSoundFile(567439)
		end
	elseif input_audiotype == "Sounds_Override_PLAYER_DEAD" then
	    if input_toggle == true then
		    RoCUI_CustomSound["PLAYER_DEAD"] = "Interface\\AddOns\\RoCUI\\sounds\\quests\\QuestFailed.ogg"
		else
		    RoCUI_CustomSound["PLAYER_DEAD"] = ""
		end
	elseif input_audiotype == "Sounds_Override_LFG_PROPOSAL_SHOW" then
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



function RoCUI_Sounds_SetupCustomSounds()
    local EventList = {"QUEST_ACCEPTED", "QUEST_TURNED_IN", "LFG_PROPOSAL_SHOW", "PLAYER_DEAD"}
    for _, v in ipairs(EventList) do
	    local VariableName = ("Sounds_Override_"..v)
		local Toggle = RoCUI_PV("Load", VariableName)
		RoCUI_Sounds_ToggleReplacements(VariableName, Toggle)
	end
end




function RoCUI_Sounds_PlayEncounterEndSound(input_type)
    local SoundIndexVariable = ("Sounds_"..input_type)
	local SoundIndex = RoCUI_PV("Load", SoundIndexVariable)
	if SoundIndex == 7 then
	
	else
	    if SoundIndex == 6 then
	        SoundIndex = fastrandom(1, 5)
	    end
		local SoundID = RoCUI_General_FetchAudioFilepath(SoundIndex, input_type)
		RoCUI_General_PlaySoundFile(SoundID, false)
	end
end




function RoCUI_Sounds_PlayOtherSound(input_event)
    local SoundID = RoCUI_CustomSound[input_event]
	local VariableName = ("Sounds_Override_"..input_event)
	
	if RoCUI_PV("Load", VariableName) == true then
		RoCUI_General_PlaySoundFile(SoundID, false)
	end
end




-- Check if the current boss encounter is just a prelude for the real fight that follows afterwards.
-- Currently known fake victory boss encounters include:
---- Gnok from the "The Ring of Glory" delve.
---- Den'zara from the "The Labyrinth of Kindo'jan" delve.
function RoCUI_Sounds_CheckIfFakeVictory(input_encounterID)
    local Proceed = false
    for _, v in ipairs(RoCUI_Sounds_FakeVictoryList) do
        if input_encounterID == v then
            Proceed = true
		end
	end
	return Proceed
end