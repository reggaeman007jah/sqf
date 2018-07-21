
GLB_BulletsFired = 0;

player addEventHandler ["FIRED", {null = [] execVM "script.sqf";}];

// when mission starts you have 0 bullets fired


// next cange the code to this:


GLB_BulletsFired = 0;

player addEventHandler ["ANIMCHANGED", {null = [] execVM "script.sqf";}];

// THIS ^^ still works with script.sqf




//next, to add the EH to all units, change to:


GLB_BulletsFired = 0;

{
_x addEventHandler ["FIRED", {null = [] execVM "script.sqf";}];
} forEach allunits;

// note, EHs are constant throughout the game, and do not need to be reapplied on respawn






