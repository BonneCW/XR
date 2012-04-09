// ***********************
// C_IsUsedMobMyPossession
// ***********************

func int C_IsUsedMobMyPossession(var C_NPC slf, var C_NPC oth)
{
	// FUNC

	// ------ Persönliches Besitzflag ------
	if (Npc_IsDetectedMobOwnedByNpc(oth, slf)) 
	{
		return TRUE;
	};
	
	// ------ wenn MOB in meinem Portalraum (oder Raum von befreundeter Gilde) benutzt wurde ------
	if (C_NpcIsBotheredByPlayerRoomGuild(slf))
	|| (Wld_GetPlayerPortalGuild() == GIL_PUBLIC)
	{
		return TRUE;
	};	
	
	return FALSE;
};
