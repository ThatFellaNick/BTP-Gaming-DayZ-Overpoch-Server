if (isServer) then {



_vehicle_0 = objNull;
if (true) then
{
_this = createVehicle ["MAP_R2_RockWall", [3174.5518, 3395.9976], [], 0, "CAN_COLLIDE"];
_vehicle_0 = _this;
_this setDir -637.23334;
_this setPos [3174.5518, 3395.9976];
};

_vehicle_1 = objNull;
if (true) then
{
_this = createVehicle ["MAP_R2_RockWall", [3179.4758, 3435.9524, 4.0806327], [], 0, "CAN_COLLIDE"];
_vehicle_1 = _this;
_this setDir 277.68649;
_this setPos [3179.4758, 3435.9524, 4.0806327];
};

_vehicle_3 = objNull;
if (true) then
{
_this = createVehicle ["MAP_R2_RockWall", [3183.0605, 3349.2285, 4.8923988], [], 0, "CAN_COLLIDE"];
_vehicle_3 = _this;
_this setDir 427.59711;
_this setPos [3183.0605, 3349.2285, 4.8923988];
};

_vehicle_4 = objNull;
if (true) then
{
_this = createVehicle ["MAP_R2_RockWall", [3205.5007, 3317.2625], [], 0, "CAN_COLLIDE"];
_vehicle_4 = _this;
_this setDir 398.97125;
_this setPos [3205.5007, 3317.2625];
};

_vehicle_5 = objNull;
if (true) then
{
_this = createVehicle ["MAP_R2_RockWall", [3247.6194, 3298.0613], [], 0, "CAN_COLLIDE"];
_vehicle_5 = _this;
_this setDir -363.34442;
_this setPos [3247.6194, 3298.0613];
};

_vehicle_8 = objNull;
if (true) then
{
_this = createVehicle ["MAP_R2_RockWall", [3297.4629, 3450.4495], [], 0, "CAN_COLLIDE"];
_vehicle_8 = _this;
_this setDir -170.38853;
_this setPos [3297.4629, 3450.4495];
};

_vehicle_9 = objNull;
if (true) then
{
_this = createVehicle ["MAP_R2_RockWall", [3334.2993, 3417.1099], [], 0, "CAN_COLLIDE"];
_vehicle_9 = _this;
_this setDir -123.16807;
_this setPos [3334.2993, 3417.1099];
};

_vehicle_10 = objNull;
if (true) then
{
_this = createVehicle ["MAP_R2_RockWall", [3280.533, 3250.4756], [], 0, "CAN_COLLIDE"];
_vehicle_10 = _this;
_this setDir -14.984175;
_this setPos [3280.533, 3250.4756];
};

_vehicle_11 = objNull;
if (true) then
{
_this = createVehicle ["MAP_R2_RockWall", [3343.7781, 3320.719], [], 0, "CAN_COLLIDE"];
_vehicle_11 = _this;
_this setDir -72.570518;
_this setPos [3343.7781, 3320.719];
};

_vehicle_12 = objNull;
if (true) then
{
_this = createVehicle ["MAP_R2_RockWall", [3348.6143, 3363.6333], [], 0, "CAN_COLLIDE"];
_vehicle_12 = _this;
_this setDir -95.449776;
_this setPos [3348.6143, 3363.6333];
};

_vehicle_13 = objNull;
if (true) then
{
_this = createVehicle ["MAP_R2_RockWall", [3264.7717, 3444.8596, 0.098523401], [], 0, "CAN_COLLIDE"];
_vehicle_13 = _this;
_this setDir -581.40845;
_this setPos [3264.7717, 3444.8596, 0.098523401];
};

_vehicle_14 = objNull;
if (true) then
{
_this = createVehicle ["MAP_R2_RockWall", [3322.4194, 3275.4348, -0.0002746582], [], 0, "CAN_COLLIDE"];
_vehicle_14 = _this;
_this setDir -54.067604;
_this setPos [3322.4194, 3275.4348, -0.0002746582];
};

_vehicle_15 = objNull;
if (true) then
{
_this = createVehicle ["MAP_R2_RockWall", [3217.748, 3467.3889, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
_vehicle_15 = _this;
_this setDir -214.8748;
_this setPos [3217.748, 3467.3889, -1.5258789e-005];
};





// Bor Trader City - (when entering from north entrance)        the 1st trader on the left, clockwise -- Weapons Neutral
_unit_1201 = objNull;
if (true) then
{
_this = createAgent ["Tanny_PMC", [3262.95, 3423.72, 0.002], [], 0, "CAN_COLLIDE"];
_unit_1201 = _this;
_this setDir 178;
_this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
_this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
};

// Bor Trader City - (when entering from north entrance)        the 2nd trader on the left, clockwise -- Ammunition Neutral
_unit_1202 = objNull;
if (true) then
{
_this = createAgent ["GUE_Commander", [3274.93,3436.47,0.002], [], 0, "CAN_COLLIDE"];
_unit_1202 = _this;
_this setDir 189;
_this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
_this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
};

// Bor Trader City - (when entering from north entrance)        the 3rd trader on the left, clockwise -- neutral Building/Parts
_unit_1203 = objNull;
if (true) then
{
_this = createAgent ["RU_Citizen2", [3283.64, 3421.78, 0.001], [], 0, "CAN_COLLIDE"];
_unit_1203 = _this;
_this setDir 244;
_this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
_this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
};

// Bor Trader City - (when entering from north entrance)        the 4th trader on the left, clockwise -- auto dealer (car dealer)
_unit_1204 = objNull;
if (true) then
{
//3289.81,3411.21,9.918
_this = createAgent ["Worker1", [3289.11, 3411.11, 0.001], [], 0, "CAN_COLLIDE"];
_unit_1204 = _this;
_this setDir 276;
_this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
_this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
};

_vehicle_12041 = objNull;
if (true) then
{
_this = createVehicle ["HeliHEmpty", [3285.11, 3410.11, 0.002], [], 0, "CAN_COLLIDE"];
_vehicle_12041 = _this;
_this setDir 276;
_this setPos [3285.11, 3410.11, 0.002];
};

_vehicle_12042 = objNull;
if (true) then
{
_this = createVehicle ["HeliHRescue", [3285.15, 3410.15, 0.002], [], 0, "CAN_COLLIDE"];
_vehicle_12042 = _this;
_this setDir 276;
_this setPos [3285.15, 3410.15, 0.002];
};

// Bor Trader City - (when entering from north entrance)        5th trader on the left, clockwise -- neutral General Store
_unit_1205 = objNull;
if (true) then
{
_this = createAgent ["Damsel5", [3270.38,3404.06,0.001], [], 0, "CAN_COLLIDE"];
_unit_1205 = _this;
_this setDir 17;
_this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
_this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
};

// Bor Trader City - (when entering from north entrance)        6th trader on the left, clockwise -- Medical Supplies
_unit_1206 = objNull;
if (true) then
{
_this = createAgent ["ValentinaVictim", [3260.15,3410.68,0.002], [], 0, "CAN_COLLIDE"];
_unit_1206 = _this;
_this setDir 66;
_this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
_this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
};

};