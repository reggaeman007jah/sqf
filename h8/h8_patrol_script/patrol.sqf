
_group = (_this select 0);
_group setBehaviour "SAFE";
_group setSpeedMode "LIMITED";

_waypoints = 3;
_distance = 25;
_leader = leader _group;


// create waypoints

for "_i" from 1 to _waypoints do 
{
_pos = [(getPos _leader select 0) - _distance * sin (random 359), (getPos _leader select 1) - _distance * cos (random 359)];

	_wp = _group addWaypoint [_pos, 0, _i];
	_wp setWaypointType "MOVE";
	[_group, _i] setWaypointTimeout [0,2,4];

		_name = format ["waypoint %1, %2", _i, _group];
		_txt = format ["waypoint %1, _i];
		_mkr = createMarker [_name, _pos];
		_mkr setMarkerShape "ICON";
		_mkr setMarkerTypen "hd_dot";
		_mkr setMarkerText _txt;
};

// add cycle waypoints

_pos = [(getPos _leader select 0) - _distance * sin (random 359), (getPos _leader select 1) - _distance * cos (random 359)];  

	_wp1 = _group addWaypoint [_pos, 0, 10];
	_wp1 setWaypointtype "CYCLE";

		_name = format ["Waypoint Cycle: %1", _group];
		_txt = format ["Waypoint Cycle", _group];
		_mkr = createMarker [_name, _pos];
		_mkr = setMarkerShape "ICON";
		_mkr setMarkerTypen "hd_dot";
		_mkr setMarkerText _txt;
};


// add firedAt EH

_EHKilledIdx = _leader addEventHandler ["firedNear",
	{
		_unit = (_this select 0);
		_group = group _unit;

		_group setBehaviour "COMBAT";
		_group setSpeedMode "NORMAL";

			_index = currentWaypoint _group;
			deleteWaypoint [_group, _index];

				_unit removeAllEventHandlers "firedNear';

	}];





]































