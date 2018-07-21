
createDialog "dialogTest";

    _ctrl = (findDisplay 1234 ) displayCTRL 1500;

   		playerListArray = [];

			{
				playerListArray pushback _x;
				_name = name _x;
				_side = side _x;

				lbAdd [1500, _name];

				switch (_side) do
					{
						case WEST: {lbSetColor [1500, _forEachindex, [0,0,1,1]];}; //blue
						case EAST: {lbSetColor [1500, _forEachindex, [1,0,0,1]];}; //red
					}
			
			} forEach allUnits;

lbSetCurSel [1500, 0];


