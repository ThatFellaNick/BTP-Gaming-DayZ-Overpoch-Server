private ["_player","_ctType","_inVehicle","_ct","_canDo","_onLadder","_finished","_finishedTime","_distance"];

_player = player; //Setting a local variable as player saves resources
_canDo = call fnc_actionAllowed;
_ct = cursorTarget;
_ctType = typeOf _ct;
_distance = _player distance _ct;


if(isNull _ct || _ctType != "MMT_Civ" ) exitWith {cutText ["You can pack only built bikes! ", "PLAIN DOWN"];};
if(dayz_combat == 1) exitWith {cutText ["You are in Combat and cannot pack a bike.", "PLAIN DOWN"];};
if(!(_canDo)) exitWith {cutText ["You are in a vehicle or performing an action!","PLAIN DOWN"];};
if(inSafeZone) exitWith {cutText ["ANTI-TROLL: Cannot pack bike in a Safe Zone!","PLAIN DOWN"];};


DZE_ActionInProgress = true;

_player playActionNow "Medic";
[_player,"repair",0,false,10] call dayz_zombieSpeak;
[_player,10,true,(getPosATL _player)] spawn player_alertZombies;

r_interrupt = false;
r_doLoop = true;

_finished = false;
_finishedTime = diag_tickTime+3;

while {r_doLoop} do {
	if (diag_tickTime >= _finishedTime) then {
		r_doLoop = false;
		_finished = true;
	};
	if (r_interrupt) then {
		r_doLoop = false;
	};
	sleep 0.1;
};

if (_finished) then {
	
	_objectID = _ct getVariable ["ObjectID", "0"];
	_objectUID = _ct getVariable ["ObjectUID", "0"];
	PVDZE_obj_Delete = [_objectID, _objectUID, (name _player)];
	publicVariableServer "PVDZE_obj_Delete";

	deleteVehicle _ct;
	_player addWeapon "ItemToolbox";
	
	cutText ["\nYou have packed a bike!", "PLAIN DOWN",3];
	r_interrupt = false;
	player switchMove "";
	player playActionNow "stop";
} else {
	r_interrupt = false;
	_player switchMove "";
	_player playActionNow "stop";
		
	cutText ["\n\nCanceled packing bike!", "PLAIN DOWN",4];
};
DZE_ActionInProgress = false;
