// ******************************************************************
// C_NpcIsIcemonster
// -------------
// überprüft anhand der gilden ob slf Icemonster ist
// ******************************************************************

func int C_NpcIsIcemonster(var C_NPC slf)
{
     	if  (slf.guild == GIL_IceGOLEM)
	|| (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE)
	|| (slf.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_ICEGOLEM)
	|| (slf.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_ICEDRAGON)
	|| (slf.aivar[AIV_MM_REAL_ID] == ID_ICEWOLF)
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Summoned_Eiswolf))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Eiswaran))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Scavenger_Ice))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Eis))
     	{
     		return TRUE;
     	};
     
     	return FALSE;
};

