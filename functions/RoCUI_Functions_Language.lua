function RoCUI_Language_TopMenuButtons(input_submenutype)
    local TextVariableName = ("RoCUI_Text_Options_TopMenu_SubmenuType_"..input_submenutype)
	local TextVariable = _G[TextVariableName]
    tinsert(RoCUI_Dropdown_TopMenuButtons, TextVariable)
	tinsert(RoCUI_TopMenuButtons_List, input_submenutype)
	
end




function RoCUI_Language_Stats(input_category, input_stat)
    local TextVariableName = ("RoCUI_Text_Options_OptionsMenu_Infopanel_StatType_"..input_stat)
	local TextVariable = _G[TextVariableName]
    local ListVariableName = ("RoCUI_Dropdown_Infopanel_StatType_"..input_category)
    local ListVariable = _G[ListVariableName]
	tinsert(ListVariable, input_stat)
end




function RoCUI_Language_Update()
    local LocaleString = RoCUI_PV("Load", "General_Language")
	local LanguageFunctionName = ("RoCUI_LoadLanguage_"..LocaleString)
    local LanguageFunction = _G[LanguageFunctionName]
    LanguageFunction()




	RoCUI_Dropdown_General_FactionSkin = {}
    tinsert(RoCUI_Dropdown_General_FactionSkin, RoCUI_Text_Options_OptionsMenu_General_FactionSkin_Human)
    tinsert(RoCUI_Dropdown_General_FactionSkin, RoCUI_Text_Options_OptionsMenu_General_FactionSkin_Undead)
    tinsert(RoCUI_Dropdown_General_FactionSkin, RoCUI_Text_Options_OptionsMenu_General_FactionSkin_Orc)
    tinsert(RoCUI_Dropdown_General_FactionSkin, RoCUI_Text_Options_OptionsMenu_General_FactionSkin_NightElf)




    RoCUI_Dropdown_Sounds_Channel = {}
    tinsert(RoCUI_Dropdown_Sounds_Channel, RoCUI_Text_Options_OptionsMenu_Sounds_Channel_Master)
    tinsert(RoCUI_Dropdown_Sounds_Channel, RoCUI_Text_Options_OptionsMenu_Sounds_Channel_Music)
    tinsert(RoCUI_Dropdown_Sounds_Channel, RoCUI_Text_Options_OptionsMenu_Sounds_Channel_SFX)
    tinsert(RoCUI_Dropdown_Sounds_Channel, RoCUI_Text_Options_OptionsMenu_Sounds_Channel_Ambience)
    tinsert(RoCUI_Dropdown_Sounds_Channel, RoCUI_Text_Options_OptionsMenu_Sounds_Channel_Dialog)




    RoCUI_Dropdown_Sounds_Victory = {}
    tinsert(RoCUI_Dropdown_Sounds_Victory, RoCUI_Text_Options_OptionsMenu_General_FactionSkin_Human)
    tinsert(RoCUI_Dropdown_Sounds_Victory, RoCUI_Text_Options_OptionsMenu_General_FactionSkin_Undead)
    tinsert(RoCUI_Dropdown_Sounds_Victory, RoCUI_Text_Options_OptionsMenu_General_FactionSkin_Orc)
    tinsert(RoCUI_Dropdown_Sounds_Victory, RoCUI_Text_Options_OptionsMenu_General_FactionSkin_NightElf)
    tinsert(RoCUI_Dropdown_Sounds_Victory, RoCUI_Text_Options_OptionsMenu_Sounds_Generic)
    tinsert(RoCUI_Dropdown_Sounds_Victory, RoCUI_Text_Options_OptionsMenu_Sounds_Random)
    tinsert(RoCUI_Dropdown_Sounds_Victory, RoCUI_Text_Options_OptionsMenu_Sounds_NoMusic)



	
    RoCUI_Dropdown_Sounds_Defeat = {}
    tinsert(RoCUI_Dropdown_Sounds_Defeat, RoCUI_Text_Options_OptionsMenu_General_FactionSkin_Human)
    tinsert(RoCUI_Dropdown_Sounds_Defeat, RoCUI_Text_Options_OptionsMenu_General_FactionSkin_Undead)
    tinsert(RoCUI_Dropdown_Sounds_Defeat, RoCUI_Text_Options_OptionsMenu_General_FactionSkin_Orc)
    tinsert(RoCUI_Dropdown_Sounds_Defeat, RoCUI_Text_Options_OptionsMenu_General_FactionSkin_NightElf)
    tinsert(RoCUI_Dropdown_Sounds_Defeat, RoCUI_Text_Options_OptionsMenu_Sounds_Generic)
    tinsert(RoCUI_Dropdown_Sounds_Defeat, RoCUI_Text_Options_OptionsMenu_Sounds_Random)
    tinsert(RoCUI_Dropdown_Sounds_Defeat, RoCUI_Text_Options_OptionsMenu_Sounds_NoMusic)




    -- Top Menu Buttons
    RoCUI_Dropdown_TopMenuButtons = {}
	RoCUI_TopMenuButtons_List = {}
	RoCUI_Language_TopMenuButtons("AddOnOptions")
    RoCUI_Language_TopMenuButtons("ESC")
    RoCUI_Language_TopMenuButtons("Character")
    RoCUI_Language_TopMenuButtons("Inventory")
    if RoCUI_WoWVersion ~= "Classic" then
	    RoCUI_Language_TopMenuButtons("Professions")
	end
	RoCUI_Language_TopMenuButtons("Spellbook")
	if RoCUI_WoWVersion == "Classic" then
        RoCUI_Language_TopMenuButtons("Skills")
	end
	if RoCUI_PlayerStats_CurrentClass == 3 then
        RoCUI_Language_TopMenuButtons("HunterPets")
	end

    RoCUI_Language_TopMenuButtons("Talents")
	if RoCUI_WoWVersion == "Retail" or RoCUI_WoWVersion == "Forever" then
        RoCUI_Language_TopMenuButtons("CooldownManager")
	end
	if RoCUI_WoWVersion == "Retail" or RoCUI_WoWVersion == "MoP" then
        RoCUI_Language_TopMenuButtons("Achievements")
	elseif RoCUI_WoWVersion == "Forever" then
        RoCUI_Language_TopMenuButtons("ForeverLegacy")
	end
    RoCUI_Language_TopMenuButtons("Quests")
    RoCUI_Language_TopMenuButtons("Guild")
	if RoCUI_WoWVersion ~= "Classic" then
        RoCUI_Language_TopMenuButtons("LFG_PVE")
	end
	if RoCUI_WoWVersion == "Classic" or RoCUI_WoWVersion == "Forever" then
        RoCUI_Language_TopMenuButtons("PvP")
	else
	    RoCUI_Language_TopMenuButtons("LFG_PVP")
	end
	if RoCUI_WoWVersion == "Retail" then
        RoCUI_Language_TopMenuButtons("LFG_MPlus")
	end
	if RoCUI_WoWVersion == "Retail" or RoCUI_WoWVersion == "MoP" then
        RoCUI_Language_TopMenuButtons("Mounts")
        RoCUI_Language_TopMenuButtons("BattlePets")
        RoCUI_Language_TopMenuButtons("Toys")
        RoCUI_Language_TopMenuButtons("Heirlooms")
        RoCUI_Language_TopMenuButtons("Appearances")
        RoCUI_Language_TopMenuButtons("Journal")
    end
    RoCUI_Language_TopMenuButtons("Calendar")
    RoCUI_Language_TopMenuButtons("Map")
    RoCUI_Language_TopMenuButtons("Social")
    RoCUI_Language_TopMenuButtons("Stopwatch")
	if RoCUI_WoWVersion == "Retail" then
	    RoCUI_Language_TopMenuButtons("GreatVault")
	end   
    RoCUI_Language_TopMenuButtons("Hide")




    RoCUI_Dropdown_Infopanel_ForeverName = {}
    tinsert(RoCUI_Dropdown_Infopanel_ForeverName, RoCUI_Text_Options_OptionsMenu_Infopanel_ForeverName_FirstName)
    tinsert(RoCUI_Dropdown_Infopanel_ForeverName, RoCUI_Text_Options_OptionsMenu_Infopanel_ForeverName_LastName)
    tinsert(RoCUI_Dropdown_Infopanel_ForeverName, RoCUI_Text_Options_OptionsMenu_Infopanel_ForeverName_FullName)




    RoCUI_Dropdown_Other_CombatLockdown = {}
    tinsert(RoCUI_Dropdown_Other_CombatLockdown, RoCUI_Text_Options_OptionsMenu_Other_CombatLockdown_Once)
    tinsert(RoCUI_Dropdown_Other_CombatLockdown, RoCUI_Text_Options_OptionsMenu_Other_CombatLockdown_Never)
    tinsert(RoCUI_Dropdown_Other_CombatLockdown, RoCUI_Text_Options_OptionsMenu_Other_CombatLockdown_Always)




    local CurrentAndMaximum = (RoCUI_Text_Options_OptionsMenu_Portrait_Current.." / "..RoCUI_Text_Options_OptionsMenu_Portrait_Maximum)
    RoCUI_Dropdown_Portrait_HealthDisplayType = {}
    tinsert(RoCUI_Dropdown_Portrait_HealthDisplayType, CurrentAndMaximum)
    tinsert(RoCUI_Dropdown_Portrait_HealthDisplayType, RoCUI_Text_Options_OptionsMenu_Portrait_Current)
    tinsert(RoCUI_Dropdown_Portrait_HealthDisplayType, RoCUI_Text_Options_OptionsMenu_Portrait_Percentage)




    RoCUI_Dropdown_Portrait_PowerDisplayType = {}
    tinsert(RoCUI_Dropdown_Portrait_PowerDisplayType, CurrentAndMaximum)
    tinsert(RoCUI_Dropdown_Portrait_PowerDisplayType, RoCUI_Text_Options_OptionsMenu_Portrait_Current)
    tinsert(RoCUI_Dropdown_Portrait_PowerDisplayType, RoCUI_Text_Options_OptionsMenu_Portrait_Percentage)




    -- Infopanel Stat Selection
    ---- Offensive
    RoCUI_Dropdown_Infopanel_StatType_Offensive = {}
    RoCUI_Language_Stats("Offensive", "Weapon")
    RoCUI_Language_Stats("Offensive", "AttackPower")
    RoCUI_Language_Stats("Offensive", "SpellPower")
	if RoCUI_WoWVersion == "MoP" then
	    RoCUI_Language_Stats("Offensive", "PvPDamage")
	end



    ---- Defensive
    RoCUI_Dropdown_Infopanel_StatType_Defensive = {}
    RoCUI_Language_Stats("Defensive", "Armor")
    RoCUI_Language_Stats("Defensive", "Dodge")
    RoCUI_Language_Stats("Defensive", "Parry")
    RoCUI_Language_Stats("Defensive", "Block")

	if RoCUI_WoWVersion == "Classic" then
        RoCUI_Language_Stats("Defensive", "Defense")
	elseif RoCUI_WoWVersion == "Forever" then
        RoCUI_Language_Stats("Defensive", "DefenseForever")
	end

	if RoCUI_WoWVersion == "Retail" or RoCUI_WoWVersion == "Forever" then
	    RoCUI_Language_Stats("Defensive", "Avoidance")
	end

	if RoCUI_WoWVersion == "Classic" or RoCUI_WoWVersion == "Forever" then
        RoCUI_Language_Stats("Defensive", "FireResistance")
        RoCUI_Language_Stats("Defensive", "FrostResistance")
        RoCUI_Language_Stats("Defensive", "NatureResistance")
        RoCUI_Language_Stats("Defensive", "ArcaneResistance")
        RoCUI_Language_Stats("Defensive", "ShadowResistance")
        RoCUI_Language_Stats("Defensive", "HolyResistance")
    end

	if RoCUI_WoWVersion_Sub_Classic == "TBC" then
        RoCUI_Language_Stats("Defensive", "Resilience")
	elseif RoCUI_WoWVersion == "MoP" then
        RoCUI_Language_Stats("Defensive", "ResilienceMoP")
    end




    ---- Other Stats
    RoCUI_Dropdown_Infopanel_StatType_Other = {}
    RoCUI_Language_Stats("Other", "Strength")
    RoCUI_Language_Stats("Other", "Agility")
    RoCUI_Language_Stats("Other", "Intellect")
    RoCUI_Language_Stats("Other", "Stamina")

    if RoCUI_WoWVersion ~= "Retail" then
        RoCUI_Language_Stats("Other", "Spirit")
    end

    RoCUI_Language_Stats("Other", "CriticalStrike")
    RoCUI_Language_Stats("Other", "CritChanceMelee")
    RoCUI_Language_Stats("Other", "CritChanceRanged")
    RoCUI_Language_Stats("Other", "CritChanceSpells")

    if RoCUI_WoWVersion ~= "Retail" then
        RoCUI_Language_Stats("Other", "HitChanceMelee")
        RoCUI_Language_Stats("Other", "HitChanceRanged")
        RoCUI_Language_Stats("Other", "HitChanceSpells")
	end

    RoCUI_Language_Stats("Other", "Haste")

	if RoCUI_WoWVersion ~= "Classic" then
	    RoCUI_Language_Stats("Other", "Versatility")
	end

    RoCUI_Language_Stats("Other", "Mastery")

    if RoCUI_WoWVersion == "Forever" or RoCUI_WoWVersion == "Classic" then
        RoCUI_Language_Stats("Other", "ArmorPenetration")
		RoCUI_Language_Stats("Other", "SpellPenetration")
		RoCUI_Language_Stats("Other", "AttackSpeed")
		RoCUI_Language_Stats("Other", "Expertise")
		RoCUI_Language_Stats("Other", "SpellHealing")
    end

	if RoCUI_WoWVersion == "Retail" or RoCUI_WoWVersion == "Forever" then
	    RoCUI_Language_Stats("Other", "Leech")
	end

	if RoCUI_WoWVersion ~= "Retail" then
	    RoCUI_Language_Stats("Other", "PvPHealing")
	end


    RoCUI_Language_Stats("Other", "Speed")

end