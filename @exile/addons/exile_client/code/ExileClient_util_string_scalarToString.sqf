/**
 * ExileClient_util_string_scalarToString
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
if (_this < 0) then 
{
    str ceil _this + (str (_this - ceil _this) select [2])
} 
else 
{
    str floor _this + (str (_this - floor _this) select [1])
};