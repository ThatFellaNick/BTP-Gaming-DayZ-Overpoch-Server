private ["_random_job", "_job", "_pay", "_interval", "_payFIX1", "_payFIX2", "_payFIX3", "_minutes", "_count", "_runned1", "_runned2", "_base_near1", "_camper_pos1", "_base_near2", "_camper_pos2", "_didHeCamp"];
player removeAction s_player_BTPcareer;
s_player_BTPcareer = -1;
if (isNil "BTP_jobs") then { BTP_JOBs = false; };
if (!BTP_jobs) then {
	BTP_jobs = true;
	_random_job = [
		["Mayor", 12500, 1200],
		["Builder", 5000, 900],
		["Marine Engineer", 9000, 600],
		["Retailer", 5000, 900],
		["Hot dog Vendor", 5000, 1200],
		["Store Manager", 6000, 600],
		["Astronaut", 14000, 1200],
		["Hunter", 7500, 600],
		["Army Officer", 7500, 600],
		["Dairy Farmer", 5500, 600],
		["Grim Reaper", 7500, 600],
		["Boxer", 5000, 600],
		["Scientist", 14000, 1200],
		["Bambie Teacher", 7500, 600],
		["Mental Scientist", 7500, 900],
		["Pilot", 7500, 600],
		["Engineer", 7500, 600],
		["President", 7500, 900],
		["Secretary", 7500, 600],
		["Pediatrician", 6500, 600],
		["Porn Star", 9300, 600],
		["Lawyer", 9000, 900],
		["Driver", 7500, 600],
		["Black Market Dealer", 7500, 1200],		
		["Sniper", 9000, 600],
		["Dragon Born", 7500, 900],
		["Clerk", 14000, 600],
		["Baby Sitter", 9300, 600],
		["Office Manager", 5000, 600],
		["Potato farmer", 9300, 900],
		["Pet Doctor", 5000, 900],
		["Hacker", 9300, 1200],	
		["Fapper", 5000, 600],
		["Goat Shagger", 3300, 600],
		["Bullseye Cooker", 3300, 900],		
		["Gamer Kid", 5000, 900],
		["Noobie Scripter", 5000, 900]
	] call BIS_fnc_selectRandom;
	
	_job = _random_job select 0;
	_pay = _random_job select 1;
	_interval = _random_job select 2;
	_payFIX1 = [_pay] call BIS_fnc_numberText;
	_payFIX2 = [_pay*2] call BIS_fnc_numberText;
	_payFIX3 = [_pay*3] call BIS_fnc_numberText;
	_minutes = _interval/60;
	BTP_JOB = _job;
	BTP_PAY = format["%1 coins every %2 min.",_payFIX1,_minutes];
	systemChat format["[BTP] Your job is a %1 and it pays you %2 coins every %3 minutes!",_job,_payFIX1,_minutes];
	format["[BTP] Your job is a %1 and it pays you %2 coins every %3 minutes!",_job,_payFIX1,_minutes] call dayz_rollingMessages;
	
	uiSleep 10;
	
	systemChat format["[BTP] Your job is a %1 and it pays you %2 coins every %3 minutes!",_job,_payFIX1,_minutes];
	format["[BTP] %1 has started a new job as a %2. Paycheck: %3.",name player,_job,BTP_PAY] call dayz_rollingMessages;

	_count = 0;
	_runned1 = false;
	_runned2 = false;
	while {alive player} do {
		_base_near1 = count nearestObjects [player, ["Plastic_Pole_EP1_DZ"], 35];
		_camper_pos1 = getPos (vehicle player);
		uiSleep _interval;
		if (!inSafeZone) then {
			_base_near2 = count nearestObjects [player, ["Plastic_Pole_EP1_DZ"], 35];
			if (_base_near1 == 0 || _base_near2 == 0) then {
				_camper_pos2 = getPos (vehicle player);
				_didHeCamp = round(_camper_pos1 distance _camper_pos2);
				if (_didHeCamp > 100) then {
					_count = _count+1;
					if (_count < 4) then {
						[player,_pay] call SC_fnc_addCoins;
						systemChat format["[BTP] You have received %1 coins paycheck from %2 job!",_payFIX1,_job];
						format["[BTP] You have received %1 coins paycheck from %2 job!",_payFIX1,_job] call dayz_rollingMessages;
					} else {
						if (_count > 6) then {
							if (!_runned2) then {
								_runned2 = true;
								systemChat format["[BTP] You have been promoted to the Chief %1 which pays %2 coins every %3 minutes!",_job,_payFIX3,_minutes];
								format["[BTP] You have been promoted to the Chief %1 which pays %2 coins every %3 minutes!",_job,_payFIX3,_minutes]; call dayz_rollingMessages;
								BTP_JOB = format["Chief %1",_job];
								BTP_PAY = format["%1 coins every %2 min.",_payFIX3,_minutes];
							};
							[player,_pay*3] call SC_fnc_addCoins;
							systemChat format["[BTP]You have received %1 coins paycheck from Chief %2 job!",_payFIX3,_job];
							format["[BTP]You have received %1 coins paycheck from Chief %2 job!",_payFIX3,_job] call dayz_rollingMessages;
						} else {
							if (!_runned1) then {
								_runned1 = true;
								systemChat format["[BTP]You have been promoted to the Senior %1 which pays %2 coins every %3 minutes!",_job,_payFIX2,_minutes];
								format["[BTP]You have been promoted to the Senior %1 which pays %2 coins every %3 minutes!",_job,_payFIX2,_minutes] call dayz_rollingMessages;
								BTP_JOB = format["Senior %1",_job];
								BTP_PAY = format["%1 coins every %2 min.",_payFIX2,_minutes];
							};
							[player,_pay*2] call SC_fnc_addCoins;
							systemChat format["J[BTP]You have received %1 coins paycheck from Senior %2 job!",_payFIX2,_job];
							format["J[BTP]You have received %1 coins paycheck from Senior %2 job!",_payFIX2,_job] call dayz_rollingMessages;
						};
					};
				} else {
					systemChat format["[BTP]You were camping in same area and your %1 paycheck was skipped!",BTP_JOB];
					format["[BTP]You were camping in same area and your %1 paycheck was skipped!",BTP_JOB] call dayz_rollingMessages;
				};
			} else {
				systemChat format["[BTP]You were hanging around a base and your %1 paycheck was skipped!",BTP_JOB];
				format["[BTP]You were hanging around a base and your %1 paycheck was skipped!",BTP_JOB] call dayz_rollingMessages; 
			};
		} else {
			systemChat format["[BTP]You were hanging in or around a safe zone and your %1 paycheck was skipped!",BTP_JOB];
			format["[BTP]You were hanging in or around a safe zone and your %1 paycheck was skipped!",BTP_JOB] call dayz_rollingMessages;
		};
	};
} else {
		format["%1, you already have job as a %2!",name player,BTP_JOB] call dayz_rollingMessages;
};
