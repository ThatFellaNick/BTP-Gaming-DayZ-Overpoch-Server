if (isNil 'debugMonitor') then {
	debugMonitor = true;
	execVM "Scripts\CustomDebugMonitor\debug.sqf";
} else {
	debugMonitor = !debugMonitor;
	hintSilent '';
	execVM "Scripts\CustomDebugMonitor\debug.sqf";
};
