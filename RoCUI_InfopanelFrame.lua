-- infopanel frame


---- weapon and armor icon
function RoCUI_Infopanel_UpdateEquipmentIcon(input_id, input_icon, input_quality, input_slotID)
    local RoCUI_ItemID = input_id
    local RoCUI_ItemIcon = input_icon
    local RoCUI_ItemQuality = input_quality
	local RoCUI_ItemClassID = ""
	local RoCUI_ItemClassIDString = ""
    local RoCUI_ItemSubclassID = ""
    local RoCUI_ItemSubclassIDString = ""
	local RoCUI_ItemQualityString = ""
    local RoCUI_FinalString = ""

    if RoCUI_ItemIcon == nil then
	    RoCUI_ItemIcon = "Interface\\AddOns\\RoCUI\\images\\infopanel\\placeholder"
    end
    if RoCUI_ItemQuality == nil then
	    RoCUI_ItemQuality = 1
    end


    ---- determine main type (weapon or armor)
    RoCUI_ItemClassID = select(6, C_Item.GetItemInfoInstant(RoCUI_ItemID))





    ---- determine sub type
    RoCUI_ItemSubclassID = select(7, C_Item.GetItemInfoInstant(RoCUI_ItemID))
	RoCUI_ItemSubclassID = RoCUI_ItemSubclassID + 1

    if RoCUI_ItemClassID == 2 then
	    RoCUI_ItemClassIDString = "weapons"
		RoCUI_ItemSubclassIDString = RoCUI_Table_SubitemType_Weapon[RoCUI_ItemSubclassID]
	elseif RoCUI_ItemClassID == 4 then
	    RoCUI_ItemClassIDString = "armor"
		RoCUI_ItemSubclassIDString = RoCUI_Table_SubitemType_Armor[RoCUI_ItemSubclassID]
	end


    ---- generate item quality string.
	---- make poor and heirlooms quality default to common quality. Also, make artifacts use the epic quality color.
    if RoCUI_ItemQuality == 0 then
	    RoCUI_ItemQuality = 1
	elseif RoCUI_ItemQuality == 6 then
	    RoCUI_ItemQuality = 5
	elseif RoCUI_ItemQuality == 7 then
	    RoCUI_ItemQuality = 1
	elseif RoCUI_ItemQuality == 8 then
	    RoCUI_ItemQuality = 1
	end
	
	RoCUI_ItemQualityString = ("_"..tostring(RoCUI_ItemQuality))


    ---- don't include the quality number in the string if it's an armor type and one of the following: libram, idol, totem, sigil, relic
	---- ...or if it's a fishing rod.
	if RoCUI_ItemClassID == 2 then
		if RoCUI_ItemSubclassIDString == "fish" then
			RoCUI_ItemQualityString = ""
		end
	elseif RoCUI_ItemClassID == 4 then
	    for i, v in ipairs(RoCUI_Table_SubitemType_Armor_NoQualityVariants) do
		    if RoCUI_ItemSubclassIDString == v then
			    RoCUI_ItemQualityString = ""
			end
		end
	else
	end


	---- generate filepath
	RoCUI_FinalString = ("Interface\\AddOns\\RoCUI\\images\\infopanel_"..RoCUI_ItemClassIDString.."\\"..RoCUI_ItemSubclassIDString..RoCUI_ItemQualityString)
    if RoCUIDB_Options["Infopanel_IconPreference"] == false then
        RoCUI_FinalString = RoCUI_ItemIcon
	end

    local RoCUI_Backdrop = RoCUI_UpdateBackdrop_Infopanel(RoCUI_FinalString)
    if input_slotID == "weapon" then
	    RoCUI_CustomFrame_infoplayer_weapon_icon:SetTexture(RoCUI_FinalString)
	elseif input_slotID == "armor" then
	    RoCUI_CustomFrame_infoplayer_armor_icon:SetTexture(RoCUI_FinalString)
	else
	end
end




---- weapon and armor icon (but the slot is empty)
function RoCUI_Infopanel_UpdateEquipmentIconEmpty(input_slotID)
    if input_slotID == "weapon" then
	    RoCUI_CustomFrame_infoplayer_weapon_icon:SetTexture("Interface\\AddOns\\RoCUI\\images\\infopanel_weapons\\unarmed")
	elseif input_slotID == "armor" then
	    RoCUI_CustomFrame_infoplayer_armor_icon:SetTexture("Interface\\AddOns\\RoCUI\\images\\infopanel_armor\\unarmored")
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
	    local RoCUI_Temp_ItemID = C_Item.GetItemID(itemLoc)
	    local RoCUI_Temp_ItemIcon = C_Item.GetItemIcon(itemLoc)
	    local RoCUI_Temp_ItemQuality = C_Item.GetItemQuality(itemLoc)
        RoCUI_Infopanel_UpdateEquipmentIcon(RoCUI_Temp_ItemID, RoCUI_Temp_ItemIcon, RoCUI_Temp_ItemQuality, input_slotID)
	else
	    RoCUI_Infopanel_UpdateEquipmentIconEmpty(input_slotID)
    end
end




---- stats icon
function RoCUI_Infopanel_UpdateStatIcon()
	local RoCUI_Temp_Specialization = C_SpecializationInfo.GetSpecialization()
    local RoCUI_Temp_PrimaryStat = select(6, C_SpecializationInfo.GetSpecializationInfo(RoCUI_Temp_Specialization))
    local RoCUI_Temp_SpecializationIcon = select(4, C_SpecializationInfo.GetSpecializationInfo(RoCUI_Temp_Specialization))
	local RoCUI_Temp_ClassID = select(3, UnitClass("player"))
	local RoCUI_Temp_ClassIDIcon = RoCUI_Table_ClassIcons[RoCUI_Temp_ClassID]
	local RoCUI_Temp_Classic_PrimaryStatIcon = RoCUI_Table_Classic_PrimaryStat[RoCUI_Temp_ClassID]
    local RoCUI_Temp_Statname = ""

    ---- determine primary stat type
    if RoCUI_Temp_PrimaryStat == 1 then
        RoCUI_Temp_Statname = "stats_str"
	elseif RoCUI_Temp_PrimaryStat == 2 then
        RoCUI_Temp_Statname = "stats_agi"
	elseif RoCUI_Temp_PrimaryStat == 4 then
        RoCUI_Temp_Statname = "stats_int"
	else
	end

	if RoCUI_GameVersion == 1 then
	    RoCUI_Temp_Statname = RoCUI_Temp_Classic_PrimaryStatIcon
	end

	---- generate filepath
	RoCUI_FinalString = ("Interface\\AddOns\\RoCUI\\images\\infopanel\\"..RoCUI_Temp_Statname)
    if RoCUIDB_Options["Infopanel_IconPreference"] == false then
        if RoCUI_GameVersion == 1 then
            RoCUI_FinalString = RoCUI_Temp_ClassIDIcon
        else
		    RoCUI_FinalString = RoCUI_Temp_SpecializationIcon
        end
		
	end
	RoCUI_CustomFrame_infoplayer_stats_icon:SetTexture(RoCUI_FinalString)
end






function RoCUI_Infopanel_UpdateDamageAndArmorNumbers()

end