FUNC VOID HAUPTQUESTS()
{
	// Hauptquests

	if (CurrentLevel == MINENTAL_ZEN)
	{
		// Fokussuche

		if (Npc_HasItems(hero, ItMi_Focus_Kloster) == 1)
		&& (Mod_Fokus_Kloster == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Fokusplatz))
		{
			Mod_Fokus_Kloster = 1;

			B_GivePlayerXP	(500);

			B_LogEntry	(TOPIC_MOD_FOKUSSUCHE, "Ich habe den Fokus aus der Klosterruine geborgen.");
		};

		if (Npc_HasItems(hero, ItMi_Focus_Meer) == 1)
		&& (Mod_Fokus_Meer == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Fokusplatz))
		{
			Mod_Fokus_Meer = 1;

			B_GivePlayerXP	(500);

			B_LogEntry	(TOPIC_MOD_FOKUSSUCHE, "Ich habe den Fokus von der Meeresklippe geborgen.");
		};

		if (Npc_HasItems(hero, ItMi_Focus_Troll) == 1)
		&& (Mod_Fokus_Troll == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Fokusplatz))
		{
			Mod_Fokus_Troll = 1;

			B_GivePlayerXP	(500);

			B_LogEntry	(TOPIC_MOD_FOKUSSUCHE, "Ich habe den Fokus aus der Trollschlucht geborgen.");
		};

		if (Npc_HasItems(hero, ItMi_Focus_Stonehenge) == 1)
		&& (Mod_Fokus_Stonehenge == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Fokusplatz))
		{
			Mod_Fokus_Stonehenge = 1;

			B_GivePlayerXP	(500);

			B_LogEntry	(TOPIC_MOD_FOKUSSUCHE, "Ich habe den Fokus des Stonehenges von Ranad bekommen.");
		};

		if (Npc_HasItems(hero, ItMi_Focus_Bergfestung) == 1)
		&& (Mod_Fokus_Bergfestung == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Fokusplatz))
		{
			Mod_Fokus_Bergfestung = 1;

			B_GivePlayerXP	(500);

			B_LogEntry	(TOPIC_MOD_FOKUSSUCHE, "Ich konnte Hosh Pak den Fokus der Bergfestung abnehmen.");
		};

		if (Mod_Fokus_Bergfestung == 1)
		&& (Mod_Fokus_Troll == 1)
		&& (Mod_Fokus_Stonehenge == 1)
		&& (Mod_Fokus_Meer == 1)
		&& (Mod_Fokus_Kloster == 1)
		&& (Mod_Fokus_Alle == 0)
		{
			Mod_Fokus_Alle = 1;

			B_GivePlayerXP	(2000);

			B_LogEntry	(TOPIC_MOD_FOKUSSUCHE, "Ich habe alle fünf Foki. Ich sollte jetzt nach Jharkendar zurückkehren und dort die Foki einsetzen. Vorher sollte ich allerdings nochmal mit Saturas sprechen.");
		};

		// Tore im Minental öffnen und schließen

		if (Kapitel == 3)
		&& (Gardist_Dabei == FALSE)
		{
			if (Wld_IsTime(21,00,06,00))
			&& (Mod_ALTor_01 == 0)
			{
				Mod_ALTor_01 = 1;

				Wld_SendTrigger	("EVT_OC_MAINGATE01_01");
			}
			else if (Wld_IsTime(06,01,20,59))
			&& (Mod_ALTor_01 == 1)
			{
				Mod_ALTor_01 = 0;

				Wld_SendTrigger	("EVT_OC_MAINGATE01_01");
			};
			if (Wld_IsTime(21,00,06,00))
			&& (Mod_ALTor_02 == 0)
			{
				Mod_ALTor_02 = 1;

				Wld_SendTrigger	("EVT_OC_MAINGATE02_01");
			}
			else if (Wld_IsTime(06,01,20,59))
			&& (Mod_ALTor_02 == 1)
			{
				Mod_ALTor_02 = 0;

				Wld_SendTrigger	("EVT_OC_MAINGATE02_01");
			};
			if (Wld_IsTime(21,00,06,00))
			&& (Mod_ALTor_03 == 0)
			{
				Mod_ALTor_03 = 1;

				Wld_SendTrigger	("EVT_OC_MAINGATE02_02");
			}
			else if (Wld_IsTime(06,01,20,59))
			&& (Mod_ALTor_03 == 1)
			{
				Mod_ALTor_03 = 0;

				Wld_SendTrigger	("EVT_OC_MAINGATE02_02");
			};
		};

		if (Kapitel == 4)
		&& (Mod_ALTor_01 == 1)
		{
			Mod_ALTor_01 = 0;

			Wld_SendTrigger	("EVT_OC_MAINGATE01_01");
		};
		if (Kapitel == 4)
		&& (Mod_ALTor_02 == 1)
		{
			Mod_ALTor_02 = 0;

			Wld_SendTrigger	("EVT_OC_MAINGATE02_01");
		};
		if (Kapitel == 4)
		&& (Mod_ALTor_03 == 1)
		{
			Mod_ALTor_03 = 0;

			Wld_SendTrigger	("EVT_OC_MAINGATE02_02");
		};

		// Chromanin

		if (riddle1 == TRUE)
		&& (Npc_GetDistToWP(hero, "LOCATION_19_03_ROOM3") < 500)
		&& (riddle1inserted == FALSE)
		{
			riddle1inserted = TRUE;

			Wld_InsertNpc	(Monster_11058_Demon_MT,	"LOCATION_19_03_ROOM3");
		};

		if (Hlp_IsValidNpc(Monster_11059_Kobold_MT))
		{
			if (!Npc_IsDead(Monster_11059_Kobold_MT))
			&& (Npc_KnowsInfo(hero, Info_Mod_Schiffskobold_Hi))
			&& (Npc_GetDistToNpc(hero, Monster_11059_Kobold_MT) < 300)
			{
				AI_Teleport	(Monster_11059_Kobold_MT, Npc_GetNextWP(Monster_11059_Kobold_MT));
			};
		};

		// Tagebucheintrag, wenn man die Klaue gefunden hat

		if (Npc_HasItems(hero, ItMw_BeliarWeapon_2H_01) == 1)
		&& (Mod_Klaue_TB == 0)
		{
			Mod_Klaue_TB = 1;

			B_LogEntry	(TOPIC_MOD_ERSTEWAFFE, "Ich habe dem Skelett die Klaue Beliars abgenommen und sollte nun zu Xardas gehen.");
		};

		// Ratford und Drax wegen Fokus verschwinden lassen

		if (!Mod_RatfordDrax_Weg)
		&& (Npc_GetDistToWP(hero, "OW_PATH_1_5_A") > 5000)
		&& (Npc_GetDistToWP(hero, "WP_CIRCLE_01") < 10000) {
			Mod_RatfordDrax_Weg = TRUE;

			B_StartOtherRoutine	(Mod_1120_BDT_Ratford_MT, "FOKUS");
			B_StartOtherRoutine	(Mod_1121_BDT_Drax_MT, "TOT");

			Wld_InsertNpc	(Warg_RatfordDrax_01, "FP_WARGLEICHE_FOKUS_01");
			Wld_InsertNpc	(Warg_RatfordDrax_02, "FP_WARGLEICHE_FOKUS_02");
			Wld_InsertNpc	(Warg_RatfordDrax_03, "FP_WARGLEICHE_FOKUS_03");
			Wld_InsertNpc	(Warg_RatfordDrax_04, "FP_WARGLEICHE_FOKUS_04");
			Wld_InsertNpc	(Warg_RatfordDrax_05, "FP_WARGLEICHE_FOKUS_05");
			Wld_InsertNpc	(Warg_RatfordDrax_06, "FP_WARGLEICHE_FOKUS_06");
			Wld_InsertNpc	(Warg_RatfordDrax_07, "FP_WARGLEICHE_FOKUS_07");
			Wld_InsertNpc	(Warg_RatfordDrax_08, "FP_WARGLEICHE_FOKUS_08");

			B_KillNpc	(Warg_RatfordDrax_01);
			B_KillNpc	(Warg_RatfordDrax_02);
			B_KillNpc	(Warg_RatfordDrax_03);
			B_KillNpc	(Warg_RatfordDrax_04);
			B_KillNpc	(Warg_RatfordDrax_05);
			B_KillNpc	(Warg_RatfordDrax_06);
			B_KillNpc	(Warg_RatfordDrax_07);
			B_KillNpc	(Warg_RatfordDrax_08);
		};
	};

	if (CurrentLevel == ADDONWORLD_ZEN)
	{
		// Meldung in Jharkendar, wenn man aus dem Portaltempel raus will

		if (Mod_AW_PortalMeldung == 0)
		&& (Npc_GetDistTowP(hero, "ADW_PORTALTEMPEL_16") < 300)
		&& (LEAVE_PORTALTEMPEL_FIRSTTIME_ONETIME == 0)
		{
			Mod_AW_PortalMeldung = 1;

			AI_StandUP	(hero);

			AI_Output(hero, NULL, "Info_Mod_Hero_PortalTempelOut_15_00"); //Der Ausgang ist versperrt. Irgendwie muss man ihn öffnen können. Vielleicht gibt es einen Schalter oder einen Hebel hier irgendwo?
		};

		// Die Echsen im Sumpf

		if (Mod_Echsis == 4)
		&& (Mod_EchsenTag < Wld_GetDay())
		{
			Mod_Echsis = 5;

			B_StartOtherRoutine	(Mod_12003_DRA_Albi_AW,	"WURDE");
			AI_Teleport	(Mod_12003_DRA_Albi_AW,	"BL_DOWN_CENTER_03");
		};

		// Zu Xardas nach dem letzten Teleporter

		if (FokiEingesetzt == 5)
		&& (Mod_HQ_FokusZuXardas == 1)
		{
			Mod_HQ_FokusTeleport += 1;

			B_SetAivar(hero, AIV_INVINCIBLE, FALSE);

			if (Mod_HQ_FokusTeleport == 2)
			{
				AI_Teleport	(hero, "ADW_ENTRANCE");

				Mod_HQ_FokusZuXardas = 2;
			};
		};

		if (Mod_HQ_FokusZuXardas == 2)
		&& (Npc_KnowsInfo(hero, Info_Mod_Xardas_AW_Hi))
		&& (!Npc_IsInState(Mod_678_DMB_Xardas_AW, ZS_Talk))
		{
			AI_Teleport	(hero, "OBELISKSCHREIN_WP");

			Mod_HQ_FokusZuXardas = 3;
		};

		// Die Schlacht der Echsen

		if (Mod_HQ_AlraunenTor == 1)
		{
			Mod_HQ_AlraunenTor = 2;

			Wld_PlayEffect("BLACK_SCREEN", hero, hero, 0, 0, 0, TRUE);

			Snd_Play	("GOL_STEPBOOM");

			B_LogEntry	(TOPIC_MOD_ECHSEN_SCHLACHT, "Das war eine ziemlich große Gruppe an Golems, die mich hier umgerannt hat. Ich sollte schleunigst zu den Echsen und ihnen bei der Schlacht helfen.");

			// Echsen vor Stadt wegen Schlacht

			B_StartOtherRoutine	(Mod_12002_DRA_Patroullie_AW, "SCHLACHT");
			B_StartOtherRoutine	(Mod_12004_DRA_Wache_AW, "SCHLACHT");
			B_StartOtherRoutine	(Mod_12005_DRA_Wache_AW, "SCHLACHT");
			B_StartOtherRoutine	(Mod_12006_DRA_Echse_AW, "SCHLACHT");
			B_StartOtherRoutine	(Mod_12009_DRA_Echse_AW, "SCHLACHT");
			B_StartOtherRoutine	(Mod_12010_DRA_Echse_AW, "SCHLACHT");
			B_StartOtherRoutine	(Mod_12011_DRA_Echse_AW, "SCHLACHT");
			B_StartOtherRoutine	(Mod_12012_DRA_Echse_AW, "SCHLACHT");
			B_StartOtherRoutine	(Mod_12013_DRA_Echse_AW, "SCHLACHT");
			B_StartOtherRoutine	(Mod_12014_DRA_Echse_AW, "SCHLACHT");
			B_StartOtherRoutine	(Mod_12015_DRA_Echse_AW, "SCHLACHT");
			B_StartOtherRoutine	(Mod_12018_DRA_Echse_AW, "SCHLACHT");
			B_StartOtherRoutine	(Mod_12019_DRA_Echse_AW, "SCHLACHT");

			Wld_InsertNpc	(SwampGolem_Schlacht_01, "ADW_SWAMP_SIT_BENCH_03");
			Wld_InsertNpc	(SwampGolem_Schlacht_02, "ADW_SWAMP_SIT_BENCH_03");
			Wld_InsertNpc	(SwampGolem_Schlacht_03, "ADW_SWAMP_SIT_BENCH_03");
			Wld_InsertNpc	(SwampGolem_Schlacht_04, "ADW_SWAMP_SIT_BENCH_03");
			Wld_InsertNpc	(SwampGolem_Schlacht_05, "ADW_SWAMP_SIT_BENCH_03");
			Wld_InsertNpc	(SwampGolem_Schlacht_06, "ADW_SWAMP_SIT_BENCH_03");
			Wld_InsertNpc	(SwampGolem_Schlacht_07, "ADW_SWAMP_SIT_BENCH_03");
			Wld_InsertNpc	(SwampGolem_Schlacht_08, "ADW_SWAMP_SIT_BENCH_03");
			Wld_InsertNpc	(SwampGolem_Schlacht_09, "ADW_SWAMP_SIT_BENCH_03");
			Wld_InsertNpc	(SwampGolem_Schlacht_10, "ADW_SWAMP_SIT_BENCH_03");

			Wld_InsertNpc	(SwampGolem_Schlacht_11, "ADW_PATH_TO_BL_03");
			Wld_InsertNpc	(SwampGolem_Schlacht_12, "ADW_PATH_TO_BL_03");
			Wld_InsertNpc	(SwampGolem_Schlacht_13, "ADW_PATH_TO_BL_03");
			Wld_InsertNpc	(SwampGolem_Schlacht_14, "ADW_PATH_TO_BL_03");
			Wld_InsertNpc	(SwampGolem_Schlacht_15, "ADW_PATH_TO_BL_03");
			Wld_InsertNpc	(SwampGolem_Schlacht_16, "ADW_PATH_TO_BL_03");
			Wld_InsertNpc	(SwampGolem_Schlacht_17, "ADW_PATH_TO_BL_03");
			Wld_InsertNpc	(SwampGolem_Schlacht_18, "ADW_PATH_TO_BL_03");
			Wld_InsertNpc	(SwampGolem_Schlacht_19, "ADW_PATH_TO_BL_03");
			Wld_InsertNpc	(SwampGolem_Schlacht_20, "ADW_PATH_TO_BL_03");

			Wld_InsertNpc	(SwampGolem_Schlacht_21, "ADW_BANDIT_VP1_04_B");
			Wld_InsertNpc	(SwampGolem_Schlacht_22, "ADW_BANDIT_VP1_04_B");
			Wld_InsertNpc	(SwampGolem_Schlacht_23, "ADW_BANDIT_VP1_04_B");
			Wld_InsertNpc	(SwampGolem_Schlacht_24, "ADW_BANDIT_VP1_04_B");
			Wld_InsertNpc	(SwampGolem_Schlacht_25, "ADW_BANDIT_VP1_04_B");
		};

		if (Mod_HQ_AlraunenTor == 2)
		&& (Npc_IsDead(SwampGolem_Schlacht_01))
		&& (Npc_IsDead(SwampGolem_Schlacht_02))
		&& (Npc_IsDead(SwampGolem_Schlacht_03))
		&& (Npc_IsDead(SwampGolem_Schlacht_04))
		&& (Npc_IsDead(SwampGolem_Schlacht_05))
		&& (Npc_IsDead(SwampGolem_Schlacht_06))
		&& (Npc_IsDead(SwampGolem_Schlacht_07))
		&& (Npc_IsDead(SwampGolem_Schlacht_08))
		&& (Npc_IsDead(SwampGolem_Schlacht_09))
		&& (Npc_IsDead(SwampGolem_Schlacht_10))
		&& (Npc_IsDead(SwampGolem_Schlacht_11))
		&& (Npc_IsDead(SwampGolem_Schlacht_12))
		&& (Npc_IsDead(SwampGolem_Schlacht_13))
		&& (Npc_IsDead(SwampGolem_Schlacht_14))
		&& (Npc_IsDead(SwampGolem_Schlacht_15))
		&& (Npc_IsDead(SwampGolem_Schlacht_16))
		&& (Npc_IsDead(SwampGolem_Schlacht_17))
		&& (Npc_IsDead(SwampGolem_Schlacht_18))
		&& (Npc_IsDead(SwampGolem_Schlacht_19))
		&& (Npc_IsDead(SwampGolem_Schlacht_20))
		&& (Npc_IsDead(SwampGolem_Schlacht_21))
		&& (Npc_IsDead(SwampGolem_Schlacht_22))
		&& (Npc_IsDead(SwampGolem_Schlacht_23))
		&& (Npc_IsDead(SwampGolem_Schlacht_24))
		&& (Npc_IsDead(SwampGolem_Schlacht_25))
		{
			Mod_HQ_AlraunenTor = 3;

			B_LogEntry	(TOPIC_MOD_ECHSEN_SCHLACHT, "Die Schlacht ist gewonnen und alle Golems besiegt. Ich sollte nun zu Albi zurückkehren.");

			B_StartOtherRoutine	(Mod_12002_DRA_Patroullie_AW, "START");
			B_StartOtherRoutine	(Mod_12004_DRA_Wache_AW, "START");
			B_StartOtherRoutine	(Mod_12005_DRA_Wache_AW, "START");
			B_StartOtherRoutine	(Mod_12006_DRA_Echse_AW, "START");
			B_StartOtherRoutine	(Mod_12009_DRA_Echse_AW, "START");
			B_StartOtherRoutine	(Mod_12010_DRA_Echse_AW, "START");
			B_StartOtherRoutine	(Mod_12011_DRA_Echse_AW, "START");
			B_StartOtherRoutine	(Mod_12012_DRA_Echse_AW, "START");
			B_StartOtherRoutine	(Mod_12013_DRA_Echse_AW, "START");
			B_StartOtherRoutine	(Mod_12014_DRA_Echse_AW, "START");
			B_StartOtherRoutine	(Mod_12015_DRA_Echse_AW, "START");
			B_StartOtherRoutine	(Mod_12018_DRA_Echse_AW, "START");
			B_StartOtherRoutine	(Mod_12019_DRA_Echse_AW, "START");
		};

		// Mutantengolem

		if (Npc_GetDistToWP(hero, "BL_RAVEN_STAIRS_01") < 500)
		&& (Mod_Mutantengolem == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Albi_Schlacht3))
		{
			Mod_Mutantengolem = 1;

			Wld_InsertNpc	(Monster_11057_Mutantengolem_AW, "ADW_ADANOSTEMPEL_TELEPORTSTATION");

			AI_StandUP	(hero);

			AI_TurnToNpc	(hero, Monster_11057_Mutantengolem_AW);
		};

		if (Mod_Mutantengolem == 1)
		&& (Monster_11057_Mutantengolem_AW.attribute[ATR_HITPOINTS] < Monster_11057_Mutantengolem_AW.attribute[ATR_HITPOINTS_MAX]/4)
		&& (Mod_Adanostempel_Door == 0)
		{
			Wld_SendTrigger	("EVT_OPENDOOR_SCENE");

			AI_StandUP	(hero);
			AI_StandUP	(Monster_11057_Mutantengolem_AW);

			AI_Teleport	(hero, "BL_RAVEN_03");
			AI_Teleport	(Monster_11057_Mutantengolem_AW, "BL_RAVEN_01");

			B_StartOtherRoutine	(Monster_11057_Mutantengolem_AW, "TOR");

			AI_TurnToNpc	(hero, Monster_11057_Mutantengolem_AW);
			AI_TurnToNpc	(Monster_11057_Mutantengolem_AW, hero);

			AI_SetWalkMode	(Monster_11057_Mutantengolem_AW, NPC_RUN);

			Mod_Mutantengolem = 2;
		};

		if (Mod_Mutantengolem == 2)
		&& (Npc_GetDistToNpc(hero, Monster_11057_Mutantengolem_AW) < 300)
		{
			AI_AlignToWP	(hero);
			AI_PlayAni	(hero, "T_STAND_2_JUMP");

			AI_SetWalkMode	(Monster_11057_Mutantengolem_AW, NPC_RUN);

			Mod_Mutantengolem = 3;
		};

		if (Mod_Mutantengolem == 3)
		&& (Mod_Adanostempel_Door == 0)
		&& (Npc_GetDistToWP(Monster_11057_Mutantengolem_AW, "BL_RAVEN_CHECK") < 500)
		{
			Mod_Adanostempel_Door = 1;

			Mod_Mutantengolem = 4;

			Wld_SendTrigger	("EVT_ADANOSTEMPEL_EINGANGSTUER");
			Wld_PlayEffect	("FX_EarthQuake", hero, hero, 0, 0, 0, FALSE);
			Snd_Play	("Ravens_Earthquake4");
		};

		if (Npc_KnowsInfo(hero, PC_Fokus1_Einsetzen))
		&& (Npc_HasItems(hero, ItMi_Focus_Troll) == 1)
		{
			Npc_RemoveInvItems	(hero, ItMi_Focus_Troll, 1);
		}
		else if (Npc_KnowsInfo(hero, PC_Fokus2_Einsetzen))
		&& (Npc_HasItems(hero, ItMi_Focus_Meer) == 1)
		{
			Npc_RemoveInvItems	(hero, ItMi_Focus_Meer, 1);
		}
		else if (Npc_KnowsInfo(hero, PC_Fokus3_Einsetzen))
		&& (Npc_HasItems(hero, ItMi_Focus_Stonehenge) == 1)
		{
			Npc_RemoveInvItems	(hero, ItMi_Focus_Stonehenge, 1);
		}
		else if (Npc_KnowsInfo(hero, PC_Fokus4_Einsetzen))
		&& (Npc_HasItems(hero, ItMi_Focus_Kloster) == 1)
		{
			Npc_RemoveInvItems	(hero, ItMi_Focus_Kloster, 1);
		}
		else if (Npc_KnowsInfo(hero, PC_Fokus5_Einsetzen))
		&& (Npc_HasItems(hero, ItMi_Focus_Bergfestung) == 1)
		{
			Npc_RemoveInvItems	(hero, ItMi_Focus_Bergfestung, 1);
		};

		if (Mod_Leprechaun_Choices == 2)
		&& (!Npc_IsInState(Monster_11073_Leprechaun_AW, ZS_Talk))
		{
			Mod_Leprechaun_Choices = 3;

			AI_Teleport	(Monster_11073_Leprechaun_AW, "TOT");
			B_StartOtherRoutine	(Monster_11073_Leprechaun_AW, "TOT");
			AI_Teleport	(Monster_11073_Leprechaun_AW, "TOT");

			Wld_SpawnNpcRange	(hero, Stoneguardian, 1, 750);
		};

		if (Mod_Leprechaun_Choices == 3)
		&& (Npc_GetDistToNpc(Monster_11073_Leprechaun_AW, hero) >= 1000)
		{
			Mod_Leprechaun_Choices = 4;

			B_RemoveNpc	(Monster_11073_Leprechaun_AW);
		};

		// Ritual für das Magieprisma

		if (Mod_PrismaRitual_Counter < 80)
		{
			if (Npc_KnowsInfo(hero, Info_Mod_Eremit_Prisma6))
			&& (Npc_IsInState(Mod_115_NONE_Eremit_AW, ZS_Circle))
			{
				Mod_PrismaRitual_Counter += 1;

				if (Mod_PrismaRitual_Counter == 15)
				|| (Mod_PrismaRitual_Counter == 50)
				{
					Mod_PrismaRitual_ZuLangsam = 1;

					Wld_StopEffect ("SPELLFX_PRISMA");
				};

				if ((Mod_PrismaRitual_Counter == 25)
				|| (Mod_PrismaRitual_Counter == 60))
				&& (Mod_PrismaRitual_ZuLangsam == 1)
				{
					Mod_PrismaRitual_ZuLangsam = 2;
				};
			};
		};

		// Aus Kapitel 3 zurück		

		if (Mod_XW_Startscene == 6 || (Npc_KnowsInfo(hero, Info_Mod_Argez_XW_Gefangen2) && Mod_XW_StartScene != 7))
		{
			Mod_XW_Startscene = 7;

			AI_Teleport	(PC_Friend_AW, "PC_HERO");
			B_StartOtherRoutine	(PC_Friend_AW, "BACK");
		};
		
		// Puzzlespiel bei Argez
		
		if (Npc_KnowsInfo(hero, Info_Mod_Argez_AW_Stab2))
		&& (Mod_Argez_Puzzle == 0)
		&& (!Npc_IsInState(PC_Friend_AW, ZS_Talk)) {
			Mod_Argez_Puzzle = 1;
			
			Mod_Uriziel_Background = View_CreatePxl(0, 0, Print_Screen[PS_X], Print_Screen[PS_Y]);
			View_SetTexture(Mod_Uriziel_Background, "WHITE.TGA");
			View_Open(Mod_Uriziel_Background);
			Mod_Uriziel_Frame = View_CreatePxl(Print_Screen[PS_X] / 2 - 119, Print_Screen[PS_Y] / 2 - 411, Print_Screen[PS_X] / 2 - 119 + 237, Print_Screen[PS_Y] / 2 - 411 + 821);
			View_SetTexture(Mod_Uriziel_Frame, "BORDER.TGA");
			View_Open(Mod_Uriziel_Frame);
			
			Mod_Uriziel_Piece1 = Button_CreatePxl(r_Max(Print_Screen[PS_X] - 121), r_Max(Print_Screen[PS_Y] - 178), 121, 178, "P1.TGA", Button_Null, Button_Null, PuzzleButton_Click);
			Button_Show(Mod_Uriziel_Piece1);
			
			Mod_Uriziel_Piece2 = Button_CreatePxl(r_Max(Print_Screen[PS_X] - 126), r_Max(Print_Screen[PS_Y] - 318), 126, 318, "P2.TGA", Button_Null, Button_Null, PuzzleButton_Click);
			Button_Show(Mod_Uriziel_Piece2);
			
			Mod_Uriziel_Piece3 = Button_CreatePxl(r_Max(Print_Screen[PS_X] - 138), r_Max(Print_Screen[PS_Y] - 205), 138, 205, "P3.TGA", Button_Null, Button_Null, PuzzleButton_Click);
			Button_Show(Mod_Uriziel_Piece3);
			
			Mod_Uriziel_Piece4 = Button_CreatePxl(r_Max(Print_Screen[PS_X] - 113), r_Max(Print_Screen[PS_Y] - 186), 113, 186, "P4.TGA", Button_Null, Button_Null, PuzzleButton_Click);
			Button_Show(Mod_Uriziel_Piece4);
			
			Mod_Uriziel_Piece5 = Button_CreatePxl(r_Max(Print_Screen[PS_X] - 174), r_Max(Print_Screen[PS_Y] - 304), 174, 304, "P5.TGA", Button_Null, Button_Null, PuzzleButton_Click);
			Button_Show(Mod_Uriziel_Piece5);
			
			Mod_Uriziel_Piece6 = Button_CreatePxl(r_Max(Print_Screen[PS_X] - 65), r_Max(Print_Screen[PS_Y] - 190), 65, 190, "P6.TGA", Button_Null, Button_Null, PuzzleButton_Click);
			Button_Show(Mod_Uriziel_Piece6);
			
			Mod_Uriziel_Piece7 = Button_CreatePxl(r_Max(Print_Screen[PS_X] - 64), r_Max(Print_Screen[PS_Y] - 158), 64, 158, "P7.TGA", Button_Null, Button_Null, PuzzleButton_Click);
			Button_Show(Mod_Uriziel_Piece7);
			
			Mod_Uriziel_Piece8 = Button_CreatePxl(r_Max(Print_Screen[PS_X] - 33), r_Max(Print_Screen[PS_Y] - 153), 33, 153, "P8.TGA", Button_Null, Button_Null, PuzzleButton_Click);
			Button_Show(Mod_Uriziel_Piece8);
			
			var string descriptionText1; descriptionText1 = "Verschiebe die Teile mit der Maus an ihren Platz.";
			var string descriptionText2; descriptionText2 = "Ein Mausklick hebt ein Teil auf, ein weiterer legt es wieder ab.";
			Mod_Uriziel_PuzzleDescription1 = View_CreatePxl(0, 0, Print_Screen[PS_X], Print_Screen[PS_Y]);
			Mod_Uriziel_PuzzleDescription2 = View_CreatePxl(0, 50, Print_Screen[PS_X], Print_Screen[PS_Y] - 50);
			View_AddText(Mod_Uriziel_PuzzleDescription1, 0, 0, descriptionText1, FONT_ScreenSmall);
			View_AddText(Mod_Uriziel_PuzzleDescription2, 0, 0, descriptionText2, FONT_ScreenSmall);
			View_Open(Mod_Uriziel_PuzzleDescription1);
			View_Open(Mod_Uriziel_PuzzleDescription2);
			
			Cursor_Show();
			Cursor_NoEngine = 1;
		};
	};

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		// Dämonisch

		if (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))
		&& (Npc_GetDistToWP(hero, "WP_SOELDNER_DAEMONISCH_TOT") < 500)
		&& (Mod_HQ_SoeldnerDaemonisch == FALSE)
		{
			Mod_HQ_SoeldnerDaemonisch = TRUE;

			B_GivePlayerXP	(50);

			B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Was haben wir denn hier ... ein Söldner, der offensichtlich mit einer Söldnerwaffe durchbohrt am Boden liegt.");
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))
		&& (Npc_GetDistToWP(hero, "NW_CITY_SMFOREST_03") < 500)
		&& (Mod_HQ_PaladineDaemonisch == FALSE)
		{
			Mod_HQ_PaladineDaemonisch = TRUE;
		};

		if (Hlp_IsValidNpc(Mod_566_NONE_Brian_NW))
		{
			if (Mod_HQ_BrianDaemonisch == FALSE)
			&& (Npc_KnowsInfo(hero, Info_Mod_Brian_Daemonisch))
			&& (!Npc_IsInState(Mod_566_NONE_Brian_NW, ZS_Talk))
			{
				AI_PlayAni	(Mod_566_NONE_Brian_NW, "T_DEADB");

				B_KillNpc	(Mod_566_NONE_Brian_NW);

				Mod_HQ_BrianDaemonisch = TRUE;
			};
		};

		// Dämonisch

		if (Hlp_IsValidNpc(Mod_570_NONE_Coragon_NW))
		{
			if (Npc_KnowsInfo(hero, Info_Mod_Coragon_Daemonisch3))
			&& (!Npc_IsInState(Mod_570_NONE_Coragon_NW, ZS_Talk))
			&& (Mod_HQ_Daemonisch_City == 0)
			{
				Mod_HQ_Daemonisch_City_Counter += 1;

				if (Mod_HQ_Daemonisch_City_Counter == 10)
				{
					AI_PlayAni	(Mod_1251_RIT_Ritter_NW, "T_STAND_2_VICTIM_SLE");
					AI_PlayAni	(Mod_1252_RIT_Ritter_NW, "T_STAND_2_VICTIM_SLE");
					AI_PlayAni	(Mod_1253_RIT_Ritter_NW, "T_STAND_2_VICTIM_SLE");
					AI_PlayAni	(Mod_1254_RIT_Ritter_NW, "T_STAND_2_VICTIM_SLE");
					AI_PlayAni	(Mod_1259_RIT_Ritter_NW, "T_STAND_2_VICTIM_SLE");
					AI_PlayAni	(Mod_1261_RIT_Ritter_NW, "T_STAND_2_VICTIM_SLE");
					AI_PlayAni	(Mod_1175_MIL_Miliz_NW, "T_STAND_2_VICTIM_SLE");
					AI_PlayAni	(Mod_1176_MIL_Miliz_NW, "T_STAND_2_VICTIM_SLE");
					AI_PlayAni	(Mod_1177_MIL_Miliz_NW, "T_STAND_2_VICTIM_SLE");
					AI_PlayAni	(Mod_1044_VLK_Buerger_NW, "T_STAND_2_VICTIM_SLE");
					AI_PlayAni	(Mod_1045_VLK_Buerger_NW, "T_STAND_2_VICTIM_SLE");

					B_StartOtherRoutine	(Mod_524_KDW_Vatras_NW, "DAEMONISCH");
				};

				if (Mod_HQ_Daemonisch_City_Counter == 20)
				{
					AI_StandUp	(Mod_1251_RIT_Ritter_NW);
					AI_StandUp	(Mod_1252_RIT_Ritter_NW);
					AI_StandUp	(Mod_1253_RIT_Ritter_NW);
					AI_StandUp	(Mod_1254_RIT_Ritter_NW);
					AI_StandUp	(Mod_1259_RIT_Ritter_NW);
					AI_StandUp	(Mod_1261_RIT_Ritter_NW);
					AI_StandUp	(Mod_1175_MIL_Miliz_NW);
					AI_StandUp	(Mod_1176_MIL_Miliz_NW);
					AI_StandUp	(Mod_1177_MIL_Miliz_NW);
					AI_StandUp	(Mod_1044_VLK_Buerger_NW);
					AI_StandUp	(Mod_1045_VLK_Buerger_NW);

					B_StartOtherRoutine	(Mod_1252_RIT_Ritter_NW, "START");
					B_StartOtherRoutine	(Mod_1253_RIT_Ritter_NW, "START");
					B_StartOtherRoutine	(Mod_1254_RIT_Ritter_NW, "START");
					B_StartOtherRoutine	(Mod_1259_RIT_Ritter_NW, "START");
					B_StartOtherRoutine	(Mod_1261_RIT_Ritter_NW, "START");
					B_StartOtherRoutine	(Mod_1175_MIL_Miliz_NW, "START");
					B_StartOtherRoutine	(Mod_1176_MIL_Miliz_NW, "START");
					B_StartOtherRoutine	(Mod_1177_MIL_Miliz_NW, "START");
					B_StartOtherRoutine	(Mod_1044_VLK_Buerger_NW, "START");
					B_StartOtherRoutine	(Mod_1045_VLK_Buerger_NW, "START");

					Mod_HQ_Daemonisch_City = 1;
				};
			};

			if (Mod_HQ_Daemonisch_Orlan == 1)
			{
				if (Npc_GetDistToWP(Mod_776_NONE_Orlan_NW, "WP_TAVERNE_ZIMMER_07") < 500)
				{
					Mod_HQ_Daemonisch_Orlan = 2;

					B_StartOtherRoutine	(Mod_776_NONE_Orlan_NW, "DAEMONISCH2");

					AI_Teleport	(Mod_914_NOV_Babo_NW, "NW_TAVERNE");
					AI_Teleport	(Mod_1191_NOV_Novize_NW, "NW_TAVERNE");
					AI_Teleport	(Mod_105_BAU_Sekob_NW, "NW_TAVERNE");
					AI_Teleport	(Mod_1400_BAU_Bauer_NW, "NW_TAVERNE");
					AI_Teleport	(Mod_1401_BAU_Bauer_NW, "NW_TAVERNE");
					AI_Teleport	(Mod_1402_BAU_Bauer_NW, "NW_TAVERNE");
					AI_Teleport	(Mod_1046_VLK_Buerger_NW, "NW_TAVERNE");
					AI_Teleport	(Mod_1048_VLK_Buerger_NW, "NW_TAVERNE");

					B_StartOtherRoutine	(Mod_914_NOV_Babo_NW, "DAEMONISCH");
					B_StartOtherRoutine	(Mod_1191_NOV_Novize_NW, "DAEMONISCH");
					B_StartOtherRoutine	(Mod_105_BAU_Sekob_NW, "DAEMONISCH");
					B_StartOtherRoutine	(Mod_1400_BAU_Bauer_NW, "DAEMONISCH");
					B_StartOtherRoutine	(Mod_1401_BAU_Bauer_NW, "DAEMONISCH");
					B_StartOtherRoutine	(Mod_1402_BAU_Bauer_NW, "DAEMONISCH");
					B_StartOtherRoutine	(Mod_1046_VLK_Buerger_NW, "DAEMONISCH");
					B_StartOtherRoutine	(Mod_1048_VLK_Buerger_NW, "DAEMONISCH");

					AI_Teleport	(Mod_914_NOV_Babo_NW, "NW_TAVERNE");
					AI_Teleport	(Mod_1191_NOV_Novize_NW, "NW_TAVERNE");
					AI_Teleport	(Mod_105_BAU_Sekob_NW, "NW_TAVERNE");
					AI_Teleport	(Mod_1400_BAU_Bauer_NW, "NW_TAVERNE");
					AI_Teleport	(Mod_1401_BAU_Bauer_NW, "NW_TAVERNE");
					AI_Teleport	(Mod_1402_BAU_Bauer_NW, "NW_TAVERNE");
					AI_Teleport	(Mod_1046_VLK_Buerger_NW, "NW_TAVERNE");
					AI_Teleport	(Mod_1048_VLK_Buerger_NW, "NW_TAVERNE");
				};
			};

			if (Mod_HQ_Daemonisch_Orlan == 2)
			{
				Mod_HQ_Daemonisch_Orlan_Counter += 1;

				if (Mod_HQ_Daemonisch_Orlan_Counter == 20)
				{
					AI_PlayAni	(Mod_914_NOV_Babo_NW, "T_STAND_2_VICTIM_SLE");
					AI_PlayAni	(Mod_1191_NOV_Novize_NW, "T_STAND_2_VICTIM_SLE");
					AI_PlayAni	(Mod_105_BAU_Sekob_NW, "T_STAND_2_VICTIM_SLE");
					AI_PlayAni	(Mod_1400_BAU_Bauer_NW, "T_STAND_2_VICTIM_SLE");
					AI_PlayAni	(Mod_1401_BAU_Bauer_NW, "T_STAND_2_VICTIM_SLE");
					AI_PlayAni	(Mod_1402_BAU_Bauer_NW, "T_STAND_2_VICTIM_SLE");
					AI_PlayAni	(Mod_1046_VLK_Buerger_NW, "T_STAND_2_VICTIM_SLE");
					AI_PlayAni	(Mod_1048_VLK_Buerger_NW, "T_STAND_2_VICTIM_SLE");
				};

				if (Mod_HQ_Daemonisch_Orlan_Counter == 30)
				{
					AI_StandUp	(Mod_914_NOV_Babo_NW);
					AI_StandUp	(Mod_1191_NOV_Novize_NW);
					AI_StandUp	(Mod_105_BAU_Sekob_NW);
					AI_StandUp	(Mod_1400_BAU_Bauer_NW);
					AI_StandUp	(Mod_1401_BAU_Bauer_NW);
					AI_StandUp	(Mod_1402_BAU_Bauer_NW);
					AI_StandUp	(Mod_1046_VLK_Buerger_NW);
					AI_StandUp	(Mod_1048_VLK_Buerger_NW);

					B_StartOtherRoutine	(Mod_1191_NOV_Novize_NW, "START");
					B_StartOtherRoutine	(Mod_105_BAU_Sekob_NW, "START");
					B_StartOtherRoutine	(Mod_1400_BAU_Bauer_NW, "START");
					B_StartOtherRoutine	(Mod_1401_BAU_Bauer_NW, "START");
					B_StartOtherRoutine	(Mod_1046_VLK_Buerger_NW, "START");
					B_StartOtherRoutine	(Mod_1048_VLK_Buerger_NW, "START");

					Mod_HQ_Daemonisch_Orlan = 3;
				};
			};
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Thekla_Daemonisch2))
		&& (!Npc_IsInState(Mod_799_BAU_Thekla_NW, ZS_Talk))
		&& (Mod_HQ_Daemonisch_Thekla == 0)
		{
			Mod_HQ_Daemonisch_Thekla = 1;

			if (Npc_IsDead(Mod_1201_SLD_Soeldner_NW))
			{
				Wld_InsertNpc	(Mod_1201_SLD_Soeldner_NW, "BIGFARM");
			};

			AI_Teleport	(Mod_1201_SLD_Soeldner_NW, "NW_BIGFARM_KITCHEN_01");
			AI_Teleport	(Mod_1202_SLD_Soeldner_NW, "NW_BIGFARM_KITCHEN_01");
			AI_Teleport	(Mod_1203_SLD_Soeldner_NW, "NW_BIGFARM_KITCHEN_01");
			AI_Teleport	(Mod_1204_SLD_Soeldner_NW, "NW_BIGFARM_KITCHEN_01");

			B_StartOtherRoutine	(Mod_1201_SLD_Soeldner_NW, "DAEMONISCH");
			B_StartOtherRoutine	(Mod_1202_SLD_Soeldner_NW, "DAEMONISCH");
			B_StartOtherRoutine	(Mod_1203_SLD_Soeldner_NW, "DAEMONISCH");
			B_StartOtherRoutine	(Mod_1204_SLD_Soeldner_NW, "DAEMONISCH");

			AI_Teleport	(Mod_1201_SLD_Soeldner_NW, "NW_BIGFARM_KITCHEN_01");
			AI_Teleport	(Mod_1202_SLD_Soeldner_NW, "NW_BIGFARM_KITCHEN_01");
			AI_Teleport	(Mod_1203_SLD_Soeldner_NW, "NW_BIGFARM_KITCHEN_01");
			AI_Teleport	(Mod_1204_SLD_Soeldner_NW, "NW_BIGFARM_KITCHEN_01");
		};

		if (Mod_HQ_Daemonisch_Thekla == 1)
		{
			Mod_HQ_Daemonisch_Thekla_Counter += 1;

			if (Mod_HQ_Daemonisch_Thekla_Counter == 10)
			{
				AI_PlayAni	(Mod_1201_SLD_Soeldner_NW, "T_STAND_2_VICTIM_SLE");
				AI_PlayAni	(Mod_1202_SLD_Soeldner_NW, "T_STAND_2_VICTIM_SLE");
				AI_PlayAni	(Mod_1203_SLD_Soeldner_NW, "T_STAND_2_VICTIM_SLE");
				AI_PlayAni	(Mod_1204_SLD_Soeldner_NW, "T_STAND_2_VICTIM_SLE");			
			};

			if (Mod_HQ_Daemonisch_Thekla_Counter == 20)
			{
				AI_StandUp	(Mod_1201_SLD_Soeldner_NW);
				AI_StandUp	(Mod_1202_SLD_Soeldner_NW);
				AI_StandUp	(Mod_1203_SLD_Soeldner_NW);
				AI_StandUp	(Mod_1204_SLD_Soeldner_NW);	

				B_StartOtherRoutine	(Mod_1202_SLD_Soeldner_NW, "START");
				B_StartOtherRoutine	(Mod_1203_SLD_Soeldner_NW, "START");
				B_StartOtherRoutine	(Mod_1204_SLD_Soeldner_NW, "START");		

				Mod_HQ_Daemonisch_Thekla = 2;
			};
		};

		if (Mod_HQ_Daemonisch == 1)
		&& (Mod_HQ_Daemonisch_City == 1)
		&& (Mod_HQ_Daemonisch_Orlan == 3)
		&& (Mod_HQ_Daemonisch_Thekla == 2)
		{
			Mod_HQ_Daemonisch = 2;

			B_LogEntry	(TOPIC_MOD_DAEMONISCH, "So, das waren alle drei. Jetzt wieder zu Xardas.");
		};

		if (Mod_HQ_Daemonisch == 3)
		{
			if (Mod_HQ_Daemonisch_SP_01 == 0)
			&& (((Npc_IsDead(Mod_13000_SP_Seelenpeiniger_NW))
			&& (Npc_IsDead(Mod_13001_SP_Seelenpeiniger_NW))
			&& (Npc_IsDead(Mod_13002_SP_Seelenpeiniger_NW))
			&& (Npc_IsDead(Mod_13003_SP_Seelenpeiniger_NW))
			&& (Npc_IsDead(Mod_13004_SP_Seelenpeiniger_NW))
			&& (Npc_IsDead(Mod_13021_SP_Seelenpeiniger_NW))
			&& (Npc_IsDead(Mod_13022_SP_Seelenpeiniger_NW)))
			|| ((Npc_GetDistToWP(Mod_13000_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03") > 5000)
			&& (Npc_GetDistToWP(Mod_13001_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03") > 5000)
			&& (Npc_GetDistToWP(Mod_13002_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03") > 5000)
			&& (Npc_GetDistToWP(Mod_13003_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03") > 5000)
			&& (Npc_GetDistToWP(Mod_13004_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03") > 5000)
			&& (Npc_GetDistToWP(Mod_13021_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03") > 5000)
			&& (Npc_GetDistToWP(Mod_13022_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03") > 5000)
			&& (Npc_GetDistToWP(hero, "NW_BIGFARM_LAKE_CAVE_03") < 2000)
			&& (Wld_IsTime(20,15,06,00))))
			{
				Mod_HQ_Daemonisch_SP_01 = 1;

				Mod_HQ_Daemonisch_SP += 1;

				if (Mod_HQ_Daemonisch_SP == 1)
				{
					B_LogEntry	(TOPIC_MOD_DAEMONISCH, "1. Lager erledigt.");
				}
				else if (Mod_HQ_Daemonisch_SP == 2)
				{
					B_LogEntry	(TOPIC_MOD_DAEMONISCH, "2. Lager erledigt.");
				}
				else
				{
					B_LogEntry	(TOPIC_MOD_DAEMONISCH, "3. Lager erledigt.");
				};
			};
			if (Mod_HQ_Daemonisch_SP_02 == 0)
			{
				if (Npc_IsDead(Mod_13009_SP_Seelenpeiniger_NW))
				&& (Npc_IsDead(Mod_13010_SP_Seelenpeiniger_NW))
				&& (Npc_IsDead(Mod_13011_SP_Seelenpeiniger_NW))
				&& (Npc_IsDead(Mod_13012_SP_Seelenpeiniger_NW))
				&& (Npc_IsDead(Mod_13023_SP_Seelenpeiniger_NW))
				&& (Npc_IsDead(Mod_13024_SP_Seelenpeiniger_NW))
				{
					Mod_HQ_Daemonisch_SP_02 = 1;

					Mod_HQ_Daemonisch_SP += 1;

					if (Mod_HQ_Daemonisch_SP == 1)
					{
						B_LogEntry	(TOPIC_MOD_DAEMONISCH, "1. Lager erledigt.");
					}
					else if (Mod_HQ_Daemonisch_SP == 2)
					{
						B_LogEntry	(TOPIC_MOD_DAEMONISCH, "2. Lager erledigt.");
					}
					else
					{
						B_LogEntry	(TOPIC_MOD_DAEMONISCH, "3. Lager erledigt.");
					};
				}
				else if (Npc_GetDistToWP(Mod_13009_SP_Seelenpeiniger_NW, "NW_BIGFARM_FOREST_03_NAVIGATION") > 2000)
				&& (Npc_GetDistToWP(Mod_13010_SP_Seelenpeiniger_NW, "NW_BIGFARM_FOREST_03_NAVIGATION") > 2000)
				&& (Npc_GetDistToWP(Mod_13011_SP_Seelenpeiniger_NW, "NW_BIGFARM_FOREST_03_NAVIGATION") > 2000)
				&& (Npc_GetDistToWP(Mod_13012_SP_Seelenpeiniger_NW, "NW_BIGFARM_FOREST_03_NAVIGATION") > 2000)
				&& (Npc_GetDistToWP(Mod_13023_SP_Seelenpeiniger_NW, "NW_BIGFARM_FOREST_03_NAVIGATION") > 2000)
				&& (Npc_GetDistToWP(Mod_13024_SP_Seelenpeiniger_NW, "NW_BIGFARM_FOREST_03_NAVIGATION") > 2000)
				&& (Npc_GetDistToWP(hero, "NW_BIGFARM_FOREST_03_NAVIGATION") < 2000)
				&& (Wld_IsTime(20,15,06,00))
				{
					Mod_HQ_Daemonisch_SP_02 = 1;

					Mod_HQ_Daemonisch_SP += 1;

					if (Mod_HQ_Daemonisch_SP == 1)
					{
						B_LogEntry	(TOPIC_MOD_DAEMONISCH, "1. Lager erledigt.");
					}
					else if (Mod_HQ_Daemonisch_SP == 2)
					{
						B_LogEntry	(TOPIC_MOD_DAEMONISCH, "2. Lager erledigt.");
					}
					else
					{
						B_LogEntry	(TOPIC_MOD_DAEMONISCH, "3. Lager erledigt.");
					};
				};
			};
			if (Mod_HQ_Daemonisch_SP_03 == 0)
			&& (((Npc_IsDead(Mod_13013_SP_Seelenpeiniger_NW))
			&& (Npc_IsDead(Mod_13014_SP_Seelenpeiniger_NW))
			&& (Npc_IsDead(Mod_13015_SP_Seelenpeiniger_NW))
			&& (Npc_IsDead(Mod_13016_SP_Seelenpeiniger_NW))
			&& (Npc_IsDead(Mod_13025_SP_Seelenpeiniger_NW))
			&& (Npc_IsDead(Mod_13026_SP_Seelenpeiniger_NW)))
			|| ((Npc_GetDistToWP(Mod_13013_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_04") > 5000)
			&& (Npc_GetDistToWP(Mod_13014_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_04") > 5000)
			&& (Npc_GetDistToWP(Mod_13015_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_04") > 5000)
			&& (Npc_GetDistToWP(Mod_13016_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_04") > 5000)
			&& (Npc_GetDistToWP(Mod_13025_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_04") > 5000)
			&& (Npc_GetDistToWP(Mod_13026_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_04") > 5000)
			&& (Npc_GetDistToWP(hero, "NW_BIGFARM_LAKE_CAVE_03") < 2000)
			&& (Wld_IsTime(20,15,06,00))))
			{
				Mod_HQ_Daemonisch_SP_03 = 1;

				Mod_HQ_Daemonisch_SP += 1;

				if (Mod_HQ_Daemonisch_SP == 1)
				{
					B_LogEntry	(TOPIC_MOD_DAEMONISCH, "1. Lager erledigt.");
				}
				else if (Mod_HQ_Daemonisch_SP == 2)
				{
					B_LogEntry	(TOPIC_MOD_DAEMONISCH, "2. Lager erledigt.");
				}
				else
				{
					B_LogEntry	(TOPIC_MOD_DAEMONISCH, "3. Lager erledigt.");
				};
			};

			if (Mod_HQ_Daemonisch_SP == 2)
			&& (Mod_HQ_Daemonisch_SPZ == 0)
			{
				Mod_HQ_Daemonisch_SPZ = 1;

				if (Mod_HQ_Daemonisch_SP_01 == 0)
				{
					Wld_InsertNpc	(Zombie_SP_01, "NW_BIGFARM_LAKE_CAVE_03");
				}
				else if (Mod_HQ_Daemonisch_SP_02 == 0 && hero.guild != GIL_PAL)
				{
					Wld_InsertNpc	(Zombie_SP_02, "NW_BIGFARM_FOREST_03_NAVIGATION");
				}
				else
				{
					Wld_InsertNpc	(Zombie_SP_03, "NW_CITY_SMFOREST_05");
				};
			};
		};

		if (Mod_HQ_Daemonisch == 4)
		&& ((Mod_HQ_Daemonisch_SP_01 == 2)
		|| (Mod_HQ_Daemonisch_SP_02 == 2)
		|| (Mod_HQ_Daemonisch_SP_03 == 2))
		{
			B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Aha, Taverne ... nur welche?");

			Mod_HQ_Daemonisch = 5;
		};

		if ((Mod_HQ_Daemonisch == 7)
		|| (Mod_HQ_Daemonisch == 6))
		&& (Npc_GetDistToWP(hero, "NW_FARM1_BANDITS_CAVE_01") < 500)
		{
			Mod_HQ_Daemonisch = 8;

			AI_GotoWP	(hero, "NW_FARM1_BANDITS_CAVE_01");

			Wld_SendTrigger	("URNOLKAP4");

			CutsceneAn = TRUE;
		};

		if (Mod_HQ_Daemonisch == 8)
		{
			if (Mod_HQ_Daemonisch_Sequenz == 0)
			{
				if (Mod_HQ_Daemonisch_SP_01 == 2)
				{
					AI_TurnToNpc	(Mod_7422_NONE_Frau_NW, Mod_753_NOV_Ulf_NW);
					AI_TurnToNpc	(Mod_753_NOV_Ulf_NW, Mod_7422_NONE_Frau_NW);

					AI_Output(Mod_753_NOV_Ulf_NW, NULL, "Info_Mod_UrnolKap4_Ulf_28_00"); //Ich ... ich kann das nicht mehr tun. Warum verlangst du das von mir?
				}
				else if (Mod_HQ_Daemonisch_SP_02 == 2)
				{
					AI_TurnToNpc	(Mod_7422_NONE_Frau_NW, Mod_541_NONE_Till_NW);
					AI_TurnToNpc	(Mod_541_NONE_Till_NW, Mod_7422_NONE_Frau_NW);

					AI_Output(Mod_541_NONE_Till_NW, NULL, "Info_Mod_UrnolKap4_Till_24_01"); //Ich ... ich kann das nicht mehr tun. Warum verlangst du das von mir?
				}
				else
				{
					AI_TurnToNpc	(Mod_7422_NONE_Frau_NW, Mod_754_NONE_Valentino_NW);
					AI_TurnToNpc	(Mod_754_NONE_Valentino_NW, Mod_7422_NONE_Frau_NW);

					AI_Output(Mod_754_NONE_Valentino_NW, NULL, "Info_Mod_UrnolKap4_Valentino_03_02"); //Ich ... ich kann das nicht mehr tun. Warum verlangst du das von mir?
				};
			};
			if (Mod_HQ_Daemonisch_Sequenz == 5)
			{
				if (Mod_HQ_Daemonisch_SP_01 == 2)
				{
					AI_Output(Mod_753_NOV_Ulf_NW, NULL, "Info_Mod_UrnolKap4_Ulf_28_03"); //Vorher bin ich dem Mann begegnet, den ich töten sollte ... ich konnte es nicht.
				}
				else if (Mod_HQ_Daemonisch_SP_02 == 2)
				{
					AI_Output(Mod_541_NONE_Till_NW, NULL, "Info_Mod_UrnolKap4_Till_24_04"); //Vorher bin ich dem Mann begegnet, den ich töten sollte ... ich konnte es nicht.
				}
				else
				{
					AI_Output(Mod_754_NONE_Valentino_NW, NULL, "Info_Mod_UrnolKap4_Valentino_03_05"); //Vorher bin ich dem Mann begegnet, den ich töten sollte ... ich konnte es nicht.
				};
			};
			if (Mod_HQ_Daemonisch_Sequenz == 10)
			{
				if (Mod_HQ_Daemonisch_SP_01 == 2)
				{
					AI_Output(Mod_753_NOV_Ulf_NW, NULL, "Info_Mod_UrnolKap4_Ulf_28_06"); //Ich will doch einfach nur unsere Liebe leben.
				}
				else if (Mod_HQ_Daemonisch_SP_02 == 2)
				{
					AI_Output(Mod_541_NONE_Till_NW, NULL, "Info_Mod_UrnolKap4_Till_24_07"); //Ich will doch einfach nur unsere Liebe leben.
				}
				else
				{
					AI_Output(Mod_754_NONE_Valentino_NW, NULL, "Info_Mod_UrnolKap4_Valentino_03_08"); //Ich will doch einfach nur unsere Liebe leben.
				};
			};
			if (Mod_HQ_Daemonisch_Sequenz == 15)
			{
				AI_Output(Mod_7422_NONE_Frau_NW, NULL, "Info_Mod_UrnolKap4_Urnol_17_09"); //Ach, du hast recht. Das darf so nicht weitergehen.
			};
			if (Mod_HQ_Daemonisch_Sequenz == 20)
			{
				AI_Output(Mod_7422_NONE_Frau_NW, NULL, "Info_Mod_UrnolKap4_Urnol_17_10"); //Daher ... wird sich jetzt einer der Schattendiener deiner annehmen ... sonst nützt du mir ja doch nichts mehr.
			};
			if (Mod_HQ_Daemonisch_Sequenz == 25)
			{
				if (Mod_HQ_Daemonisch_SP_01 == 2)
				{
					AI_Output(Mod_753_NOV_Ulf_NW, NULL, "Info_Mod_UrnolKap4_Ulf_28_11"); //Was ... nein, aber ich liebe dich doooch ...
				}
				else if (Mod_HQ_Daemonisch_SP_02 == 2)
				{
					AI_Output(Mod_541_NONE_Till_NW, NULL, "Info_Mod_UrnolKap4_Till_24_12"); //Was ... nein, aber ich liebe dich doooch ...
				}
				else
				{
					AI_Output(Mod_754_NONE_Valentino_NW, NULL, "Info_Mod_UrnolKap4_Valentino_03_13"); //Was ... nein, aber ich liebe dich doooch ...
				};
			};
			if (Mod_HQ_Daemonisch_Sequenz == 30)
			{
				if (Mod_HQ_Daemonisch_SP_01 == 2)
				{
					AI_PlayAni	(Mod_753_NOV_Ulf_NW, "T_DEADB");
				}
				else if (Mod_HQ_Daemonisch_SP_02 == 2)
				{
					AI_PlayAni	(Mod_541_NONE_Till_NW, "T_DEADB");
				}
				else
				{
					AI_PlayAni	(Mod_754_NONE_Valentino_NW, "T_DEADB");
				};

				B_SetNpcVisual 		(Mod_7422_NONE_Frau_NW, MALE, "Ske_Head", 0, 0, ITAR_Pal_Skel);
			};
			if (Mod_HQ_Daemonisch_Sequenz == 32)
			{
				if (Mod_HQ_Daemonisch_SP_01 == 2)
				{
					B_KillNpc	(Mod_753_NOV_Ulf_NW);
				}
				else if (Mod_HQ_Daemonisch_SP_02 == 2)
				{
					B_KillNpc	(Mod_541_NONE_Till_NW);
				}
				else
				{
					B_KillNpc	(Mod_754_NONE_Valentino_NW);
				};
			};
			if (Mod_HQ_Daemonisch_Sequenz == 35)
			{
				AI_Output(Mod_7422_NONE_Frau_NW, NULL, "Info_Mod_UrnolKap4_Urnol_14_14"); //Und außerdem bist du auch gar nicht mein Typ, harharhar ... Trottel.
			};
			if (Mod_HQ_Daemonisch_Sequenz == 39)
			{
				AI_GotoWP	(hero, "NW_FARM1_BANDITS_CAVE_02");
			};
			if (Mod_HQ_Daemonisch_Sequenz == 40)
			{
				Mod_HQ_Daemonisch = 9;

				CutsceneAn = FALSE;
			};

			Mod_HQ_Daemonisch_Sequenz += 1;
		};

		// Brian

		if (!Npc_IsInState(Mod_1248_RIT_Ritter_NW, ZS_Talk))
		&& (Npc_KnowsInfo(hero, Info_Mod_RitterBeiBrian_Daemonisch))
		&& (Mod_HQ_BrianDaemonisch == 2)
		&& (Mod_RBB_Angriff == 0)
		{
			Mod_RBB_Angriff = 1;

			B_Attack	(Mod_1249_RIT_Ritter_NW, hero, AR_Kill, 0);
			B_Attack	(Mod_1250_RIT_Ritter_NW, hero, AR_Kill, 0);
		};

		// Bennet kommt einen Tag später auf's Schiff

		if (Mod_BennetDabei == 1)
		&& (Wld_GetDay() > Mod_BennetSchiffTag)
		{
			B_StartOtherRoutine	(Mod_562_NONE_Bennet_NW, "SCHIFF");

			Mod_BennetDabei = 2;
		};

		// Schifffahrt geht los

		if (Mod_JackHW == 4)
		&& (!Npc_IsInState(Mod_586_NONE_Jack_NW, ZS_Talk))
		{
			AI_Teleport	(hero, "SHIP_IN_14");

			Mod_JackHW = 5;

			B_SetTopicStatus	(TOPIC_MOD_HQ_CREW, LOG_SUCCESS);
		};

		if (Mod_CedricLos == 3)
		&& (!Npc_IsInState(Mod_569_RIT_Cedric_NW, ZS_Talk))
		{
			AI_Teleport	(hero, "SHIP_IN_14");

			Mod_CedricLos = 4;

			B_SetTopicStatus	(TOPIC_MOD_HQ_CREW, LOG_SUCCESS);
		};

		// Feuermagier für Cedric

		if (Mod_CedricDabei == 1)
		&& (Mod_MiltenDabei == 1)
		&& (Mod_CedricLos == 0)
		{
			Mod_CedricLos = 1;

			B_LogEntry	(TOPIC_MOD_HQ_CREW, "Gut, mit Milten als Feuermagier sollte Cedric zufrieden sein.");
		};

		// Frauen für Bones

		if (Mod_BonesDabei == 1)
		&& ((Mod_CassiaDabei == 1)
		|| (Mod_SagittaDabei == 1))
		&& (Mod_BonesOk == 0)
		{
			B_LogEntry	(TOPIC_MOD_HQ_CREW, "Eine Frau für Bones hätte ich also schonmal ...");

			Mod_BonesOk = 1;
		};

		if (Npc_HasItems(hero, ItMi_Ornament_Heiler) == 1)
		&& (Mod_HatOrnamentHeiler == 0)
		{
			Mod_HatOrnamentHeiler = 1;

			B_LogEntry	(TOPIC_MOD_PORTAL, "Ich hab das Ornamentstück des Heilers.");
		};

		if (Npc_HasItems(hero, ItMi_Ornament_Krieger) == 1)
		&& (Mod_HatOrnamentKrieger == 0)
		{
			Mod_HatOrnamentKrieger= 1;

			B_LogEntry	(TOPIC_MOD_PORTAL, "Ich hab das Ornamentstück des Kriegers.");
		};

		if (Npc_HasItems(hero, ItMi_Ornament_Totenwaechter) == 1)
		&& (Mod_HatOrnamentTotenwaechter == 0)
		{
			Mod_HatOrnamentTotenwaechter = 1;

			B_LogEntry	(TOPIC_MOD_PORTAL, "Ich hab das Ornamentstück des Totenwächters.");
		};

		// Seelenpeiniger rechtzeitig teleportieren ;)

		if (Kapitel == 4)
		{
			if (!Npc_IsDead(Mod_13025_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13025_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13025_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13025_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_05") > 5000)
				{
					AI_Teleport	(Mod_13025_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_05");
					AI_Teleport	(Mod_13025_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_05");
				};
			};
			if (!Npc_IsDead(Mod_13026_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13026_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13026_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13026_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_05") > 5000)
				{
					AI_Teleport	(Mod_13026_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_05");
					AI_Teleport	(Mod_13026_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_05");
				};
			};
			if (!Npc_IsDead(Mod_13024_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13024_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13024_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13024_SP_Seelenpeiniger_NW, "NW_BIGFARM_FOREST_03_NAVIGATION") > 5000)
				{
					AI_Teleport	(Mod_13024_SP_Seelenpeiniger_NW, "NW_BIGFARM_FOREST_03_NAVIGATION");
					AI_Teleport	(Mod_13024_SP_Seelenpeiniger_NW, "NW_BIGFARM_FOREST_03_NAVIGATION");
				};
			};
			if (!Npc_IsDead(Mod_13022_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13022_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13022_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13022_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03") > 5000)
				{
					AI_Teleport	(Mod_13022_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03");
					AI_Teleport	(Mod_13022_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03");
				};
			};
			if (!Npc_IsDead(Mod_13023_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13023_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13023_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13023_SP_Seelenpeiniger_NW, "NW_BIGFARM_FOREST_03_NAVIGATION") > 5000)
				{
					AI_Teleport	(Mod_13023_SP_Seelenpeiniger_NW, "NW_BIGFARM_FOREST_03_NAVIGATION");
					AI_Teleport	(Mod_13023_SP_Seelenpeiniger_NW, "NW_BIGFARM_FOREST_03_NAVIGATION");
				};
			};
			if (!Npc_IsDead(Mod_13020_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13020_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13020_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13020_SP_Seelenpeiniger_NW, "NW_FARM1_CITYWALL_02_B") > 5000)
				{
					AI_Teleport	(Mod_13020_SP_Seelenpeiniger_NW, "NW_FARM1_CITYWALL_02_B");
					AI_Teleport	(Mod_13020_SP_Seelenpeiniger_NW, "NW_FARM1_CITYWALL_02_B");
				};
			};
			if (!Npc_IsDead(Mod_13019_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13019_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13019_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13019_SP_Seelenpeiniger_NW, "NW_FARM1_CITYWALL_02_B") > 5000)
				{
					AI_Teleport	(Mod_13019_SP_Seelenpeiniger_NW, "NW_FARM1_CITYWALL_02_B");
					AI_Teleport	(Mod_13019_SP_Seelenpeiniger_NW, "NW_FARM1_CITYWALL_02_B");
				};
			};
			if (!Npc_IsDead(Mod_13021_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13021_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13021_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13021_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03") > 5000)
				{
					AI_Teleport	(Mod_13021_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03");
					AI_Teleport	(Mod_13021_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03");
				};
			};
			if (!Npc_IsDead(Mod_13018_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13018_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13018_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13018_SP_Seelenpeiniger_NW, "NW_FARM1_CITYWALL_02_B") > 5000)
				{
					AI_Teleport	(Mod_13018_SP_Seelenpeiniger_NW, "NW_FARM1_CITYWALL_02_B");
					AI_Teleport	(Mod_13018_SP_Seelenpeiniger_NW, "NW_FARM1_CITYWALL_02_B");
				};
			};
			if (!Npc_IsDead(Mod_13016_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13016_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13016_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13016_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_05") > 5000)
				{
					AI_Teleport	(Mod_13016_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_05");
					AI_Teleport	(Mod_13016_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_05");
				};
			};
			if (!Npc_IsDead(Mod_13017_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13017_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13017_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13017_SP_Seelenpeiniger_NW, "NW_FARM1_CITYWALL_02_B") > 5000)
				{
					AI_Teleport	(Mod_13017_SP_Seelenpeiniger_NW, "NW_FARM1_CITYWALL_02_B");
					AI_Teleport	(Mod_13017_SP_Seelenpeiniger_NW, "NW_FARM1_CITYWALL_02_B");
				};
			};
			if (!Npc_IsDead(Mod_13013_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13013_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13013_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13013_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_04") > 5000)
				{
					AI_Teleport	(Mod_13013_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_04");
					AI_Teleport	(Mod_13013_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_04");
				};
			};
			if (!Npc_IsDead(Mod_13015_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13015_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13015_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13015_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_05") > 5000)
				{
					AI_Teleport	(Mod_13015_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_05");
					AI_Teleport	(Mod_13015_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_05");
				};
			};
			if (!Npc_IsDead(Mod_13012_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13012_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13012_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13012_SP_Seelenpeiniger_NW, "NW_BIGFARM_FOREST_03_NAVIGATION") > 5000)
				{
					AI_Teleport	(Mod_13012_SP_Seelenpeiniger_NW, "NW_BIGFARM_FOREST_03_NAVIGATION");
					AI_Teleport	(Mod_13012_SP_Seelenpeiniger_NW, "NW_BIGFARM_FOREST_03_NAVIGATION");
				};
			};
			if (!Npc_IsDead(Mod_13014_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13014_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13014_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13014_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_04") > 5000)
				{
					AI_Teleport	(Mod_13014_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_04");
					AI_Teleport	(Mod_13014_SP_Seelenpeiniger_NW, "NW_CITY_SMFOREST_04");
				};
			};
			if (!Npc_IsDead(Mod_13009_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13009_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13009_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13009_SP_Seelenpeiniger_NW, "NW_BIGFARM_FOREST_03_NAVIGATION") > 5000)
				{
					AI_Teleport	(Mod_13009_SP_Seelenpeiniger_NW, "NW_BIGFARM_FOREST_03_NAVIGATION");
					AI_Teleport	(Mod_13009_SP_Seelenpeiniger_NW, "NW_BIGFARM_FOREST_03_NAVIGATION");
				};
			};
			if (!Npc_IsDead(Mod_13007_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13007_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13007_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13007_SP_Seelenpeiniger_NW, "NW_FARM4_WOOD_MONSTER_02") > 5000)
				{
					AI_Teleport	(Mod_13007_SP_Seelenpeiniger_NW, "NW_FARM4_WOOD_MONSTER_02");
					AI_Teleport	(Mod_13007_SP_Seelenpeiniger_NW, "NW_FARM4_WOOD_MONSTER_02");
				};
			};
			if (!Npc_IsDead(Mod_13006_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13006_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13006_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13006_SP_Seelenpeiniger_NW, "NW_FARM4_WOOD_MONSTER_02") > 5000)
				{
					AI_Teleport	(Mod_13006_SP_Seelenpeiniger_NW, "NW_FARM4_WOOD_MONSTER_02");
					AI_Teleport	(Mod_13006_SP_Seelenpeiniger_NW, "NW_FARM4_WOOD_MONSTER_02");
				};
			};
			if (!Npc_IsDead(Mod_13011_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13011_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13011_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13011_SP_Seelenpeiniger_NW, "NW_BIGFARM_FOREST_03_NAVIGATION") > 5000)
				{
					AI_Teleport	(Mod_13011_SP_Seelenpeiniger_NW, "NW_BIGFARM_FOREST_03_NAVIGATION");
					AI_Teleport	(Mod_13011_SP_Seelenpeiniger_NW, "NW_BIGFARM_FOREST_03_NAVIGATION");
				};
			};
			if (!Npc_IsDead(Mod_13003_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13003_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13003_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13003_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03") > 5000)
				{
					AI_Teleport	(Mod_13003_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03");
					AI_Teleport	(Mod_13003_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03");
				};
			};
			if (!Npc_IsDead(Mod_13008_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13008_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13008_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13008_SP_Seelenpeiniger_NW, "NW_FARM4_WOOD_MONSTER_02") > 5000)
				{
					AI_Teleport	(Mod_13008_SP_Seelenpeiniger_NW, "NW_FARM4_WOOD_MONSTER_02");
					AI_Teleport	(Mod_13008_SP_Seelenpeiniger_NW, "NW_FARM4_WOOD_MONSTER_02");
				};
			};
			if (!Npc_IsDead(Mod_13004_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13004_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13004_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13004_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03") > 5000)
				{
					AI_Teleport	(Mod_13004_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03");
					AI_Teleport	(Mod_13004_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03");
				};
			};
			if (!Npc_IsDead(Mod_13005_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13005_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13005_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13005_SP_Seelenpeiniger_NW, "NW_FARM4_WOOD_MONSTER_02") > 5000)
				{
					AI_Teleport	(Mod_13005_SP_Seelenpeiniger_NW, "NW_FARM4_WOOD_MONSTER_02");
					AI_Teleport	(Mod_13005_SP_Seelenpeiniger_NW, "NW_FARM4_WOOD_MONSTER_02");
				};
			};
			if (!Npc_IsDead(Mod_13010_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13010_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13010_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13010_SP_Seelenpeiniger_NW, "NW_BIGFARM_FOREST_03_NAVIGATION") > 5000)
				{
					AI_Teleport	(Mod_13010_SP_Seelenpeiniger_NW, "NW_BIGFARM_FOREST_03_NAVIGATION");
					AI_Teleport	(Mod_13010_SP_Seelenpeiniger_NW, "NW_BIGFARM_FOREST_03_NAVIGATION");
				};
			};
			if (!Npc_IsDead(Mod_13002_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13002_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13002_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13002_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03") > 5000)
				{
					AI_Teleport	(Mod_13002_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03");
					AI_Teleport	(Mod_13002_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03");
				};
			};
			if (!Npc_IsDead(Mod_13001_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13001_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13001_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13001_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03") > 5000)
				{
					AI_Teleport	(Mod_13001_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03");
					AI_Teleport	(Mod_13001_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03");
				};
			};
			if (!Npc_IsDead(Mod_13000_SP_Seelenpeiniger_NW))
			{
				if (Wld_IsTime(06,00,20,00))
				&& (Npc_GetDistToWP(Mod_13000_SP_Seelenpeiniger_NW, "TOT") > 5000)
				{
					AI_Teleport	(Mod_13000_SP_Seelenpeiniger_NW, "TOT");
				}
				else if (Wld_IsTime(20,00,06,00))
				&& (Npc_GetDistToWP(Mod_13000_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03") > 5000)
				{
					AI_Teleport	(Mod_13000_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03");
					AI_Teleport	(Mod_13000_SP_Seelenpeiniger_NW, "NW_BIGFARM_LAKE_CAVE_03");
				};
			};
		};

		// Hero sagt was, wenn man die Notizen von Dämonisch-Zombie mitnimmt

		if (Npc_HasItems(hero, ItWr_Daemonisch) == 1)
		&& (Mod_DaemonischZettel == 0)
		{
			Mod_DaemonischZettel = 1;

			B_Say_Overlay	(hero, NULL, "$READZETTEL");
		};

		// Garond schmeißt Held und Argez immer wieder raus

		if (Mod_Garond_Rauswurf == 1)
		&& (!Npc_IsInState(Mod_500_PAL_Garond_NW, ZS_Talk))
		{
			Mod_Garond_Rauswurf = 0;

			AI_Teleport	(PC_Friend_NW,	"NW_FARM1_PATH_CITY_SHEEP_05");
			AI_Teleport	(hero,	"NW_FARM1_PATH_CITY_SHEEP_05");
			AI_Teleport	(PC_Friend_NW,	"NW_FARM1_PATH_CITY_SHEEP_05");
		};

		// Nach einem Tag pennen soll Argez TA wechseln und quatschen

		if (Mod_Argez == 0)
		{
			if (Npc_KnowsInfo(hero, Info_Mod_Argez_NW_InCity))
			&& (Mod_Argez_Day < Wld_GetDay())
			{
				Mod_Argez = 1;

				B_StartOtherRoutine	(PC_Friend_NW, "START");
			};
		};

		// Vision von Argez' Zombie-Kill

		if (Mod_Argez == 1)
		{
			if (Npc_GetDistToWP(hero, "WP_SEQUENZ_ARGEZ") < 500)
			&& (Mod_AnomalieAmulett == 1)
			{
				Mod_Argez = 2;

				B_LogEntry	(TOPIC_MOD_DUNKLEMAGIE, "Die Vision hat Argez gezeigt, als er seinen ungeplanten Zauber ausstieß. Ungeplant? Oder spielt er die ganze Zeit über nur mit uns?");

				PlayVideo ("Xeres\XR_ArgezVision.bik");
			};
		};

		// Argez zu Hero teleportieren, wenn zu weit weg

		if (Npc_KnowsInfo(hero, Info_Mod_Argez_NW_LosZuSaturas))
		&& (!Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Argez3))
		{
			if (Npc_GetDistToNpc(PC_Friend_NW, hero) > 2500)
			{
				AI_Teleport	(PC_Friend_NW, "PC_HERO");
			};
		};

		// Saturas plaudert mit Argez

		if (Mod_Argez == 2)
		&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Argez3))
		&& (!Npc_IsInState(Mod_774_KDW_Saturas_NW, ZS_Talk))
		{
			Mod_Argez = 3;

			Wld_SendTrigger	("EVT_CAMERA_SATURASARGEZ");

			CutsceneAn = TRUE;
		};

		if (Mod_Argez == 3)
		{
			if (Mod_Argez_Counter == 2)
			{
				AI_TurnToNpc	(PC_Friend_NW, Mod_774_KDW_Saturas_NW);
				AI_TurnToNpc	(Mod_774_KDW_Saturas_NW, PC_Friend_NW);

				AI_Output(Mod_774_KDW_Saturas_NW, NULL, "Info_Mod_ArgezSaturas_14_00"); //Du musst Argez sein, der Mann ohne Vergangenheit.
			};
			if (Mod_Argez_Counter == 2)
			{
				AI_Output(PC_Friend_NW, NULL, "Info_Mod_ArgezSaturas_37_01"); //Und Ihr müsst Saturas sein, Meister der Magie.
			};
			if (Mod_Argez_Counter == 7)
			{
				AI_Output(Mod_774_KDW_Saturas_NW, NULL, "Info_Mod_ArgezSaturas_14_02"); //Jedoch ist dieser Meister nicht zu dem imstande, was du geleistet hast.
			};
			if (Mod_Argez_Counter == 12)
			{
				AI_Output(Mod_774_KDW_Saturas_NW, NULL, "Info_Mod_ArgezSaturas_14_03"); //Mich würde interessieren, wie man in den Besitz dieser Kräfte gelangt.
			};
			if (Mod_Argez_Counter == 17)
			{
				AI_Output(PC_Friend_NW, NULL, "Info_Mod_ArgezSaturas_37_04"); //Das ist auch für mich ein Mysterium. Wenn ich sie Euch lehren könnte, würde ich es sofort tun.
			};
			if (Mod_Argez_Counter == 22)
			{
				AI_Output(Mod_774_KDW_Saturas_NW, NULL, "Info_Mod_ArgezSaturas_14_05"); //Du missverstehst mich. Ich will nicht selbst über diese Kräfte gebieten.
			};
			if (Mod_Argez_Counter == 27)
			{
				AI_Output(Mod_774_KDW_Saturas_NW, NULL, "Info_Mod_ArgezSaturas_14_06"); //Ich sehe bloß einen groben Verstoß gegen das göttliche Gleichgewicht und will dies in Zukunft verhindern.
			};
			if (Mod_Argez_Counter == 32)
			{
				AI_Output(PC_Friend_NW, NULL, "Info_Mod_ArgezSaturas_37_07"); //Inwiefern habe ich gegen das Gleichgewicht verstoßen?
			};
			if (Mod_Argez_Counter == 37)
			{
				AI_Output(Mod_774_KDW_Saturas_NW, NULL, "Info_Mod_ArgezSaturas_14_08"); //Dein Spruch war ein primitiver, aber mächtiger Beliarzauber. Er hätte einen Großteil unserer Zauberer auf der Stelle kampfunfähig gemacht.
			};
			if (Mod_Argez_Counter == 42)
			{
				AI_Output(PC_Friend_NW, NULL, "Info_Mod_ArgezSaturas_37_09"); //Ich kann nur versuchen, es in Zukunft nicht noch einmal so weit kommen zu lassen.
			};
			if (Mod_Argez_Counter == 47)
			{
				AI_Output(PC_Friend_NW, NULL, "Info_Mod_ArgezSaturas_37_10"); //Ich versichere Euch, es stand nicht in meiner Absicht, zu einer Bedrohung zu werden.
			};
			if (Mod_Argez_Counter == 52)
			{
				AI_Output(Mod_774_KDW_Saturas_NW, NULL, "Info_Mod_ArgezSaturas_14_11"); //Und doch wirst du es bleiben, bis deine Vergangenheit entschlüsselt ist.
			};
			if (Mod_Argez_Counter == 57)
			{
				AI_Output(PC_Friend_NW, NULL, "Info_Mod_ArgezSaturas_37_12"); //Mit Eurer Erlaubnis, Meister, werde ich so lange in diesem Tempel helfen. Ich habe das unbestimmte Gefühl, ihn schon mal gesehen zu haben.
			};
			if (Mod_Argez_Counter == 62)
			{
				AI_Output(PC_Friend_NW, NULL, "Info_Mod_ArgezSaturas_37_13"); //Vielleicht finde ich hier Hinweise auf mein altes Leben.
			};
			if (Mod_Argez_Counter == 67)
			{
				AI_Output(Mod_774_KDW_Saturas_NW, NULL, "Info_Mod_ArgezSaturas_14_14"); //Das kommt meinen Vorstellungen entgegen.
			};
			if (Mod_Argez_Counter == 72)
			{
				AI_Output(PC_Friend_NW, NULL, "Info_Mod_ArgezSaturas_37_15"); //(hintergründig) Kann ich mir vorstellen ...
			};
			if (Mod_Argez_Counter == 77)
			{
				Mod_Argez = 4;

				CutsceneAn = FALSE;

				B_StartOtherRoutine	(Mod_774_KDW_Saturas_NW, "SMALLTALK");
				B_StartOtherRoutine	(PC_Friend_NW, "SMALLTALK");
			};

			Mod_Argez_Counter += 1;
		};

		// Am Ende sind nochmal alle Freunde bei Xardas

		if (Mod_Xardas_Ende == 0)
		{
			if (Wld_GetDay() > Mod_Xardas_Uriziel_Day)
			&& (Npc_KnowsInfo(hero, Info_Mod_Xardas_GDG_Uriziel))
			{
				Mod_Xardas_Ende = 1;

				B_StartOtherRoutine	(Mod_513_DMB_Xardas_NW, "START");
				B_StartOtherRoutine	(Mod_592_PAL_Hagen_NW, "START");
				B_StartOtherRoutine	(Mod_527_SLD_Torlof_NW, "START");
				B_StartOtherRoutine	(Mod_674_SLD_Lee_NW, "START");
				B_StartOtherRoutine	(Mod_551_KDF_Pyrokar_NW, "START");
				B_StartOtherRoutine	(Mod_774_KDW_Saturas_NW, "START");
				B_StartOtherRoutine	(Mod_553_KDF_Ulthar_NW, "START");
				B_StartOtherRoutine	(Mod_524_KDW_Vatras_NW, "START");
				B_StartOtherRoutine	(Mod_552_KDF_Serpentes_NW, "START");

				B_StartOtherRoutine	(Mod_533_SLD_Gorn_NW, "ATXARDAS");
				B_StartOtherRoutine	(Mod_557_PSINOV_Lester_NW, "ATXARDAS");
				B_StartOtherRoutine	(Mod_538_RDW_Diego_NW, "ATXARDAS");
				B_StartOtherRoutine	(Mod_534_KDF_Milten_NW, "ATXARDAS");
			};
		};

		if (Mod_XW_Kap6 == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Diego_Kap6_2))
		&& (!Npc_IsInState(Mod_538_RDW_Diego_NW, ZS_Talk))
		{
			B_SetLevelchange ("Bonne\Xeres_Endlevel.zen", "ARENA_01");

			AI_Teleport	(hero, "OBELISKSCHREIN_WP");

			Mod_XW_Kap6 = 1;
		};
	};

	// Tagebucheinträge, wenn man Ornamentstücke gefunden hat

	if (CurrentLevel == RELENDEL_ZEN)
	{
		if (Npc_HasItems(hero, ItMi_Ornament_Priester) == 1)
		&& (Mod_HatOrnamentPriester == 0)
		{
			Mod_HatOrnamentPriester = 1;

			B_LogEntry	(TOPIC_MOD_PORTAL, "Ich hab das Ornamentstück des Priesters.");
		};
	};

	if (CurrentLevel == ORCTEMPEL_ZEN)
	{
		// Tagebucheintrag, wenn man das Bruchstück von Uriziel vom Schamanen hat

		if (Npc_HasItems(hero, ItMi_UrizielKaputt) == 1)
		&& (Mod_HasUrizielKaputt == 0)
		{
			Mod_HasUrizielKaputt = 1;

			B_LogEntry	(TOPIC_MOD_URIZIEL, "Verdammt, Uriziel ist tatsächlich zerstört. Was Xardas wohl dazu sagen wird? Hmm, aber was meinte der Schamane mit der Macht der drei Götter?");
		};

		// Anfangsmonolog, wenn Dokument von Xardas gelesen und Teleport nicht funzt

		if (XardasLetterForHeroOT == TRUE)
		&& (TooLessMana == 1)
		{
			OTTeleportScene();
		};
	};

	if (CurrentLevel == DRAGONISLAND_ZEN)
	{
		// Randolph wird nach Gespräch Halbinfernalischer

		if (Npc_KnowsInfo(hero, Info_Mod_Randolph_IR_Hi))
		&& (!Npc_IsInState(Mod_7527_BAU_Randolph_IR, ZS_Talk))
		&& (Mod_RandolphIR_Demon == 0)
		{
			Mod_RandolphIR_Demon = 1;

			B_SetNpcVisual 		(Mod_7527_BAU_Randolph_IR, MALE, "Hum_Head_Bald", 206, 17, ItAr_Bau_L);
		};

		// Irdoraths neue Sachen

		// Schalter am Anfang

		if (Npc_GetDistToWP(hero, "DI_ORKAREA_20") < 600)
		&& (Mod_IR_HebelProb == 0)
		{
			B_Say_Overlay	(hero, NULL, "$IRDORATHNOWAY");

			Mod_IR_HebelProb = 1;
		};

		// Wenn Held nicht mehr im Gespräch und Hebelmann bereit => kleine Sequenz zum Öffnen

		if (Mod_IR_Hebel == 1)
		&& (Mod_SaveOther == 0)
		{
			Mod_IR_Hebel = 2;

			AI_GotoWP(hero, "DI_ORKAREA_18");
			AI_GotoWP(Mod_IR_Hebelmann, "DI_ORKAREA_25");

			Wld_SendTrigger	("EVT_HEBELCAM");

			CutsceneAn = TRUE;
		};

		if (Mod_IR_Hebel == 2)
		{
			Mod_IR_HebelCounter += 1;

			if (Mod_IR_HebelCounter == 3)
			{
				AI_UseMob (hero, "SWITCH", 1);
				AI_UseMob (Mod_IR_Hebelmann, "SWITCH", 1);
			};

			if (Mod_IR_HebelCounter == 4)
			{
				Mod_IR_Hebel = 3;

				CutsceneAn = FALSE;

				Wld_SendTrigger	("ISLE_INVISIBLEWALL_01");

				Wld_InsertNpc	(Monster_11053_Demonlord_IR, "DI_ORKOBERST");
			};
		};

		// Bei der Brücke bleiben die Gefährten zurück

		if (Npc_GetDistToWP(hero, "DI_DRACONIANAREA_17") < 500)
		{
			if (Mod_IR_Randolph == 1)
			{
				Mod_IR_Randolph = 2;

				B_StartOtherRoutine	(Mod_7527_BAU_Randolph_IR, "WAITING");
			};
			if (Mod_IR_Diego == 1)
			{
				Mod_IR_Diego = 2;

				B_StartOtherRoutine	(Mod_7442_RDW_Diego_IR, "WAITING");
			};
			if (Mod_IR_Ethan == 1)
			{
				Mod_IR_Ethan = 2;

				B_StartOtherRoutine	(Mod_7450_HTR_Ethan_IR, "WAITING");
			};
			if (Mod_IR_Milten == 1)
			{
				Mod_IR_Milten = 2;

				B_StartOtherRoutine	(Mod_7443_KDF_Milten_IR, "WAITING");
			};
			if (Mod_IR_Gorn == 1)
			{
				Mod_IR_Gorn = 2;

				B_StartOtherRoutine	(Mod_7444_SLD_Gorn_IR, "WAITING");
			};
			if (Mod_IR_Lester == 1)
			{
				Mod_IR_Lester = 2;

				B_StartOtherRoutine	(Mod_7445_PSINOV_Lester_IR, "WAITING");
			};
			if (Mod_IR_Myxir == 1)
			{
				Mod_IR_Myxir = 2;

				B_StartOtherRoutine	(Mod_7448_KDS_Myxir_IR, "WAITING");
			};
			if (Mod_IR_Tengron == 1)
			{
				Mod_IR_Tengron = 2;

				B_StartOtherRoutine	(Mod_7451_RIT_Tengron_IR, "WAITING");
			};
			if (Mod_IR_Cord == 1)
			{
				Mod_IR_Cord = 2;

				B_StartOtherRoutine	(Mod_7452_SLD_Cord_IR, "WAITING");
			};
			if (Mod_IR_Angar == 1)
			{
				Mod_IR_Angar = 2;

				B_StartOtherRoutine	(Mod_7455_TPL_Angar_IR, "WAITING");
			};
			if (Mod_IR_Uriela == 1)
			{
				Mod_IR_Uriela = 2;

				B_StartOtherRoutine	(Mod_7467_HEX_Uriela_IR, "WAITING");
			};
			if (Mod_IR_Cassia == 1)
			{
				Mod_IR_Cassia = 2;

				B_StartOtherRoutine	(Mod_7465_NONE_Cassia_IR, "WAITING");
			};
			if (Mod_IR_Velaya == 1)
			{
				Mod_IR_Velaya = 2;

				B_StartOtherRoutine	(Mod_7468_BAU_Velaya_IR, "WAITING");
			};
			if (Mod_IR_Keroloth == 1)
			{
				Mod_IR_Keroloth = 2;

				B_StartOtherRoutine	(Mod_7463_RIT_Keroloth_IR, "WAITING");
			};
			if (Mod_IR_Marcos == 1)
			{
				Mod_IR_Marcos = 2;

				B_StartOtherRoutine	(Mod_7461_RIT_Marcos_IR, "WAITING");
			};
			if (Mod_IR_Gerold == 1)
			{
				Mod_IR_Gerold = 2;

				B_StartOtherRoutine	(Mod_7462_RIT_Gerold_IR, "WAITING");
			};
		};

		// Brücke wieder einfahren

		if (Npc_GetDistToWP(hero, "DI_DRACONIANAREA_21") < 1800)
		&& (Mod_IR_Bridge == 0)
		{
			Mod_IR_Bridge = 1;

			Wld_SendTrigger	("ISLE_BIGBRIDGE_01");
		};

		// Unterstützung der Magier

		if (Npc_GetDistToWP(hero, "DI_DRACONIANAREA_21") < 300)
		&& (Mod_IR_Bridge == 1)
		{
			Mod_IR_Bridge = 2;

			Wld_InsertItem	(ItMi_MagierBeutel_IR, "FP_ITEM_MAGIERKRAM");

			Wld_SendTrigger	("EVT_MAGIERKRAM_IRRLICHT");
			Wld_SendTrigger	("EVT_IRRLICHT_PFX");

			Snd_Play	("IRDORATHMAGIERVOICE");
		};

		if (Mod_IR_Bridge == 2)
		{
			Mod_IR_BridgeCounter += 1;

			if (Mod_IR_BridgeCounter == 10)
			{
				Mod_IR_Bridge = 3;

				Wld_SendUnTrigger	("EVT_IRRLICHT_PFX");
			
				if (Mod_IR_Randolph == 2)
				{
					Mod_IR_Randolph = 0;

					B_StartOtherRoutine	(Mod_7527_BAU_Randolph_IR, "START");
				};
				if (Mod_IR_Diego == 2)
				{
					Mod_IR_Diego = 0;

					B_StartOtherRoutine	(Mod_7442_RDW_Diego_IR, "START");
				};
				if (Mod_IR_Ethan == 2)
				{
					Mod_IR_Ethan = 0;

					B_StartOtherRoutine	(Mod_7450_HTR_Ethan_IR, "START");
				};
				if (Mod_IR_Milten == 2)
				{
					Mod_IR_Milten = 3;

					B_StartOtherRoutine	(Mod_7443_KDF_Milten_IR, "START");
				};
				if (Mod_IR_Gorn == 2)
				{
					Mod_IR_Gorn = 0;

					B_StartOtherRoutine	(Mod_7444_SLD_Gorn_IR, "START");
				};
				if (Mod_IR_Lester == 2)
				{
					Mod_IR_Lester = 0;

					B_StartOtherRoutine	(Mod_7445_PSINOV_Lester_IR, "START");
				};
				if (Mod_IR_Myxir == 2)
				{
					Mod_IR_Myxir = 0;

					B_StartOtherRoutine	(Mod_7448_KDS_Myxir_IR, "START");
				};
				if (Mod_IR_Tengron == 2)
				{
					Mod_IR_Tengron = 0;

					B_StartOtherRoutine	(Mod_7451_RIT_Tengron_IR, "START");
				};
				if (Mod_IR_Cord == 2)
				{
					Mod_IR_Cord = 0;

					B_StartOtherRoutine	(Mod_7452_SLD_Cord_IR, "START");
				};
				if (Mod_IR_Angar == 2)
				{
					Mod_IR_Angar = 0;

					B_StartOtherRoutine	(Mod_7455_TPL_Angar_IR, "START");
				};
				if (Mod_IR_Uriela == 2)
				{
					Mod_IR_Uriela = 0;

					B_StartOtherRoutine	(Mod_7467_HEX_Uriela_IR, "START");
				};
				if (Mod_IR_Cassia == 2)
				{
					Mod_IR_Cassia = 0;

					B_StartOtherRoutine	(Mod_7465_NONE_Cassia_IR, "START");
				};
				if (Mod_IR_Velaya == 2)
				{
					Mod_IR_Velaya = 0;

					B_StartOtherRoutine	(Mod_7468_BAU_Velaya_IR, "START");
				};
				if (Mod_IR_Keroloth == 2)
				{
					Mod_IR_Keroloth = 0;

					B_StartOtherRoutine	(Mod_7463_RIT_Keroloth_IR, "START");
				};
				if (Mod_IR_Marcos == 2)
				{
					Mod_IR_Marcos = 0;

					B_StartOtherRoutine	(Mod_7461_RIT_Marcos_IR, "START");
				};
				if (Mod_IR_Gerold == 2)
				{
					Mod_IR_Gerold = 0;

					B_StartOtherRoutine	(Mod_7462_RIT_Gerold_IR, "START");
				};

				if (Mod_JackDabei > 0)
				{
					B_StartOtherRoutine	(Mod_7458_NONE_Jack_IR, "WAITING");
				};
				if (Mod_CedricDabei > 0)
				{
					B_StartOtherRoutine	(Mod_7460_RIT_Cedric_IR, "WAITING");
				};
			};
		};

		// Wenn Drache tot ist, dann Brücke wieder ausfahren

		if (Npc_IsDead(Dragon_Undead))
		&& (Mod_IR_Bridge == 3)
		{
			Mod_IR_Bridge = 4;

			Wld_SendTrigger	("ISLE_BIGBRIDGE_01");

			B_StartOtherRoutine	(PC_Friend_IR, "WAITING");

			Mod_IR_Argez = 2;
		};

		// Argez ist auf dem Schiff

		if (Mod_IR_Dabei > 0)
		&& (Mod_IR_Argez == 0)
		{
			Mod_IR_Argez = 1;

			if (Mod_JackDabei == 2)
			{
				AI_Teleport	(Mod_7458_NONE_Jack_IR, "SHIP_CONNECT_LAND_01");
				B_StartOtherRoutine	(Mod_7458_NONE_Jack_IR, "WAITING");
			};
		};
	};

	if (CurrentLevel == GDG_WORLD_ZEN)
	{
		if (Mod_GDG_Plattform == 0)
		{
			AI_StandUp	(hero);

			AI_Output(hero, NULL, "Info_Mod_Hero_GDG_Plattform_15_00"); //Was für ein Glück, da ist ja schon die Plattform. Aber wo ist der dazugehörige Sockel? Mist.

			B_LogEntry	(TOPIC_MOD_URIZIEL, "Na super. Zwar war die Plattform gleich in der Nähe, aber leider fehlt der Sockel. Ich werde mich also umschauen müssen.");

			Mod_GDG_Plattform = 1;
		};
	};

	if (CurrentLevel == XERESWELT_ZEN)
	{
		if (Mod_XW_Startscene == 1)
		{
			XW_Startscene();
		};

		if (Mod_XW_Startscene == 0)
		{
			Mod_XW_Startscene = 1;
		};

		if (!Npc_IsInState(Schattenlord_998_Urnol, ZS_Talk))
		&& (!Npc_IsInState(PC_Friend_XW, ZS_Talk))
		&& (Mod_XW_Startscene == 3)
		{
			Mod_XW_Startscene = 4;

			Npc_SendSinglePerc	(hero, PC_Friend_XW, PERC_ASSESSTALK);
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Urnol_XW_Hi))
		&& (!Npc_IsInState(Schattenlord_998_Urnol, ZS_Talk))
		&& (Mod_XW_Startscene == 2)
		{
			Mod_XW_Startscene = 3;

			AI_Teleport	(hero, "KNAST_02");
		};

		if (!Npc_IsInState(Monster_11074_Leprechaun_XW, ZS_Talk))
		&& (!Npc_IsInState(PC_Friend_XW, ZS_Talk))
		&& (Npc_KnowsInfo(hero, Info_Mod_Argez_XW_Gefangen))
		&& (Mod_XW_Startscene == 4)
		{
			Mod_XW_Startscene = 5;

			Npc_SendSinglePerc	(hero, Monster_11074_Leprechaun_XW, PERC_ASSESSTALK);
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Leprechaun_XW_Hi))
		&& (!Npc_IsInState(Monster_11074_Leprechaun_XW, ZS_Talk))
		&& (Mod_XW_Startscene == 5)
		{
			Mod_XW_Startscene = 6;

			Wld_InsertItem	(ItKe_XeresKnast, "FP_ITEM_XERESKNAST");
		};

		if (Mod_XW_Kap6 == 2)
		{
			XW_Kap6_Scene01();
		};

		if (Mod_XW_Kap6 == 3)
		&& (Npc_IsDead(Hauertroll_XW_01))
		&& (Npc_IsDead(Shadowbeast_XW_01))
		{
			XW_Kap6_Scene02();
		};

		if (Mod_XW_Kap6 == 4)
		{
			if (Npc_IsDead(Hauertroll_XW_02))
			&& (Npc_IsDead(Shadowbeast_XW_02))
			&& (Npc_IsDead(Shadowbeast_XW_03))
			&& (Npc_IsDead(Schattenwark_XW_01))
			&& (Npc_IsDead(Schattenwark_XW_02))
			&& (Npc_IsDead(Schattenwark_XW_03))
			&& (Npc_IsDead(Schattenwark_XW_04))
			&& (Npc_IsDead(Schattenwark_XW_05))
			&& (Npc_IsDead(Schattenwark_XW_06))
			&& (Npc_IsDead(Dragonsnapper_XW_01))
			&& (Npc_IsDead(Dragonsnapper_XW_02))
			&& (Npc_IsDead(Dragonsnapper_XW_03))
			&& (Npc_IsDead(Dragonsnapper_XW_04))
			&& (Npc_IsDead(Dragonsnapper_XW_05))
			&& (Npc_IsDead(Riesenspinne_XW_01))
			{
				Mod_XW_Kap6 = 5;

				Wld_InsertNpc	(Hauertroll_XW_03, "ARENA_05");
				Wld_InsertNpc	(Hauertroll_XW_04, "ARENA_04");
				Wld_InsertNpc	(Schattenwark_XW_07, "ARENA_26");
				Wld_InsertNpc	(Schattenwark_XW_08, "ARENA_27");
				Wld_InsertNpc	(Schattenwark_XW_09, "ARENA_05");
				Wld_InsertNpc	(Schattenwark_XW_10, "ARENA_04");
				Wld_InsertNpc	(Schattenwark_XW_11, "ARENA_26");
				Wld_InsertNpc	(Schattenwark_XW_12, "ARENA_27");
				Wld_InsertNpc	(Dragonsnapper_XW_06, "ARENA_05");
				Wld_InsertNpc	(Dragonsnapper_XW_07, "ARENA_04");
				Wld_InsertNpc	(Dragonsnapper_XW_08, "ARENA_26");
				Wld_InsertNpc	(Dragonsnapper_XW_09, "ARENA_27");
				Wld_InsertNpc	(Dragonsnapper_XW_10, "ARENA_05");
				Wld_InsertNpc	(Riesenspinne_XW_02, "ARENA_04");
				Wld_InsertNpc	(Riesenspinne_XW_03, "ARENA_26");
				Wld_InsertNpc	(Riesenspinne_XW_04, "ARENA_27");
			};
		};

		if (Mod_XW_Kap6 == 5)
		{
			if (Npc_IsDead(Hauertroll_XW_03))
			&& (Npc_IsDead(Hauertroll_XW_04))
			&& (Npc_IsDead(Schattenwark_XW_07))
			&& (Npc_IsDead(Schattenwark_XW_08))
			&& (Npc_IsDead(Schattenwark_XW_09))
			&& (Npc_IsDead(Schattenwark_XW_10))
			&& (Npc_IsDead(Schattenwark_XW_11))
			&& (Npc_IsDead(Schattenwark_XW_12))
			&& (Npc_IsDead(Dragonsnapper_XW_06))
			&& (Npc_IsDead(Dragonsnapper_XW_07))
			&& (Npc_IsDead(Dragonsnapper_XW_08))
			&& (Npc_IsDead(Dragonsnapper_XW_09))
			&& (Npc_IsDead(Dragonsnapper_XW_10))
			&& (Npc_IsDead(Riesenspinne_XW_02))
			&& (Npc_IsDead(Riesenspinne_XW_03))
			&& (Npc_IsDead(Riesenspinne_XW_04))
			{
				XW_Kap6_Scene03();
			};
		};

		if (Mod_XW_Kap6 == 6)
		{
			if (Npc_KnowsInfo(hero, Info_Mod_Xeres_XW_Hi))
			&& (!Npc_IsInState(Xeres_02, ZS_Talk))
			{
				XW_Kap6_Scene04();
			};
		};

		if (Mod_XW_Kap6 == 7)
		{
			if (Npc_KnowsInfo(hero, Info_Mod_Xeres_XW_LesterTot))
			&& (!Npc_IsInState(Xeres_02, ZS_Talk))
			{
				XW_Kap6_Scene05();
			};
		};

		if (Mod_XW_Kap6 == 8)
		{
			if (Mod_Xeres_Geister_Tot == 20)
			{
				XW_Kap6_Scene06();
			};
		};

		if (Mod_XW_Kap6 == 10)
		{
			XW_Kap6_Scene07();
		};

		if (Mod_XW_Kap6 == 11)
		{
			if (Npc_IsDead(Mod_7765_SLD_Gorn_XW))
			{
				XW_Kap6_Scene08();
			};
		};
	};
	
	if (Npc_HasItems(hero, ItAt_SoulStone_Urnol) && Mod_Seelenstein_Urnol == FALSE) {
		Mod_Seelenstein_Urnol = TRUE;
		Spine_UpdateAchievementProgress(SPINE_ACHIEVEMENT_22, Mod_Seelenstein_Urnol + Mod_Seelenstein_Formwandler + Mod_Seelenstein_UD);
	};
	
	if (Npc_HasItems(hero, ItAt_SoulStone_Formwandler) && Mod_Seelenstein_Formwandler == FALSE) {
		Mod_Seelenstein_Formwandler = TRUE;
		Spine_UpdateAchievementProgress(SPINE_ACHIEVEMENT_22, Mod_Seelenstein_Urnol + Mod_Seelenstein_Formwandler + Mod_Seelenstein_UD);
	};
	
	if (Npc_HasItems(hero, ItAt_SoulStone_UD) && Mod_Seelenstein_UD == FALSE) {
		Mod_Seelenstein_UD = TRUE;
		Spine_UpdateAchievementProgress(SPINE_ACHIEVEMENT_22, Mod_Seelenstein_Urnol + Mod_Seelenstein_Formwandler + Mod_Seelenstein_UD);
	};
	
	if (Mod_Seelenstein_Complete == FALSE) {
		if (Mod_Seelenstein_Urnol && Mod_Seelenstein_Formwandler && Mod_Seelenstein_UD) {
			Mod_Seelenstein_Complete = TRUE;
			
			B_LogEntry(TOPIC_MOD_URIZIEL, "Ich habe alle Seelensteine gefunden. Jetzt sollte ich wohl mit Trimedron sprechen...");
		};
	};
};