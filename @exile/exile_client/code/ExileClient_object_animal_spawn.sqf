/**
 * ExileClient_object_animal_spawn
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_animalType","_animalConfig","_animalClass","_position","_animal"];
_animalType = _this;
_animalConfig = configFile >> "CfgVehicles" >> _animalType >> "Exile";
_animalClass = selectRandom (getArray (_animalConfig >> "variations"));
_position = position player;
_animal = createAgent [_animalClass, _position, [], 0, "FORM"];
_animal setVariable ["BIS_fnc_animalBehaviour_disable", true];
_animal setVariable ["State", 0];
_animal setVariable ["SpawnedAt", time];
_animal playMoveNow (getText (_animalConfig >> "idleMove"));
_animal addEventHandler ["FiredNear", 	{ _this call ExileClient_object_animal_event_onFiredNear; 	}];
_animal addEventHandler ["Hit", 		{ _this call ExileClient_object_animal_event_onHit; 		}];
_animal addEventHandler ["Killed", 		{ _this call ExileClient_object_animal_event_onKilled; 		}];
