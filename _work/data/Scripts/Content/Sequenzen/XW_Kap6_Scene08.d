var int Mod_XW_Kap6_Scene08_Counter;

FUNC VOID XW_Kap6_Scene08()
{
	if (Mod_XW_Kap6_Scene08_Counter == 0)
	{
		DoForAll(B_RemoveDeadBodies);

		AI_Teleport	(Xeres_02, "ARENA_18");
		AI_Teleport	(Mod_7763_RDW_Diego_XW, Mod_7763_RDW_Diego_XW.wp);
	};

	if (Mod_XW_Kap6_Scene08_Counter == 1)
	{
		Wld_SendTrigger	("KAP6SCENE8");

		CutsceneAn = TRUE;

		AI_TurnToNpc	(Xeres_02, Mod_7763_RDW_Diego_XW);
	};

	if (Mod_XW_Kap6_Scene08_Counter == 3)
	{
		AI_Output(Xeres_02, NULL, "Info_Mod_Hero_XW_Kap6_Scene08_14_00"); //(spöttisch rufend) Mein tapferer Recke!
	};

	if (Mod_XW_Kap6_Scene08_Counter == 9)
	{
		AI_TurnToNpc	(Mod_7763_RDW_Diego_XW, Xeres_02);
		AI_TurnToNpc	(hero, Xeres_02);
	};

	if (Mod_XW_Kap6_Scene08_Counter == 11)
	{
		AI_Output(Mod_7763_RDW_Diego_XW, NULL, "Info_Mod_Hero_XW_Kap6_Scene08_11_01"); //Du bist also die hässliche Missgeburt, wegen der wir hier sind.
	};

	if (Mod_XW_Kap6_Scene08_Counter == 17)
	{
		AI_Output(Xeres_02, NULL, "Info_Mod_Hero_XW_Kap6_Scene08_14_02"); //Wegen der du in einen unehrenhaften Tod gehen wirst, ja.
	};

	if (Mod_XW_Kap6_Scene08_Counter == 23)
	{
		AI_Output(Xeres_02, NULL, "Info_Mod_Hero_XW_Kap6_Scene08_14_03"); //Hier gibt es nichts für dich zu gewinnen.
	};

	if (Mod_XW_Kap6_Scene08_Counter == 29)
	{
		AI_Output(Mod_7763_RDW_Diego_XW, NULL, "Info_Mod_Hero_XW_Kap6_Scene08_11_04"); //Ich bin nicht hier, um zu gewinnen.
	};

	if (Mod_XW_Kap6_Scene08_Counter == 35)
	{
		Wld_PlayEffect("FX_EarthQuake", Xeres_02, Xeres_02, 0, 0, 0, FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_RED", Xeres_02, Xeres_02, 0, 0, 0, FALSE);
		AI_PlayAni (Xeres_02, "T_PRACTICEMAGIC5");
	};

	if (Mod_XW_Kap6_Scene08_Counter == 37)
	{
		Mod_7763_RDW_Diego_XW.attribute[ATR_HITPOINTS] = 0;
		AI_PlayAni	(Mod_7763_RDW_Diego_XW, "T_EXPLOSION");
	};

	if (Mod_XW_Kap6_Scene08_Counter == 39)
	{
		AI_TurnToNpc	(Xeres_02, hero);
	};

	if (Mod_XW_Kap6_Scene08_Counter == 40)
	{
		AI_Output(Xeres_02, NULL, "Info_Mod_Hero_XW_Kap6_Scene08_14_05"); //Ich hoffe, du hast gesehen, wie hoffnungslos dein Unterfangen war.
	};

	if (Mod_XW_Kap6_Scene08_Counter == 46)
	{
		Wld_SendUnTrigger	("KAP6SCENE8");
		Wld_SendTrigger	("KAP6SCENE3");
	};

	if (Mod_XW_Kap6_Scene08_Counter == 47)
	{
		AI_Output(hero, NULL, "Info_Mod_Hero_XW_Kap6_Scene08_15_06"); //Du redest doch nur, um verschnaufen zu können.
	};

	if (Mod_XW_Kap6_Scene08_Counter == 53)
	{
		AI_Output(hero, NULL, "Info_Mod_Hero_XW_Kap6_Scene08_15_07"); //So groß können deine Kräfte gar nicht sein.
	};

	if (Mod_XW_Kap6_Scene08_Counter == 59)
	{
		Wld_SendUnTrigger	("KAP6SCENE3");
		Wld_SendTrigger	("KAP6SCENE8");

		Wld_SendUnTrigger	("GIFTTEPPICH");
	};

	if (Mod_XW_Kap6_Scene08_Counter == 60)
	{
		AI_Output(Xeres_02, NULL, "Info_Mod_Hero_XW_Kap6_Scene08_14_08"); //Du hast ja noch nicht alles gesehen!
	};

	if (Mod_XW_Kap6_Scene08_Counter == 66)
	{
		AI_Teleport	(Xeres_02, "TOT");
		B_StartOtherRoutine	(Xeres_02, "TOT");

		Wld_InsertNpc	(DemonLord_Xeres, "ARENA_01");
	};

	if (Mod_XW_Kap6_Scene08_Counter == 67)
	{
		Mod_XW_Kap6 = 12;

		Wld_SendUnTrigger	("KAP6SCENE8");

		CutsceneAn = FALSE;
	};

	Mod_XW_Kap6_Scene08_Counter += 1;
};