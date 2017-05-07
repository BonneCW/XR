var int Mod_XW_Kap6_Scene04_Counter;

FUNC VOID XW_Kap6_Scene04()
{
	if (Mod_XW_Kap6_Scene04_Counter == 0)
	{
		DoForAll(B_RemoveDeadBodies);

		AI_Teleport	(hero, "ARENA_01");
		AI_Teleport	(Mod_7764_PSINOV_Lester_XW, Mod_7764_PSINOV_Lester_XW.wp);
	};

	if (Mod_XW_Kap6_Scene04_Counter == 1)
	{
		Wld_SendTrigger	("KAP6SCENE01A");

		CutsceneAn = TRUE;
	};

	if (Mod_XW_Kap6_Scene04_Counter == 3)
	{
		Wld_PlayEffect("FX_EarthQuake", Xeres_02, Xeres_02, 0, 0, 0, FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_RED", Xeres_02, Xeres_02, 0, 0, 0, FALSE);
		AI_PlayAni (Xeres_02, "T_PRACTICEMAGIC5");
	};

	if (Mod_XW_Kap6_Scene04_Counter == 9)
	{
		Wld_SendUnTrigger	("KAP6SCENE01A");
		Wld_SendTrigger	("KAP6SCENE4");
	};

	if (Mod_XW_Kap6_Scene04_Counter == 10)
	{
		Wld_PlayEffect("spellFX_DEATHWAVE_EXPLOSION",  Mod_7764_PSINOV_Lester_XW, Mod_7764_PSINOV_Lester_XW, 0, 0, 0, FALSE );
		
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
