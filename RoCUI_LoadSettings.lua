-- The add-on creates all the frames on the "PLAYER_ENTERING_WORLD" event.
-- This way, we can use the settings variables as defaults (if no prior user data exists).

RoCUI_Event_LoadSettings = CreateFrame("Frame")
RoCUI_Event_LoadSettings:RegisterEvent("PLAYER_ENTERING_WORLD")
RoCUI_Event_LoadSettings:SetScript("OnEvent", function(_, event, isInitialLogin, isReloadingUi)
    RoCUI_CreateCustomFramesAfterAddonLoad()
    RoCUI_Event_LoadSettings:UnregisterEvent("PLAYER_ENTERING_WORLD")
end)