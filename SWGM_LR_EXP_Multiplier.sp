#pragma semicolon 1

#include <sourcemod>
#include <lvl_ranks>
#include <swgm>

int		g_iLRMultiplier = 2; //

public Plugin:myinfo =
{
	name = "SWGM LR EXP Multiplier for pedrotski <3",
	author = "GARAYEV",
	version = "1.0"
};

public void OnPluginStart()
{
	if(LR_IsLoaded()) LR_OnCoreIsReady();
}

public void LR_OnCoreIsReady()
{
	LR_Hook(LR_OnPlayerKilledPre, OnPlayerKilledPre);
}

void OnPlayerKilledPre(Event hEvent, int &iExpCaused, int iExpVictim, int iExpAttacker)
{
	int iClient = GetClientOfUserId(hEvent.GetInt("attacker"));
	
	if(SWGM_InGroup(iClient))
	{
		iExpCaused *= g_iLRMultiplier;
	}
}