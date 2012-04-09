var int Mod_LeichengaseScene_Counter;

FUNC VOID LeichengaseScene()
{
	if (Mod_LeichengaseScene_Counter == 0)
	{
		Wld_SendTrigger	("EVT_LEICHENGASE_SCENE");

		CutsceneAn = TRUE;
	};

	if (Mod_LeichengaseScene_Counter == 2)
	{
		AI_AimAt	(Mod_1218_TPL_Templer_MT, Mod_1322_PSINOV_Novize_MT);
		AI_AimAt	(Mod_1219_TPL_Templer_MT, Mod_1324_PSINOV_Novize_MT);
		AI_AimAt	(Mod_1221_TPL_Templer_MT, Mod_1325_PSINOV_Novize_MT);
		AI_AimAt	(Mod_1226_TPL_Templer_MT, Mod_1326_PSINOV_Novize_MT);
	};

	if (Mod_LeichengaseScene_Counter == 4)
	{
		AI_ShootAt	(Mod_1218_TPL_Templer_MT, Mod_1322_PSINOV_Novize_MT);
		AI_ShootAt	(Mod_1219_TPL_Templer_MT, Mod_1324_PSINOV_Novize_MT);
		AI_ShootAt	(Mod_1221_TPL_Templer_MT, Mod_1325_PSINOV_Novize_MT);
		AI_ShootAt	(Mod_1226_TPL_Templer_MT, Mod_1326_PSINOV_Novize_MT);
	};

	if (Mod_LeichengaseScene_Counter == 5)
	{
		Wld_PlayEffect ("spellFX_Firestorm_COLLIDE", Mod_1322_PSINOV_Novize_MT, Mod_1322_PSINOV_Novize_MT, 0, 0, 0, FALSE);
		Wld_PlayEffect ("spellFX_Firestorm_COLLIDE", Mod_1324_PSINOV_Novize_MT, Mod_1324_PSINOV_Novize_MT, 0, 0, 0, FALSE);
		Wld_PlayEffect ("spellFX_Firestorm_COLLIDE", Mod_1325_PSINOV_Novize_MT, Mod_1325_PSINOV_Novize_MT, 0, 0, 0, FALSE);
		Wld_PlayEffect ("spellFX_Firestorm_COLLIDE", Mod_1326_PSINOV_Novize_MT, Mod_1326_PSINOV_Novize_MT, 0, 0, 0, FALSE);
	};

	if (Mod_LeichengaseScene_Counter == 6)
	{		
		AI_StopAim	(Mod_1218_TPL_Templer_MT);
		AI_StopAim	(Mod_1219_TPL_Templer_MT);
		AI_StopAim	(Mod_1221_TPL_Templer_MT);
		AI_StopAim	(Mod_1226_TPL_Templer_MT);
	};

	if (Mod_LeichengaseScene_Counter == 7)
	{
		AI_PlayAni	(Mod_1322_PSINOV_Novize_MT, "T_STAND_2_SLEGROUND");
		AI_StartState	(Mod_1326_PSINOV_Novize_MT, ZS_Inflate, 0, "");

		B_RemoveNpc	(Mod_1324_PSINOV_Novize_MT);

		Wld_InsertNpc	(Meatbug, "PSI_TRAINING_3");
	};

	if (Mod_LeichengaseScene_Counter == 10)
	{
		Wld_SendUnTrigger	("EVT_LEICHENGASE_SCENE");

		Mod_Caine_Leichengase = 3;

		CutsceneAn = FALSE;
	};

	Mod_LeichengaseScene_Counter += 1;
};