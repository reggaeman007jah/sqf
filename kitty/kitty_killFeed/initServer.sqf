
"unitkilled" addPublicVariableEventHandler
{
    private ["_data"];
    _data = (_this select 1);
    _unit = (_data select 0);
    _killer = (_data select 1);
    _killerSide = (_data select 2);
    _unitName = name _unit;
    _killerName = name _killer;
    _distance = _unit distance _killer;

    _message = format ["%1 was killed by %2 from %3 meters", _unitName, _killerName, _distance];

    [[_message, _killerSide],
        {
            _message = (_this select 0);
            _side = (_this select 1);

            controlNumber = controlNumber + 1;

            disableSerialization;
                {
                    _ctrl = (findDisplay 46) displayCtrl _x;

                    _pos = ctrlPosition _ctrl;
                    _pos set [1, (_pos select 1) + 0.030];

                    _ctrl ctrlSetPosition _pos;
                    _ctrl ctrlCommit 0.25;
                } forEach controlList;       

            if (controlNumber > 3) then
                {
                    _num = count controlList;
                    _ctrlT = (findDisplay 46) displayCtrl (_num - 2);
                    _ctrlT ctrlsetFade 1;
                    _ctrlT ctrlCommit 6;
                };

            _display = findDisplay 46;
            _ctrl = _display ctrlCreate ["RscText", controlNumber];

            _ctrl ctrlSetPosition [-0.6, 0.9, 0.6, 0.1];

            switch (_side) do
                {
                    case WEST : {_ctrl ctrlSetTextColor [0, 0, 1, 1]};
                    case EAST : {_ctrl ctrlSetTextColor [1, 0, 0, 1]}; 
                };

            _ctrl ctrlSetText _message;
            _ctrl ctrlcommit 0;
            controlList pushBack controlNumber;
        }] remoteExec ["call"];


};