var int Mod_XW_Kap6_Scene01_Counter;

FUNC VOID XW_Kap6_Scene01()
{
	if (Mod_XW_Kap6_Scene01_Counter == 1)
	{
		Wld_SendTrigger	("KAP6SCENE01A");

		CutsceneAn = TRUE;
		
		Mod_7763_RDW_Diego_XW.senses_range = 0;
		Npc_ClearAIQueue(Mod_7763_RDW_Diego_XW);
		AI_StandUp(Mod_7763_RDW_Diego_XW);
		
		Mod_7764_PSINOV_Lester_XW.senses_range = 0;
		Npc_ClearAIQueue(Mod_7764_PSINOV_Lester_XW);
		AI_StandUp(Mod_7764_PSINOV_Lester_XW);
		
		Mod_7765_SLD_Gorn_XW.senses_range = 0;
		Npc_ClearAIQueue(Mod_7765_SLD_Gorn_XW);
		AI_StandUp(Mod_7765_SLD_Gorn_XW);
		
		Mod_7766_KDF_Milten_XW.senses_range = 0;
		Npc_ClearAIQueue(Mod_7766_KDF_Milten_XW);
		AI_StandUp(Mod_7766_KDF_Milten_XW);
		
		B_Attack(Hauertroll_XW_01, Shadowbeast_XW_01, AR_NONE, 0);
		B_Attack(Shadowbeast_XW_01, Hauertroll_XW_01, AR_NONE, 0);
	};

	if (Mod_XW_Kap6_Scene01_Counter == 3)
	{
		AI_Output(Mod_7765_SLD_Gorn_XW, NULL, "Info_Mod_Hero_XW_Kap6_Scene01_03_00"); //Heilige Scheiﬂe ...
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
		Npc_ClearAIQueue(Hauertroll_XW_01);
		Npc_ClearAIQueue(Shadowbeast_XW_01);
		AI_StandUp(Hauertroll_XW_01);
		AI_StandUp(Shadowbeast_XW_01);
		AI_GotoWP	(Hauertroll_XW_01, "ARENA_01");
		AI_GotoWP	(Shadowbeast_XW_01, "ARENA_01");
		Hauertroll_XW_01.flags = 0;
		Shadowbeast_XW_01.flags = 0;
	};

	if (Mod_XW_Kap6_Scene01_Counter == 45)
	{
		Mod_XW_Kap6 = 3;

		Wld_SendUnTrigger	("KAP6SCENE01B");

		CutsceneAn = FALSE;
	};

	Mod_XW_Kap6_Scene01_Counter += 1;
};