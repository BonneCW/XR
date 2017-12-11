var int Mod_ChaniAbenteurerScene_Counter;

FUNC VOID ChaniAbenteurerScene()
{
	if (Mod_ChaniAbenteurerScene_Counter == 0)
	{
		Wld_SendTrigger	("EVT_CHANIABENTEURER_SCENE");

		AI_TurnToNpc	(Mod_1623_OUT_Chani_REL, Mod_7655_OUT_Abenteurer_REL);
		AI_TurnToNpc	(Mod_7655_OUT_Abenteurer_REL, Mod_1623_OUT_Chani_REL);

		CutsceneAn = TRUE;
	};

	if (Mod_ChaniAbenteurerScene_Counter == 2)
	{
		AI_Output(Mod_7655_OUT_Abenteurer_REL, NULL, "Info_Mod_ChaniAbenteurerScene_06_00"); //Du Miststück, hast mir meinen Geldbeutel geklaut. Na warte!
	};

	if (Mod_ChaniAbenteurerScene_Counter == 8)
	{
		AI_ReadyMeleeWeapon	(Mod_7655_OUT_Abenteurer_REL);
	};

	if (Mod_ChaniAbenteurerScene_Counter == 9)
	{
		AI_PlayAni	(Mod_1623_OUT_Chani_REL, "T_FISTATTACKMOVE");
	};

	if (Mod_ChaniAbenteurerScene_Counter == 10)
	{
		AI_PlayAni	(Mod_7655_OUT_Abenteurer_REL, "T_STAND_2_WOUNDED");
	};

	if (Mod_ChaniAbenteurerScene_Counter == 12)
	{
		AI_Output(Mod_1623_OUT_Chani_REL, NULL, "Info_Mod_ChaniAbenteurerScene_19_01"); //Was jetzt, du Pantoffelheld?!
	};

	if (Mod_ChaniAbenteurerScene_Counter == 18)
	{
		AI_Output(Mod_7654_OUT_Alkor_REL, NULL, "Info_Mod_ChaniAbenteurerScene_31_02"); //(hämisch) Ha, das ging voll in die Weichteile.
	};

	if (Mod_ChaniAbenteurerScene_Counter == 24)
	{
		B_StartOtherRoutine	(Mod_1623_OUT_Chani_REL, "START");
		B_StartOtherRoutine	(Mod_7655_OUT_Abenteurer_REL, "START");

		Wld_SendUnTrigger	("EVT_CHANIABENTEURER_SCENE");

		Mod_Chani_Abenteurer = 2;

		CutsceneAn = FALSE;
	};

	Mod_ChaniAbenteurerScene_Counter += 1;
};