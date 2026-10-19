---- determin critical strike rating type to use
function RoCUI_UnitStats_CriticalStrike()
    local SpellCrit = 0
    local SpellCrit_Minimum = 0
	local SpellCrit_Final = 0
	local MeleeCrit_Final = 0
	local RangedCrit_Final = 0
	local Rating = 11
    local SecretIsActive = false

	
    for i=2, 7 do
        SpellCrit = GetSpellCritChance(i)
        if issecretvalue(SpellCrit) == true then
		    SpellCrit = 0
            SecretIsActive = true
			break
        else
            if i == 2 then
                SpellCrit_Minimum = SpellCrit
            else
                SpellCrit_Minimum = min(SpellCrit_Minimum, SpellCrit)
            end
		end
    end

	
	MeleeCrit_Final = GetCritChance()
	RangedCrit_Final = GetRangedCritChance()
	SpellCrit_Final = SpellCrit_Minimum	
    if hasanysecretvalues(MeleeCrit_Final, RangedCrit_Final, SpellCrit_Final) == true then
        SecretIsActive = true
	end

    if SecretIsActive == true then
	    Rating = 11
	else
        if (SpellCrit_Final >= RangedCrit_Final and SpellCrit_Final >= MeleeCrit_Final) then
            Rating = 11
        elseif (RangedCrit_Final >= MeleeCrit_Final) then
            Rating = 10
        else
            Rating = 9
        end
	end

	return Rating
end




function RoCUI_UnitStats_WeaponDamage()
    local AttackPower = 0
    local SecretIsActive = false

    if IsRangedWeapon() == true then
        AttackPower = UnitRangedAttackPower("player")
    else
        AttackPower = UnitAttackPower("player")
    end

    if issecretvalue(AttackPower) == true then
        SecretIsActive = true
		AttackPower = 0
    end

    return AttackPower, SecretIsActive
end




function RoCUI_UnitStats_AttackPower()
    local AttackPower = 0
    local SecretIsActive = false

    if IsRangedWeapon() == true then
        AttackPower = UnitRangedAttackPower("player")
    else
        AttackPower = UnitAttackPower("player")
    end

    if issecretvalue(AttackPower) == true then
        SecretIsActive = true
		AttackPower = 0
    end

    return AttackPower, SecretIsActive
end




function RoCUI_UnitStats_SpellPower()
    local Spellpower = 0
    local SecretIsActive = false

    for i=2, 7 do
        local MagicSchoolDamage = GetSpellBonusDamage(i)
        if issecretvalue(MagicSchoolDamage) == true then
		    Spellpower = 0
            SecretIsActive = true
			break
        else
            if i == 2 then
                Spellpower = MagicSchoolDamage
            else
                Spellpower = min(Spellpower, MagicSchoolDamage)
            end
		end
    end

    return Spellpower, SecretIsActive
end




---- handle the non-percentage numbers
function RoCUI_UnitStats_RawNumbers(input_number, input_type, input_enum)
    local RawNumber = 0
    local SecretIsActive = false

    if input_type == "CombatRating" then
	    RawNumber = GetCombatRating(input_number)
	elseif input_type == "PrimaryStat" then
        RawNumber = select(1, UnitStat("player", input_number))
    elseif input_type == "Armor" then
        RawNumber = select(2, UnitArmor("player"))
    elseif input_type == "ElementalResistance" then
        RawNumber = select(3, UnitResistance("player", input_enum))
    elseif input_type == "DefenseForever" then
        RawNumber = select(1, UnitDefenseSkill("player"))
	elseif input_type == "Regular" then
	-- do nothing, only perform the secrec check
	end

	if issecretvalue(RawNumber) == true then
	    RawNumber = 0
		SecretIsActive = true
	end

    return RawNumber, SecretIsActive
end




---- handle percentage numbers (including formatting)
function RoCUI_UnitStats_PercentageNumbers(input_number, input_enum)
    local PercentageNumber = 0
    local PercentageNumberExtra = nil
    local SecretIsActive = false

    if input_number == "Armor" then
        local Armor1 = select(2, UnitArmor("player"))
        if issecretvalue(Armor1) == false then
            local Armor2 = C_PaperDollInfo.GetArmorEffectiveness(Armor1, UnitEffectiveLevel("player"))
			if issecretvalue(Armor2) == false then
			    PercentageNumber = Armor2*100
			else
			    SecretIsActive = true
			end
		else
		    SecretIsActive = true
        end
    elseif input_number == "Versatility" then
        local CombatRating = GetCombatRatingBonus(29)
        if issecretvalue(CombatRating) == false then
            local Bonus = GetVersatilityBonus(29)
			if issecretvalue(Bonus) == false then
                PercentageNumber = (CombatRating + Bonus)
			else
			    SecretIsActive = true
			end
		else
		    SecretIsActive = true
        end
    elseif input_number == "ElementalResistance" then
        local ResistanceValue = select(3, UnitResistance("player", input_enum))
        if issecretvalue(ResistanceValue) == false then
            PercentageNumber = ResistanceValue
		else
		    SecretIsActive = true
        end
    elseif input_number == "CritChanceSpells" then
        local SpellCrit = 0
        for i=2, 7 do
            SpellCrit = GetSpellCritChance(i)
            if issecretvalue(SpellCrit) == true then
			    SecretIsActive = true
                break
            else
                if i == 2 then
                    PercentageNumber = SpellCrit
                else
                    PercentageNumber = min(PercentageNumber, SpellCrit)
                end
			end
        end
    elseif input_number == "HitChanceMelee" then
        local CombatRating = GetCombatRatingBonus(6)
        if issecretvalue(CombatRating) == false then
            local Modifier = GetHitModifier()
			if issecretvalue(Modifier) == false then
                PercentageNumber = (CombatRating + Modifier)
			else
			    SecretIsActive = true
			end
		else
		    SecretIsActive = true
        end
    elseif input_number == "HitChanceRanged" then
        local CombatRating = GetCombatRatingBonus(7)
        if issecretvalue(CombatRating) == false then
            local Modifier = GetHitModifier()
			if issecretvalue(Modifier) == false then
                PercentageNumber = (CombatRating + Modifier)
			else
			    SecretIsActive = true
			end
		else
		    SecretIsActive = true
        end
    elseif input_number == "HitChanceSpells" then
        local CombatRating = GetCombatRatingBonus(8)
        if issecretvalue(CombatRating) == false then
            local Modifier = GetSpellHitModifier()
			if issecretvalue(Modifier) == false then
                PercentageNumber = (CombatRating + Modifier)
			else
			    SecretIsActive = true
			end
		else
		    SecretIsActive = true
        end
    elseif input_number == "AttackSpeed" then
        local MainHandSpeed, OffHandSpeed = UnitAttackSpeed("player")
        if hasanysecretvalues(MainHandSpeed, OffHandSpeed) == false then
            PercentageNumber = MainHandSpeed
            PercentageNumberExtra = OffHandSpeed
		else
		    SecretIsActive = true
		end
    elseif input_number == "ResilienceMoP" then
        local CombatRating = GetCombatRatingBonus(16)
        if issecretvalue(CombatRating) == false then
            local Modifier = GetModResilienceDamageReduction()
			if issecretvalue(Modifier) == false then
                PercentageNumber = (CombatRating + Modifier)
			else
			    SecretIsActive = true
			end
		else
		    SecretIsActive = true
        end
    elseif input_number == "DefenseForever" then
        local DefenseBase = select(1, UnitDefenseSkill("player"))
        if issecretvalue(DefenseBase) == false then
            local DefenseModifier = select(2, UnitDefenseSkill("player"))
			if issecretvalue(DefenseModifier) == false then
                PercentageNumber = (DefenseBase + DefenseModifier)
			else
			    SecretIsActive = true
			end
		else
		    SecretIsActive = true
        end
    else
        if issecretvalue(input_number) == false then
            PercentageNumber = input_number
		else
            SecretIsActive = true
        end
    end

    local Textstring = (string.format("%.0f", PercentageNumber).."%")
	if PercentageNumberExtra ~= nil then
        Textstring = (string.format("%.0f", PercentageNumber).."%".." / "..string.format("%.0f", PercentageNumberExtra).."%")
	end

    return Textstring, true, SecretIsActive
end




---- calculate each individual stat
function RoCUI_UnitStats_NumberAndName(input_ID, input_type)
    local Number_Temp = 0
	local Resilience = 0
    local StatVariableName = ("RoCUI_Text_Options_OptionsMenu_Infopanel_StatType_"..input_ID)
	local StatName = _G[StatVariableName]
    local CriticalStrikeRating = 0
	local Ranged = false
	local Spellpower = 0
	local Number_Final = 0
	local IsPercentage = false
    local SecretIsActive = false

    if input_type == "damage" then
        if input_ID == "Weapon" then
        elseif input_ID == "AttackPower" then
            Number_Final, SecretIsActive = RoCUI_UnitStats_AttackPower()
        elseif input_ID == "SpellPower" then
            Number_Final, SecretIsActive = RoCUI_UnitStats_SpellPower()
        elseif input_ID == "PvPDamage" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Temp = GetPvpPowerDamage()
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers(Number_Temp)
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(27, "CombatRating")
            end
        end
    elseif input_type == "armor" then
        if input_ID == "Armor" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers("Armor")
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(0, "Armor")
            end
        elseif input_ID == "Dodge" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Temp = GetDodgeChance()
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers(Number_Temp)
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(3, "CombatRating")
            end
        elseif input_ID == "Parry" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Temp = GetParryChance()
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers(Number_Temp)
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(4, "CombatRating")
            end
        elseif input_ID == "Block" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Temp = GetBlockChance()
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers(Number_Temp)
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(5, "CombatRating")
            end
        elseif input_ID == "Avoidance" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Temp = GetAvoidance()
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers(Number_Temp)
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(21, "CombatRating")
            end
        elseif input_ID == "Defense" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Temp = GetCombatRatingBonus(2)           
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers(Number_Temp)
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(2, "CombatRating")
            end
        elseif input_ID == "DefenseForever" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then         
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers("DefenseForever")
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(nil, "DefenseForever")
            end
        elseif input_ID == "Resilience" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Temp = GetCombatRatingBonus(15)
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers(Number_Temp)
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(15, "CombatRating")
            end
        elseif input_ID == "ResilienceMoP" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers("ResilienceMoP")
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(16, "CombatRating")
            end
        elseif input_ID == "HolyResistance" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers("ElementalResistance", Enum.Damageclass.Holy)
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(nil, "ElementalResistance", Enum.Damageclass.Holy)
            end
        elseif input_ID == "FireResistance" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers("ElementalResistance", Enum.Damageclass.Fire)
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(nil, "ElementalResistance", Enum.Damageclass.Fire)
            end
        elseif input_ID == "NatureResistance" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers("ElementalResistance", Enum.Damageclass.Nature)
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(nil, "ElementalResistance", Enum.Damageclass.Nature)
            end
        elseif input_ID == "FrostResistance" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers("ElementalResistance", Enum.Damageclass.Frost)
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(nil, "ElementalResistance", Enum.Damageclass.Frost)
            end
        elseif input_ID == "ShadowResistance" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers("ElementalResistance", Enum.Damageclass.Shadow)
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(nil, "ElementalResistance", Enum.Damageclass.Shadow)
            end
        elseif input_ID == "ArcaneResistance" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers("ElementalResistance", Enum.Damageclass.Arcane)
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(nil, "ElementalResistance", Enum.Damageclass.Arcane)
            end
        end
    elseif input_type == "other" then
        if input_ID == "Strength" then
            Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(1, "PrimaryStat")
        elseif input_ID == "Agility" then
            Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(2, "PrimaryStat")
        elseif input_ID == "Intellect" then
            Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(4, "PrimaryStat")
        elseif input_ID == "Stamina" then
            Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(3, "PrimaryStat")
        elseif input_ID == "Spirit" then
            Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(5, "PrimaryStat")
        elseif input_ID == "CriticalStrike" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Temp = GetCritChance()
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers(Number_Temp)
            else
                local CriticalStrikeRating = RoCUI_UnitStats_CriticalStrike()
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(CriticalStrikeRating, "CombatRating")
            end
        elseif input_ID == "Haste" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Temp = GetHaste()
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers(Number_Temp)
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(18, "CombatRating")
            end
        elseif input_ID == "Versatility" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers("Versatility")
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(29, "CombatRating")
            end
        elseif input_ID == "Mastery" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Temp = select(1, GetMasteryEffect())
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers(Number_Temp)
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(26, "CombatRating")
            end
        elseif input_ID == "Leech" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Temp = GetLifesteal()
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers(Number_Temp)
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(17, "CombatRating")
            end
        elseif input_ID == "Speed" then

            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Temp = GetCombatRatingBonus(14)
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers(Number_Temp)
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(14, "CombatRating")
            end
        elseif input_ID == "CritChanceMelee" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Temp = GetCritChance()
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers(Number_Temp)
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(9, "CombatRating")
            end
        elseif input_ID == "CritChanceRanged" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Temp = GetRangedCritChance()
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers(Number_Temp)
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(10, "CombatRating")
            end
        elseif input_ID == "CritChanceSpells" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers("CritChanceSpells")
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(11, "CombatRating")
            end
        elseif input_ID == "HitChanceMelee" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers("HitChanceMelee")
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(6, "CombatRating")
            end
        elseif input_ID == "HitChanceRanged" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers("HitChanceRanged")
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(7, "CombatRating")
            end
        elseif input_ID == "HitChanceSpells" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers("HitChanceSpells")
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(8, "CombatRating")
            end
        elseif input_ID == "ArmorPenetration" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Temp = GetArmorPenetration()
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers(Number_Temp)
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(25, "CombatRating")
            end
        elseif input_ID == "SpellPenetration" then
                Number_Final = GetSpellPenetration()
        elseif input_ID == "AttackSpeed" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers("AttackSpeed")
            else
                if IsRangedWeapon() == true then
                    Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(18, "CombatRating")
                else
                    Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(19, "CombatRating")
                end
            end
        elseif input_ID == "Expertise" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Temp = select(1, GetExpertisePercent())
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers(Number_Temp)
            else
            end
        elseif input_ID == "SpellHealing" then
            Number_Temp = GetSpellBonusHealing()
            Number_Final = RoCUI_UnitStats_RawNumbers(Number_Temp, "Regular")
        elseif input_ID == "PvPHealing" then
            if RoCUI_PV("Load", "Infopanel_StatsPercentage") == true then
                Number_Temp = GetPvpPowerHealing()
                Number_Final, IsPercentage, SecretIsActive = RoCUI_UnitStats_PercentageNumbers(Number_Temp)
            else
                Number_Final, SecretIsActive = RoCUI_UnitStats_RawNumbers(27, "CombatRating")
            end
        end
    end

    return Number_Final, StatName, IsPercentage, SecretIsActive
end




---- create the fontstrings for the infopanel
function RoCUI_UnitStats_UpdateStatText()

    local Textcolor = CreateColor(0.989, 0.828, 0.071)

    local Choice_Weapon = 1
	local Weapon_Name_Temp = ""
    local Weapon_Name = ""
    local Weapon_Number = 0
	local Weapon_Number_Final = ""
    local Weapon_Number_Random1 = 0
    local Weapon_Number_Random2 = 0
    local Textstring_Weapon_Final = ""

	local Choice_Armor = 1
	local Armor_Tag = ""
    local Armor_Name = ""
    local Armor_Number = 0
	local Armor_Number_Final = ""
    local Textstring_Armor_Final = ""

	local Choice_Stats = 1
	local Stats_Tag = ""
    local Stats_Name = ""
    local Stats_Number = 0
    local Stats_Temp = ""
    local Textstring_Stats_Final = ""
	
	local OutputIsPercentage = false
    local SecretIsActive = false


    ---- weapons aka damage
	Choice_Weapon = RoCUI_PV("Load", "Infopanel_StatType_Offensive")
	if Choice_Weapon == nil then
        Choice_Weapon = "Weapon"
	end
	
	if Choice_Weapon == "Weapon" then
	    Weapon_Name = RoCUI_Text_Options_OptionsMenu_Infopanel_StatType_Weapon
		local MinDamage_Temp = 0
		local MaxDamage_Temp = 0
		local MinDamage_Final = 0
		local MaxDamage_Final = 0

	    if IsRangedWeapon() == true then
		    MinDamage_Temp = select(2, UnitRangedDamage("player"))
		    MaxDamage_Temp = select(3, UnitRangedDamage("player"))
	    else
		    MinDamage_Temp = select(1, UnitDamage("player"))
		    MaxDamage_Temp = select(2, UnitDamage("player"))
	    end

        if hasanysecretvalues(MinDamage_Temp, MaxDamage_Temp) == true then
		    MinDamage_Temp = 0
		    MaxDamage_Temp = 0
			SecretIsActive = true
		end

        MinDamage_Final = string.format("%.0f", MinDamage_Temp)
        MaxDamage_Final = string.format("%.0f", MaxDamage_Temp)

		Textstring_Weapon_Final = (Textcolor:WrapTextInColorCode(Weapon_Name..":").."\n "..MinDamage_Final.." - "..MaxDamage_Final)
	elseif Choice_Weapon == "PvPDamage" then
        Weapon_Number, Weapon_Name, OutputIsPercentage, SecretIsActive = RoCUI_UnitStats_NumberAndName(Choice_Weapon, "damage")
        if OutputIsPercentage == true then 
		    Textstring_Weapon_Final = (Textcolor:WrapTextInColorCode(Weapon_Name..":").."\n "..Weapon_Number.."\n\n")
	    else
			if RoCUI_PV("Load", "Infopanel_StatsAbbreviate") == true then
	            Weapon_Number_Final = AbbreviateNumbers(Weapon_Number, RoCUI_Database_AbbreviationData_Infopanel)
	        else
		        Weapon_Number_Final = string.format("%.0f", Weapon_Number)
	        end
            Textstring_Weapon_Final = (Textcolor:WrapTextInColorCode(Weapon_Name..":").."\n "..Weapon_Number_Final.."\n\n")
	    end
    else
        Weapon_Number, Weapon_Name, OutputIsPercentage, SecretIsActive = RoCUI_UnitStats_NumberAndName(Choice_Weapon, "damage")

	    if RoCUI_PV("Load", "Infopanel_StatsAbbreviate") == true then
	        Weapon_Number_Final = AbbreviateNumbers(Weapon_Number, RoCUI_Database_AbbreviationData_Infopanel)
		else
		    Weapon_Number_Final = string.format("%.0f", Weapon_Number)
		end

        Textstring_Weapon_Final = (Textcolor:WrapTextInColorCode(Weapon_Name..":").."\n "..Weapon_Number_Final)
	end


    ---- armor
	Choice_Armor = RoCUI_PV("Load", "Infopanel_StatType_Defensive")
	if Choice_Armor == nil then
        Choice_Armor = "Armor"
	end
    Armor_Number, Armor_Name, OutputIsPercentage, SecretIsActive = RoCUI_UnitStats_NumberAndName(Choice_Armor, "armor")

    if OutputIsPercentage == true then
        Textstring_Armor_Final = (Textcolor:WrapTextInColorCode(Armor_Name..":").."\n "..Armor_Number)
	else
	    if RoCUI_PV("Load", "Infopanel_StatsAbbreviate") == true then
	        Armor_Number_Final = AbbreviateNumbers(Armor_Number, RoCUI_Database_AbbreviationData_Infopanel)
	    else
		    Armor_Number_Final = string.format("%.0f", Armor_Number)
	    end
	
        Textstring_Armor_Final = (Textcolor:WrapTextInColorCode(Armor_Name..":").."\n "..Armor_Number_Final)
	end


    ---- other stats
	for i=1, 3 do
	    local VariableName = ("Infopanel_StatType_Other_"..tostring(i))
	    local OtherStats_Choice = RoCUI_PV("Load", VariableName)
	    if OtherStats_Choice == nil then
		    if i == 1 then
                OtherStats_Choice = "Strength"
			elseif i == 2 then
                OtherStats_Choice = "Agility"
			elseif i == 3 then
                OtherStats_Choice = "Intellect"
			end
	    end
		local OtherStats_Number = 0
		local OtherStats_Number_Final = ""
		local OtherStats_Name = ""
		local OutputPercentage = false
        OtherStats_Number, OtherStats_Name, OutputPercentage, SecretIsActive = RoCUI_UnitStats_NumberAndName(OtherStats_Choice, "other")
		
        if OutputPercentage == true then
		    local OtherStats_Textstring = (Textcolor:WrapTextInColorCode(OtherStats_Name..":").."\n "..OtherStats_Number.."\n\n")
		    Textstring_Stats_Final = (Textstring_Stats_Final..OtherStats_Textstring)
	    else
			if RoCUI_PV("Load", "Infopanel_StatsAbbreviate") == true then
	            OtherStats_Number_Final = AbbreviateNumbers(OtherStats_Number, RoCUI_Database_AbbreviationData_Infopanel)
	        else
		        OtherStats_Number_Final = string.format("%.0f", OtherStats_Number)
	        end
		
		
		    local OtherStats_Textstring = (Textcolor:WrapTextInColorCode(OtherStats_Name..":").."\n "..OtherStats_Number_Final.."\n\n")
		    Textstring_Stats_Final = (Textstring_Stats_Final..OtherStats_Textstring)
	    end

	end


    ---- update infopanel
    if RoCUI_General_CombatCheck() == true then
        RoCUI_CombatLockdown_UpdateAfterCombatEnds = true
        RoCUI_CombatLockdown_SendMessage("Stats")
	elseif SecretIsActive == true then
        RoCUI_CombatLockdown_UpdateAfterCombatEnds = true
        RoCUI_CombatLockdown_SendMessage("Stats")
    else
        RoCUI_Frames_Infopanel["PlayerStats_Offensive"]:SetText(Textstring_Weapon_Final)
        RoCUI_Frames_Infopanel["PlayerStats_Defensive"]:SetText(Textstring_Armor_Final)
        RoCUI_Frames_Infopanel["PlayerStats_Other"]:SetText(Textstring_Stats_Final)
    end

end