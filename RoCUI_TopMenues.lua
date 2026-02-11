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
        ToggleProfessionsBook()
    elseif RoCUI_Temp_SubmenuChoice == 4 then
        PlayerSpellsUtil.ToggleSpellBookFrame()
    elseif RoCUI_Temp_SubmenuChoice == 5 then
        PlayerSpellsUtil.ToggleClassTalentOrSpecFrame()
    elseif RoCUI_Temp_SubmenuChoice == 6 then
	    CooldownViewerSettings:TogglePanel()
    elseif RoCUI_Temp_SubmenuChoice == 7 then
        ToggleAchievementFrame()
    elseif RoCUI_Temp_SubmenuChoice == 8 then
        ToggleQuestLog()
    elseif RoCUI_Temp_SubmenuChoice == 9 then
        ToggleGuildFrame()
    elseif RoCUI_Temp_SubmenuChoice == 10 then
		PVEFrame_ToggleFrame("GroupFinderFrame", nil)
    elseif RoCUI_Temp_SubmenuChoice == 11 then
		PVEFrame_ToggleFrame("PVPUIFrame", nil)
    elseif RoCUI_Temp_SubmenuChoice == 12 then
        PVEFrame_ToggleFrame("ChallengesFrame", nil)
    elseif RoCUI_Temp_SubmenuChoice == 13 then
        ToggleCollectionsJournal(COLLECTIONS_JOURNAL_TAB_INDEX_MOUNTS)
    elseif RoCUI_Temp_SubmenuChoice == 14 then
        ToggleCollectionsJournal(COLLECTIONS_JOURNAL_TAB_INDEX_PETS)
    elseif RoCUI_Temp_SubmenuChoice == 15 then
        ToggleCollectionsJournal(COLLECTIONS_JOURNAL_TAB_INDEX_TOYS)
    elseif RoCUI_Temp_SubmenuChoice == 16 then
        ToggleCollectionsJournal(COLLECTIONS_JOURNAL_TAB_INDEX_HEIRLOOMS)
    elseif RoCUI_Temp_SubmenuChoice == 17 then
        ToggleCollectionsJournal(COLLECTIONS_JOURNAL_TAB_INDEX_APPEARANCES)
    elseif RoCUI_Temp_SubmenuChoice == 18 then
	    ToggleEncounterJournal()
	elseif RoCUI_Temp_SubmenuChoice == 19 then
	    ToggleCalendar()
    elseif RoCUI_Temp_SubmenuChoice == 20 then
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
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Talents)
    elseif input_submenutype == 6 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_CooldownManager_Abbreviated)
    elseif input_submenutype == 7 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Achievements)
    elseif input_submenutype == 8 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Quests)
    elseif input_submenutype == 9 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Guild)
    elseif input_submenutype == 10 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder)
    elseif input_submenutype == 11 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder)
    elseif input_submenutype == 12 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder)
    elseif input_submenutype == 13 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Mounts)
    elseif input_submenutype == 14 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Pets)
    elseif input_submenutype == 15 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Toys)
    elseif input_submenutype == 16 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Heirlooms)
    elseif input_submenutype == 17 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Appearances)
    elseif input_submenutype == 18 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Journal)
    elseif input_submenutype == 19 then
        _G[RoCUI_Temp_ButtonName]:SetText(RoCUI_Text_Options_TopMenu_SubmenuType_Calendar)
    elseif input_submenutype == 20 then
        _G[RoCUI_Temp_ButtonName]:SetText("")
	else
	end
	
	RoCUI_ToggleDisplay_Buttons(input_frametype, input_submenutype)
end







