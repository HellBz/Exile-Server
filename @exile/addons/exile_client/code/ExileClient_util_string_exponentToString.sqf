/**
 * ExileClient_util_string_exponentToString
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_s"];
_s = "";
while {_this >= 10} do 
{
	_this = _this / 10;
	_s = format ["%1%2", round ((_this % floor _this) * 10), _s];
	_this = floor _this;
};
format ["%1%2", _this, _s];