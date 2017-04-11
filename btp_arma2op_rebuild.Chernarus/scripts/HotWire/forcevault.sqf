/** ORIGINAL Author: SchwEde aka shinySonic **/
/** REWRITED BY juandayz and dedicated for Pillbox :D **/
//Fixes by "a man" and "shawn" tnks guys for the help

private ["_hasitem","_vault","_isunlockable","_open","_SetChanceToFail"];

_vault = _this select 3;
_isunlockable = (((typeOf _vault) == "VaultStorageLocked") || ((typeOf _vault) == "LockboxStorageLocked"));
_open= round(random 10);
_SetChanceToFail = 9;//1 chance to unlock /9 chance to cannot unlock
_hasitem = "ItemHotwireKit" in magazines player;

player removeAction s_player_hotwirevault;
s_player_hotwirevault = -1;

if (!_hasitem) exitWith {
systemChat("You need a hotwire kit in your inventory");
};


dayz_actionInProgress = true;
player removeMagazine "ItemHotwireKit";


if (_isunlockable) then {

if (_open < _SetChanceToFail)  exitWith {
dayz_actionInProgress = false;
systemChat("Bad Luck, i could not open it and broke the Hotwire Kit");
};

systemChat("Done! I have opened the vault");

//call compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\vault_unlock.sqf";
dayz_combination = _vault getVariable["CharacterID","0"];
_vault spawn player_unlockVault;
dayz_actionInProgress = false;
};