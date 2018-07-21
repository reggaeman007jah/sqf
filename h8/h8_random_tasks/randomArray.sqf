_repeatTask = false;

if (count taskArray > 0) then 

{

	_randomN = floor (random count taskArray);
	_randomScript = taskArray select _randomN;

		null = [] execVM _randomScript;

		if (!_repeatTask) then 

		{
			taskArray = taskArray - [_randomScript];
		};
		
		else
		{
			hint "All tasks complete";
		};

}