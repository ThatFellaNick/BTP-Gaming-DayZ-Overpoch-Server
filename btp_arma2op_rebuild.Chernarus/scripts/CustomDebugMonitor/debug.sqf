while {debugMonitor} do
{
	_time = (round(120-(serverTime)/60));     //Want it to count up instead of down? use _time = (round serverTime)/60;
    _hours = (floor(_time/60));
    _minutes = (_time - (_hours * 60));
    switch(_minutes) do
    {
        case 9: {_minutes = "09"};
        case 8: {_minutes = "08"};
        case 7: {_minutes = "07"};
        case 6: {_minutes = "06"};
        case 5: {_minutes = "05"};
        case 4: {_minutes = "04"};
        case 3: {_minutes = "03"};
        case 2: {_minutes = "02"};
        case 1: {_minutes = "01"};
        case 0: {_minutes = "00"};
    };
	Money 			= player getVariable["cashMoney",0];
	Special_Money	= player getVariable["GlobalMoney",0];
	Bank_Balance 	= player getVariable["MoneySpecial",0];
	
	_pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));
	if (player == vehicle player) then { _pic = (gettext (configFile >> 'cfgWeapons' >> (currentWeapon player) >> 'picture'));}
	else { _pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture')); 
		};
		hintSilent parseText format ["
	<t size='1.2' font='Zeppelin33' align='center' color='#ffffff'>%1</t><br/>	
	<img size='5' image='%11'/><br/>
	<t color='#DD5D25' size='1' font='Zeppelin33' align='left'>Players Online: </t><t color='#ffffff' size='1' font='Zeppelin33' align='right'>%2</t><br/>	
	<t color='#DD5D25' size='1' font='Zeppelin33' align='left'>FPS: </t><t color='#ffffff' size='1' font='Zeppelin33' align='right'>%3</t><br/>
	<t color='#DD5D25' size='1' font='Zeppelin33' align='left'>Blood: </t><t color='#ffffff' size='1' font='Zeppelin33' align='right'>%4</t><br/>
	<t color='#DD5D25' size='1' font='Zeppelin33' align='left'>Humanity: </t><t color='#ffffff' size='1' font='Zeppelin33' align='right'>%5</t><br/>
	<br/>
	<t color='#DD5D25' size='1' font='Zeppelin33' align='left'>Murders: </t><t color='#ffffff' size='1' font='Zeppelin33' align='right'>%6</t><br/>
	<t color='#DD5D25' size='1' font='Zeppelin33' align='left'>Bandit Kills:  </t><t color='#ffffff' size='1' font='Zeppelin33' align='right'>%7</t><br/>
	<t color='#DD5D25' size='1' font='Zeppelin33' align='left'>Zombie Kills: </t><t color='#ffffff' size='1' font='Zeppelin33' align='right'>%8</t><br/>
	<t color='#DD5D25' size='1' font='Zeppelin33' align='left'>Restart In: </t><t color='#ffffff' size='1' font='Zeppelin33' align='right'>%9H %10M</t><br/>
	<t color='#ffffff' size='1' font='Zeppelin33' align='center'>www.btpgaming.com</t>
	",
		(name player),//1
		(playersNumber west),//2
		(round diag_fps),//3
		(player getVariable['USEC_BloodQty', r_player_blood]),//4
		(player getVariable['humanity', 0]),//5
		(player getVariable['humanKills', 0]),//6
		(player getVariable['banditKills', 0]),//7
		(player getVariable['zombieKills', 0]),//8
		_hours, // Used on line 52 to display hours //9
		_minutes, // Used on line 52 to display minutes //10
		_pic,//11
		[Money] call BIS_fnc_numberText,//12
		[Bank_Balance] call BIS_fnc_numberText//13
		
	];
    sleep 1;
};
//Add this If Needed
	/*  
	<br/>
	<t color='#DD5D25' size='1' font='Zeppelin33' align='left'>Cash: </t><t color='#ffffff' size='1' font='Zeppelin33' align='right'>%12 Coins</t><br/>
	<t color='#DD5D25' size='1' font='Zeppelin33' align='left'>Bank Money: </t><t color='#ffffff' size='1' font='Zeppelin33' align='right'>%13 Coins</t><br/>
	<br/>
	*/