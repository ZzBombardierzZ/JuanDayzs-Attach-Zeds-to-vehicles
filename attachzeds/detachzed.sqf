private ["_zbody","_zattached","_car","_currentZedArray", "_nearbyCars"];
_zbody = _this select 3;
_zattached = _zbody getVariable["zattached", true];
_nearbyCars = nearestobjects [getPos player, ZED_AllowedVehicles, 10];
if (_zattached && count _nearbyCars == 1) then {
    _car = _nearbyCars select 0;
    player addMagazine "equip_rope";
    detach _zbody;
    sleep 0.5;
    _zbody attachto [_car, [-5, -1, 0]];
    sleep 0.2;
    detach _zbody;
    systemChat "You remove the zombie from the car.";
    _zbody setVariable["zattached", false, false];
    _currentZedArray = _car getVariable ["zattachedArray", []];
    _currentZedArray = _currentZedArray - [_zbody];
    _car setVariable["zattachedArray", _currentZedArray, true];
    sleep 2;
    systemChat "You untie the zombie. It can now take damage.";
    _zbody addEventHandler ["handledamage", {
        true
    }];
};