function RoCUI_Profiles_ProfileIndexTextstring(input_number)
    local textstring = string.format("%02d", input_number)
	return textstring
end




function RoCUI_PV(input_mode, input_variable, input_value) -- PV stands for Profile Variable
    local profileindex = RoCUI_Profiles_ProfileIndexTextstring(RoCUI_Options_CurrentProfile)

    if input_mode == "Load" then
	    local Value = RoCUIDB_Profiles[profileindex][input_variable]
		return Value
	elseif input_mode == "Save" then
	    RoCUIDB_Profiles[profileindex][input_variable] = input_value
	end

end