
-- portrait image
function RoCUI_PortraitUpdate()
    SetPortraitTexture(RoCUI_CustomFrame_Texture_portraitplayerrender, "player", false)
end

RoCUI_Event_PortraitUpdate = CreateFrame("Frame")
RoCUI_Event_PortraitUpdate:RegisterEvent("PORTRAITS_UPDATED")
RoCUI_Event_PortraitUpdate:SetScript("OnEvent", function(_, event)
    RoCUI_PortraitUpdate()
end)




-- portrait health value
function RoCUI_UpdatePlayerStats_Health()
    local RoCUI_Temp_PlayerHealth_Current = UnitHealth("player")
    local RoCUI_Temp_PlayerHealth_Maximum = UnitHealthMax("player")
	
	RoCUI_CustomFrame_Portrait_Health:SetText(RoCUI_Temp_PlayerHealth_Current.." / "..RoCUI_Temp_PlayerHealth_Maximum)
end

RoCUI_Event_UpdatePlayerStats_Health = CreateFrame("Frame")
RoCUI_Event_UpdatePlayerStats_Health:RegisterEvent("PLAYER_ENTERING_WORLD")
RoCUI_Event_UpdatePlayerStats_Health:RegisterUnitEvent("UNIT_HEALTH", "player")
RoCUI_Event_UpdatePlayerStats_Health:SetScript("OnEvent", function(_, event)
    RoCUI_UpdatePlayerStats_Health()
end)




-- portrait mana value
function RoCUI_UpdatePlayerStats_Mana()
    local RoCUI_Temp_PlayerMana_Current = 0
    local RoCUI_Temp_PlayerMana_Maximum = 0
	
	if RoCUIDB_Options["Portrait_PowerDisplayType"] == 50 then
	    RoCUI_Temp_PlayerMana_Current = UnitPower("player")
        RoCUI_Temp_PlayerMana_Maximum = UnitPowerMax("player")
	else
        RoCUI_Temp_PlayerMana_Current = UnitPower("player", RoCUIDB_Options["Portrait_PowerDisplayType"])
        RoCUI_Temp_PlayerMana_Maximum = UnitPowerMax("player", RoCUIDB_Options["Portrait_PowerDisplayType"])
	end
	
	RoCUI_CustomFrame_Portrait_Mana:SetText(RoCUI_Temp_PlayerMana_Current.." / "..RoCUI_Temp_PlayerMana_Maximum)
end

RoCUI_Event_UpdatePlayerStats_Mana = CreateFrame("Frame")
RoCUI_Event_UpdatePlayerStats_Mana:RegisterEvent("PLAYER_ENTERING_WORLD")
RoCUI_Event_UpdatePlayerStats_Mana:RegisterUnitEvent("UNIT_POWER_UPDATE", "player")
RoCUI_Event_UpdatePlayerStats_Mana:RegisterUnitEvent("UNIT_DISPLAYPOWER", "player")
RoCUI_Event_UpdatePlayerStats_Mana:SetScript("OnEvent", function(_, event)
    RoCUI_UpdatePlayerStats_Mana()
end)