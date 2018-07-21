
cash = 0;
removeAllWeapons player;

player addAction ["count cash", {hint format ["Cash: %1", cash]; },[],6];

player addAction ["buy weapon (cost 5)","subtractCash.sqf", [], 5];

player addAction ["add cash (+10)", 
{
	cash = cash + 10;
	hint "cash + 10";
},[],4];

// check this is correct!


