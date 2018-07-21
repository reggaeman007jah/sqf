
    _index = lbCurSel 1500;
    _unit = playerListArray select _index;
    _pos = getPosATL _unit;

    player setPosATL [_pos select 0, _pos select 1, _pos select 2];