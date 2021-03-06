/*
	Main entry point, should be called from mission.sqf
*/
if (!isServer && !hasInterface) then
{
	diag_log "EHC: Initializing";
	
	#include "settings.sqf"
	
	call compile preprocessFileLineNumbers "hc\compiles.sqf";
	call compile preprocessFileLineNumbers "hc\headless_client\handlers.sqf";
	call compile preprocessFileLineNumbers "hc\headless_client\heartbeat.sqf";
        call compile preprocessFileLineNumbers "hc\headless_client\Bad_slot_HC1.sqf";
	//run player_monitor
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";
};

if (isServer) then
{
	call compile preprocessFileLineNumbers "hc\server\handlers.sqf"; // passing signals;
};
