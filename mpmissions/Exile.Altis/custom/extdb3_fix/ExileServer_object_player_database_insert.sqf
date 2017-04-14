/**
 * ExileServer_object_player_database_insert
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_player","_playerID"];
_player = _this;

_uid = _player getVariable ["ExileOwnerUID", "SomethingWentWrong"];
_name = _player getVariable ["ExileName", "SomethingWentWrong"];

if !(_uid in ["", "__SERVER__", "__HEADLESS__"]) then
{
	format["Player %1 (UID %2) connected!", _name, _uid] call ExileServer_util_log;
	_isKnownAccount = format["isKnownAccount:%1", _uid] call ExileServer_system_database_query_selectSingleField;
	if !(_isKnownAccount) then
	{
		format["createAccount:%1:%2", _uid, _name] call ExileServer_system_database_query_fireAndForget;
	};
};


_playerID = format["createPlayer:%1:%2", _uid , _name ] call ExileServer_system_database_query_insertSingle;
_player setVariable ["ExileDatabaseID", _playerID];


_playerID