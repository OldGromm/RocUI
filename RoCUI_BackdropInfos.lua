-- default backdrop entry
RoCUI_CustomBackdrop_Options_Menu_Border = {
    bgFile = "Interface\\AddOns\\RoCUI\\images\\backdrop_bg\\human",
    edgeFile = "Interface\\AddOns\\RoCUI\\images\\backdrop_border\\human",
    tile = true,
    tileEdge = true,
    tileSize = 64,
    edgeSize = 64,
    insets = { left = 14, right = 14, top = 14, bottom = 14 },
}



-- backdrop
function RoCUI_UpdateBackdrop()
    local RoCUI_Temp_TextureFilepath_Background = RoCUI_FetchTextureFilepath("backdrop_bg")
    local RoCUI_Temp_TextureFilepath_Border = RoCUI_FetchTextureFilepath("backdrop_border")
    RoCUI_CustomBackdrop_Options_Menu_Border = {
        bgFile = RoCUI_Temp_TextureFilepath_Background,
        edgeFile = RoCUI_Temp_TextureFilepath_Border,
        tile = true,
        tileEdge = true,
        tileSize = 64,
        edgeSize = 64,
        insets = { left = 14, right = 14, top = 14, bottom = 14 },
    }
end