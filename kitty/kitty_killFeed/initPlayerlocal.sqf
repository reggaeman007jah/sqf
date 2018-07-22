
controlList = [];
controlNumber = 0;

{
    _x addEventhandler ["KILLED",
        {
            _unit = (_this select 0);
            _killer = (_this select 1);
            _killerSide = side (_this select 1);
            unitKilled = [_unitName, _killerName, _killerSide];
            publicVariableServer "unitKilled";
        }];
} forEach allUnits;