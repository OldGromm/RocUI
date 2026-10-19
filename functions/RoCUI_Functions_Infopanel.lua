function RoCUI_Infopanel_UpdatePlayerNameAndTitle()
	local Textstring = ""

    if RoCUI_WoWVersion == "Forever" then
        if RoCUI_PV("Load", "Infopanel_ShowTitle") == true then
            Textstring = UnitPVPName("player")
        else
            if RoCUI_PV("Load", "Infopanel_ForeverName") == 1 then
                Textstring = select(1, UnitNameUnmodified("player"))
            elseif RoCUI_PV("Load", "Infopanel_ForeverName") == 2 then
                Textstring = select(2, UnitNameUnmodified("player"))
            elseif RoCUI_PV("Load", "Infopanel_ForeverName") == 3 then
                Textstring = UnitPVPName("player")
            end
        end
	else
        if RoCUI_PV("Load", "Infopanel_ShowTitle") == true then
            Textstring = UnitPVPName("player")
        else
            Textstring = select(1, UnitNameUnmodified("player"))
        end
	end

	if issecretvalue(Textstring) == false then
        RoCUI_Frames_Infopanel["Player_Name"]:SetTextToFit(Textstring)
	end

end




function RoCUI_Infopanel_UpdatePlayerSpecAndLevel()
    local PlayerLevel = UnitLevel("player")
    local PlayerLoc = PlayerLocation:CreateFromUnit("player")
    local ClassName = select(1, C_PlayerInfo.GetClass(PlayerLoc))
	local Textstring = ""

    if RoCUI_WoWVersion == "Retail" or RoCUI_WoWVersion == "MoP" then
        if RoCUI_PV("Load", "Infopanel_ShowSpecName") == true then
            local Specialization = C_SpecializationInfo.GetSpecialization()
            local SpecName = select(2, C_SpecializationInfo.GetSpecializationInfo(Specialization))
		    Textstring = (LEVEL.." "..tostring(PlayerLevel).." "..SpecName.." "..ClassName)
        else
		    Textstring = (LEVEL.." "..tostring(PlayerLevel).." "..ClassName)
        end
	else
	    Textstring = (LEVEL.." "..tostring(PlayerLevel).." "..ClassName)
	end

    RoCUI_Frames_Infopanel["Player_Spec"]:SetTextToFit(Textstring)
end




function RoCUI_Infopanel_UpdatePlayerExperienceBar()
    local Experience_Current = UnitXP("player")
    local Experience_Next = UnitXPMax("player")
	local Experience_Progress = (Experience_Current / Experience_Next * 100)

	local CurrentPlayerLevel = UnitLevel("player")
	local CurrentExpansionMaxLevel = GetMaxPlayerLevel()
		
	if CurrentPlayerLevel == CurrentExpansionMaxLevel then
	    RoCUI_Frames_Infopanel["Player_Experience"]:SetValue(100)
	else
	    RoCUI_Frames_Infopanel["Player_Experience"]:SetValue(Experience_Progress)
	end
end




function RoCUI_Infopanel_UpdateEquipmentIcon(input_id, input_icon, input_quality, input_slotID)
    local ItemID = input_id
    local ItemIcon = input_icon
    local ItemQuality = input_quality
	local ItemClassID = ""
	local ItemClassIDString = ""
    local ItemSubclassID = ""
    local ItemSubclassIDString = ""
	local ItemQualityString = ""
    local Textstring_Final = ""

    if ItemIcon == nil then
	    ItemIcon = "Interface\\AddOns\\RoCUI\\images\\infopanel\\placeholder"
    end
    if ItemQuality == nil then
	    ItemQuality = 1
    end


    ---- determine main type (weapon or armor)
    ItemClassID = select(6, C_Item.GetItemInfoInstant(ItemID))


    ---- determine sub type
    ItemSubclassID = select(7, C_Item.GetItemInfoInstant(ItemID))
	ItemSubclassID = ItemSubclassID + 1

    if ItemClassID == 2 then
	    ItemClassIDString = "weapons"
		ItemSubclassIDString = RoCUI_Infopanel_SubitemType_Weapon[ItemSubclassID]
	elseif ItemClassID == 4 then
	    ItemClassIDString = "armor"
		ItemSubclassIDString = RoCUI_Infopanel_SubitemType_Armor[ItemSubclassID]
	end


    -- generate item quality string.
	---- make poor and heirlooms quality default to common quality. Also, make artifacts use the epic quality color.
    if ItemQuality == 0 then
	    ItemQuality = 1
	elseif ItemQuality == 6 then
	    ItemQuality = 5
	elseif ItemQuality == 7 then
	    ItemQuality = 1
	elseif ItemQuality == 8 then
	    ItemQuality = 1
	end
	
	ItemQualityString = ("_"..tostring(ItemQuality))


    ---- don't include the quality number in the string if it's an armor type and one of the following:
	---- libram, idol, totem, sigil, relic... or if it's a fishing rod.
	if ItemClassID == 2 then
		if ItemSubclassIDString == "fish" then
			ItemQualityString = ""
		end
	elseif ItemClassID == 4 then
	    for i, v in ipairs(RoCUI_Infopanel_SubitemType_Armor_NoQualityVariants) do
		    if ItemSubclassIDString == v then
			    ItemQualityString = ""
			end
		end
	else
	end


	-- generate filepath
	Textstring_Final = ("Interface\\AddOns\\RoCUI\\images\\infopanel_"..ItemClassIDString.."\\"..ItemSubclassIDString..ItemQualityString)
    if RoCUI_PV("Load", "Infopanel_UseWC3Icons") == false then
        Textstring_Final = ItemIcon
	end


    if input_slotID == "weapon" then
	    RoCUI_Frames_Infopanel["Player_Weapon_Icon"]:SetTexture(Textstring_Final)
	elseif input_slotID == "armor" then
	    RoCUI_Frames_Infopanel["Player_Armor_Icon"]:SetTexture(Textstring_Final)
	else
	end
end




---- weapon and armor icon (but the slot is empty)
function RoCUI_Infopanel_UpdateEquipmentIconEmpty(input_slotID)
    if input_slotID == "weapon" then
	    RoCUI_Frames_Infopanel["Player_Weapon_Icon"]:SetTexture("Interface\\AddOns\\RoCUI\\images\\infopanel_weapons\\unarmed")
	elseif input_slotID == "armor" then
	    RoCUI_Frames_Infopanel["Player_Armor_Icon"]:SetTexture("Interface\\AddOns\\RoCUI\\images\\infopanel_armor\\unarmored")
	else
	end
end




function RoCUI_Infopanel_CheckPlayerEquipment(input_slotID)
    local itemLoc = 0

    if input_slotID == "weapon" then
        itemLoc = ItemLocation:CreateFromEquipmentSlot(INVSLOT_MAINHAND)
    elseif input_slotID == "armor" then
        itemLoc = ItemLocation:CreateFromEquipmentSlot(INVSLOT_CHEST)
    else
    end

    if itemLoc:IsValid() then
	    local ItemID = C_Item.GetItemID(itemLoc)
	    local ItemIcon = C_Item.GetItemIcon(itemLoc)
	    local ItemQuality = C_Item.GetItemQuality(itemLoc)
        RoCUI_Infopanel_UpdateEquipmentIcon(ItemID, ItemIcon, ItemQuality, input_slotID)
	else
	    RoCUI_Infopanel_UpdateEquipmentIconEmpty(input_slotID)
    end
end




---- stats icon
function RoCUI_Infopanel_UpdateStatIcon()
    -- class icon
    local ClassName = select(2, C_PlayerInfo.GetClass(RoCUI_PlayerStats_CurrentPlayer))
    local ClassIconString = ("UI-HUD-UnitFrame-Player-Portrait-ClassIcon-"..ClassName)


    -- specialization icon
	local Specialization = C_SpecializationInfo.GetSpecialization()
    local SpecializationIcon = select(4, C_SpecializationInfo.GetSpecializationInfo(Specialization))
	

    -- primary stat
    local PrimaryStat = select(6, C_SpecializationInfo.GetSpecializationInfo(Specialization))
	if RoCUI_WoWVersion == "Forever" or RoCUI_WoWVersion == "Classic" then
	    PrimaryStat = RoCUI_PlayerStats_ClassicPrimaryStat
	end
    ---- determine primary stat type
	local Textstring_Stat = ""
    if PrimaryStat == 1 then
        Textstring_Stat = "stats_str"
	elseif PrimaryStat == 2 then
        Textstring_Stat = "stats_agi"
	elseif PrimaryStat == 4 then
        Textstring_Stat = "stats_int"
	else
	end
	---- generate filepath
	local Textstring_Final = ("Interface\\AddOns\\RoCUI\\images\\infopanel\\"..Textstring_Stat)


    if RoCUI_PV("Load", "Infopanel_UseWC3Icons") == true then
	    RoCUI_Frames_Infopanel["Player_Stats_Icon"]:SetTexture(Textstring_Final)
	else
	    if RoCUI_WoWVersion == "Retail" or RoCUI_WoWVersion == "MoP" then
		    if RoCUI_PV("Load", "Infopanel_UseSpecIcon") == true then
		        RoCUI_Frames_Infopanel["Player_Stats_Icon"]:SetTexture(SpecializationIcon)
		    else
		        RoCUI_Frames_Infopanel["Player_Stats_Icon"]:SetAtlas(ClassIconString)
		    end
		else
		    RoCUI_Frames_Infopanel["Player_Stats_Icon"]:SetAtlas(ClassIconString)
		end
	end
end