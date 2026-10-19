function RoCUI_TopMenuButtons_ButtonReaction(input_buttonID)
    local VariableName = ("TopMenuButtons_"..input_buttonID)
    local SubmenuChoice = RoCUI_PV("Load", VariableName)


    if SubmenuChoice == "ESC" then
	    if GameMenuFrame:IsShown() == true then
		    HideUIPanel(GameMenuFrame)
			PlaySoundFile("Interface\\AddOns\\RoCUI\\sounds\\interface\\BigButtonClick.ogg", "SFX")
		else
	        ShowUIPanel(GameMenuFrame)
			PlaySoundFile("Interface\\AddOns\\RoCUI\\sounds\\interface\\GamePause.ogg", "SFX")
		end
    elseif SubmenuChoice == "Character" then
        if RoCUI_WoWVersion == "Forever" then
            if CharacterFrame:IsShown() == true then
                HideUIPanel(CharacterFrame)
            else
                ShowUIPanel(CharacterFrame)
            end
		else
            ToggleCharacter("PaperDollFrame")
		end
    elseif SubmenuChoice == "Inventory" then
        ToggleBackpack()
    elseif SubmenuChoice == "Professions" then
	    if RoCUI_WoWVersion == "Retail" or RoCUI_WoWVersion == "Forever" then
		    ToggleProfessionsBook()
		else
            ToggleSpellBook(BOOKTYPE_PROFESSION)	
		end
    elseif SubmenuChoice == "Spellbook" then
	    if RoCUI_WoWVersion == "Retail" or RoCUI_WoWVersion == "Forever" then
		    PlayerSpellsUtil.ToggleSpellBookFrame()
		else
            ToggleSpellBook(BOOKTYPE_SPELL)	
		end
    elseif SubmenuChoice == "Skills" then
	    ToggleCharacter("SkillFrame")
    elseif SubmenuChoice == "HunterPets" then
	    if RoCUI_WoWVersion == "Retail" or RoCUI_WoWVersion == "Forever" then
		    PlayerSpellsUtil.ToggleSpellBookFrame(PlayerSpellsUtil.SpellBookCategories.Pet)
		else
		    ToggleCharacter("PetPaperDollFrame")
		end
    elseif SubmenuChoice == "Talents" then
        if RoCUI_WoWVersion == "Retail" or RoCUI_WoWVersion == "Forever" then
            PlayerSpellsUtil.ToggleClassTalentOrSpecFrame()
        else
            ToggleTalentFrame()
        end
    elseif SubmenuChoice == "CooldownManager" then
	    CooldownViewerSettings:TogglePanel()
    elseif SubmenuChoice == "Achievements" then
        ToggleAchievementFrame()
    elseif SubmenuChoice == "ForeverLegacy" then
        ToggleLegacySystemUI()
    elseif SubmenuChoice == "Quests" then
        ToggleQuestLog()
    elseif SubmenuChoice == "Guild" then
        ToggleGuildFrame()
    elseif SubmenuChoice == "LFG_PVE" then
        if RoCUI_WoWVersion == "Retail" or RoCUI_WoWVersion == "MoP" then
            PVEFrame_ToggleFrame("GroupFinderFrame", nil)
        elseif RoCUI_WoWVersion == "Forever" then
            LFGVanilla_ToggleFrame()
        end
    elseif SubmenuChoice == "PvP" then
	    if RoCUI_WoWVersion == "Forever" then
		    ToggleCharacter("PVPRankFrame")
		elseif RoCUI_WoWVersion == "Classic" then
		    ToggleCharacter("PVPFrame")
		end
    elseif SubmenuChoice == "LFG_PVP" then
	    if RoCUI_WoWVersion == "Retail" then
		    PVEFrame_ToggleFrame("PVPUIFrame", nil)
		else
		    TogglePVPFrame()
		end
    elseif SubmenuChoice == "LFG_MPlus" then
		    PVEFrame_ToggleFrame("ChallengesFrame", nil)
    elseif SubmenuChoice == "Mounts" then
        ToggleCollectionsJournal(COLLECTIONS_JOURNAL_TAB_INDEX_MOUNTS)
    elseif SubmenuChoice == "BattlePets" then
        ToggleCollectionsJournal(COLLECTIONS_JOURNAL_TAB_INDEX_PETS)
    elseif SubmenuChoice == "Toys" then
        ToggleCollectionsJournal(COLLECTIONS_JOURNAL_TAB_INDEX_TOYS)
    elseif SubmenuChoice == "Heirlooms" then
        ToggleCollectionsJournal(COLLECTIONS_JOURNAL_TAB_INDEX_HEIRLOOMS)
    elseif SubmenuChoice == "Appearances" then
        ToggleCollectionsJournal(COLLECTIONS_JOURNAL_TAB_INDEX_APPEARANCES)
    elseif SubmenuChoice == "Journal" then
	    ToggleEncounterJournal()
	elseif SubmenuChoice == "Calendar" then
	    ToggleCalendar()
    elseif SubmenuChoice == "Map" then
	    ToggleWorldMap()
    elseif SubmenuChoice == "Social" then
	    ToggleFriendsFrame()
    elseif SubmenuChoice == "Stopwatch" then
		TimeManager_Toggle()
    elseif SubmenuChoice == "GreatVault" then
	    C_AddOns.LoadAddOn("Blizzard_WeeklyRewards")
	    if WeeklyRewardsFrame:IsShown() == true then
		    WeeklyRewardsFrame:Hide()
		else
	        WeeklyRewardsFrame:Show()
		end
	elseif SubmenuChoice == "AddOnOptions" then
        RoCUI_General_ToggleOptionsMenu()
    else
	end

end




function RoCUI_TopMenuButtons_UpdateText(input_buttonID, input_submenutype)
    local FrameName = ("Top"..input_buttonID)
    local FrameNameDropdown = ("TopMenuButtons_"..input_buttonID)


    local TextVariableName_Abbreviated = ("RoCUI_Text_Options_TopMenu_SubmenuType_"..input_submenutype.."_Abbreviated")
	local TextVariable_Abbreviated = _G[TextVariableName_Abbreviated]


    RoCUI_Frames_Buttons[FrameName]:SetText(TextVariable_Abbreviated)
	RoCUI_Frames_OptionsEntry[FrameNameDropdown]:SetDefaultText(TextVariable_Abbreviated)


	if input_submenutype == "Hide" then
        RoCUI_Frames_Buttons[FrameName]:Hide()
    else
        RoCUI_Frames_Buttons[FrameName]:Show()
    end
end



function RoCUI_TopMenuButtons_UpdateText_All()
    for i=1, 8 do
        local VariableName = ("TopMenuButtons_"..i)
        local SubmenuChoice = RoCUI_PV("Load", VariableName)
		RoCUI_TopMenuButtons_UpdateText(i, SubmenuChoice)
    end
end