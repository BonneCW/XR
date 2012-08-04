FUNC VOID EVT_TOFAICE()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Faice_Aufnahme))
	|| (Npc_KnowsInfo(hero, Info_Mod_Faice_RitualRunning))
	{
		AI_Teleport	(hero, "OW_PATH_TEMPELRUIN07");
	};
};