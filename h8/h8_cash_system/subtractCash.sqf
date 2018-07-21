
_target = _this select 0;
_caller = _this select 1;
_id = _this select 2;
// the above are not used in this video

cost = 5;

if (cash >= _cost)
then 
	{
	cash = cash - _cost;
	hint "cash taken";
	player addWeapon "arifle_MX_f";
	}
else 
	{
	hint "not enough money";
	};
};



