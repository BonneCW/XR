FUNC VOID XW_Startscene()
{
	if (Mod_XW_Startscene_Counter == 1)
	{
		Wld_SendTrigger	("STARTSCENE");

		AI_PlayAni	(hero, "T_SEARCH");

		CutsceneAn = TRUE;
	};

	if (Mod_XW_Startscene_Counter == 3)
	{
		AI_Output(hero, NULL, "Info_Mod_Hero_XW_Startscene_15_00"); //Bei den Göttern!
	};

	if (Mod_XW_Startscene_Counter == 51)
	{
		Mod_XW_Startscene = 2;

		CutsceneAn = FALSE;
	};

	Mod_XW_Startscene_Counter += 1;
};