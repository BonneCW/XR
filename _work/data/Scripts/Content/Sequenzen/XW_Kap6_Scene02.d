var int Mod_XW_Kap6_Scene02_Counter;

FUNC VOID XW_Kap6_Scene02()
{
	if (Mod_XW_Kap6_Scene03_Counter == 0)
	{
		DoForAll(B_RemoveDeadBodies);

		AI_Teleport	(hero, "ARENA_01");
	};

	if (Mod_XW_Kap6_Scene02_Counter == 1)
	{
		Wld_SendTrigger	("KAP6SCENE01A");

		CutsceneAn = TRUE;
	};

	if (Mod_XW_Kap6_Scene02_Counter == 3)
	{
		AI_Output(Mod_7766_KDF_Milten_XW, NULL, "Info_Mod_Hero_XW_Kap6_Scene02_03_00"); //(ruft) Was machen wir jetzt?
	};

	if (Mod_XW_Kap6_Scene02_Counter == 9)
	{
		AI_Output(Mod_7764_PSINOV_Lester_XW, NULL, "Info_Mod_Hero_XW_Kap6_Scene02_13_01"); //Die Zuschauer scheinen noch nicht verstanden zu haben, dass wir nicht zum Programm gehören.
	};

	if (Mod_XW_Kap6_Scene02_Counter == 15)
	{
		AI_Output(hero, NULL, "Info_Mod_Hero_XW_Kap6_Scene02_15_02"); //Dann machen wir erst mal weiter und schauen, was als nächstes passiert.
	};

	if (Mod_XW_Kap6_Scene02_Counter == 21)
	{
		Mod_XW_Kap6 = 4;

		Wld_SendUnTrigger	("KAP6SCENE01A");

		Wld_InsertNpc	(Hauertroll_XW_02, "ARENA_05");
		Wld_InsertNpc	(Shadowbeast_XW_02, "ARENA_05");
		Wld_InsertNpc	(Shadowbeast_XW_03, "ARENA_05");
		Wld_InsertNpc	(Schattenwark_XW_01, "ARENA_05");
		Wld_InsertNpc	(Schattenwark_XW_02, "ARENA_05");
		Wld_InsertNpc	(Schattenwark_XW_03, "ARENA_05");
		Wld_InsertNpc	(Schattenwark_XW_04, "ARENA_05");
		Wld_InsertNpc	(Schattenwark_XW_05, "ARENA_05");
		Wld_InsertNpc	(Schattenwark_XW_06, "ARENA_05");
		Wld_InsertNpc	(Dragonsnapper_XW_01, "ARENA_05");
		Wld_InsertNpc	(Dragonsnapper_XW_02, "ARENA_05");
		Wld_InsertNpc	(Dragonsnapper_XW_03, "ARENA_05");
		Wld_InsertNpc	(Dragonsnapper_XW_04, "ARENA_05");
		Wld_InsertNpc	(Dragonsnapper_XW_05, "ARENA_05");
		Wld_InsertNpc	(Riesenspinne_XW_01, "ARENA_05");

		CutsceneAn = FALSE;
	};

	Mod_XW_Kap6_Scene02_Counter += 1;
};