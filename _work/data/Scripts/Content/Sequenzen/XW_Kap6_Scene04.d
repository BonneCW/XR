var int Mod_XW_Kap6_Scene04_Counter;

FUNC VOID XW_Kap6_Scene04()
{
	if (Mod_XW_Kap6_Scene04_Counter == 0)
	{
		DoForAll(B_RemoveDeadBodies);

		AI_Teleport	(hero, "ARENA_01");
	};

	if (Mod_XW_Kap6_Scene04_Counter == 1)
	{
		Wld_SendTrigger	("KAP6SCENE01A");

		CutsceneAn = TRUE;
	};

	if (Mod_XW_Kap6_Scene04_Counter == 3)
	{
		AI_PlayAni	(Xeres_02, "t_MagRun_2_FeaShoot");
	};

	if (Mod_XW_Kap6_Scene04_Counter == 8)
	{
		AI_PlayAni	(Xeres_02, "t_FeaShoot_2_Stand");
	};

	if (Mod_XW_Kap6_Scene04_Counter == 9)
	{
		Wld_SendUnTrigger	("KAP6SCENE01A");
		Wld_SendTrigger	("KAP6SCENE4");
	};

	if (Mod_XW_Kap6_Scene04_Counter == 10)
	{
		Mod_7764_PSINOV_Lester_XW.attribute[ATR_HITPOINTS] = 0;

		AI_PlayAni	(Mod_7764_PSINOV_Lester_XW, "T_DEAD");
	};

	if (Mod_XW_Kap6_Scene04_Counter == 13)
	{
		Mod_XW_Kap6 = 7;

		Wld_SendUnTrigger	("KAP6SCENE04");

		CutsceneAn = FALSE;
	};

	Mod_XW_Kap6_Scene04_Counter += 1;
};