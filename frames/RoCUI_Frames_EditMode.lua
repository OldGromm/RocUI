function RoCUI_EditMode_RestorePreviousVisibilityState(input_framename)
    local CurrentFrame = RoCUI_Frames[input_framename]
    local CurrentLayoutName = RoCUI_LibEditMode:GetActiveLayoutName()
    local FrameVisibility = RoCUIDB_EditMode[input_framename][CurrentLayoutName]["Visibility"]
    if FrameVisibility == false then
        CurrentFrame:Hide()
    else
    end
end




function RoCUI_EditMode_RegisterFramesForEditMode()
    for _, v in pairs(RoCUI_Database_FramesDefaultSettings) do
	    local FrameName = v["Name"]
		local CurrentFrame = RoCUI_Frames[FrameName]
        local DefaultData = {
	    point = v["Position"],
        x = v["Position_X"],
        y = v["Position_Y"],
	    }



        local function onPositionChanged(frame, layoutName, point, x, y)
            RoCUIDB_EditMode[FrameName][layoutName].point = point
            RoCUIDB_EditMode[FrameName][layoutName].x = x
            RoCUIDB_EditMode[FrameName][layoutName].y = y
        end


        RoCUI_LibEditMode:RegisterCallback("enter", function()
            CurrentFrame:Show()
        end)


        RoCUI_LibEditMode:RegisterCallback("exit", function()
            RoCUI_EditMode_RestorePreviousVisibilityState(FrameName, input_layoutname)
        end)


        RoCUI_LibEditMode:RegisterCallback("layout", function(layoutName)
            if not RoCUIDB_EditMode[FrameName] then
                RoCUIDB_EditMode[FrameName] = {}
            end
            if not RoCUIDB_EditMode[FrameName][layoutName] then
                RoCUIDB_EditMode[FrameName][layoutName] = CopyTable(DefaultData)
				RoCUIDB_EditMode[FrameName][layoutName]["Scale"] = 1.0
				RoCUIDB_EditMode[FrameName][layoutName]["Strata"] = v["Strata"]
				RoCUIDB_EditMode[FrameName][layoutName]["Visibility"] = v["Visibility"]
            end


            CurrentFrame:ClearAllPoints()

            local FramePoint = RoCUIDB_EditMode[FrameName][layoutName].point
			local FramePositionX = RoCUIDB_EditMode[FrameName][layoutName].x
			local FramePositionY = RoCUIDB_EditMode[FrameName][layoutName].y
			CurrentFrame:SetPoint(FramePoint, FramePositionX, FramePositionY)
			local FrameScale = RoCUIDB_EditMode[FrameName][layoutName]["Scale"]
			CurrentFrame:SetScale(FrameScale)
			local FrameStrataNumber = RoCUIDB_EditMode[FrameName][layoutName]["Strata"]
			local FrameStrataLevel = RoCUI_Backdrop_StrataNames[FrameStrataNumber]
			CurrentFrame:SetFrameStrata(FrameStrataLevel)
            local FrameVisibility = RoCUIDB_EditMode[FrameName][layoutName]["Visibility"]
            if FrameVisibility == true then
                CurrentFrame:Show()
            elseif FrameVisibility == false then
                CurrentFrame:Hide()
            end
			
        end)


        RoCUI_LibEditMode:AddFrame(CurrentFrame, onPositionChanged, DefaultData)


        RoCUI_LibEditMode:AddFrameSettings(CurrentFrame, {
            --scale
			{
            name = RoCUI_Text_EditMode_Scale,
            kind = RoCUI_LibEditMode.SettingType.Slider,
            default = 1.0,
            get = function(layoutName)
                return RoCUIDB_EditMode[FrameName][layoutName]["Scale"]
            end,
            set = function(layoutName, value)
                RoCUIDB_EditMode[FrameName][layoutName]["Scale"] = value
                CurrentFrame:SetScale(value)
            end,
            minValue = 0.1,
            maxValue = 5,
            valueStep = 0.1,
            formatter = function(value)
                return FormatPercentage(value, true)
            end,
            },

            --strata
            {
            name = RoCUI_Text_EditMode_Strata,
            kind = RoCUI_LibEditMode.SettingType.Slider,
            default = v["Strata"],
            get = function(layoutName)
                return RoCUIDB_EditMode[FrameName][layoutName]["Strata"]
            end,
            set = function(layoutName, value)
                RoCUIDB_EditMode[FrameName][layoutName]["Strata"] = value
    			local StrataLevel = RoCUI_Backdrop_StrataNames[value]
                CurrentFrame:SetFrameStrata(StrataLevel)
            end,
            minValue = 1,
            maxValue = 8,
            valueStep = 1,
            },

            --visibility
            {
            name = RoCUI_Text_EditMode_Visibility,
            kind = RoCUI_LibEditMode.SettingType.Checkbox,
            default = v["Visibility"],
            get = function(layoutName)
                return RoCUIDB_EditMode[FrameName][layoutName]["Visibility"]
            end,
            set = function(layoutName, value)
                RoCUIDB_EditMode[FrameName][layoutName]["Visibility"] = value
    			if value == true then
    			    CurrentFrame:Show()
    			elseif value == false then
    			    CurrentFrame:Hide()
    			end
            end,
            },
        })

	end

end