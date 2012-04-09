FUNC VOID ArgezVision()
{
	if (Mod_ArgezVision_Counter == 0)
	{
		Wld_InsertNpc	(Zombie_Argez,	"FP_ROAM_ZOMBIE_ARGEZ");
		Wld_InsertNpc	(PC_Friend_Dummy,	"WP_SEQUENZ_ARGEZ");
	};

	if (Mod_ArgezVision_Counter == 1)
	{
		//Wld_SetTime	(02,00);

		AI_Teleport	(hero,	"WP_HERO_ARGEZVISION_SPECTATOR");
	};

	if (Mod_ArgezVision_Counter == 3)
	{
		Wld_SendTrigger	("EVT_CAMERA_ARGEZVISION_01");

		Wld_PlayEffect	("SLOW_MOTION_ARGEZVISION", hero, hero, 0, 0, 0, FALSE);
		Wld_PlayEffect	("DEMENTOR_FX", hero, hero, 0, 0, 0, FALSE);
		Wld_PlayEffect	("DEMENTOR_FX", PC_Friend_Dummy, PC_Friend_Dummy, 0, 0, 0, FALSE);
		Wld_PlayEffect	("DEMENTOR_FX", Zombie_Argez, Zombie_Argez, 0, 0, 0, FALSE);
		//Wld_PlayEffect	("SLOW_MOTION", hero, hero, 0, 0, 0, FALSE);
	};

	if (Mod_ArgezVision_Counter == 6)
	{
		AI_TurnToNpc (PC_Friend_Dummy, Zombie_Argez);
	};

	if (Mod_ArgezVision_Counter == 9)
	{
		B_ReadySpell (PC_Friend_Dummy, SPL_ArgezVision, SPL_Cost_ArgezVision);
	};

	if (Mod_ArgezVision_Counter == 11)
	{
		Npc_ClearAIQueue (PC_Friend_Dummy);

		AI_StandUP	(PC_Friend_Dummy);

		B_ClearPerceptions	(PC_Friend_Dummy);
		Npc_SetTarget		(PC_Friend_Dummy, Zombie_Argez);
		Npc_GetTarget	(PC_Friend_Dummy);
		AI_StartState		(PC_Friend_Dummy, ZS_Attack, 0, "");
	};

	if (Mod_ArgezVision_Counter == 12)
	{
		Wld_SendUnTrigger	("EVT_CAMERA_ARGEZVISION_01");
		Wld_SendTrigger	("EVT_CAMERA_ARGEZVISION_02");
	};

	Mod_ArgezVision_Counter += 1;
};