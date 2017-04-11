private ["_spawnChance", "_spawnMarker", "_spawnRadius", "_markerRadius", "_item", "_debug", "_start_time", "_loot_box", "_wait_time", "_position", "_event_marker", "_loot_pos", "_debug_marker","_loot_box", "_hint","_var","_giveWep","_possibleMags","_mag"];

_loot_box = "USVehicleBox";

_giveWep = ["RPG7V","DMR_DZ","FHQ_ACR_WDL_TWS_SD","BAF_LRR_scoped","M32_EP1","USSR_cheytacM200_sd","m107_DZ","BAF_L85A2_RIS_CWS","SCAR_H_STD_EGLM_Spect","BAF_L85A2_UGL_Holo","G36_C_SD_camo","M4A1_AIM_SD_camo","Mk48_CCO_DZ","M240_DZ","FHQ_MSR_SD_DESERT","FHQ_XM2010_DESERT","M110_NVG_EP1"] call BIS_fnc_selectRandom;
_possibleMags = getArray (configfile >> "cfgWeapons" >> _giveWep >> "magazines");
_mag = _possibleMags select 0;

waitUntil {!isNil "AIMissionStatLocs"}; 
 
_wait_time = 300; 
_var = floor((random 10) + 1);

// Dont mess with theses unless u know what yours doing
_start_time = time;
 
if (isNil "EPOCH_EVENT_RUNNING") then {
EPOCH_EVENT_RUNNING = false;
};
 
// Check for another event running
if (EPOCH_EVENT_RUNNING) exitWith {
diag_log("Event already running");
};
 

EPOCH_EVENT_RUNNING = true;
 
// Random location
_position = AIMissionStatLocs call BIS_fnc_selectRandom;
 
diag_log(format["Spawning loot event at %1", _position]);

_markerRadius = 350;
_markershape = "ELLIPSE";
_markercolor = "ColorRed";
_missiontype = 0;
_refreshmarker = [_position,_markerRadius,_markershape,_markercolor,_missiontype,_start_time] execVM "\z\addons\dayz_server\missions\Crate Missions\refreshmarker.sqf";
 
_loot_pos = [_position,0,(_markerRadius - 100),10,0,2000,0] call BIS_fnc_findSafePos;
 
diag_log(format["Creating ammo box at %1", _loot_pos]);
 
// Create ammo box
_loot_box = createVehicle [_loot_box,_loot_pos,[], 0, "NONE"];
clearMagazineCargoGlobal _loot_box;
clearWeaponCargoGlobal _loot_box;
 
// Cut the grass around the loot position
_clutter = createVehicle ["ClutterCutter_small_2_EP1", _loot_pos, [], 0, "CAN_COLLIDE"];
_clutter setPos _loot_pos;
// cut the grass    end
 
_loot_box addWeaponCargoGlobal [_giveWep, 1];
_loot_box addMagazineCargoGlobal [_mag, _var];
 
_txt = "Military Crate Dropped!\nCheck your map!";
_colortask = [1,0,0,1];
_tasktype = "taskNew";
fnc_show_colorMiddleMsg = [_txt,_colortask,_tasktype];
publicVariable 'fnc_show_colorMiddleMsg';

diag_log(format["Loot event setup, waiting for %1 seconds", _wait_time]);

//Wait until player is Near.
waitUntil{
sleep 1;
(({isPlayer _x && _x distance _loot_box <= 5} count playableUnits > 0));
};

_txt = "Military Crate Secured!";
_colortask = [1,0,0,1];
_tasktype = "taskDone";
fnc_show_colorMiddleMsg = [_txt,_colortask,_tasktype];
publicVariable 'fnc_show_colorMiddleMsg';

_debug_marker = createMarker [ format ["loot_event_debug_marker_%1", _start_time], _loot_pos];
_debug_marker setMarkerShape "ICON";
_debug_marker setMarkerType "mil_dot";
_debug_marker setMarkerColor "ColorRed";
_debug_marker setMarkerAlpha 1;

EPOCH_EVENT_RUNNING = false;
sleep 30;

// Wait
sleep _wait_time;
 
// Clean up
deleteVehicle _loot_box;
deleteVehicle _clutter;
deleteMarker _debug_marker;
