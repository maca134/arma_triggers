/*
	Author: maca134

	Description:
	Gets a list of players, ordered by distance within an area

	Parameter(s):
	_this select 0: position (Array)

	_this select 1: radius (Number)

	Returns:
	Array
*/

params [
	['_position', [], [[]], [2,3]],
	['_radius', -1, [0]]
];
if (_position isEqualTo []) exitWith {};
if (_radius isEqualTo -1) exitWith {};
_players = [
	allPlayers,
	[_position, _radius],
	{_x distance2D _input0},
	"ASCEND",
	{_x distance2D _input0 < _input1}
] call BIS_fnc_sortBy;
_players