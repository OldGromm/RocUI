function RoCUI_Frames_CreateLockdownMessage()
    -- message frame
    FrameName = (RoCUI_Text_AddonNameAbbreviated.." - "..RoCUI_Text_Options_OptionsMenu_Other_CombatLockdown)
    local CombatLockdownFrame = CreateFrame("Frame", FrameName, UIParent)
    CombatLockdownFrame:SetAllPoints()
    CombatLockdownFrame:SetSize(420, 200)
    CombatLockdownFrame:SetIgnoreParentScale(true)

    local MessageFrame_1 = CombatLockdownFrame:CreateFontString(nil, "OVERLAY", "RoCUICombatLockdown12")
    MessageFrame_1:SetPoint("TOPLEFT", 0, 80)
    MessageFrame_1:SetText("")
    local MessageFrame_2 = CombatLockdownFrame:CreateFontString(nil, "OVERLAY", "RoCUICombatLockdown12")
    MessageFrame_2:SetPoint("TOPLEFT", 0, 40)
    MessageFrame_2:SetText("")
    local MessageFrame_3 = CombatLockdownFrame:CreateFontString(nil, "OVERLAY", "RoCUICombatLockdown12")
    MessageFrame_3:SetPoint("TOPLEFT", 0, 0)
    MessageFrame_3:SetText("")
	RoCUI_Frames_CombatLockdown["Message_1"] = MessageFrame_1
	RoCUI_Frames_CombatLockdown["Message_2"] = MessageFrame_2
	RoCUI_Frames_CombatLockdown["Message_3"] = MessageFrame_3

    local EditMode = CombatLockdownFrame:CreateFontString(nil, "OVERLAY", "RoCUICombatLockdown36")
    EditMode:SetPoint("LEFT", 0, 0)
    EditMode:SetText("")
	RoCUI_Frames_CombatLockdown["EditMode"] = EditMode

end