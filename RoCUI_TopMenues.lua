function RoCUI_ButtonReaction(input_frametype)
    local RoCUI_Temp_VariableName = ("TopMenuChoice_"..input_frametype)
    local RoCUI_Temp_SubmenuChoice = RoCUIDB_Options[RoCUI_Temp_VariableName]

    if RoCUI_Temp_SubmenuChoice == 1 then
	    if GameMenuFrame:IsShown() == true then
		    HideUIPanel(GameMenuFrame)
			PlaySoundFile("Interface\\AddOns\\RoCUI\\sounds\\interface\\BigButtonClick.ogg", "SFX")
		else
	        ShowUIPanel(GameMenuFrame)
			PlaySoundFile("Interface\\AddOns\\RoCUI\\sounds\\interface\\GamePause.ogg", "SFX")
		end
    elseif RoCUI_Temp_SubmenuChoice == 2 then
        ToggleCharacter("PaperDollFrame")
    elseif RoCUI_Temp_SubmenuChoice == 3 then
	    if RoCUI_GameVersion == 3 then
		    ToggleProfessionsBook()
		else
		    if SpellBookFrame:IsShown() == true then
		        ToggleSpellBook(BOOKTYPE_PROFESSION)
			else
			    ToggleFrame(SpellBookFrame)
			end		
		end
    elseif RoCUI_Temp_SubmenuChoice == 4 then
		if RoCUI_GameVersion == 3 then
			PlayerSpellsUtil.ToggleSpellBookFrame()
	    else
		    if SpellBookFrame:IsShown() == true then
		        ToggleSpellBook(BOOKTYPE_SPELL)
			else
			    ToggleFrame(SpellBookFrame)
			end		
		end
    elseif RoCUI_Temp_SubmenuChoice == 5 then
	    ToggleCharacter("SkillFrame")
    elseif RoCUI_Temp_SubmenuChoice == 6 then
	    ToggleCharacter("PVPFrame")
    elseif RoCUI_Temp_SubmenuChoice == 7 then
		if RoCUI_GameVersion == 3 then
			PlayerSpellsUtil.ToggleClassTalentOrSpecFrame()
		else
			ToggleTalentFrame()
		end
    elseif RoCUI_Temp_SubmenuChoice == 8 then
	    CooldownViewerSettings:TogglePanel()
    elseif RoCUI_Temp_SubmenuChoice == 9 then
        ToggleAchievementFrame()
    elseif RoCUI_Temp_SubmenuChoice == 10 then
        ToggleQuestLog()
    elseif RoCUI_Temp_SubmenuChoice == 11 then
        ToggleGuildFrame()
    elseif RoCUI_Temp_SubmenuChoice == 12 then
		PVEFrame_ToggleFrame("GroupFinderFrame", nil)
    elseif RoCUI_Temp_SubmenuChoice == 13 then
	    if RoCUI_GameVersion == 3 then
		    PVEFrame_ToggleFrame("PVPUIFrame", nil)
		elseif RoCUI_GameVersion == 2 then
		    TogglePVPFrame()
		else
		end
    elseif RoCUI_Temp_SubmenuChoice == 14 then
		    PVEFrame_ToggleFrame("ChallengesFrame", nil)
    elseif RoCUI_Temp_SubmenuChoice == 15 then
        ToggleCollectionsJournal(COLLECTIONS_JOURNAL_TAB_INDEX_MOUNTS)
    elseif RoCUI_Temp_SubmenuChoice == 16 then
        ToggleCollectionsJournal(COLLECTIONS_JOURNAL_TAB_INDEX_PETS)
    elseif RoCUI_Temp_SubmenuChoice == 17 then
        ToggleCollectionsJournal(COLLECTIONS_JOURNAL_TAB_INDEX_TOYS)
    elseif RoCUI_Temp_SubmenuChoice == 18 then
        ToggleCollectionsJournal(COLLECTIONS_JOURNAL_TAB_INDEX_HEIRLOOMS)
    elseif RoCUI_Temp_SubmenuChoice == 19 then
        ToggleCollectionsJournal(COLLECTIONS_JOURNAL_TAB_INDEX_APPEARANCES)
    elseif RoCUI_Temp_SubmenuChoice == 20 then
	    ToggleEncounterJournal()
	elseif RoCUI_Temp_SubmenuChoice == 21 then
	    ToggleCalendar()
    elseif RoCUI_Temp_SubmenuChoice == 22 then
	    ToggleWorldMap()
    elseif RoCUI_Temp_SubmenuChoice == 23 then
	    ToggleFriendsFrame()
    elseif RoCUI_Temp_SubmenuChoice == 24 then
	    C_AddOns.LoadAddOn("Blizzard_WeeklyRewards")
	    if WeeklyRewardsFrame:IsShown() == true then
		    WeeklyRewardsFrame:Hide()
		else
	        WeeklyRewardsFrame:Show()
		end
    else
	end

end




function RoCUI_ButtonTextUpdate(input_frametype, input_submenutype)
    local RoCUI_Temp_ButtonName = ("RoCUI_CustomFrame_Base_"..input_frametype)
	if input_submenutype == 1 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_ESC)
    elseif input_submenutype == 2 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Character)
    elseif input_submenutype == 3 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Professions)
    elseif input_submenutype == 4 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Spellbook)
    elseif input_submenutype == 5 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Skills)
    elseif input_submenutype == 6 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_PvP)
    elseif input_submenutype == 7 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Talents)
    elseif input_submenutype == 8 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_CooldownManager_Abbreviated)
    elseif input_submenutype == 9 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Achievements)
    elseif input_submenutype == 10 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Quests)
    elseif input_submenutype == 11 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Guild)
    elseif input_submenutype == 12 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder)
    elseif input_submenutype == 13 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder)
    elseif input_submenutype == 14 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder)
    elseif input_submenutype == 15 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Mounts)
    elseif input_submenutype == 16 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Pets)
    elseif input_submenutype == 17 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Toys)
    elseif input_submenutype == 18 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Heirlooms)
    elseif input_submenutype == 19 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Appearances)
    elseif input_submenutype == 20 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Journal)
    elseif input_submenutype == 21 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Calendar)
    elseif input_submenutype == 22 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Map)
    elseif input_submenutype == 23 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Social)
    elseif input_submenutype == 24 then	
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_GreatVault_Abbreviated)
    elseif input_submenutype == 25 then	
        _G[RoCUI_Temp_ButtonName]:SetText("")
	else
	end
	
	RoCUI_ToggleDisplay_Buttons(input_frametype, input_submenutype)
end
