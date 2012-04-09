// ***************
// C_WantToRansack
// ***************

func int C_WantToRansack (var C_NPC slf)
{
	// ------ NPCTYPE_FRIEND plündert den Spieler nicht ------
	if (slf.npctype == NPCTYPE_FRIEND) && (Npc_IsPlayer(other))
	{
		return FALSE;
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7106_ASS_Ramsi_NW))
	{
		return TRUE;
	};
	
	// ------ ausgenommene Gilden ------
	if (slf.guild == GIL_DMT)
	|| (slf.guild == GIL_ORC)
	|| (slf.guild == GIL_PAL)
	|| (slf.guild == GIL_KDF)
	|| (slf.guild == GIL_NOV)
	|| (slf.guild == GIL_KDW)
	|| (other.guild > GIL_SEPERATOR_HUM)
	{
		return FALSE;
	};

	if (slf.aivar[AIV_Partymember] == TRUE)
	{
		return FALSE;
	};
	
	return TRUE;
};
