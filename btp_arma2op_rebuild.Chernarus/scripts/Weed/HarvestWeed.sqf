private ["_hempqty","_findHemp","_countHemp","_playerNear"];
if (DZE_ActionInProgress) exitWith {};
DZE_ActionInProgress = true;
_hempqty = {_x == "ItemKiloHemp"} count magazines player;
_findHemp = nearestObjects [player,["fiberplant"],5];
_countHemp = count _findHemp;
_playerNear = {isPlayer _x} count (player nearEntities ["CAManBase", 10]) > 1;

if (_playerNear) exitWith { 
	format ["[BTP]Cannot do this while another player is nearby!"] call dayz_rollingMessages; 
	systemChat format["[BTP]Cannot do this while another player is nearby!"];
	DZE_ActionInProgress = false;
};
if (vehicle player != player) exitWith { 
	format ["[BTP]You cannot do this while in a vehicle!"] call dayz_rollingMessages; 
	systemChat format["[BTP]You cannot do this while in a vehicle!"];
	DZE_ActionInProgress = false;
};
if (_hempqty > 9) exitWith { 
	format["[BTP] You have a max amount of weed in your inventory!"] call dayz_rollingMessages; 
	systemChat format["[BTP] You have a max amount of weed in your inventory!"]; 
	DZE_ActionInProgress = false;
};
if (_countHemp > 0) then {	
	r_interrupt = false;
	player playActionNow "PutDown";
	deleteVehicle (_findHemp select 0);
	player addMagazine "ItemKiloHemp";
	format["[BTP] You collected some precious weed!"] call dayz_rollingMessages; 
	systemChat format["[BTP] You collected some precious weed!"]; 
	uiSleep 3;
} else {
	format["[BTP] There is no more Hemp!"] call dayz_rollingMessages; 
	systemChat format["[BTP] There is no more Hemp!"]; 
};
DZE_ActionInProgress = false;
