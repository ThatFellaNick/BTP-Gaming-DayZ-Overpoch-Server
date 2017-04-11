_openGroups = {
	if (dayz_requireRadio && !("ItemRadio" in items player)) then {
		localize "STR_EPOCH_NEED_RADIO" call dayz_rollingMessages;
	} else {
		if (isNull findDisplay 80000) then {
			if (!isNil "dayz_groupInit") then {[] spawn dayz_openGroupDialog;};
		} else {
			findDisplay 80000 closeDisplay 2;
		};
	};
};
Call _openGroups;