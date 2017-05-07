var int Mod_XW_Kap6_Scene05_Counter;

FUNC VOID XW_Kap6_Scene05()
{
	if (Mod_XW_Kap6_Scene05_Counter == 0)
	{
		DoForAll(B_RemoveDeadBodies);

		AI_Teleport	(hero, "ARENA_01");
	};

	if (Mod_XW_Kap6_Scene05_Counter == 1)
	{
		Wld_SendTrigger	("KAP6SCENE01A");

		CutsceneAn = TRUE;
	};

	if (Mod_XW_Kap6_Scene05_Counter == 3)
	{
		Wld_PlayEffect("FX_EarthQuake", Xeres_02, Xeres_02, 0, 0, 0, FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_RED", Xeres_02, Xeres_02, 0, 0, 0, FALSE);
		AI_PlayAni (Xeres_02, "T_PRACTICEMAGIC5");
	};

	if (Mod_XW_Kap6_Scene05_Counter == 8)
	{
		if (!Hlp_IsValidNpc(Monster_11074_Leprechaun_XW)) {
			Wld_InsertNpc(Monster_11074_Leprechaun_XW, "ARENA_02");
		};
		AI_Teleport	(Monster_11074_Leprechaun_XW, "ARENA_02");
		B_StartOtherRoutine	(Monster_11074_Leprechaun_XW, "ARENA");
	};

	if (Mod_XW_Kap6_Scene05_Counter == 10)
	{
		Wld_PlayEffect("spellFX_DEATHWAVE_EXPLOSION",  Monster_11074_Leprechaun_XW, Monster_11074_Leprechaun_XW, 0, 0, 0, FALSE );
		
		Monster_11074_Leprechaun_XW.attribute[ATR_HITPOINTS] = 0;

		AI_PlayAni	(Monster_11074_Leprechaun_XW, "T_DEAD");
	};

	if (Mod_XW_Kap6_Scene05_Counter == 13)
	{
		AI_Output(Xeres_02, NULL, "Info_Mod_Hero_XW_Kap6_Scene05_14_00"); //(stutzt) Leprechaun? Leprechaun?
	};

	if (Mod_XW_Kap6_Scene05_Counter == 19)
	{
		AI_Output(hero, NULL, "Info_Mod_Hero_XW_Kap6_Scene05_15_01"); //Absicht oder Versehen?
	};

	if (Mod_XW_Kap6_Scene05_Counter == 25)
	{
		AI_Output(Xeres_02, NULL, "Info_Mod_Hero_XW_Kap6_Scene05_14_02"); //Wie konnte er aus dem Gefängnis kommen, in das ich ihn gesteckt hatte?
	};

	if (Mod_XW_Kap6_Scene05_Counter == 31)
	{
		AI_Output(hero, NULL, "Info_Mod_Hero_XW_Kap6_Scene05_15_03"); //Du hast deinen eigenen Diener eingesperrt?
	};

	if (Mod_XW_Kap6_Scene05_Counter == 37)
	{
		AI_Output(Xeres_02, NULL, "Info_Mod_Hero_XW_Kap6_Scene05_14_04"); //Er war verantwortlich dafür, dass du fliehen konntest. Das musste bestraft werden.
	};

	if (Mod_XW_Kap6_Scene05_Counter == 43)
	{
		AI_Output(Xeres_02, NULL, "Info_Mod_Hero_XW_Kap6_Scene05_14_05"); //Aber auch ich habe meine milde Seite. Ich hätte ihn schon nach 50 Jahren wieder herausgelassen ... wenn er dann noch gelebt hätte.
	};

	if (Mod_XW_Kap6_Scene05_Counter == 49)
	{
		Mod_XW_Kap6 = 8;

		Wld_SendUnTrigger	("KAP6SCENE01A");

		Mod_Xeres_Kampfphase = 1;

		B_Attack	(Xeres_02, hero, AR_NONE, 0);

		CutsceneAn = FALSE;
	};

	Mod_XW_Kap6_Scene05_Counter += 1;
};