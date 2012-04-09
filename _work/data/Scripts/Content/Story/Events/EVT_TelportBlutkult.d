FUNC VOID TELEPORTAUSBLUTKULT()
{
	AI_Teleport	(hero, "NW_FARM2_TAVERNCAVE1_06");
};

FUNC VOID TELEPORTINBLUTKULT()
{
	if (Mod_WM_HexenTot == 1)
	{
		AI_Teleport	(hero, "WP_BK_01");
	};
};