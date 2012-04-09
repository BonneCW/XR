FUNC VOID B_Golemschadensbedingung(var C_NPC oth, var C_NPC slf)
{
	if (slf.aivar[AIV_MM_REAL_ID] == ID_FIREGOLEM)
	{
		if (Npc_GetActiveSpell(oth) == SPL_FIREBOLT)
		{
			slf.attribute[ATR_HITPOINTS] -= 50;
		};
	};
};