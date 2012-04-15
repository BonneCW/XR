var int Mod_SlyKaranto_KampfScene_Counter;

FUNC VOID SlyKaranto_KampfScene()
{
	if (Mod_SlyKaranto_KampfScene_Counter == 1)
	{
		Wld_SendTrigger	("ARENAKAMERA");

		CutsceneAn = TRUE;
	};

	if (Mod_SlyKaranto_KampfScene_Counter == 2)
	{
		B_Attack	(Mod_801_STT_Sly_MT, Mod_1871_TPL_GorKaranto_MT, AR_NONE, 0);
		B_Attack	(Mod_1871_TPL_GorKaranto_MT, Mod_801_STT_Sly_MT, AR_NONE, 0);

		if (Mod_Sly_Tipp)
		{
			Mod_801_STT_Sly_MT.flags = 2;
		};
	};

	if (C_NpcIsDown(Mod_801_STT_Sly_MT))
	|| (C_NpcIsDown(Mod_1871_TPL_GorKaranto_MT))
	{
		if (C_NpcIsDown(Mod_801_STT_Sly_MT))
		{
			Mod_Sly_Arena = 5;
		}
		else
		{
			Mod_Sly_Arena = 6;
		};

		if (Mod_Sly_Tipp)
		{
			Mod_801_STT_Sly_MT.flags = 0;
		};

		Wld_SendUnTrigger	("ARENAKAMERA");

		CutsceneAn = FALSE;
	};

	Mod_SlyKaranto_KampfScene_Counter += 1;
};