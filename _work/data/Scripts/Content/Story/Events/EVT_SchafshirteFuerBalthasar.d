FUNC VOID EVT_SchafshirteFuerBalthasar()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Balthasar_Bereit))
	&& (Mod_BalthasarsWoelfe == 0)
	{
		Wld_InsertNpc	(Balthi_YWolf1, "FARM4");
		Wld_InsertNpc	(Balthi_YWolf2, "FARM4");
		Wld_InsertNpc	(Balthi_YWolf3, "FARM4");

		Mod_BalthasarsWoelfe = 1;
	};
};