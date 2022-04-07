private ["_car", "_zbody", "_zattached", "_currentZedArray"];
_car = _this select 3;
_zattached = _car getVariable["zattachedArray", []];
if (count _zattached > 0) then {
    _currentZedArray = _car getVariable ["zattachedArray", []];
    {
        _zbody = _x;
        detach _zbody;
        sleep 0.5;
        _zbody attachto [_car, [-5, -1, 0]];
        sleep 0.2;
        detach _zbody;
        _zbody setVariable["zattached", false, false];
        _currentZedArray = _currentZedArray - [_zbody];
        _car setVariable["zattachedArray", _currentZedArray, true];
    } forEach _zattached;
    systemChat "Zombies have been removed from the vehicle.";
    sleep 2;
    {
        _zbody = _x;
        player addMagazine "equip_rope";
        _zbody addEventHandler ["handledamage", {
            true
        }];
    } forEach _zattached;
    systemChat "Zombies have been untied and can take damage."
} else {
    systemChat("No zombies are attached to your vehicle.");
};