private ["_zbody", "_zattached", "_nearbyCars", "_car", "_currentZedArray", "_carMaxZombies", "_zed_allowedZombiesPerVehicle"];
_zbody = _this select 3;
_zattached = _zbody getVariable["zattached", false];

_zed_allowedZombiesPerVehicle = [
		["hilux1_civil_3_open_DZE",4],
		["datsun1_civil_3_open_DZE",4],
		["hilux1_civil_1_open_DZE",4],
		["datsun1_civil_1_open_DZE",4],
		["V3S_Open_TK_CIV_EP1",10],
		["V3S_Open_TK_EP1",10],
		["KamazOpen_DZE",10]
	];

if (!_zattached) then {
    _nearbyCars = nearestobjects [getPos player, ZED_Allowedvehicles, 10];
    if (count _nearbyCars > 0) then {
        _car = _nearbyCars select 0;
        if (_zbody distance _car < 10) then {
            _carMaxZombies = 0;
            {
                if (typeOf _car == _x select 0) exitwith { //exit forEach loop if vehicle is found
                    _carMaxZombies = _x select 1;
                };
            } forEach ZED_AllowedZombiesPervehicle;
            if (_carMaxZombies == 0) exitwith { //exit script if vehicle is not found
                systemChat "No allowed zombies in this vehicle.";
            };
            _currentZedArray = _car getVariable ["zattachedArray", []];
            if (count _currentZedArray >= _carMaxZombies) exitwith {
                systemChat format ["This vehicle (%1) can't carry anymore zombies.", typeOf _car];
            };
            _zbody attachto [_car, [0, -1.5, -1]];
            player removeMagazine "equip_rope";
            _zbody addEventHandler ["handledamage", {
                false
            }];
            [objNull, _zbody, rswitchMove, ""] call RE;
            _zbody setVariable["zattached", true, true];
            _currentZedArray = _currentZedArray + [_zbody];
            _car setVariable["zattachedArray", _currentZedArray, true];
            systemChat("You tie the zombie to the vehicle.");
        };
    } else {
        systemChat("No allowed vehicle nearby");
    };
};