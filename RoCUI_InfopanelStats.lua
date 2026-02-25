-- portrait stat formatting and calculations


---- shorten number
function RoCUI_ShortenNumber_Infopanel(input_number)
    local RoCUI_Temp_NewNumber = input_number
	local RoCUI_Temp_NewString = ""
	if input_number > 1000000 then
	    RoCUI_Temp_NewNumber = (input_number / 10000)
	elseif input_number > 100000 then
	    RoCUI_Temp_NewNumber = (input_number / 1000)
	elseif input_number > 10000 then
	    RoCUI_Temp_NewNumber = (input_number / 100)
	elseif input_number > 1000 then
	    RoCUI_Temp_NewNumber = (input_number / 10)
	else
	end
	RoCUI_Temp_NewString = string.format("%.0f", RoCUI_Temp_NewNumber)
    return RoCUI_Temp_NewString
end




---- determin critical strike rating type to use
function RoCUI_Infopanel_UpdateStat_CriticalStrike()
    local RoCUI_Temp_SpellCrit = 0
    local RoCUI_Temp_MinimumCrit = 0
	local RoCUI_SpellCrit_Final = 0
	local RoCUI_MeleeCrit_Final = 0
	local RoCUI_RangedCrit_Final = 0
	local RoCUI_Rating = 0
	
	for i=2, 7 do
		RoCUI_Temp_SpellCrit = GetSpellCritChance(i)
		if i == 2 then
		    RoCUI_Temp_MinimumCrit = RoCUI_Temp_SpellCrit
		else
		    RoCUI_Temp_MinimumCrit = min(RoCUI_Temp_MinimumCrit, RoCUI_Temp_SpellCrit)
		end
	end
	
	RoCUI_MeleeCrit_Final = GetCritChance()
	RoCUI_RangedCrit_Final = GetRangedCritChance()
	RoCUI_SpellCrit_Final = RoCUI_Temp_MinimumCrit	

	if (RoCUI_SpellCrit_Final >= RoCUI_RangedCrit_Final and RoCUI_SpellCrit_Final >= RoCUI_MeleeCrit_Final) then
		RoCUI_Rating = CR_CRIT_SPELL
	elseif (RoCUI_RangedCrit_Final >= RoCUI_MeleeCrit_Final) then
		RoCUI_Rating = CR_CRIT_RANGED
	else
		RoCUI_Rating = CR_CRIT_MELEE
	end
	
	return RoCUI_Rating
end




---- handle the non-percentage numbers
function RoCUI_Infopanel_UpdateStat_RawNumbers(input_number, input_type)
    local RoCUI_Temp_Number = 0

    if input_type == "CR" then
	    RoCUI_Temp_Number = GetCombatRating(input_number)
	elseif input_type == "PR" then
        RoCUI_Temp_Number = select(1, UnitStat("player", input_number))
	elseif input_type == "AR" then
        RoCUI_Temp_Number = select(2, UnitArmor("player"))
	else
	end

    return RoCUI_Temp_Number
end




---- calculate each individual stat
function RoCUI_Infopanel_UpdateStat_NumberAndName(input_ID, input_type)
    local RoCUI_Temp_Number = 0
	local RoCUI_Temp_Armor = 0
	local RoCUI_Temp_Armor2 = 0
	local RoCUI_Temp_Armor3 = 0
	local RoCUI_Temp_Resilience = 0
	local RoCUI_Temp_Name = ""
    local RoCUI_Temp_CriticalStrikeRating = 0
	local RoCUI_Temp_Ranged = false
	local RoCUI_Temp_Spellpower = 0
	local RoCUI_Number_Final = 0
	local RoCUI_IsPercentage = false

    if input_type == "damage" then
	    if input_ID == 1 then
	    elseif input_ID == 2 then
		    RoCUI_Temp_Name = ATTACK_POWER_TOOLTIP
            RoCUI_Temp_Ranged = IsRangedWeapon()
	        if RoCUI_Temp_Ranged == true then
		        RoCUI_Number_Final = UnitRangedAttackPower("player")
	        else
	            RoCUI_Number_Final = UnitAttackPower("player")
	        end
	    elseif input_ID == 3 then
		    RoCUI_Temp_Name = STAT_SPELLPOWER
			for i=2, 7 do
			    local RoCUI_Temp_MagicSchoolDamage = GetSpellBonusDamage(i)
				if i == 2 then
				    RoCUI_Temp_Spellpower = RoCUI_Temp_MagicSchoolDamage
				else
				    RoCUI_Temp_Spellpower = min(RoCUI_Temp_Spellpower, RoCUI_Temp_MagicSchoolDamage)
				end
			end
			RoCUI_Number_Final = RoCUI_Temp_Spellpower
		else
		end
	elseif input_type == "armor" then
	    if input_ID == 1 then
		    RoCUI_Temp_Name = ARMOR
			if RoCUIDB_Options["Infopanel_TextFormatting_Stats_Percentage"] == true then
		        RoCUI_Temp_Armor = select(2, UnitArmor("player"))
			    RoCUI_Temp_Armor2 = C_PaperDollInfo.GetArmorEffectiveness(RoCUI_Temp_Armor, UnitEffectiveLevel("player"))
			    RoCUI_Temp_Armor3 = RoCUI_Temp_Armor2*100
			    RoCUI_Number_Final = (string.format("%.0f", RoCUI_Temp_Armor3).."%")
				RoCUI_IsPercentage = true
			else
			    RoCUI_Number_Final = RoCUI_Infopanel_UpdateStat_RawNumbers(0, "AR")
			end
	    elseif input_ID == 2 then
		    RoCUI_Temp_Name = DODGE
            if RoCUIDB_Options["Infopanel_TextFormatting_Stats_Percentage"] == true then
		        RoCUI_Temp_Number = GetDodgeChance()
			    RoCUI_Number_Final = (string.format("%.0f", RoCUI_Temp_Number).."%")
				RoCUI_IsPercentage = true
			else
			    RoCUI_Number_Final = RoCUI_Infopanel_UpdateStat_RawNumbers(CR_DODGE, "CR")
			end
	    elseif input_ID == 3 then
		    RoCUI_Temp_Name = PARRY
            if RoCUIDB_Options["Infopanel_TextFormatting_Stats_Percentage"] == true then
		        RoCUI_Temp_Number = GetParryChance()
			    RoCUI_Number_Final = (string.format("%.0f", RoCUI_Temp_Number).."%")
				RoCUI_IsPercentage = true
			else
			    RoCUI_Number_Final = RoCUI_Infopanel_UpdateStat_RawNumbers(CR_PARRY, "CR")
			end
	    elseif input_ID == 4 then
		    RoCUI_Temp_Name = BLOCK
            if RoCUIDB_Options["Infopanel_TextFormatting_Stats_Percentage"] == true then
		        RoCUI_Temp_Number = GetBlockChance()
			    RoCUI_Number_Final = (string.format("%.0f", RoCUI_Temp_Number).."%")
				RoCUI_IsPercentage = true
			else
			    RoCUI_Number_Final = RoCUI_Infopanel_UpdateStat_RawNumbers(CR_BLOCK, "CR")
			end
	    elseif input_ID == 5 then
		    RoCUI_Temp_Name = STAT_AVOIDANCE
            if RoCUIDB_Options["Infopanel_TextFormatting_Stats_Percentage"] == true then
		        RoCUI_Temp_Number = GetAvoidance()
			    RoCUI_Number_Final = (string.format("%.0f", RoCUI_Temp_Number).."%")
				RoCUI_IsPercentage = true
			else
			    RoCUI_Number_Final = RoCUI_Infopanel_UpdateStat_RawNumbers(CR_AVOIDANCE, "CR")
			end
	    elseif input_ID == 6 then
		    RoCUI_Temp_Name = COMBAT_RATING_NAME2
			if RoCUIDB_Options["Infopanel_TextFormatting_Stats_Percentage"] == true then
                RoCUI_Temp_Number = GetCombatRatingBonus(CR_DEFENSE_SKILL)           
			    RoCUI_Number_Final = (string.format("%.0f", RoCUI_Temp_Number).."%")
				RoCUI_IsPercentage = true
			else
			    RoCUI_Number_Final = RoCUI_Infopanel_UpdateStat_RawNumbers(CR_DEFENSE_SKILL, "CR")
			end
	    elseif input_ID == 7 then
		    RoCUI_Temp_Name = RESILIENCE
			if RoCUIDB_Options["Infopanel_TextFormatting_Stats_Percentage"] == true then
                RoCUI_Temp_Number = GetCombatRatingBonus(CR_RESILIENCE_CRIT_TAKEN)
			    RoCUI_Number_Final = (string.format("%.0f", RoCUI_Temp_Number).."%")
				RoCUI_IsPercentage = true
			else
			    RoCUI_Number_Final = RoCUI_Infopanel_UpdateStat_RawNumbers(CR_RESILIENCE_CRIT_TAKEN, "CR")
			end
		else
		end
	elseif input_type == "other" then
	    if input_ID == 1 then
            RoCUI_Temp_Name = SPEC_FRAME_PRIMARY_STAT_STRENGTH
			RoCUI_Number_Final = RoCUI_Infopanel_UpdateStat_RawNumbers(1, "PR")
	    elseif input_ID == 2 then
            RoCUI_Temp_Name = SPEC_FRAME_PRIMARY_STAT_AGILITY
			RoCUI_Number_Final = RoCUI_Infopanel_UpdateStat_RawNumbers(2, "PR")
	    elseif input_ID == 3 then
            RoCUI_Temp_Name = SPEC_FRAME_PRIMARY_STAT_INTELLECT
			RoCUI_Number_Final = RoCUI_Infopanel_UpdateStat_RawNumbers(4, "PR")
	    elseif input_ID == 4 then
            RoCUI_Temp_Name = SPELL_STAT3_NAME
			RoCUI_Number_Final = RoCUI_Infopanel_UpdateStat_RawNumbers(3, "PR")
	    elseif input_ID == 5 then
            RoCUI_Temp_Name = STAT_CRITICAL_STRIKE
			RoCUI_Temp_CriticalStrikeRating = RoCUI_Infopanel_UpdateStat_CriticalStrike()
            if RoCUIDB_Options["Infopanel_TextFormatting_Stats_Percentage"] == true then
		        RoCUI_Temp_Number = GetCritChance()
			    RoCUI_Number_Final = (string.format("%.0f", RoCUI_Temp_Number).."%")
				RoCUI_IsPercentage = true
			else
			    RoCUI_Number_Final = RoCUI_Infopanel_UpdateStat_RawNumbers(RoCUI_Temp_CriticalStrikeRating, "CR")
			end
	    elseif input_ID == 6 then
            RoCUI_Temp_Name = STAT_HASTE
            if RoCUIDB_Options["Infopanel_TextFormatting_Stats_Percentage"] == true then
		        RoCUI_Temp_Number = GetHaste()
			    RoCUI_Number_Final = (string.format("%.0f", RoCUI_Temp_Number).."%")
				RoCUI_IsPercentage = true
			else
			    RoCUI_Number_Final = RoCUI_Infopanel_UpdateStat_RawNumbers(CR_HASTE_MELEE, "CR")
			end
	    elseif input_ID == 7 then
            RoCUI_Temp_Name = STAT_VERSATILITY
			if RoCUIDB_Options["Infopanel_TextFormatting_Stats_Percentage"] == true then
		        RoCUI_Temp_Number = GetCombatRatingBonus(CR_VERSATILITY_DAMAGE_DONE) + GetVersatilityBonus(CR_VERSATILITY_DAMAGE_DONE)
			    RoCUI_Number_Final = (string.format("%.0f", RoCUI_Temp_Number).."%")
				RoCUI_IsPercentage = true
			else
			    RoCUI_Number_Final = RoCUI_Infopanel_UpdateStat_RawNumbers(CR_VERSATILITY_DAMAGE_DONE, "CR")
			end
	    elseif input_ID == 8 then
            RoCUI_Temp_Name = STAT_MASTERY
			if RoCUIDB_Options["Infopanel_TextFormatting_Stats_Percentage"] == true then
		        RoCUI_Temp_Number = select(1, GetMasteryEffect())
			    RoCUI_Number_Final = (string.format("%.0f", RoCUI_Temp_Number).."%")
				RoCUI_IsPercentage = true
			else
			    RoCUI_Number_Final = RoCUI_Infopanel_UpdateStat_RawNumbers(CR_MASTERY, "CR")
			end
	    elseif input_ID == 9 then
            RoCUI_Temp_Name = STAT_LIFESTEAL
			if RoCUIDB_Options["Infopanel_TextFormatting_Stats_Percentage"] == true then
		        RoCUI_Temp_Number = GetLifesteal()
			    RoCUI_Number_Final = (string.format("%.0f", RoCUI_Temp_Number).."%")
				RoCUI_IsPercentage = true
			else
			    RoCUI_Number_Final = RoCUI_Infopanel_UpdateStat_RawNumbers(CR_LIFESTEAL, "CR")
			end
	    elseif input_ID == 10 then
            RoCUI_Temp_Name = STAT_SPEED
			if RoCUIDB_Options["Infopanel_TextFormatting_Stats_Percentage"] == true then
				RoCUI_Temp_Number = GetCombatRatingBonus(CR_SPEED)
			    RoCUI_Number_Final = (string.format("%.0f", RoCUI_Temp_Number).."%")
				RoCUI_IsPercentage = true
			else
			    RoCUI_Number_Final = RoCUI_Infopanel_UpdateStat_RawNumbers(CR_SPEED, "CR")
			end
		else
		end
	else
	end

    return RoCUI_Number_Final, RoCUI_Temp_Name, RoCUI_IsPercentage
end




---- create the fontstrings for the infopanel
function RoCUI_Infopanel_UpdateStatText()

    local RoCUI_Color = CreateColor(0.989, 0.828, 0.071)

    local RoCUI_Temp_Weapon_Choice = 1
	local RoCUI_Temp_Weapon_Tag = ""
    local RoCUI_Temp_Weapon_Name = ""
    local RoCUI_Temp_Weapon_Number = 0
	local RoCUI_Temp_Weapon_Number_Final = ""
    local RoCUI_Temp_Weapon_Number_Random1 = 0
    local RoCUI_Temp_Weapon_Number_Random2 = 0
    local RoCUI_Temp_Weapon_Final = ""

	local RoCUI_Temp_Armor_Choice = 1
	local RoCUI_Temp_Armor_Tag = ""
    local RoCUI_Temp_Armor_Name = ""
    local RoCUI_Temp_Armor_Number = 0
	local RoCUI_Temp_Armor_Number_Final = ""
    local RoCUI_Temp_Armor_Final = ""

	local RoCUI_Temp_Stats_Choice = 1
	local RoCUI_Temp_Stats_Tag = ""
    local RoCUI_Temp_Stats_Name = ""
    local RoCUI_Temp_Stats_Number = 0
    local RoCUI_Temp_Stats_Temp = ""
    local RoCUI_Temp_Stats_Final = ""
	
	local RoCUI_OutputIsPercentage = false


    ---- weapons aka damage
	RoCUI_Temp_Weapon_Choice = RoCUIDB_Options["Infopanel_StatType_Offensive"]
	if RoCUI_Temp_Weapon_Choice == nil then
        RoCUI_Temp_Weapon_Choice = 1
	end
	
	if RoCUI_Temp_Weapon_Choice == 1 then
	    RoCUI_Temp_Weapon_Name = WEAPON
        local RoCUI_Temp_Ranged = IsRangedWeapon()
		local RoCUI_Temp_MinDamage = 0
		local RoCUI_Temp_MaxDamage = 0
		local RoCUI_MinDamage_Final = 0
		local RoCUI_MaxDamage_Final = 0

	    if RoCUI_Temp_Ranged == true then
		    RoCUI_Temp_MinDamage = select(2, UnitRangedDamage("player"))
		    RoCUI_Temp_MaxDamage = select(3, UnitRangedDamage("player"))
	    else
		    RoCUI_Temp_MinDamage = select(1, UnitDamage("player"))
		    RoCUI_Temp_MaxDamage = select(2, UnitDamage("player"))
	    end

	    if RoCUIDB_Options["Infopanel_TextFormatting_Stats_Abbreviate"] == true then
			if RoCUI_GameVersion == 3 then
	            RoCUI_MinDamage_Final = AbbreviateNumbers(RoCUI_Temp_MinDamage, RoCUI_CustomAbbreviationData_Infopanel_WeaponDamage)
		        RoCUI_MaxDamage_Final = AbbreviateNumbers(RoCUI_Temp_MaxDamage, RoCUI_CustomAbbreviationData_Infopanel_WeaponDamage)
	        else
			    RoCUI_MinDamage_Final = RoCUI_ShortenNumber_Infopanel(RoCUI_Temp_MinDamage)
		        RoCUI_MaxDamage_Final = RoCUI_ShortenNumber_Infopanel(RoCUI_Temp_MaxDamage)
	        end
		else
		    RoCUI_MinDamage_Final = string.format("%.0f", RoCUI_Temp_MinDamage)
		    RoCUI_MaxDamage_Final = string.format("%.0f", RoCUI_Temp_MaxDamage)
		end

		RoCUI_Temp_Weapon_Final = (RoCUI_Color:WrapTextInColorCode(RoCUI_Temp_Weapon_Name..":").."\n "..RoCUI_MinDamage_Final.." - "..RoCUI_MaxDamage_Final)

	else
        RoCUI_Temp_Weapon_Number, RoCUI_Temp_Weapon_Name, RoCUI_OutputIsPercentage = RoCUI_Infopanel_UpdateStat_NumberAndName(RoCUI_Temp_Weapon_Choice, "damage")

	    if RoCUIDB_Options["Infopanel_TextFormatting_Stats_Abbreviate"] == true then
			if RoCUI_GameVersion == 3 then
	            RoCUI_Temp_Weapon_Number_Final = AbbreviateNumbers(RoCUI_Temp_Weapon_Number, RoCUI_CustomAbbreviationData_Infopanel)
	        else
			    RoCUI_Temp_Weapon_Number_Final = RoCUI_ShortenNumber_Infopanel(RoCUI_Temp_Weapon_Number)
	        end
		else
		    RoCUI_Temp_Weapon_Number_Final = string.format("%.0f", RoCUI_Temp_Weapon_Number)
		end

        RoCUI_Temp_Weapon_Final = (RoCUI_Color:WrapTextInColorCode(RoCUI_Temp_Weapon_Name..":").."\n "..RoCUI_Temp_Weapon_Number_Final)
	end


    ---- armor
	RoCUI_Temp_Armor_Choice = RoCUIDB_Options["Infopanel_StatType_Defensive"]
	if RoCUI_Temp_Armor_Choice == nil then
        RoCUI_Temp_Armor_Choice = 1
	end
    RoCUI_Temp_Armor_Number, RoCUI_Temp_Armor_Name, RoCUI_OutputIsPercentage = RoCUI_Infopanel_UpdateStat_NumberAndName(RoCUI_Temp_Armor_Choice, "armor")

    if RoCUI_OutputIsPercentage == true then
        RoCUI_Temp_Armor_Final = (RoCUI_Color:WrapTextInColorCode(RoCUI_Temp_Armor_Name..":").."\n "..RoCUI_Temp_Armor_Number)
	else
	    if RoCUIDB_Options["Infopanel_TextFormatting_Stats_Abbreviate"] == true then
		    if RoCUI_GameVersion == 3 then
	            RoCUI_Temp_Armor_Number_Final = AbbreviateNumbers(RoCUI_Temp_Armor_Number, RoCUI_CustomAbbreviationData_Infopanel)
	        else
			    RoCUI_Temp_Armor_Number_Final = RoCUI_ShortenNumber_Infopanel(RoCUI_Temp_Armor_Number)
	        end
	    else
		    RoCUI_Temp_Armor_Number_Final = string.format("%.0f", RoCUI_Temp_Armor_Number)
	    end
	
        RoCUI_Temp_Armor_Final = (RoCUI_Color:WrapTextInColorCode(RoCUI_Temp_Armor_Name..":").."\n "..RoCUI_Temp_Armor_Number_Final)
	end


    ---- other stats
	for i=1, 3 do
	    local RoCUI_Temp_OptionsString = ("Infopanel_StatType_Other_"..tostring(i))
	    local RoCUI_Temp_Other_Choice = RoCUIDB_Options[RoCUI_Temp_OptionsString]
	    if RoCUI_Temp_Other_Choice == nil then
            RoCUI_Temp_Other_Choice = 1
	    end
		local RoCUI_Temp_Other_Number = 0
		local RoCUI_Temp_Other_Number_Final = ""
		local RoCUI_Temp_Other_Name = ""
		local RoCUI_OutputPercentage = false
        RoCUI_Temp_Other_Number, RoCUI_Temp_Other_Name, RoCUI_OutputPercentage = RoCUI_Infopanel_UpdateStat_NumberAndName(RoCUI_Temp_Other_Choice, "other")
		
        if RoCUI_OutputPercentage == true then
		    local RoCUI_Temp_Other_String = (RoCUI_Color:WrapTextInColorCode(RoCUI_Temp_Other_Name..":").."\n "..RoCUI_Temp_Other_Number.."\n\n")
		    RoCUI_Temp_Stats_Final = (RoCUI_Temp_Stats_Final..RoCUI_Temp_Other_String)
	    else
			if RoCUIDB_Options["Infopanel_TextFormatting_Stats_Abbreviate"] == true then
		        if RoCUI_GameVersion == 3 then
	                RoCUI_Temp_Other_Number_Final = AbbreviateNumbers(RoCUI_Temp_Other_Number, RoCUI_CustomAbbreviationData_Infopanel)
	            else
			        RoCUI_Temp_Other_Number_Final = RoCUI_ShortenNumber_Infopanel(RoCUI_Temp_Other_Number)
	            end
	        else
		        RoCUI_Temp_Other_Number_Final = string.format("%.0f", RoCUI_Temp_Other_Number)
	        end
		
		
		    local RoCUI_Temp_Other_String = (RoCUI_Color:WrapTextInColorCode(RoCUI_Temp_Other_Name..":").."\n "..RoCUI_Temp_Other_Number_Final.."\n\n")
		    RoCUI_Temp_Stats_Final = (RoCUI_Temp_Stats_Final..RoCUI_Temp_Other_String)
	    end

	end


    ---- update infopanel
    RoCUI_CustomFrame_infoplayer_weapon_title:SetText(RoCUI_Temp_Weapon_Final)
    RoCUI_CustomFrame_infoplayer_armor_title:SetText(RoCUI_Temp_Armor_Final)
    RoCUI_CustomFrame_infoplayer_stats_title:SetText(RoCUI_Temp_Stats_Final)
end