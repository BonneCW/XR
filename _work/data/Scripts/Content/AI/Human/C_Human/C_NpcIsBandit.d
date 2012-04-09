// ******************************************************************
// C_NpcIsFiremonster
// -------------
// überprüft anhand der gilden ob slf Firemonster ist
// ******************************************************************

func int C_NpcIsBandit(var C_NPC slf)
{
     	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_946_BDT_Edgor_NW))
     	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_952_BDT_Franco_NW))
     	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_963_BDT_Senyan_NW))
     	{
     		return TRUE;
     	};
     
     	return FALSE;
};

