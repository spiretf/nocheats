#pragma semicolon 1
#include <sourcemod>
#include <tf2>

public Plugin:myinfo = {
	name = "nocheats",
	author = "Icewind",
	description = "Prevent settings sv_cheats 1",
	version = "0.1",
	url = "https://spire.tf"
};

ConVar sv_cheats;

public OnPluginStart() {
	sv_cheats = FindConVar("sv_cheats");
	if (sv_cheats != null) {
		sv_cheats.AddChangeHook(OnSvCheats);
	}
}

public void OnSvCheats(ConVar convar, char[] oldValue, char[] newValue){
	if (StringToInt(newValue) != 0)	{
		convar.IntValue = 0;
	}
}