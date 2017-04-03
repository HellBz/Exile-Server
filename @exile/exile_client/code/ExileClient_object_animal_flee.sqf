/**
 * ExileClient_object_animal_flee
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_animal","_attacker","_animalConfig","_fleeDistance","_direction","_position","_dangerSound"];
_animal = _this select 0;
_attacker = _this select 1;
if !(alive _animal) exitWith {false};
if ((_animal getVariable ["State", -1]) isEqualTo 2) exitWith {false};
_animal setVariable ["State", 2];
_animalConfig = configFile >> "CfgVehicles" >> typeOf _animal >> "Exile";
_fleeDistance = 50 + (random 100);
_direction = [_attacker, _animal] call BIS_fnc_dirTo;
_position = [getPos _animal, _fleeDistance, _direction] call ExileClient_util_math_getPositionInDirection;
_animal playMoveNow (getText (_animalConfig >> "fleeMove"));
_animal moveTo _position;
_dangerSound = selectRandom (getArray (_animalConfig >> "dangerSounds"));
playSound3D [_dangerSound select 0, _animal, false, getPosASL _animal, _dangerSound select 2, 1, _dangerSound select 1];
waitUntil {(moveToCompleted _animal) || (moveToFailed _animal) || !(alive _animal)};
if (alive _animal) then 
{
	_animal setVariable ["State", 0];
	_animal playMoveNow (getText (_animalConfig >> "idleMove"));
};
