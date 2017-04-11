class ExtraRc {
	class ItemToolbox {
		class BuildBike {
			text = "Deploy Bike";
			script = "execVM 'dayz_code\scripts\deploybike.sqf'";
		};
	};
	class ItemKnife {
			class HarvestWeed {
				text = "Harvest Weed";
				script = "execVM 'scripts\Weed\HarvestWeed.sqf'";
			};
	};
	class ItemRadio {
			class CustomMenu {
				text = "BTP Menu";
				script = "execVM 'scripts\menu\menu_init.sqf'";
			};
	};
	class Binocular_Vector  {
                class ViewDistance {
                        text = "View Distance:";
                        script = "systemChat('Change View Distance Locally. Click on one of the distance options');";
                };
				 class distance2000m {
                        text = "2000 Meters";
                        script = "setViewDistance 2000; systemChat('[BTP]ViewDistance: 2000');format['[BTP]ViewDistance: 2000'] call dayz_rollingMessages;";
                };
                class distance3000m {
                        text = "3000 Meters";
                        script = "setViewDistance 3000; systemChat('[BTP]ViewDistance: 3000');format['[BTP]ViewDistance: 3000'] call dayz_rollingMessages;";
                };
                class distance4000m {
                        text = "4000 Meters";
                        script = "setViewDistance 4000; systemChat('[BTP]ViewDistance: 4000'); systemChat('Warning: Higher the view distance Lower the FPS'); format['[BTP]ViewDistance: 4000'] call dayz_rollingMessages;";
                };
                class distance6000m {
                        text = "6000 Meters";
                        script = "setViewDistance 6000; systemChat('[BTP]ViewDistance: 6000'); systemChat('Warning: Higher the view distance Lower the FPS'); format['[BTP]ViewDistance: 6000'] call dayz_rollingMessages;";
                };
				class distance10000m {
                        text = "10000 Meters";
                        script = "setViewDistance 10000; systemChat('[BTP]ViewDistance: 10000'); systemChat('Warning: Higher the view distance Lower the FPS'); format['[BTP]ViewDistance: 10000'] call dayz_rollingMessages;";
                };
        };
        class Binocular {
                class ViewDistance {
                        text = "View Distance:";
                        script = "systemChat('Change View Distance Locally. Click on one of the distance options');";
                };
								 class distance2000m {
                        text = "2000 Meters";
                        script = "setViewDistance 2000; systemChat('[BTP]ViewDistance: 2000');format['[BTP]ViewDistance: 2000'] call dayz_rollingMessages;";
                };
                class distance3000m {
                        text = "3000 Meters";
                        script = "setViewDistance 3000; systemChat('[BTP]ViewDistance: 3000');format['[BTP]ViewDistance: 3000'] call dayz_rollingMessages;";
                };
                class distance4000m {
                        text = "4000 Meters";
                        script = "setViewDistance 4000; systemChat('[BTP]ViewDistance: 4000'); systemChat('Warning: Higher the view distance Lower the FPS'); format['[BTP]ViewDistance: 4000'] call dayz_rollingMessages;";
                };
                class distance6000m {
                        text = "6000 Meters";
                        script = "setViewDistance 6000; systemChat('[BTP]ViewDistance: 6000'); systemChat('Warning: Higher the view distance Lower the FPS'); format['[BTP]ViewDistance: 6000'] call dayz_rollingMessages;";
                };
				class distance10000m {
                        text = "10000 Meters";
                        script = "setViewDistance 10000; systemChat('[BTP]ViewDistance: 10000'); systemChat('Warning: Higher the view distance Lower the FPS'); format['[BTP]ViewDistance: 10000'] call dayz_rollingMessages;";
                };
				 };
};