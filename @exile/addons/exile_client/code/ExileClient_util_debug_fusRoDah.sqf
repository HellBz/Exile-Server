/**
 * ExileClient_util_debug_fusRoDah
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_dir","_magnitude"];
_dir = getDir player;
_magnitude = 100;
cursorTarget setVelocity [    (sin _dir * _magnitude),    (cos _dir * _magnitude),    20   ];
true
