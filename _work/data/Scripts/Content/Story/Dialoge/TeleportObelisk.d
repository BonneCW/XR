INSTANCE Info_Mod_TeleportObelisk_PatherionKloster (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_PatherionKloster_Condition;
	information	= Info_Mod_TeleportObelisk_PatherionKloster_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum Kloster";
};

FUNC INT Info_Mod_TeleportObelisk_PatherionKloster_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportPatherionKloster == TRUE)
	&& (CurrentLevel == PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_PatherionKloster_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	AI_Teleport	(hero, "WP_PAT_WEG_182");
};

INSTANCE Info_Mod_TeleportObelisk_ToPatherion (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_ToPatherion_Condition;
	information	= Info_Mod_TeleportObelisk_ToPatherion_Info;
	permanent	= 1;
	important	= 0;
	description	= "von Khorinis nach Patherion";
};

FUNC INT Info_Mod_TeleportObelisk_ToPatherion_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportToPatherion == TRUE)
	&& (CurrentLevel == NEWWORLD_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_ToPatherion_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	AI_Teleport	(hero, "WAYTOPAT");
};

INSTANCE Info_Mod_TeleportObelisk_PatherionKapelle (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_PatherionKapelle_Condition;
	information	= Info_Mod_TeleportObelisk_PatherionKapelle_Info;
	permanent	= 1;
	important	= 0;
	description	= "zur Kapelle";
};

FUNC INT Info_Mod_TeleportObelisk_PatherionKapelle_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportPatherionKapelle == TRUE)
	&& (CurrentLevel == PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_PatherionKapelle_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	AI_Teleport	(hero, "WP_PAT_START");
};

INSTANCE Info_Mod_TeleportObelisk_FromPatherion (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_FromPatherion_Condition;
	information	= Info_Mod_TeleportObelisk_FromPatherion_Info;
	permanent	= 1;
	important	= 0;
	description	= "zur Kloster in Khorinis";
};

FUNC INT Info_Mod_TeleportObelisk_FromPatherion_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportFromPatherion == TRUE)
	&& (CurrentLevel == PATHERION_ZEN)
	&& (Npc_GetDistToWP(hero, "WP_PAT_START") < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_FromPatherion_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	AI_Teleport	(hero, "WP_PAT_BACK");
};

INSTANCE Info_Mod_TeleportObelisk_OWDemonTower (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_OWDemonTower_Condition;
	information	= Info_Mod_TeleportObelisk_OWDemonTower_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum alten Dämonenturm";
};

FUNC INT Info_Mod_TeleportObelisk_OWDemonTower_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportOWDemonTower == TRUE)
	&& (CurrentLevel != PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_OWDemonTower_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	if (CurrentLevel == MINENTAL_ZEN)
	{
		AI_Teleport	(hero, "DT_E3_03");
	}
	else
	{
		B_SetLevelchange ("Minental\Minental.zen", "DT_E3_03");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportObelisk_Oldcamp (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_Oldcamp_Condition;
	information	= Info_Mod_TeleportObelisk_Oldcamp_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum alten Lager";
};

FUNC INT Info_Mod_TeleportObelisk_Oldcamp_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportOldcamp == TRUE)
	&& (CurrentLevel != PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_Oldcamp_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	if (CurrentLevel == MINENTAL_ZEN)
	{
		AI_Teleport	(hero, "OCC_CHAPEL_UPSTAIRS");
	}
	else
	{
		B_SetLevelchange ("Minental\Minental.zen", "OCC_CAHPEL_UPSTAIRS");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportObelisk_Banditenlager (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_Banditenlager_Condition;
	information	= Info_Mod_TeleportObelisk_Banditenlager_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum Banditenlager";
};

FUNC INT Info_Mod_TeleportObelisk_Banditenlager_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportBanditenlager == TRUE)
	&& (CurrentLevel != PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_Banditenlager_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	if (CurrentLevel == MINENTAL_ZEN)
	{
		AI_Teleport	(hero, "LOCATION_11_06");
	}
	else
	{
		B_SetLevelchange ("Minental\Minental.zen", "LOCATION_11_06");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportObelisk_RELBauernhof (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_RELBauernhof_Condition;
	information	= Info_Mod_TeleportObelisk_RELBauernhof_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum Bauernhof";
};

FUNC INT Info_Mod_TeleportObelisk_RELBauernhof_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportRELBauernhof == TRUE)
	&& (CurrentLevel != PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_RELBauernhof_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	if (CurrentLevel == RELENDEL_ZEN)
	{
		AI_Teleport	(hero, "REL_SURFACE_041");
	}
	else
	{
		B_SetLevelchange ("Zafiron\Relendel.zen", "REL_SURFACE_041");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportObelisk_Gelato (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_Gelato_Condition;
	information	= Info_Mod_TeleportObelisk_Gelato_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum Dorf in Gelato";
};

FUNC INT Info_Mod_TeleportObelisk_Gelato_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportGelato == TRUE)
	&& (CurrentLevel != PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_Gelato_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	if (CurrentLevel == EISGEBIET_ZEN)
	{
		AI_Teleport	(hero, "EISFESTUNG_24");
	}
	else
	{
		B_SetLevelchange ("Zafiron\Eisgebiet.zen", "EISFESTUNG_24");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportObelisk_Farm (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_Farm_Condition;
	information	= Info_Mod_TeleportObelisk_Farm_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum Grossbauern";
};

FUNC INT Info_Mod_TeleportObelisk_Farm_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportFarm == TRUE)
	&& (CurrentLevel != PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_Farm_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		AI_Teleport	(hero, "BIGFARM");
	}
	else
	{
		B_SetLevelchange ("NewWorld\NewWorld.zen", "BIGFARM");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportObelisk_RELSee (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_RELSee_Condition;
	information	= Info_Mod_TeleportObelisk_RELSee_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum großen See";
};

FUNC INT Info_Mod_TeleportObelisk_RELSee_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportRELSee == TRUE)
	&& (CurrentLevel != PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_RELSee_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	if (CurrentLevel == RELENDEL_ZEN)
	{
		AI_Teleport	(hero, "REL_SURFACE_002");
	}
	else
	{
		B_SetLevelchange ("Zafiron\Relendel.zen", "REL_SURFACE_002");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportObelisk_Hofstaat (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_Hofstaat_Condition;
	information	= Info_Mod_TeleportObelisk_Hofstaat_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum Hofstaat";
};

FUNC INT Info_Mod_TeleportObelisk_Hofstaat_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportRELHofstaat == TRUE)
	&& (CurrentLevel != PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_Hofstaat_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	if (CurrentLevel == RELENDEL_ZEN)
	{
		AI_Teleport	(hero, "REL_246");
	}
	else
	{
		B_SetLevelchange ("Zafiron\Relendel.zen", "REL_246");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportObelisk_Monastery (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_Monastery_Condition;
	information	= Info_Mod_TeleportObelisk_Monastery_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum Kloster";
};

FUNC INT Info_Mod_TeleportObelisk_Monastery_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportMonastery == TRUE)
	&& (CurrentLevel != PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_Monastery_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		AI_Teleport	(hero, "KLOSTER");
	}
	else
	{
		B_SetLevelchange ("NewWorld\NewWorld.zen", "KLOSTER");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportObelisk_Khorata (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_Khorata_Condition;
	information	= Info_Mod_TeleportObelisk_Khorata_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum Marktplatz von Khorata";
};

FUNC INT Info_Mod_TeleportObelisk_Khorata_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportKhorata == TRUE)
	&& (CurrentLevel != PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_Khorata_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	if (CurrentLevel == RELENDEL_ZEN)
	{
		if ((Mod_Leonhard_Endres == 0)
		|| (Npc_KnowsInfo(hero, Info_Mod_Leonhard_Endres)))
		&& ((Kapitel < 3)
		|| (Npc_KnowsInfo(hero, Info_Mod_August_Unruhen)))
		{
			AI_Teleport	(hero, "REL_CITY_089");
		}
		else
		{
			AI_Teleport	(hero, "REL_CITY_001");
		};
	}
	else
	{
		if ((Mod_Leonhard_Endres == 0)
		|| (Npc_KnowsInfo(hero, Info_Mod_Leonhard_Endres)))
		&& ((Kapitel < 3)
		|| (Npc_KnowsInfo(hero, Info_Mod_August_Unruhen)))
		{
			B_SetLevelchange ("Zafiron\Relendel.zen", "REL_CITY_089");

			AI_Teleport	(hero, "OBELISKSCHREIN_WP");
		}
		else
		{
			B_SetLevelchange ("Zafiron\Relendel.zen", "REL_CITY_001");

			AI_Teleport	(hero, "OBELISKSCHREIN_WP");
		};
	};
};

INSTANCE Info_Mod_TeleportObelisk_Moor (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_Moor_Condition;
	information	= Info_Mod_TeleportObelisk_Moor_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum Moor";
};

FUNC INT Info_Mod_TeleportObelisk_Moor_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportRELMoor == TRUE)
	&& (CurrentLevel != PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_Moor_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	if (CurrentLevel == RELENDEL_ZEN)
	{
		AI_Teleport	(hero, "REL_MOOR_017");
	}
	else
	{
		B_SetLevelchange ("Zafiron\Relendel.zen", "REL_MOOR_017");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportObelisk_Newcamp (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_Newcamp_Condition;
	information	= Info_Mod_TeleportObelisk_Newcamp_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum neuen Lager";
};

FUNC INT Info_Mod_TeleportObelisk_Newcamp_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportNewcamp == TRUE)
	&& (CurrentLevel != PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_Newcamp_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	if (CurrentLevel == MINENTAL_ZEN)
	{
		AI_Teleport	(hero, "NC_KDW_CAVE_CENTER");
	}
	else
	{
		B_SetLevelchange ("Minental\Minental.zen", "NC_KDW_CAVE_CENTER");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportObelisk_PassOW (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_PassOW_Condition;
	information	= Info_Mod_TeleportObelisk_PassOW_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum Pass im Minental";
};

FUNC INT Info_Mod_TeleportObelisk_PassOW_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportPassOW == TRUE)
	&& (CurrentLevel != PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_PassOW_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	if (CurrentLevel == MINENTAL_ZEN)
	{
		AI_Teleport	(hero, "SPAWN_MOLERAT02_SPAWN01");
	}
	else
	{
		B_SetLevelchange ("Minental\Minental.zen", "SPAWN_MOLERAT02_SPAWN01");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportObelisk_PassNW (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_PassNW_Condition;
	information	= Info_Mod_TeleportObelisk_PassNW_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum Pass in Khorinis";
};

FUNC INT Info_Mod_TeleportObelisk_PassNW_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportPassNW == TRUE)
	&& (CurrentLevel != PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_PassNW_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		AI_Teleport	(hero, "LEVELCHANGE");
	}
	else
	{
		B_SetLevelchange ("NewWorld\NewWorld.zen", "LEVELCHANGE");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportObelisk_RELPass (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_RELPass_Condition;
	information	= Info_Mod_TeleportObelisk_RELPass_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum Pass in Relendel";
};

FUNC INT Info_Mod_TeleportObelisk_RELPass_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportRELPass == TRUE)
	&& (CurrentLevel != PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_RELPass_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	if (CurrentLevel == RELENDEL_ZEN)
	{
		AI_Teleport	(hero, "REL_008");
	}
	else
	{
		B_SetLevelchange ("Zafiron\Relendel.zen", "REL_008");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportObelisk_RELRaeuber (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_RELRaeuber_Condition;
	information	= Info_Mod_TeleportObelisk_RELRaeuber_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum Räuberlager";
};

FUNC INT Info_Mod_TeleportObelisk_RELRaeuber_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportRELRaeuber == TRUE)
	&& (CurrentLevel != PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_RELRaeuber_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	if (CurrentLevel == RELENDEL_ZEN)
	{
		AI_Teleport	(hero, "REL_SURFACE_044");
	}
	else
	{
		B_SetLevelchange ("Zafiron\Relendel.zen", "REL_SURFACE_044");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportObelisk_Sonnenkreis (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_Sonnenkreis_Condition;
	information	= Info_Mod_TeleportObelisk_Sonnenkreis_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum Sonnenkreis";
};

FUNC INT Info_Mod_TeleportObelisk_Sonnenkreis_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportSonnenkreis == TRUE)
	&& (CurrentLevel != PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_Sonnenkreis_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

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

INSTANCE Info_Mod_TeleportObelisk_Psicamp (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_Psicamp_Condition;
	information	= Info_Mod_TeleportObelisk_Psicamp_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum Sumpflager";
};

FUNC INT Info_Mod_TeleportObelisk_Psicamp_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportPsicamp == TRUE)
	&& (CurrentLevel != PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_Psicamp_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	if (CurrentLevel == MINENTAL_ZEN)
	{
		AI_Teleport	(hero, "PSI_START");
	}
	else
	{
		B_SetLevelchange ("Minental\Minental.zen", "PSI_START");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportObelisk_Waldis (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_Waldis_Condition;
	information	= Info_Mod_TeleportObelisk_Waldis_Info;
	permanent	= 1;
	important	= 0;
	description	= "zum Waldläuferlager";
};

FUNC INT Info_Mod_TeleportObelisk_Waldis_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportWaldis == TRUE)
	&& (CurrentLevel != PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_Waldis_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	if (CurrentLevel == MINENTAL_ZEN)
	{
		AI_Teleport	(hero, "WP_MT_JAEGERLAGER_01");
	}
	else
	{
		B_SetLevelchange ("Minental\Minental.zen", "WP_MT_JAEGERLAGER_01");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportObelisk_Bergfestung (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_Bergfestung_Condition;
	information	= Info_Mod_TeleportObelisk_Bergfestung_Info;
	permanent	= 1;
	important	= 0;
	description	= "zur Bergfestung";
};

FUNC INT Info_Mod_TeleportObelisk_Bergfestung_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportBergfestung == TRUE)
	&& (CurrentLevel != PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_Bergfestung_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	if (CurrentLevel == MINENTAL_ZEN)
	{
		AI_Teleport	(hero, "LOCATION_19_03_PATH_RUIN9");
	}
	else
	{
		B_SetLevelchange ("Minental\Minental.zen", "LOCATION_19_03_PATH_RUIN9");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportObelisk_Seaport (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_Seaport_Condition;
	information	= Info_Mod_TeleportObelisk_Seaport_Info;
	permanent	= 1;
	important	= 0;
	description	= "zur Hafenstadt";
};

FUNC INT Info_Mod_TeleportObelisk_Seaport_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportSeaport == TRUE)
	&& (CurrentLevel != PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_Seaport_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		AI_Teleport	(hero, "HAFEN");
	}
	else
	{
		B_SetLevelchange ("NewWorld\NewWorld.zen", "HAFEN");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportObelisk_Klosterruine (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_Klosterruine_Condition;
	information	= Info_Mod_TeleportObelisk_Klosterruine_Info;
	permanent	= 1;
	important	= 0;
	description	= "zur Klosterruine";
};

FUNC INT Info_Mod_TeleportObelisk_Klosterruine_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportKlosterruine == TRUE)
	&& (CurrentLevel != PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_Klosterruine_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	if (CurrentLevel == MINENTAL_ZEN)
	{
		AI_Teleport	(hero, "VMG_22");
	}
	else
	{
		B_SetLevelchange ("Minental\Minental.zen", "VMG_22");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportObelisk_Taverne (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_Taverne_Condition;
	information	= Info_Mod_TeleportObelisk_Taverne_Info;
	permanent	= 1;
	important	= 0;
	description	= "zur Taverne";
};

FUNC INT Info_Mod_TeleportObelisk_Taverne_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportTaverne == TRUE)
	&& (CurrentLevel != PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_Taverne_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		AI_Teleport	(hero, "TAVERNE");
	}
	else
	{
		B_SetLevelchange ("NewWorld\NewWorld.zen", "TAVERNE");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportObelisk_Xardas (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_Xardas_Condition;
	information	= Info_Mod_TeleportObelisk_Xardas_Info;
	permanent	= 1;
	important	= 0;
	description	= "zu Xardas";
};

FUNC INT Info_Mod_TeleportObelisk_Xardas_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	&& (Mod_TeleportXardas == TRUE)
	&& (CurrentLevel != PATHERION_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_Xardas_Info()
{
	B_ENDPRODUCTIONDIALOG();

	Mod_TeleportObelisk_Funzt = 1;

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		AI_Teleport	(hero, "XARDAS");
	}
	else
	{
		B_SetLevelchange ("NewWorld\NewWorld.zen", "XARDAS");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE Info_Mod_TeleportObelisk_EXIT (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_TeleportObelisk_EXIT_Condition;
	information	= Info_Mod_TeleportObelisk_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_TeleportObelisk_EXIT_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TeleportObelisk)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TeleportObelisk_EXIT_Info()
{
	B_ENDPRODUCTIONDIALOG();
};