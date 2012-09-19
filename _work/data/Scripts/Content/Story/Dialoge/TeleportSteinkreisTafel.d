INSTANCE Info_Mod_TeleportSteinkreisTafel_LobartNW (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportSteinkreisTafel_LobartNW_Condition;
	information	= Info_Mod_TeleportSteinkreisTafel_LobartNW_Info;
	permanent	= 1;
	important	= 0;
	description	= "zu Lobart's Hof in Khorinis";
};

FUNC INT Info_Mod_TeleportSteinkreisTafel_LobartNW_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportSteinkreisTafel)
	&& (Npc_GetDistToWP(hero, "WP_STEINKREIS_03") > 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportSteinkreisTafel_LobartNW_Info()
{
	B_ENDPRODUCTIONDIALOG();

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		AI_Teleport	(hero, "NW_LITTLESTONEHENDGE_01");
	}
	else
	{
		B_SetLevelchange ("NewWorld\NewWorld.zen", "NW_LITTLESTONEHENDGE_01");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportSteinkreisTafel_SekobNW (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportSteinkreisTafel_SekobNW_Condition;
	information	= Info_Mod_TeleportSteinkreisTafel_SekobNW_Info;
	permanent	= 1;
	important	= 0;
	description	= "zu Sekob's Hof in Khorinis";
};

FUNC INT Info_Mod_TeleportSteinkreisTafel_SekobNW_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportSteinkreisTafel)
	&& (Npc_GetDistToWP(hero, "WP_STEINKREIS_05") > 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportSteinkreisTafel_SekobNW_Info()
{
	B_ENDPRODUCTIONDIALOG();

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		AI_Teleport	(hero, "WP_STEINKREIS_05");
	}
	else
	{
		B_SetLevelchange ("NewWorld\NewWorld.zen", "WP_STEINKREIS_05");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportSteinkreisTafel_DunklerWaldNW (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportSteinkreisTafel_DunklerWaldNW_Condition;
	information	= Info_Mod_TeleportSteinkreisTafel_DunklerWaldNW_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum dunklen Wald in Khorinis";
};

FUNC INT Info_Mod_TeleportSteinkreisTafel_DunklerWaldNW_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportSteinkreisTafel)
	&& (Npc_GetDistToWP(hero, "WP_STEINKREIS_04") > 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportSteinkreisTafel_DunklerWaldNW_Info()
{
	B_ENDPRODUCTIONDIALOG();

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		AI_Teleport	(hero, "NW_FOREST_PATH_62_ORNA");
	}
	else
	{
		B_SetLevelchange ("NewWorld\NewWorld.zen", "NW_FOREST_PATH_62_ORNA");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportSteinkreisTafel_EisgebietEIS (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportSteinkreisTafel_EisgebietEIS_Condition;
	information	= Info_Mod_TeleportSteinkreisTafel_EisgebietEIS_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum Eisgebiet";
};

FUNC INT Info_Mod_TeleportSteinkreisTafel_EisgebietEIS_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportSteinkreisTafel)
	&& (Npc_GetDistToWP(hero, "EIS_01") > 800)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportSteinkreisTafel_EisgebietEIS_Info()
{
	B_ENDPRODUCTIONDIALOG();

	if (CurrentLevel == EISGEBIET_ZEN)
	{
		AI_Teleport	(hero, "START_EISGEBIET");
	}
	else
	{
		B_SetLevelchange ("Zafiron\Eisgebiet.zen", "START_EISGEBIET");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportSteinkreisTafel_GreatSeaREL (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportSteinkreisTafel_GreatSeaREL_Condition;
	information	= Info_Mod_TeleportSteinkreisTafel_GreatSeaREL_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum großen See in Relendel";
};

FUNC INT Info_Mod_TeleportSteinkreisTafel_GreatSeaREL_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportSteinkreisTafel)
	&& (Npc_GetDistToWP(hero, "WP_STEINKREIS_07") > 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportSteinkreisTafel_GreatSeaREL_Info()
{
	B_ENDPRODUCTIONDIALOG();

	if (CurrentLevel == RELENDEL_ZEN)
	{
		AI_Teleport	(hero, "REL_SURFACE_121");
	}
	else
	{
		B_SetLevelchange ("Zafiron\Relendel.zen", "REL_SURFACE_121");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportSteinkreisTafel_NLMT (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportSteinkreisTafel_NLMT_Condition;
	information	= Info_Mod_TeleportSteinkreisTafel_NLMT_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum Neuen Lager";
};

FUNC INT Info_Mod_TeleportSteinkreisTafel_NLMT_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportSteinkreisTafel)
	&& (Npc_GetDistToWP(hero, "OLDWORLDBERGE_50") > 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportSteinkreisTafel_NLMT_Info()
{
	B_ENDPRODUCTIONDIALOG();

	if (CurrentLevel == MINENTAL_ZEN)
	{
		AI_Teleport	(hero, "OLDWORLDBERGE_50");
	}
	else
	{
		B_SetLevelchange ("Minental\Minental.zen", "OLDWORLDBERGE_50");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportSteinkreisTafel_PassREL (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportSteinkreisTafel_PassREL_Condition;
	information	= Info_Mod_TeleportSteinkreisTafel_PassREL_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum Pass nach Khorinis in Relendel";
};

FUNC INT Info_Mod_TeleportSteinkreisTafel_PassREL_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportSteinkreisTafel)
	&& (Npc_GetDistToWP(hero, "WP_STEINKREIS_08") > 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportSteinkreisTafel_PassREL_Info()
{
	B_ENDPRODUCTIONDIALOG();

	if (CurrentLevel == RELENDEL_ZEN)
	{
		AI_Teleport	(hero, "REL_SURFACE_122");
	}
	else
	{
		B_SetLevelchange ("Zafiron\Relendel.zen", "REL_SURFACE_122");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportSteinkreisTafel_SonnenkreisNW (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportSteinkreisTafel_SonnenkreisNW_Condition;
	information	= Info_Mod_TeleportSteinkreisTafel_SonnenkreisNW_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum Sonnenkreis in Khorinis";
};

FUNC INT Info_Mod_TeleportSteinkreisTafel_SonnenkreisNW_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportSteinkreisTafel)
	&& (Npc_GetDistToWP(hero, "WP_STEINKREIS_06") > 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportSteinkreisTafel_SonnenkreisNW_Info()
{
	B_ENDPRODUCTIONDIALOG();

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		AI_Teleport	(hero, "NW_TROLLAREA_RITUALPATH_01");
	}
	else
	{
		B_SetLevelchange ("NewWorld\NewWorld.zen", "NW_TROLLAREA_RITUALPATH_01");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportSteinkreisTafel_StonehengeMT (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportSteinkreisTafel_StonehengeMT_Condition;
	information	= Info_Mod_TeleportSteinkreisTafel_StonehengeMT_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum Stonehenge im Minental";
};

FUNC INT Info_Mod_TeleportSteinkreisTafel_StonehengeMT_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportSteinkreisTafel)
	&& (Npc_GetDistToWP(hero, "WP_STEINKREIS_02") > 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportSteinkreisTafel_StonehengeMT_Info()
{
	B_ENDPRODUCTIONDIALOG();

	if (CurrentLevel == MINENTAL_ZEN)
	{
		AI_Teleport	(hero, "OW_PATH_3_13");
	}
	else
	{
		B_SetLevelchange ("Minental\Minental.zen", "OW_PATH_3_13");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportSteinkreisTafel_NebelturmMT (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportSteinkreisTafel_NebelturmMT_Condition;
	information	= Info_Mod_TeleportSteinkreisTafel_NebelturmMT_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum Wald beim alten Lager im Minental";
};

FUNC INT Info_Mod_TeleportSteinkreisTafel_NebelturmMT_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportSteinkreisTafel)
	&& (Npc_GetDistToWP(hero, "WP_STEINKREIS_01") > 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportSteinkreisTafel_NebelturmMT_Info()
{
	B_ENDPRODUCTIONDIALOG();

	if (CurrentLevel == MINENTAL_ZEN)
	{
		AI_Teleport	(hero, "SPAWN_WALD_OC_BLOODFLY01");
	}
	else
	{
		B_SetLevelchange ("Minental\Minental.zen", "SPAWN_WALD_OC_BLOODFLY01");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportSteinkreisTafel_EXIT (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportSteinkreisTafel_EXIT_Condition;
	information	= Info_Mod_TeleportSteinkreisTafel_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_TeleportSteinkreisTafel_EXIT_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportSteinkreisTafel)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportSteinkreisTafel_EXIT_Info()
{
	B_ENDPRODUCTIONDIALOG();
};