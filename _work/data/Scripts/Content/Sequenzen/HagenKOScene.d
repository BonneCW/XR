var int Mod_HagenKOScene_Counter;

FUNC VOID HagenKOScene()
{
	if (Mod_HagenKOScene_Counter == 0)
	{
		B_StartOtherRoutine	(Mod_585_RIT_Ingmar_NW, "HAGENKO");
		B_StartOtherRoutine	(Mod_1241_RIT_Torwache_NW, "HAGENKO");
		B_StartOtherRoutine	(Mod_1242_RIT_Torwache_NW, "HAGENKO");

		AI_PlayAni	(Mod_592_PAL_Hagen_NW, "T_DEAD");

		CutsceneAn = TRUE;
	};

	if (Mod_HagenKOScene_Counter == 2)
	{
		/*AI_TurnToNpc	(Mod_585_RIT_Ingmar_NW, Mod_592_PAL_Hagen_NW);
		AI_TurnToNpc	(Mod_1241_RIT_Torwache_NW, Mod_592_PAL_Hagen_NW);
		AI_TurnToNpc	(Mod_1242_RIT_Torwache_NW, Mod_592_PAL_Hagen_NW);*/

		AI_Output(Mod_585_RIT_Ingmar_NW, NULL, "Info_Mod_HagenKOScene_06_00"); //Was ist passiert?
	};

	if (Mod_HagenKOScene_Counter == 7)
	{
		AI_Output(Mod_1242_RIT_Torwache_NW, NULL, "Info_Mod_HagenKOScene_12_01"); //Holt einen Heiler!
	};

	if (Mod_HagenKOScene_Counter == 12)
	{
		AI_Output(Mod_1241_RIT_Torwache_NW, NULL, "Info_Mod_HagenKOScene_04_02"); //Er braucht dringend einen Aderlass!

		B_StartOtherRoutine	(Mod_559_PAL_Albrecht_NW, "HAGENKO");
	};

	if (Mod_HagenKOScene_Counter == 17)
	{
		AI_PlayAni	(Mod_559_PAL_Albrecht_NW, "T_STAND_2_HEASHOOT");

		Wld_PlayEffect	("SPELLFX_HEAL_ORIGIN", Mod_592_PAL_Hagen_NW, Mod_592_PAL_Hagen_NW, 0, 0, 0, FALSE);
	};

	if (Mod_HagenKOScene_Counter == 20)
	{
		AI_PlayAni	(Mod_592_PAL_Hagen_NW, "T_WOUNDED_2_STAND");

		B_StartOtherRoutine	(Mod_592_PAL_Hagen_NW,	"START");
		B_StartOtherRoutine	(Mod_585_RIT_Ingmar_NW, "START");
		B_StartOtherRoutine	(Mod_1241_RIT_Torwache_NW, "START");
		B_StartOtherRoutine	(Mod_1242_RIT_Torwache_NW, "START");
		B_StartOtherRoutine	(Mod_559_PAL_Albrecht_NW, "START");

		Mod_HagenKOScene = 2;

		CutsceneAn = FALSE;
	};

	Mod_HagenKOScene_Counter += 1;
};