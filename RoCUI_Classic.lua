-- check for current version number (disable or change a few things if this is Classic)
RoCUI_InterfaceVersion = select(4, GetBuildInfo())
RoCUI_GameVersion = 0

if RoCUI_InterfaceVersion < 40000 then
    RoCUI_GameVersion = 1
elseif RoCUI_InterfaceVersion < 100000 then
    RoCUI_GameVersion = 2
elseif RoCUI_InterfaceVersion > 100000 then
    RoCUI_GameVersion = 3
else
end




---- check titleIDs to determine how to format the player's name at the infopanel frame.
---- the titleIDs are different on each WoW version, so we're using different lists for each of them.
if RoCUI_GameVersion == 1 then
    RoCUI_Table_TitleBehindName = { 38 }
    RoCUI_Table_TitleBehindNameWithComma = { 36, 39 }
elseif RoCUI_GameVersion == 2 then
    RoCUI_Table_TitleBehindName = { 38, 42, 46, 47, 48, 53, 54, 55, 58, 60, 78, 79, 80, 81, 82, 86, 87, 88, 92, 94, 95, 96, 99, 103, 107, 108, 109, 110, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 125, 130, 133, 136, 137, 138, 140, 141, 151, 189, 197, 198, 200, 201, 203, 206, 213, 215, 216, 218, 219, 220, 221, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 252 }
    RoCUI_Table_TitleBehindNameWithComma = { 36, 39, 83, 84, 90, 91, 97, 100, 124, 126, 127, 131, 139, 143, 144, 146, 147, 152, 153, 182, 183, 184, 185, 187, 188, 194, 196, 202, 204, 208, 211, 212, 214, 222, 241, 736, 737, 738, 739 }
elseif RoCUI_GameVersion == 3 then
    RoCUI_Table_TitleBehindName = {38, 42, 46, 47, 48, 54, 55, 58, 60, 81, 82, 86, 87, 88, 92, 94, 95, 96, 99, 103, 107, 108, 109, 110, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 125, 130, 133, 136, 137, 138, 140, 141, 143, 151, 184, 189, 197, 198, 200, 201, 203, 206, 215, 216, 218, 219, 220, 221, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 252, 256, 259, 262, 264, 270, 272, 282, 289, 290, 291, 293, 298, 299, 300, 301, 318, 333, 334, 341, 343, 347, 354, 357, 362, 365, 366, 369, 375, 376, 380, 381, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399, 404, 405, 417, 418, 419, 431, 433, 436, 439, 446, 451, 453, 457, 458, 460, 465, 466, 469, 470, 476, 477, 481, 488, 494, 495, 498, 503, 504, 512, 513, 514, 516, 517, 520, 530, 531, 537, 538, 548, 575, 579, 592, 593, 601, 603, 629, 630, 631, 636, 637, 638, 641, 644, 655, 656, 657, 658, 659, 688 }
    RoCUI_Table_TitleBehindNameWithComma = {36, 39, 83, 84, 90, 91, 97, 100, 124, 126, 127, 131, 139, 146, 147, 152, 153, 182, 183, 185, 187, 188, 194, 196, 202, 204, 208, 211, 212, 214, 222, 241, 266, 267, 268, 269, 273, 275, 276, 280, 281, 285, 286, 294, 296, 297, 302, 303, 304, 306, 309, 310, 311, 312, 313, 314, 319, 325, 326, 331, 332, 342, 346, 358, 371, 374, 377, 384, 385, 386, 400, 407, 409, 412, 413, 414, 415, 416, 425, 428, 440, 442, 443, 445, 447, 448, 450, 454, 455, 462, 464, 467, 474, 480, 483, 484, 487, 502, 505, 506, 507, 518, 528, 532, 536, 547, 552, 553, 557, 561, 562, 568, 569, 570, 574, 604, 605, 612, 614, 617, 618, 642, 643, 667, 668, 669, 670, 676, 677, 680, 682, 685, 689, 753 }
end



---- adjust sound override options for TBC Classic
if RoCUI_GameVersion == 1 then
    RoCUI_Table_SoundOverrides = {"QuestAccepted", "QuestCompleted", "PlayerDies"}
else
    RoCUI_Table_SoundOverrides = {"QuestAccepted", "QuestCompleted", "PlayerDies", "Queue"}
end




---- change number of bag buttons depending on the game version (Retail has the reagent bag)
if RoCUI_GameVersion == 3 then
    RoCUI_NumberofBags = 6
else
    RoCUI_NumberofBags = 5
end