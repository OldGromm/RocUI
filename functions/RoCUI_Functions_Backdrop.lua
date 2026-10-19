function RoCUI_Backdrop_Update()
    -- border
    local PlayerChoice_Border_Number = RoCUI_PV("Load", "General_Skin_Border")
    local TextureFilepath_Border = RoCUI_General_FetchTextureFilepath("backdrop_border_"..PlayerChoice_Border_Number)

	if PlayerChoice_Border_Number == 3 then
	    TextureFilepath_Border = "Interface\\AddOns\\RoCUI\\images\\backdrop_border_3\\metal"
	elseif PlayerChoice_Border_Number == 4 then
	    TextureFilepath_Border = "dungeons\\textures\\common\\transparent"
	end


    -- background
    local PlayerChoice_Background_Number = RoCUI_PV("Load", "General_Skin_Background")
    local TextureFilepath_Background = RoCUI_General_FetchTextureFilepath("backdrop_bg_"..PlayerChoice_Background_Number)

	if PlayerChoice_Background_Number == 2 then
	    TextureFilepath_Background = "interface\\characterframe\\ui-party-background"
	elseif PlayerChoice_Background_Number == 3 then
	    TextureFilepath_Background = "dungeons\\textures\\common\\transparent"
	end


    -- create backdrop info variable
	local CustomBackdrop = {
        bgFile = TextureFilepath_Background,
        edgeFile = TextureFilepath_Border,
        tile = true,
        tileEdge = true,
        tileSize = RoCUI_Backdrop_Inset_Tilesize[PlayerChoice_Border_Number],
        edgeSize = RoCUI_Backdrop_Inset_Tilesize[PlayerChoice_Border_Number],
        insets = 
		{
		left = RoCUI_Backdrop_Inset_Horizontal[PlayerChoice_Border_Number],
		right = RoCUI_Backdrop_Inset_Horizontal[PlayerChoice_Border_Number],
		top = RoCUI_Backdrop_Inset_Vertical[PlayerChoice_Border_Number],
		bottom = RoCUI_Backdrop_Inset_Vertical[PlayerChoice_Border_Number]
		},
    }
	
	return CustomBackdrop
end




RoCUI_Backdrop_Infopanel_ExperienceBar = {
        bgFile = "dungeons\\textures\\common\\transparent",
        edgeFile = "Interface\\AddOns\\RoCUI\\images\\infopanel\\expbarborder",
        tile = true,
        tileEdge = true,
        tileSize = 16,
        edgeSize = 16,
        insets = 
		{
		left = 5,
		right = 5,
		top = 5,
		bottom = 5
		},
    }