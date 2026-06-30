-- translation notes:

-- Any of the "_Title" entries cannot be longer than 29 characters.
-- Otherwise, the game will start cutting off the options name.
-- As an example, it cannot be longer than this: -----------------------------

-- For the "Top Menu - Submenu Choices" entries, there is a maximum of 25
-- characters for the regular selection. (This is unlikely to become an issue)
-- The buttons at the top menu itself need a shortened version in case they
-- exceed 9-12 characters, however. It depends on how much space thin letters
-- like i or l are saving space.
-- These entries are marked with an "_Abbreviated" suffix.
-- If both versions of an entry are short to begin with, feele free to use
-- them in both cases.



-- German (Deutsch)
function RoCUI_LoadLanguage_deDE()




-- Options menu
---- Category names
RoCUI_Text_Options_Category_Title = "RoC UI"
RoCUI_Text_Options_Category_General = "Allgemein"
RoCUI_Text_Options_Category_Main = "Hauptfenster"
RoCUI_Text_Options_Category_Inventory = "Inventar"
RoCUI_Text_Options_Category_PlayerPortrait = "Charakterporträt"
RoCUI_Text_Options_Category_PlayerInfo = "Charakterinfo"
RoCUI_Text_Options_Category_Sundial = "Sonnenuhr"
RoCUI_Text_Options_Category_Sound = "Soundeffekte"
RoCUI_Text_Options_Category_Top_01 = "Oben links 1"
RoCUI_Text_Options_Category_Top_02 = "Oben links 2"
RoCUI_Text_Options_Category_Top_03 = "Oben links 3"
RoCUI_Text_Options_Category_Top_04 = "Oben links 4"
RoCUI_Text_Options_Category_Top_05 = "Oben rechts 1"
RoCUI_Text_Options_Category_Top_06 = "Oben rechts 2"
RoCUI_Text_Options_Category_Top_07 = "Oben rechts 3"
RoCUI_Text_Options_Category_Top_08 = "Oben rechts 4"
RoCUI_Text_Options_Category_Additional_01 = "Extrafenster 1"
RoCUI_Text_Options_Category_Additional_02 = "Extrafenster 2"
RoCUI_Text_Options_Category_Additional_03 = "Extrafenster 3"
RoCUI_Text_Options_Category_Additional_04 = "Extrafenster 4"


---- Frames (general)
RoCUI_Text_Options_Frames_Visibility_Title = "Fenster anzeigen oder verstecken"
RoCUI_Text_Options_Frames_Visibility_Description = "Ändert den Anzeigestatus des Fensters."
RoCUI_Text_Options_Frames_Strata_Title = "Fenster-Ebene ändern"
RoCUI_Text_Options_Frames_Strata_Description = "Ändert die Position des Fensters, sodass es entweder vor oder hinter anderen Fenstern angezeigt wird (auch bekannt unter dem Namen \"strata\")."
RoCUI_Text_Options_Frames_Scale_Title = "Fenster-Skalierung ändern"
RoCUI_Text_Options_Frames_Scale_Description = "Ändert die relative Skalierung des Fensters."
RoCUI_Text_Options_Frames_Width_Title = "Fensterbreite ändern"
RoCUI_Text_Options_Frames_Width_Description = "Ändert die Breite des Fensters."
RoCUI_Text_Options_Frames_Height_Title = "Fensterhöhe ändern"
RoCUI_Text_Options_Frames_Height_Description = "Ändert die Höhe des Fensters."
RoCUI_Text_Options_Frames_Position_X_Title = "Fensterposition ändern (X-Achse)"
RoCUI_Text_Options_Frames_Position_X_Description = "Ändert die Position des Fensters auf der X-Achse (horizontal / links und rechts)."
RoCUI_Text_Options_Frames_Position_Y_Title = "Fensterposition ändern (Y-Achse)"
RoCUI_Text_Options_Frames_Position_Y_Description = "Ändert die Position des Fensters auf der Y-Achse (vertikal / unten und oben)."
RoCUI_Text_Options_Frames_Backdropinfo_Border_Title = "Fensterrahmen ändern"
RoCUI_Text_Options_Frames_Backdropinfo_Border_Description = "Ändert den Stil des Rahmens des Extrafensters."
RoCUI_Text_Options_Frames_Backdropinfo_Background_Title = "Fensterhintergrund ändern"
RoCUI_Text_Options_Frames_Backdropinfo_Background_Description = "Ändert den Stil des Hintergrunds des Extrafensters."
RoCUI_Text_Options_Frames_TopButton_MenuType_Title = "Menü ändern"
RoCUI_Text_Options_Frames_TopButton_MenuType_Description = "Ändert das Menü, welches durch diesen Button in der oberen Leiste aufgerufen wird."
RoCUI_Text_Options_Language_Title = "Add-on Sprache ändern"
RoCUI_Text_Options_Language_Description = "Ändert die Sprache des Add-ons.\n\nDiese Änderung tritt erst nach einem \"/reload\" oder Neustart des Spiels in Kraft."


---- General
------ Reset add-on settings
RoCUI_Text_Options_Reset_Title = "Einstellungen zurücksetzen"
RoCUI_Text_Options_Reset_Description = "Alle Einstellungen im Optionsmenu dieses Add-ons werden auf ihre Standardwerte zurückgesetzt."
RoCUI_Text_Options_Reset_Button = "Zurücksetzen"

------ Minimap button
RoCUI_Text_Options_MinimapButton_Title = "Minimap-Button ein/ausblenden"
RoCUI_Text_Options_MinimapButton_Description = "Ändert den Anzeigestatus des Minimap-Button."

------ Add-on messages
RoCUI_Text_Options_AddonMessages_Title = "Add-on Nachrichten"
RoCUI_Text_Options_AddonMessages_Description = "Erlaubt es dem Add-on, Nachrichten im Chatfenster für bestimmte Funktionen anzuzeigen."

------ Toggle display.
RoCUI_Text_Options_ToggleDisplay_Title = "Alle Fenster ein/ausblenden"
RoCUI_Text_Options_ToggleDisplay_Description = "Ändert den Anzeigestatus aller Fenster dieses Add-ons.\n\nDiese Funktion kann auch über ein Tastenkürzel genutzt werden. Dieser muss jedoch zuerst einer Taste zugewiesen werden."

------ Faction skin selection
RoCUI_Text_Options_Skins_Title = "Fraktionsstil"
RoCUI_Text_Options_Skins_Description = "Ändert den Stil, welcher von allen Fenstern dieses Add-ons verwendet wird."
RoCUI_Text_Options_Skins_Human = "Mensch"
RoCUI_Text_Options_Skins_Undead = "Untote"
RoCUI_Text_Options_Skins_Orc = "Orc"
RoCUI_Text_Options_Skins_NightElf = "Nachtelf"




---- Sounds
------ Day and Night Cycle Widget
RoCUI_Text_Options_Sundial_Sound_Title = "Soundeffekt ein/ausschalten"
RoCUI_Text_Options_Sundial_Sound_Description = "De- oder aktiviert den Soundeffekt, welcher beim ersten Log-in des Tages, oder beim Wechsel von Tag zu Nacht und umgekehrt, abgespielt wird.\n\nTag: 6:00 - 18:00 Uhr Serverzeit\n\nNacht: 18:00 - 6:00 Uhr Serverzeit"

------ Sound Overrides
RoCUI_Text_Options_SoundOverride_QuestAccepted_Title = "Quest angenommen"
RoCUI_Text_Options_SoundOverride_QuestAccepted_Description = "Ein neuer Soundeffekt wird abgespielt, wenn ein Quest angenommen wurde."
RoCUI_Text_Options_SoundOverride_QuestCompleted_Title = "Quest abgeschlossen"
RoCUI_Text_Options_SoundOverride_QuestCompleted_Description = "Ein neuer Soundeffekt wird abgespielt, wenn ein Quest abgeschlossen wurde."
RoCUI_Text_Options_SoundOverride_PlayerDies_Title = "Spieler stirbt"
RoCUI_Text_Options_SoundOverride_PlayerDies_Description = "Ein neuer Soundeffekt wird abgespielt, wenn der Charakter des Spielers stirbt."
RoCUI_Text_Options_SoundOverride_Queue_Title = "Gruppe wurde gefunden"
RoCUI_Text_Options_SoundOverride_Queue_Description = "Ein neuer Soundeffekt wird abgespielt, wenn die Warteschlange zu Ende ist und eine zufällige Gruppe für einen Kampf gefunden wurde."

------ End of Battle
RoCUI_Text_Options_Sound_Victory_Title = "Erfolgreiches Kampfszenario"
RoCUI_Text_Options_Sound_Victory_Description = "Wähle ein Musikstück aus, welches nach dem Besiegen eines Raidbosses, Dungeonbosses oder einer Runde Mythisch+ abgespielt wird."
RoCUI_Text_Options_Sound_Defeat_Title = "Verlorenes Kampfszenario"
RoCUI_Text_Options_Sound_Defeat_Description = "Wähle ein Musikstück aus, welches nach einer Niederlage eines Kampfes mit einem Raid- oder Dungeonboss abgespielt wird."
RoCUI_Text_Options_EndofBattle_Generic = "Neutral"
RoCUI_Text_Options_EndofBattle_Random = "Zufall"
RoCUI_Text_Options_EndofBattle_None = "Keine Musik"

------ Sound Channel
RoCUI_Text_Options_Sound_Channel_Title = "Soundkanal"
RoCUI_Text_Options_Sound_Channel_Description = "Wähle den Kanal aus, in dem die Soundeffekte das Add-ons abgespielt werden."
RoCUI_Text_Options_Sound_ChannelName_Master = "Hauptkanal"
RoCUI_Text_Options_Sound_ChannelName_Music = "Musik"
RoCUI_Text_Options_Sound_ChannelName_SXF = "Effekte"
RoCUI_Text_Options_Sound_ChannelName_Ambience = "Umgebung"
RoCUI_Text_Options_Sound_ChannelName_Dialog = "Dialoge"




---- Top Menu - Submenu Choices
RoCUI_Text_Options_TopMenu_SubmenuType_ESC = "Hauptmenü"
RoCUI_Text_Options_TopMenu_SubmenuType_ESC_Abbreviated = "Menü"
RoCUI_Text_Options_TopMenu_SubmenuType_Character = "Charakter"
RoCUI_Text_Options_TopMenu_SubmenuType_Character_Abbreviated = "Charakter"
RoCUI_Text_Options_TopMenu_SubmenuType_Professions = "Berufe"
RoCUI_Text_Options_TopMenu_SubmenuType_Professions_Abbreviated = "Berufe"
RoCUI_Text_Options_TopMenu_SubmenuType_Spellbook = "Zauber"
RoCUI_Text_Options_TopMenu_SubmenuType_Spellbook_Abbreviated = "Zauber"
RoCUI_Text_Options_TopMenu_SubmenuType_Skills = "Fertigkeiten"
RoCUI_Text_Options_TopMenu_SubmenuType_Skills_Abbreviated = "Fertigkeiten"
RoCUI_Text_Options_TopMenu_SubmenuType_PvP = "PvP"
RoCUI_Text_Options_TopMenu_SubmenuType_PvP_Abbreviated = "PvP"
RoCUI_Text_Options_TopMenu_SubmenuType_Talents = "Talente"
RoCUI_Text_Options_TopMenu_SubmenuType_Talents_Abbreviated = "Talente"
RoCUI_Text_Options_TopMenu_SubmenuType_CooldownManager = "Abklingzeitmanager"
RoCUI_Text_Options_TopMenu_SubmenuType_CooldownManager_Abbreviated = "AZM"
RoCUI_Text_Options_TopMenu_SubmenuType_Achievements = "Erfolge"
RoCUI_Text_Options_TopMenu_SubmenuType_Achievements_Abbreviated = "Erfolge"
RoCUI_Text_Options_TopMenu_SubmenuType_Quests = "Quests"
RoCUI_Text_Options_TopMenu_SubmenuType_Quests_Abbreviated = "Quests"
RoCUI_Text_Options_TopMenu_SubmenuType_Guild = "Gilde"
RoCUI_Text_Options_TopMenu_SubmenuType_Guild_Abbreviated = "Gilde"
RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder = "Dungeonbrowser"
RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder_Abbreviated = "Browser"
RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder_PvE = "PvE"
RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder_PvE_Abbreviated = "PvE"
RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder_PvP = "PvP"
RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder_PvP_Abbreviated = "PvP"
RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder_MPlus = "Mythisch+"
RoCUI_Text_Options_TopMenu_SubmenuType_GroupFinder_MPlus_Abbreviated = "M+"
RoCUI_Text_Options_TopMenu_SubmenuType_Mounts = "Reittiere"
RoCUI_Text_Options_TopMenu_SubmenuType_Mounts_Abbreviated = "Reittiere"
RoCUI_Text_Options_TopMenu_SubmenuType_Pets = "Kampfhaustiere"
RoCUI_Text_Options_TopMenu_SubmenuType_Pets_Abbreviated = "Haustiere"
RoCUI_Text_Options_TopMenu_SubmenuType_Toys = "Spielzeuge"
RoCUI_Text_Options_TopMenu_SubmenuType_Toys_Abbreviated = "Spielzeuge"
RoCUI_Text_Options_TopMenu_SubmenuType_Heirlooms = "Erbstücke"
RoCUI_Text_Options_TopMenu_SubmenuType_Heirlooms_Abbreviated = "Erbstücke"
RoCUI_Text_Options_TopMenu_SubmenuType_Appearances = "Vorlagen"
RoCUI_Text_Options_TopMenu_SubmenuType_Appearances_Abbreviated = "Vorlagen"
RoCUI_Text_Options_TopMenu_SubmenuType_Journal = "Abenteuerführer"
RoCUI_Text_Options_TopMenu_SubmenuType_Journal_Abbreviated = "Kompendium"
RoCUI_Text_Options_TopMenu_SubmenuType_Calendar = "Kalender"
RoCUI_Text_Options_TopMenu_SubmenuType_Calendar_Abbreviated = "Kalender"
RoCUI_Text_Options_TopMenu_SubmenuType_Map = "Karte"
RoCUI_Text_Options_TopMenu_SubmenuType_Map_Abbreviated = "Karte"
RoCUI_Text_Options_TopMenu_SubmenuType_Social = "Geselligkeitsfenster"
RoCUI_Text_Options_TopMenu_SubmenuType_Social_Abbreviated = "Kontakte"
RoCUI_Text_Options_TopMenu_SubmenuType_GreatVault = "Große Schatzkammer"
RoCUI_Text_Options_TopMenu_SubmenuType_GreatVault_Abbreviated = "Schatzkammer"
RoCUI_Text_Options_TopMenu_SubmenuType_Hide = "Nichts anzeigen"


---- Portrait
RoCUI_Text_Options_Portrait_PowerDisplayType_Title = "Kraft-Typ ändern"
RoCUI_Text_Options_Portrait_PowerDisplayType_Description = "Manche Spezialisierung haben mehr als einen Krafttypen. Diese Funktion erlaubt es, den dargestellten Krafttyp zu ändern."
RoCUI_Text_Options_Portrait_TextFormatting_Health_Title = "Gesundheit-Darstellung ändern"
RoCUI_Text_Options_Portrait_TextFormatting_Health_Description = "Ändert die Darstellungsart, in der die Gesundheitswerte angezeigt werden."
RoCUI_Text_Options_Portrait_TextFormatting_Health_Abbreviate_Title = "Kürzere Gesundheit-Nummern"
RoCUI_Text_Options_Portrait_TextFormatting_Health_Abbreviate_Description = "Die Gesundheitswerte werden gekürzt dargestellt, um die maximal fünfstellige Darstellungsart von Warcraft III zu imitieren."
RoCUI_Text_Options_Portrait_TextFormatting_Power_Title = "Kraft-Darstellung ändern"
RoCUI_Text_Options_Portrait_TextFormatting_Power_Description = "Ändert die Darstellungsart, in der die Kraftwerte angezeigt werden."
RoCUI_Text_Options_Portrait_TextFormatting_Power_Abbreviate_Title = "Kürzere Kraft-Nummern"
RoCUI_Text_Options_Portrait_TextFormatting_Power_Abbreviate_Description = "Die Kraftwerte werden gekürzt dargestellt, um die maximal fünfstellige Darstellungsart von Warcraft III zu imitieren."
RoCUI_Text_Options_Portrait_TextFormatting_Word_Current = "Aktuell"
RoCUI_Text_Options_Portrait_TextFormatting_Word_Maximum = "Maximal"
RoCUI_Text_Options_Portrait_TextFormatting_Word_Percentage = "Prozent"
RoCUI_Text_Options_Portrait_TextSize_Health_Title = "Gesundheit-Skalierung ändern"
RoCUI_Text_Options_Portrait_TextSize_Health_Description = "Ändert die relative Skalierung des Gesundheitswertes."
RoCUI_Text_Options_Portrait_TextSize_Power_Title = "Kraft-Skalierung ändern"
RoCUI_Text_Options_Portrait_TextSize_Power_Description = "Ändert die relative Skalierung des Kraftswertes."


---- Infopanel
RoCUI_Text_Options_Infopanel_CharacterTitle_Title = "Titel anzeigen"
RoCUI_Text_Options_Infopanel_CharacterTitle_Description = "Zeigt den Titel des Charakters im Informationsfenster an (falls ein Titel zuvor ausgewählt wurde)."
RoCUI_Text_Options_Infopanel_ExperienceBarClassName_Title = "Spezialisierung anzeigen"
RoCUI_Text_Options_Infopanel_ExperienceBarClassName_Description = "Zeigt im Erfahrungsbalken den Namen der Spezialisierung anzeigen zuzüglich zu dem Namen der Klasse an."
RoCUI_Text_Options_Infopanel_IconPreference_Title = "Warcraft III-Symbole verwenden"
RoCUI_Text_Options_Infopanel_IconPreference_Description = "Im Informationsfenster werden standardmäßig die Symbole der angelegten Gegenstände angezeigt. Diese Funktion verwendet stattdessen Symbole, die von Warcraft III inspiriert sind."
RoCUI_Text_Options_Infopanel_TextFormatting_Stats_Abbreviate_Title = "Kürzere Statuswerte-Nummern"
RoCUI_Text_Options_Infopanel_TextFormatting_Stats_Abbreviate_Description = "Die Statuswerte werden gekürzt dargestellt, um die maximal dreistellige Darstellungsart von Warcraft III zu imitieren."
RoCUI_Text_Options_Infopanel_TextFormatting_Stats_Percentage_Title = "Nummern als Prozent anzeigen"
RoCUI_Text_Options_Infopanel_TextFormatting_Stats_Percentage_Description = "Manche Statuswerte werden als Prozent dargestellt."
RoCUI_Text_Options_Infopanel_StatType_Offensive_Title = "Offensiver Statuswert"
RoCUI_Text_Options_Infopanel_StatType_Offensive_Description = "Wähle den offensiven Statuswert aus, welcher im Informationsfenster angezeigt werden soll."
RoCUI_Text_Options_Infopanel_StatType_Defensive_Title = "Defensiver Statuswert"
RoCUI_Text_Options_Infopanel_StatType_Defensive_Description = "Wähle den defensiven Statuswert aus, welcher im Informationsfenster angezeigt werden soll."
RoCUI_Text_Options_Infopanel_StatType_Other_Title = "Sonstiger Statuswert"
RoCUI_Text_Options_Infopanel_StatType_Other_Description = "Wähle einen Statuswert aus, welcher im Informationsfenster angezeigt werden soll."




-- Other
---- Minimap button & compartment button
RoCUI_Text_Options_Compartment_Title = "RoC UI"
RoCUI_Text_Options_Compartment_Description = "Her klicken, um das Optionsmenü des Add-ons zu öffnen."


---- combat lockdown warning 
RoCUI_Text_CombatWarning_FirstPart = "Die Einstellungen können nicht geändert werden, "
RoCUI_Text_CombatWarning_Type0 = "weil Ihr euch in einer Kampfsituation befindet."
RoCUI_Text_CombatWarning_Type1 = "weil momentan der Mythisch+ Modus aktiv ist."
RoCUI_Text_CombatWarning_Type2 = "weil gerade ein PvP-Kampf aktiv ist."




end