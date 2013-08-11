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
		Npc_ClearAIQueue	(Mod_801_STT_Sly_MT);

		Npc_SetTarget	(Mod_801_STT_Sly_MT, Mod_1871_TPL_GorKaranto_MT);

		Npc_GetTarget	(Mod_801_STT_Sly_MT);

		AI_StartState	(Mod_801_STT_Sly_MT, ZS_Attack, 0, "");

		Npc_ClearAIQueue	(Mod_1871_TPL_GorKaranto_MT);

		Npc_SetTarget	(Mod_1871_TPL_GorKaranto_MT, Mod_801_STT_Sly_MT);

		Npc_GetTarget	(Mod_1871_TPL_GorKaranto_MT);

		AI_StartState	(Mod_1871_TPL_GorKaranto_MT, ZS_Attack, 0, "");

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

		B_StartOtherRoutine	(Mod_1871_TPL_GorKaranto_MT, "START");
		B_StartOtherRoutine	(Mod_801_STT_Sly_MT, "ATARENA");

		Wld_SendUnTrigger	("ARENAKAMERA");

		CutsceneAn = FALSE;
	};

	Mod_SlyKaranto_KampfScene_Counter += 1;
};