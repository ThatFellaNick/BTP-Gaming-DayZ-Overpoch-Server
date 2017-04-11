if(isNil "grassToggle") then {grassToggle = true;} else {grassToggle = !grassToggle};

if (grassToggle) then {
	setterraingrid 50;
	systemChat('[BTP] Grass Disabled');
	format["[BTP] Grass Disabled"] call dayz_rollingMessages;
}else{
	setterraingrid 25;
	systemChat('[BTP] Grass Enabled');
	format["[BTP] Grass Enabled"] call dayz_rollingMessages;
};