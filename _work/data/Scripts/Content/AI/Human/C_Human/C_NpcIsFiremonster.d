// ******************************************************************
// C_NpcIsFiremonster
// -------------
// überprüft anhand der gilden ob slf Firemonster ist
// ******************************************************************

func int C_NpcIsFiremonster(var C_NPC slf)
{
     	if (slf.guild == GIL_GARGOYLE)
     	|| (slf.guild == GIL_DEMON)
     	|| (slf.guild == GIL_SUMMONED_DEMON)
     	|| (slf.guild == GIL_FIREGOLEM)
	|| (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE)
	|| (slf.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_FIREGOLEM)
	|| (slf.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN)
     	{
     		return TRUE;
     	};
     
     	return FALSE;
};

