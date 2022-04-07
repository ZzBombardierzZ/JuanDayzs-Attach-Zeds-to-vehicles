# DayZ Epoch - juandayz's Attach Zeds to Vehicles (Fixed)
Originally made by [juandayz](https://epochmod.com/forum/profile/36144-juandayz/) - 
[Original script](https://epochmod.com/forum/topic/43837-release-attach-zeds-to-vehicles/)
## Bomb's Changes:
* Added fixes from the comment section of the original script.
* Added a Max Zombies check configurable in the attachzed.sqf file.
* Added feature where zombies get moved outside the vehicle when you release them. 
* Added several messages to fit a theme better as well as to tell the player reasons why zombies are not attached.
* Improved formatting of the scroll wheel options.
* Improved formatting of the scripts.
* Improved the install instructions to be more clear.
* Fixed a major issue where "release zombies" option inside the vehicle doesn't work at all.

## Install instructions:
1. Download this repository.
2. Extract the attachzeds folder into your __mission root__, ie `DayZ_Epoch_11.Chernarus` folder so the path looks like this: `mpmissions\your_instance\attachzeds\`
3. If you don't already have a custom variables, compiles, and fn_selfActions files, follow AirwavesMan's instructions [here](https://github.com/AirwavesMan/custom-epoch-functions)
4. In fn_selfActions.sqf, add find following:
~~~sqf
//Grab Flare
if (_canPickLight && !dayz_hasLight && !_isPZombie) then {
	if (s_player_grabflare < 0) then {
		_text = getText (configFile >> "CfgAmmo" >> (typeOf _nearLight) >> "displayName");
		s_player_grabflare = player addAction [format[localize "str_actions_medical_15",_text], "\z\addons\dayz_code\actions\flare_pickup.sqf",_nearLight, 1, false, true];
		s_player_removeflare = player addAction [format[localize "str_actions_medical_17",_text], "\z\addons\dayz_code\actions\flare_remove.sqf",_nearLight, 1, false, true];
	};
} else {
	player removeAction s_player_grabflare;
	player removeAction s_player_removeflare;
	s_player_grabflare = -1;
	s_player_removeflare = -1;
};
~~~

and below it add:
~~~sqf
//Beginning OF ZED ATTACH SECTION
local _allowedvehiclesA = typeOf _vehicle in ZED_AllowedVehicles;


if (_invehicle && _allowedvehiclesA && (driver _vehicle == player)) then {
    DZE_myVehicle = _vehicle;
    if (s_player_zedsr < 0 && (count (DZE_myVehicle getVariable ["zattachedArray", []]) > 0)) then {
        s_player_zedsr = DZE_myVehicle addAction ["Release Zombies", "attachzeds\detachzed_veh.sqf", DZE_myVehicle, 2, false, true, "", ""];
    };
} else {
    DZE_myVehicle removeAction s_player_zedsr;
    s_player_zedsr = -1;
};
//END OF ZED ATTACH SECTION
~~~

Next find:
~~~sqf
    //Towing with tow truck
	/*
	if(_typeOfCursorTarget == "TOW_DZE") then {
		if (s_player_towing < 0) then {
			if(!(_cursorTarget getVariable ["DZEinTow", false])) then {
				s_player_towing = player addAction [localize "STR_EPOCH_ACTIONS_ATTACH" "\z\addons\dayz_code\actions\tow_AttachStraps.sqf",_cursorTarget, 0, false, true];
			} else {
				s_player_towing = player addAction [localize "STR_EPOCH_ACTIONS_DETACH", "\z\addons\dayz_code\actions\tow_DetachStraps.sqf",_cursorTarget, 0, false, true];
			};
		};
	} else {
		player removeAction s_player_towing;
		s_player_towing = -1;
	};
	*/
~~~

and below it add:
~~~
    if (_isalive && {(_cursortarget isKindOf "zZombie_base")}) then {
		_zattached = _cursortarget getVariable["zattached", false];
		if (!_zattached) then {
			if ("equip_rope" in magazines player) then {
				if (s_player_zhide4 < 0) then {
					s_player_zhide4 = player addAction [format["<t color='#0096ff'>Tie Zombie to Nearby Vehicle</t>"], "attachzeds\attachzed.sqf", _cursortarget, 0, false, true];
				};
			} else {
				player removeAction s_player_zhide4;
				s_player_zhide4 = -1;
			};
		};
		
		if (_zattached) then {
			if (s_player_zhide5 < 0) then {
				s_player_zhide5 = player addAction [format["<t color='#0096ff'>Untie Zombie</t>"], "attachzeds\detachzed.sqf", _cursortarget, 0, true, true];
			};
		} else {
			player removeAction s_player_zhide5;
			s_player_zhide5 = -1;
		};
	};
~~~

Lastly, find `//Engineering` and below it add:
~~~sqf
    player removeAction s_player_zhide5;
	s_player_zhide5 = -1;
	player removeAction s_player_zhide4;
	s_player_zhide4 = -1;
~~~

5. In your custom variables.sqf file, below `if (!isDedicated) then {` and below it add:
~~~
	ZED_AllowedVehicles = [
		"hilux1_civil_3_open_DZE",
		"datsun1_civil_3_open_DZE",
		"hilux1_civil_1_open_DZE",
		"datsun1_civil_1_open_DZE",
		"V3S_Open_TK_CIV_EP1",
		"V3S_Open_TK_EP1",
		"KamazOpen_DZE"
	];
~~~

If you don't already have `dayz_resetSelfActions = {` in your variables.sqf file, copy the example from the example folder and paste it below `if (!isDedicated) then {`. Otherwise, if you do already have `dayz_resetSelfActions` then find `s_player_checkWallet = -1;` and below it copy:
~~~sqf
		s_player_zedsr = -1;
		s_player_zhide4 = -1;
		s_player_zhide5 = -1;
~~~

* That's it for the install.

## Configuration
* When adding/removing which vehicles can store zombies, be sure to change the `ZED_AllowedVehicles` array in the custom variables.sqf file __AND__ `_zed_allowedZombiesPerVehicle` array in attachzed.sqf.
* To change the amount of zombies that can be stored in a vehicle, change the `_zed_allowedZombiesPerVehicle` array in attachzed.sqf.