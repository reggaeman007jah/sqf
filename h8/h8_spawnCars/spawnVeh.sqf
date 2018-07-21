
_mkr = (_this select 0);
_pos = markerPos _mkr;
_carSpawns = 4;

_roadList = _pos nearRoads 100;

_showRoads = true;
if (_showRoads) then 
{
	{
		_txt = format ["Roadpos: %1", _x];
		_debug = createMarker [_txt, _x];
		_debug setMarkerShape "ICON";
		_debug setMarkerType "hd_dot";
	} forEach _roadList;
};


// this next bit removes a road if it is on a crosroads
{
_roadConnectedTo = roadsConnectedTo _x;
if (count _roadConnectedTo >2) then
	{
		_roadList = _roadList - [_x];
	};
} forEach _roadlist;


// next, shuffle _roadList, making each spawn different
_roadlist = _roadlist call BIS_fnc_arrayShuffle;

// spawning loop
for "_i" from 1 to _carSpawns do 
{
	_currentRoad = _roadList select _i;
	_roadConnectedTo = roadsConnectedTo _currentRoad;
	_connectedRoad = _roadConnectedTo select 0;
	_direction = [_currentRoad, _connectedRoad] call BIS_fnc_DirTo;

	_veh = createVehicle ["C_offroad_01_F", _currentRoad, [], 0, "CAN_COLLIDE"];
	_veh setDir _direction;
	_veh setPos [(getPos _veh select 0) - 4.5, getPos _veh select 1, getPos _veh select 2];

	_txt = format ["veh: %1", _i];
	_debug = createMarker [_txt, _currentRoad];
	_debug setMarkerShape "ICON";
	_debug setMarkerType "hd_dot";
	_debug setMarkertext _txt;
};





















