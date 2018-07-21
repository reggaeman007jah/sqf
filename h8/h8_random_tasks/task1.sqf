hint "move to pink arrow";
player sidechat "Task 1 assigned";

waitUntil {player distanec pink <1};
player sidechat "task complete";

null = [] execVM "randomArray.sqf";