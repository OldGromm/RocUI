RoCUI_CustomBackdrop = {}

RoCUI_Table_Inset_Horizontal = {14, 10, 14}
RoCUI_Table_Inset_Vertical = {14, 28, 14}
RoCUI_Table_Inset_Tilesize = {64, 128, 128}




-- update all backdrops
function RoCUI_UpdateBackdrop(input_framename)
    -- border
    local RoCUI_PlayerChoice_Border_Name = ("Backdropinfo_Border_"..input_framename)
    local RoCUI_PlayerChoice_Border_Number = RoCUIDB_Options[RoCUI_PlayerChoice_Border_Name]
    local RoCUI_Temp_TextureFilepath_Border = RoCUI_FetchTextureFilepath("backdrop_border_"..RoCUI_PlayerChoice_Border_Number)

	if RoCUI_PlayerChoice_Border_Number == 3 then
	    RoCUI_Temp_TextureFilepath_Background = "Interface\\AddOns\\RoCUI\\images\\backdrop_border_3\\metal"
	end


    -- background
    local RoCUI_PlayerChoice_Background_Name = ("Backdropinfo_Background_"..input_framename)
    local RoCUI_PlayerChoice_Background_Number = RoCUIDB_Options[RoCUI_PlayerChoice_Background_Name]
    local RoCUI_Temp_TextureFilepath_Background = RoCUI_FetchTextureFilepath("backdrop_bg_"..RoCUI_PlayerChoice_Background_Number)
   
	if RoCUI_PlayerChoice_Background_Number == 2 then
	    RoCUI_Temp_TextureFilepath_Background = "interface\\characterframe\\ui-party-background"
	elseif RoCUI_PlayerChoice_Background_Number == 3 then
	    RoCUI_Temp_TextureFilepath_Background = "dungeons\\textures\\common\\transparent"
	end


    -- create backdrop info variable
	local RoCUI_CustomBackdrop = {
        bgFile = RoCUI_Temp_TextureFilepath_Background,
        edgeFile = RoCUI_Temp_TextureFilepath_Border,
        tile = true,
        tileEdge = true,
        tileSize = RoCUI_Table_Inset_Tilesize[RoCUI_PlayerChoice_Border_Number],
        edgeSize = RoCUI_Table_Inset_Tilesize[RoCUI_PlayerChoice_Border_Number],
        insets = 
		{
		left = RoCUI_Table_Inset_Horizontal[RoCUI_PlayerChoice_Border_Number],
		right = RoCUI_Table_Inset_Horizontal[RoCUI_PlayerChoice_Border_Number],
		top = RoCUI_Table_Inset_Vertical[RoCUI_PlayerChoice_Border_Number],
		bottom = RoCUI_Table_Inset_Vertical[RoCUI_PlayerChoice_Border_Number]
		},
    }
	
	return RoCUI_CustomBackdrop
end