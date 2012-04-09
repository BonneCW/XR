var int Mod_XW_Kap6_Scene01_Counter;

FUNC VOID XW_Kap6_Scene01()
{
	if (Mod_XW_Kap6_Scene01_Counter == 1)
	{
		Wld_SendTrigger	("KAP6SCENE01A");

		CutsceneAn = TRUE;
	};

	if (Mod_XW_Kap6_Scene01_Counter == 3)
	{
		AI_Output(Mod_7765_SLD_Gorn_XW, NULL, "Info_Mod_Hero_XW_Kap6_Scene01_12_00"); //Heilige Scheiﬂe ...
	};

	if (Mod_XW_Kap6_Scene01_Counter == 9)
	{
		AI_Output(hero, NULL, "Info_Mod_Hero_XW_Kap6_Scene01_15_01"); //Xardas, ich bring dich um.
	};

	if (Mod_XW_Kap6_Scene01_Counter == 15)
	{
		Wld_SendUnTrigger	("KAP6SCENE01A");
		Wld_SendTrigger	("KAP6SCENE01B");
	};

	if (Mod_XW_Kap6_Scene01_Counter == 40)
	{
		AI_GotoWP	(Hauertroll_XW_01, "ARENA_01");
		AI_GotoWP	(Shadowbeast_XW_01, "ARENA_01");
	};

	if (Mod_XW_Kap6_Scene01_Counter == 45)
	{
		Mod_XW_Kap6 = 3;

		Wld_SendUnTrigger	("KAP6SCENE01B");

		CutsceneAn = FALSE;
	};

	Mod_XW_Kap6_Scene01_Counter += 1;
};