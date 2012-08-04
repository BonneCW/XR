FUNC INT B_GetAivar (var C_NPC slf, var int aiv)
{
	// AIV_Multi01: AIV_LastFightAgainstPlayer|AIV_NpcSawPlayerCommit|AIV_NpcStartedTalk|AIV_INVINCIBLE|AIV_TalkedToPlayer|AIV_PlayerHasPickedMyPocket|AIV_FernkampfHitZone|AIV_RANSACKED|AIV_DeathInvGiven

	if (aiv == AIV_LastFightAgainstPlayer)
	{
		return slf.aivar[AIV_Multi01]/100000000;
	}
	else if (aiv == AIV_NpcSawPlayerCommit)
	{
		return (slf.aivar[AIV_Multi01]/10000000)-10*B_GetAivar(slf, AIV_LastFightAgainstPlayer);
	}
	else if (aiv == AIV_NpcStartedTalk)
	{
		return (slf.aivar[AIV_Multi01]/1000000)-100*B_GetAivar(slf, AIV_LastFightAgainstPlayer)-10*B_GetAivar(slf, AIV_NpcSawPlayerCommit);
	}
	else if (aiv == AIV_INVINCIBLE)
	{
		return (slf.aivar[AIV_Multi01]/100000)-1000*B_GetAivar(slf, AIV_LastFightAgainstPlayer)-100*B_GetAivar(slf, AIV_NpcSawPlayerCommit)-10*B_GetAivar(slf, AIV_NpcStartedTalk);
	}
	else if (aiv == AIV_TalkedToPlayer)
	{
		return (slf.aivar[AIV_Multi01]/10000)-10000*B_GetAivar(slf, AIV_LastFightAgainstPlayer)-1000*B_GetAivar(slf, AIV_NpcSawPlayerCommit)-100*B_GetAivar(slf, AIV_NpcStartedTalk)-10*B_GetAivar(slf, AIV_INVINCIBLE);
	}
	else if (aiv == AIV_PlayerHasPickedMyPocket)
	{
		return (slf.aivar[AIV_Multi01]/1000)-100000*B_GetAivar(slf, AIV_LastFightAgainstPlayer)-10000*B_GetAivar(slf, AIV_NpcSawPlayerCommit)-1000*B_GetAivar(slf, AIV_NpcStartedTalk)-100*B_GetAivar(slf, AIV_INVINCIBLE)-10*B_GetAivar(slf, AIV_TalkedToPlayer);
	}
	else if (aiv == AIV_FernkampfHitZone)
	{
		return (slf.aivar[AIV_Multi01]/100)-1000000*B_GetAivar(slf, AIV_LastFightAgainstPlayer)-100000*B_GetAivar(slf, AIV_NpcSawPlayerCommit)-10000*B_GetAivar(slf, AIV_NpcStartedTalk)-1000*B_GetAivar(slf, AIV_INVINCIBLE)-100*B_GetAivar(slf, AIV_TalkedToPlayer)-10*B_GetAivar(slf, AIV_PlayerHasPickedMyPocket);
	}
	else if (aiv == AIV_RANSACKED)
	{
		return (slf.aivar[AIV_Multi01]/10)-10000000*B_GetAivar(slf, AIV_LastFightAgainstPlayer)-1000000*B_GetAivar(slf, AIV_NpcSawPlayerCommit)-100000*B_GetAivar(slf, AIV_NpcStartedTalk)-10000*B_GetAivar(slf, AIV_INVINCIBLE)-1000*B_GetAivar(slf, AIV_TalkedToPlayer)-100*B_GetAivar(slf, AIV_PlayerHasPickedMyPocket)-10*B_GetAivar(slf, AIV_FernkampfHitZone);
	}
	else if (aiv == AIV_DeathInvGiven)
	{
		return slf.aivar[AIV_Multi01]-100000000*B_GetAivar(slf, AIV_LastFightAgainstPlayer)-10000000*B_GetAivar(slf, AIV_NpcSawPlayerCommit)-1000000*B_GetAivar(slf, AIV_NpcStartedTalk)-100000*B_GetAivar(slf, AIV_INVINCIBLE)-10000*B_GetAivar(slf, AIV_TalkedToPlayer)-1000*B_GetAivar(slf, AIV_PlayerHasPickedMyPocket)-100*B_GetAivar(slf, AIV_FernkampfHitZone)-10*B_GetAivar(slf, AIV_RANSACKED);
	};

	return 0;
};

FUNC VOID B_SetAivar (var C_NPC slf, var int aiv, var int value)
{
	// AIV_Multi01: AIV_LastFightAgainstPlayer|AIV_NpcSawPlayerCommit|AIV_NpcStartedTalk|AIV_INVINCIBLE|AIV_TalkedToPlayer|AIV_PlayerHasPickedMyPocket|AIV_FernkampfHitZone|AIV_RANSACKED|AIV_DeathInvGiven

	if (aiv == AIV_LastFightAgainstPlayer)
	{
		slf.aivar[AIV_Multi01] -= B_GetAivar(slf, AIV_LastFightAgainstPlayer)*100000000;

		slf.aivar[AIV_Multi01] += value*100000000;
	}
	else if (aiv == AIV_NpcSawPlayerCommit)
	{
		slf.aivar[AIV_Multi01] -= B_GetAivar(slf, AIV_NpcSawPlayerCommit)*10000000;

		slf.aivar[AIV_Multi01] += value*10000000;
	}
	else if (aiv == AIV_NpcStartedTalk)
	{
		slf.aivar[AIV_Multi01] -= B_GetAivar(slf, AIV_NpcStartedTalk)*1000000;

		slf.aivar[AIV_Multi01] += value*1000000;
	}
	else if (aiv == AIV_INVINCIBLE)
	{
		slf.aivar[AIV_Multi01] -= B_GetAivar(slf, AIV_INVINCIBLE)*100000;

		slf.aivar[AIV_Multi01] += value*100000;
	}
	else if (aiv == AIV_TalkedToPlayer)
	{
		slf.aivar[AIV_Multi01] -= B_GetAivar(slf, AIV_TalkedToPlayer)*10000;

		slf.aivar[AIV_Multi01] += value*10000;
	}
	else if (aiv == AIV_PlayerHasPickedMyPocket)
	{
		slf.aivar[AIV_Multi01] -= B_GetAivar(slf, AIV_PlayerHasPickedMyPocket)*1000;

		slf.aivar[AIV_Multi01] += value*1000;
	}
	else if (aiv == AIV_FernkampfHitZone)
	{
		slf.aivar[AIV_Multi01] -= B_GetAivar(slf, AIV_FernkampfHitZone)*100;

		slf.aivar[AIV_Multi01] += value*100;
	}
	else if (aiv == AIV_RANSACKED)
	{
		slf.aivar[AIV_Multi01] -= B_GetAivar(slf, AIV_RANSACKED)*10;

		slf.aivar[AIV_Multi01] += value*10;
	}
	else if (aiv == AIV_DeathInvGiven)
	{
		slf.aivar[AIV_Multi01] -= B_GetAivar(slf, AIV_DeathInvGiven);

		slf.aivar[AIV_Multi01] += value;
	};
};