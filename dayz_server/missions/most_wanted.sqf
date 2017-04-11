_aliveTimeToWin = 10;

_updateMark = 100;

_maxTimeNearPlot = 0.15;

_onPlotCheckFrequency = 20;

_circleSize = 150;

_minPlayersToRun = 15;

_runTimeInter = 50;

_firstRunDelay = 30;

_fugitiveRewards = [
	[4,"The Fugitive received a MK 48 and Ammo.",{_posF = position _this;_posFGround = [_posF select 0,_posF select 1,0];_holder = createVehicle ['Weaponholder',_posFGround,[],0,'NONE'];_holder addWeaponCargoGlobal ['Mk48_CCO_DZ',1];_holder addMagazineCargoGlobal ['100Rnd_762x51_M240',5];_this reveal [_holder,4];}],
	[4,"The fugitive received a motorbike.",{_posF = position _this;_posFGround = [_posF select 0,_posF select 1,0];_veh = createVehicle ['TT650_Ins',_posFGround,[],8,'NONE'];_veh setVariable ['ObjectID','0',true];_veh setVariable ['ObjectUID',str round random 9999999,true];_this reveal [_veh,4];}],
	[4,"The fugitive received medical items.",{_posF = position _this;_posFGround = [_posF select 0,_posF select 1,0];_holder = createVehicle ['Weaponholder',_posFGround,[],0,'NONE'];_holder addMagazineCargoGlobal ['ItemBloodBag',1];_holder addMagazineCargoGlobal ['ItemBandage',2];_holder addMagazineCargoGlobal ['FishCookedSeaBass',1];_holder addMagazineCargoGlobal ['ItemWaterbottle',1];_holder addMagazineCargoGlobal ['ItemPainkiller',1];_holder addMagazineCargoGlobal ['ItemORP',1];_holder addMagazineCargoGlobal ['ItemMorphine',1];_this reveal [_holder,4];}],
	[4,"The fugitive sees an enemy.",{donn_seeSmoke = [];{if (_this distance _x < 300 && !((vehicle _x) isKindOf 'Air')) then {_posK = position _x;for '_i' from 1 to 4 do {_smoke = createVehicle [['SmokeShell','SmokeShellYellow','SmokeShellRed','SmokeShellGreen','SmokeShellPurple','SmokeShellBlue','SmokeShellOrange'] call BIS_fnc_selectRandom,[_posK select 0,_posK select 1,40+_i*10],[],0,'CAN_COLLIDE'];donn_seeSmoke = donn_seeSmoke + [_smoke];};};} forEach (playableUnits-[_this]);}],
	[1/12,"",{{deleteVehicle _x;} forEach donn_seeSmoke;}]
];

_safezones = switch (toLower worldName) do {
	case "chernarus":{
		[
		[6325.6772,7807.7412,0], // Stary
		[4063.4226,11664.19,0],  // Bash
		[11452.472,11339.504,0], // Klen
		[3098.91,3455.89,0], 	 // Bor
		[1100.69,2844.99,0],     // Wholesaler
		[13247.175,6076.4395,0], // Wholesaler
		[12944.227,12766.889,0], // Hero
		[5042.2383,9710.0039,0], // NW Air Dealer
		[12061.6,12636.3,0]   	 // NE Air Dealer
		];
	};
	case "tavi":{
		[
		[15309.663,9278.4912,0], // Sabina
		[11698.81,15210.121,0],  // Leyepostock
		[5538.7354,8762.2695,0], // Bilgrad
		[7376.6084,4296.5879,0], // Branibor
		[15586.8,16390.8,0], 	 // Hero 
		[6813.01,8539.05,0],     // Krasno Air Dealer
		[16474.76,10773.392,0],  // Dubovo Air Dealer
		[9853,7469,0], 			 // Wholesaler
		[13350,8611,0], 		 // Wholesaler
		[17499.8,7160.09,0], 	 // Black Market
		[4063.13,7267.37,0]      // Black Market
		];
	};
	default{
		[
		[0,0,0]
		];
	};
};

_safezonesRad = 160;

_LAdmins = [							
"0"
]; 

_NAdmins = [
"0"
]; 

_SAdmins = [
"0"
];

_admins = _SAdmins+_NAdmins+_LAdmins;

_lockedFugitives = [];

waitUntil {!isNil "DZE_safeVehicle"};
DZE_safeVehicle = DZE_safeVehicle + ["TT650_Ins"];

donn_fugitiveChoose = {
	_fugitive = objNull;
	_maxSumDist = -1;
	{
		_p = _x;
			if (damage _p < 0.2 && vehicle _p == _p) then {
				if (count (_p nearObjects ["Plastic_Pole_EP1_DZ",(DZE_PlotPole select 0)*1.25]) == 0) then {
					_pUID = getPlayerUID _p;
					if !(_pUID in _admins || _pUID in _lockedFugitives) then {
						_sumDist = 0;
						{_sumDist = _sumDist + (_p distance _x);} forEach playableUnits;
						if (_sumDist > _maxSumDist) then {_fugitive = _p;_maxSumDist = _sumDist;};
					};
				};
			};
	} forEach playableUnits;
	_fugitive
};

_aliveTimeToWin = round (_aliveTimeToWin*60);
_runTimeInter = round (_runTimeInter*60);
_firstRunDelay = round (_firstRunDelay*60);
_lastTimeConclude = time-_runTimeInter+_firstRunDelay;
while {true} do {
	waitUntil {uiSleep 15;count playableUnits >= _minPlayersToRun && (time-_lastTimeConclude) >= _runTimeInter};
	_fugitive = call donn_fugitiveChoose;
	if (!isNull _fugitive) then {
		diag_log "[MOSTWA] Begin!";
		_fugitiveName = name _fugitive;
		_fugitiveID = getPlayerUID _fugitive;
		_aliveTimeStart = time;
		_aliveTimePassed = 0;
		_timeCell = 2;
		_sleepAMark = round(_updateMark/_timeCell);
		_slepBIndex = 0;
		_sleepBMark = -1;
		if !(_slepBIndex == count _fugitiveRewards) then {
			_sleepBMark = round(((_fugitiveRewards select _slepBIndex select 0)*60)/_timeCell);
		};
		_sleepCMark = round(_onPlotCheckFrequency/_timeCell);
		_sleepDMark = round (10/_timeCell);
		_sleepA = 0;
		_sleepB = 0; 
		_sleepC = 0;
		_sleepD = 0;
		_txt = ((name _fugitive)+" has a price on his head, kill him to receive a reward."+(name _fugitive)+", stay alive " +(str(round(_aliveTimeToWin/60)))+" minutes to receive the prize.");
		_timeInPlot = 0;
		while {alive _fugitive && !isNull _fugitive && _aliveTimePassed < _aliveTimeToWin && _timeInPlot <= _aliveTimeToWin*_maxTimeNearPlot} do {
			if (_sleepA >= _sleepAMark) then {
				_txt = _txt + ((name _fugitive)+" mark updated on map."+(str (round(((_aliveTimeToWin-_aliveTimePassed)/60)*10)/10))+" minutes to stop the hunt.");
				_sleepA = 0;
				_fPos = position _fugitive;
				_error = (_circleSize*2)/sqrt(2);
				_fPosBlur = [(_fPos select 0)-_error/2+(random _error),(_fPos select 1)-_error/2+(random _error),0];
				if (_aliveTimePassed > 0) then {deleteMarker "DONN_FUGITIVE";deleteMarker "DONN_FUGITIVE_DOT";};
				createMarker ["DONN_FUGITIVE",_fPosBlur];
				"DONN_FUGITIVE" setMarkerColor "ColorYellow";
				"DONN_FUGITIVE" setMarkerShape "ELLIPSE";
				"DONN_FUGITIVE" setMarkerBrush "SolidBorder";
				"DONN_FUGITIVE" setMarkerSize [_circleSize,_circleSize];
				createMarker ["DONN_FUGITIVE_DOT",_fPosBlur];
				"DONN_FUGITIVE_DOT" setMarkerColor "ColorBlack";
				"DONN_FUGITIVE_DOT" setMarkerType "Vehicle";
				"DONN_FUGITIVE_DOT" setMarkerText "Fugitive!";
			};
			if (_sleepB == _sleepBMark) then {
				_nearPlotPole = _fugitive nearObjects ["Plastic_Pole_EP1_DZ",DZE_PlotPole select 0];
				_inSafe = false;
				{if (_fugitive distance _x < _safezonesRad) exitWith {_inSafe = true;};} forEach _safezones;
				_isFlying = ((getPosATL _fugitive) select 2) > 45;
				if (count _nearPlotPole == 0 && !_inSafe && !_isFlying) then {
					_txt = _txt + "Time Reward! " + (_fugitiveRewards select _slepBIndex select 1);
					_code = _fugitiveRewards select _slepBIndex select 2;
					_fugitive call _code;
				} else {
					_txt = _txt + "Time Reward!? In safe, on plot or flying. No reward...";
				};
				_sleepB = 0;
				_slepBIndex = _slepBIndex + 1;
				_sleepBMark = -1;
				if !(_slepBIndex == count _fugitiveRewards) then {
					_sleepBMark = round(((_fugitiveRewards select _slepBIndex select 0)*60)/_timeCell);
				};
			};
			if (_sleepC == _sleepCMark) then {
				_nearPlotPole = _fugitive nearObjects ["Plastic_Pole_EP1_DZ",DZE_PlotPole select 0];
				_inSafe = false;
				_isHigh = ((getPosATL _fugitive) select 2) > 1250;
				{if (_fugitive distance _x < _safezonesRad) exitWith {_inSafe = true;};} forEach _safezones;
				if (count _nearPlotPole > 0 || _inSafe || _isHigh) then {_timeInPlot = _timeInPlot+_sleepCMark*_timeCell};
				_sleepC = 0;
			};
			if (_sleepD == _sleepDMark) then {
				if (vehicle _fugitive == _fugitive) then {
					_sleepAMark = round(_updateMark/_timeCell);
				} else {
					if (vehicle _fugitive isKindOf "Air") then {
						_sleepAMark = round ((_updateMark/_timeCell)*0.25);
					} else {
						_sleepAMark = round ((_updateMark/_timeCell)*0.5);
					};
				};
				_sleepD = 0;
			};
			if (_txt != "" && _txt != "Time Reward! ") then {
			fnc_show_colorAdminMsg = [_txt,'#DD5D25'];
			publicVariable 'fnc_show_colorAdminMsg';
			};
			uiSleep _timeCell;
			_txt = "";
			_sleepA = _sleepA + 1;
			_sleepB = _sleepB + 1;
			_sleepC = _sleepC + 1;
			_sleepD = _sleepD + 1;
			_aliveTimePassed = (time - _aliveTimeStart);
		};
		deleteMarker "DONN_FUGITIVE";
		deleteMarker "DONN_FUGITIVE_DOT";
		if (!isNull _fugitive) then {
			_lockedFugitives = _lockedFugitives + [_fugitiveID];
			if (alive _fugitive) then {
				if (_timeInPlot <= _aliveTimeToWin*_maxTimeNearPlot) then {
					_txt = format ["%1, time over! The prize is yours!Collect your reward near you.",(name _fugitive)];
					fnc_show_colorAdminMsg = [_txt,'#DD5D25'];
					publicVariable 'fnc_show_colorAdminMsg';
					_veh = createVehicle ["CSJ_GyroC",[position _fugitive select 0,position _fugitive select 1,0],[],10,'NONE'];
					_veh setVariable ["ObjectID","0",true];
					_veh setVariable ["ObjectUID",str round random 9999999,true];
					_fugitive reveal [_veh,4];
					_holder = createVehicle ["Weaponholder",[position _fugitive select 0,position _fugitive select 1,0],[],0,"NONE"];
					_holder addMagazineCargoGlobal ["ItemBriefCase100oz",4];
					_fugitive reveal [_holder,4];
					diag_log "[MOSTWA] Ending! Fugitive Win!";
					_lastTimeConclude = time;
				} else {
					_txt = format ["Hunt time over! %1, you were near a plot pole or safezones or high in the sky. No pain no gain. No reward., ",(name _fugitive)];
					fnc_show_colorAdminMsg = [_txt,'#DD5D25'];
					publicVariable 'fnc_show_colorAdminMsg';
					diag_log "[MOSTWA] Ending! Fugitive not Fair...";
					_lastTimeConclude = time-_runTimeInter*0.75;
				};
			} else {
				_txt = format["%1 perished! Collect the prize on his body!The mark will remain on the map for 45 seconds!",(name _fugitive)];
				fnc_show_colorAdminMsg = [_txt,'#DD5D25'];
				publicVariable 'fnc_show_colorAdminMsg';
				createMarker ["DONN_FUGITIVE",position _fugitive];
				"DONN_FUGITIVE" setMarkerColor "ColorRed";
				"DONN_FUGITIVE" setMarkerShape "ELLIPSE";
				"DONN_FUGITIVE" setMarkerBrush "SolidBorder";
				"DONN_FUGITIVE" setMarkerSize [100,100];
				createMarker ["DONN_FUGITIVE_DOT",position _fugitive];
				"DONN_FUGITIVE_DOT" setMarkerColor "ColorBlack";
				"DONN_FUGITIVE_DOT" setMarkerType "Vehicle";
				"DONN_FUGITIVE_DOT" setMarkerText "Fugitive Body...";
				_holder = createVehicle ["Weaponholder",[position _fugitive select 0,position _fugitive select 1,0],[],0,"NONE"];
				_holder addMagazineCargoGlobal ["ItemBriefCase100oz",4];
				_fugitive reveal [_holder,4];
				uiSleep 120;
				deleteMarker "DONN_FUGITIVE";
				deleteMarker "DONN_FUGITIVE_DOT";
				diag_log "[MOSTWA] Ending! Fugitive perished.";
				_lastTimeConclude = time;
			};
		} else {
			_txt = format["The hunt for %1 is over... %1 disconnected!",_fugitiveName];
			fnc_show_colorAdminMsg = [_txt,'#DD5D25'];
			publicVariable 'fnc_show_colorAdminMsg';
			diag_log "[MOSTWA] Fugitive disconnected...";
			_lastTimeConclude = time-_runTimeInter*0.75;
		};
	} else {
		diag_log "[MOSTWA] Cant find an elegible fugitive...";
		_lastTimeConclude = time-_runTimeInter*0.75;
	};
};