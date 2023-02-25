function PlayerTitleDropDown_Initialize()
	-- Setup buttons
	local info = UIDropDownMenu_CreateInfo();
	local checked;
	local currentTitle = GetCurrentTitle();
	local titleName;
	for i=1, GetNumTitles() do
		-- Changed to base 0 for simplicity, change when the opportunity arrises.
		if ( IsTitleKnown(i) ) then
			if ( i == currentTitle ) then
				checked = true;
			else
				checked = false;
			end
			titleName = GetTitleName(i);
			info.text = titleName;
			info.func = PlayerTitleDropDown_OnClick;
			info.value = i;
            info.checked = checked;
			UIDropDownMenu_AddButton(info);
		end
	end
	-- Add none button
	if ( currentTitle == 0 or currentTitle == -1 ) then
		checked = true;
	else
		checked = false;
	end
	info.text = NONE;
	info.func = PlayerTitleDropDown_OnClick;
	info.value = -1;
	info.checked = checked;
	UIDropDownMenu_AddButton(info);
end
