var int Mod_Moorhexe_Hint;

FUNC VOID GILDENSTORY_NL ()
{
	// NL-Story

	if (CurrentLevel == MINENTAL_ZEN)
	{
		// Training bei Patrick

		if (Npc_KnowsInfo(hero, Info_Mod_Patrick_SindAlleDa))
		&& (Mod_SLD_Shrike == 1)
		&& (Npc_GetDistToWP(hero, "NC_TAVERN_BAR") < 400)
		{
			Mod_SLD_Shrike = 2;

			B_LogEntry	(TOPIC_MOD_SLD_PATRICK, "Verdammt, wo ist Shrike? Jetzt darf ich noch mal zu Patrick laufen.");
		};

		// Jagd mit Fester

		if (Npc_KnowsInfo(hero, Info_Mod_Fester_GobbosTot))
		&& (Npc_GetDistToWP(Mod_784_SLD_Fester_MT, "LOCATION_23_CAVE_1_02") < 300)
		&& (Mod_SLD_Fester == 1)
		{
			Mod_SLD_FesterPotion += 1;

			if (Mod_SLD_FesterPotion == 40)
			{
				Mod_SLD_Fester = 2;
			};
		};

		// Spionieren im Alten Lager

		if (Mod_SLD_Spy == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Ian_SLDSpy))
		&& (Npc_KnowsInfo(hero, Info_Mod_Fisk_SLDSpy))
		&& ((Npc_KnowsInfo(hero, Info_Mod_Fingers_SLDSpy))
		|| (Npc_KnowsInfo(hero, Info_Mod_Sly_SLDSpy)))
		{
			AI_StandUP	(hero);

			AI_Output(hero, NULL, "Info_Mod_Hero_SLDSpy_15_00"); //Das sollte an Informationen reichen.

			B_LogEntry	(TOPIC_MOD_SLD_SPY, "Ok, das ergibt schon ein klares Bild und sollte reichen. Jetzt sollte ich alsbald Bericht erstatten.");

			Mod_SLD_Spy = 1;
		};

		if (Mod_SLD_Spy == 2)
		&& (!Npc_KnowsInfo(hero, Info_Mod_Lee_SchlachtDa))
		{
			if ((Mod_SLD_KampfDay+1 == Wld_GetDay())
			&& (Wld_IsTime(08,00,24,00)))
			|| (Mod_SLD_KampfDay+1 < Wld_GetDay())
			{
				Mod_SLD_Spy = 3;
			};
		};

		// Frauenraub

		if ((((Mod_SLD_Velaya == 2)
		|| (Mod_SLD_Velaya == 1))
		&& (Npc_GetDistToNpc(hero, Mod_1621_EBR_Velaya_MT)  > 5000))
		|| (Npc_IsDead(Mod_1621_EBR_Velaya_MT)))
		&& (Npc_KnowsInfo(hero, Info_Mod_Velaya_AusLager))
		{
			Mod_SLD_Velaya = 4;

			B_RemoveNpc	(Mod_1621_EBR_Velaya_MT);
		};

		// Aufnahme Orkjäger

		if (Mod_SLD_Wettstreit == 1)
		&& (Npc_HasItems(hero, ItKe_Wettstreit) == 1)
		{
			Mod_SLD_Wettstreit = 2;

			B_StartOtherRoutine	(Mod_796_SLD_Sentenza_MT, "WETTSTREIT");
			B_StartOtherRoutine	(Mod_797_SLD_Sylvio_MT, "WETTSTREIT");
			B_StartOtherRoutine	(Mod_10000_Orc_Tarrok_MT, "ANFELSENFESTUNG");

			CreateInvItems	(Mod_797_SLD_Sylvio_MT, ItWr_Map_Wettstreit_02, 1);

			B_KillNpc	(Mod_796_SLD_Sentenza_MT);

			B_LogEntry	(TOPIC_MOD_SLD_ORKJAEGER, "Das muss der Schlüssel sein. Tja, der Söldner hat es nicht ganz geschafft den Schlüssel zu seinem Bestimmungsort zu bringen.");
		};

		if (Mod_SLD_Wettstreit == 2)
		&& (Npc_HasItems(hero, ItMi_LeePipe) == 1)
		{
			Mod_SLD_Wettstreit = 3;

			B_LogEntry	(TOPIC_MOD_SLD_ORKJAEGER, "So, das muss wohl der gesamte Inhalt der Truhe gewesen. Jetzt zu Lee damit.");
		};

		// Ein Ort ewiger Ruhe

		if (Npc_KnowsInfo(hero, Info_Mod_UndeadOrkShamane_Hi))
		&& (Mod_NL_UOS_Day < Wld_GetDay())
		&& (Mod_NL_UOS == 0)
		{
			Mod_NL_UOS = 1;

			// Direkt vor dem Eingang

			Wld_InsertNpc	(Mod_7245_SLD_Orkjaeger_MT,	"OW_PATH_198_ORCGRAVEYARD8");
			Wld_InsertNpc	(Mod_7246_SLD_Orkjaeger_MT,	"OW_PATH_198_ORCGRAVEYARD8");
			Wld_InsertNpc	(Mod_7247_SLD_Orkjaeger_MT,	"OW_PATH_198_ORCGRAVEYARD8");
			Wld_InsertNpc	(Mod_7248_SLD_Orkjaeger_MT,	"OW_PATH_198_ORCGRAVEYARD8");
			Wld_InsertNpc	(Mod_7249_SLD_Orkjaeger_MT,	"OW_PATH_198_ORCGRAVEYARD8");

			B_StartOtherRoutine	(Mod_795_SLD_Rod_MT,	"OGY");

			// Etwas weiter vorne Richtung Beisser

			Wld_InsertNpc	(Mod_7250_SLD_Orkjaeger_MT,	"OW_PATH_198_ORCGRAVEYARD6");
			Wld_InsertNpc	(Mod_7251_SLD_Orkjaeger_MT,	"OW_PATH_198_ORCGRAVEYARD6");
			Wld_InsertNpc	(Mod_7252_SLD_Orkjaeger_MT,	"OW_PATH_198_ORCGRAVEYARD6");
			Wld_InsertNpc	(Mod_7253_TPL_Templer_MT,	"OW_PATH_198_ORCGRAVEYARD6");
			Wld_InsertNpc	(Mod_7254_TPL_Templer_MT,	"OW_PATH_198_ORCGRAVEYARD6");
			Wld_InsertNpc	(Mod_7255_TPL_Templer_MT,	"OW_PATH_198_ORCGRAVEYARD6");
			Wld_InsertNpc	(Mod_7256_TPL_Templer_MT,	"OW_PATH_198_ORCGRAVEYARD6");
			Wld_InsertNpc	(Mod_7257_TPL_Templer_MT,	"OW_PATH_198_ORCGRAVEYARD6");
		};

		if (Mod_NL_UOS == 1)
		&& (Npc_KnowsInfo(hero, Info_Mod_Lee_Orkfriedhof))
		&& (Mod_Gilde == 19)
		{
			Mod_NL_UOS = 2;

			Wld_SendTrigger	("EVT_ORCGRAVYARD_MOVER_01");

			B_RemoveNpc	(Mod_7247_SLD_Orkjaeger_MT);
			B_RemoveNpc	(Mod_7248_SLD_Orkjaeger_MT);
			B_RemoveNpc	(Mod_7249_SLD_Orkjaeger_MT);
			B_RemoveNpc	(Mod_7250_SLD_Orkjaeger_MT);
			B_RemoveNpc	(Mod_7251_SLD_Orkjaeger_MT);
			B_RemoveNpc	(Mod_7252_SLD_Orkjaeger_MT);
			B_RemoveNpc	(Mod_795_SLD_Rod_MT);
			B_RemoveNpc	(Mod_7253_TPL_Templer_MT);
			B_RemoveNpc	(Mod_7254_TPL_Templer_MT);
			B_RemoveNpc	(Mod_7255_TPL_Templer_MT);
			B_RemoveNpc	(Mod_7256_TPL_Templer_MT);
			B_RemoveNpc	(Mod_7257_TPL_Templer_MT);
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Orkjaeger_MT_GetZombie_Hi))
		&& (Mod_NL_ZombieVerwandlung == 0)
		&& (!Npc_IsInState(Mod_7245_SLD_Orkjaeger_MT, ZS_Talk))
		{
			Mod_NL_ZombieVerwandlung = 1;

			AI_UnequipWeapons	(Mod_7245_SLD_Orkjaeger_MT);

			Wld_PlayEffect("spellFX_Fear",  Mod_7245_SLD_Orkjaeger_MT, Mod_7245_SLD_Orkjaeger_MT, 0, 0, 0, FALSE );

			Mdl_ApplyOverlayMDS	(Mod_7245_SLD_Orkjaeger_MT, "ZOMBIE.MDS");

			B_Attack	(Mod_7245_SLD_Orkjaeger_MT, hero, AR_Kill, 0);

			B_SetAttitude	(Mod_7245_SLD_Orkjaeger_MT, ATT_HOSTILE);

			AI_UnequipWeapons	(Mod_7246_SLD_Orkjaeger_MT);

			Wld_PlayEffect("spellFX_Fear",  Mod_7246_SLD_Orkjaeger_MT, Mod_7246_SLD_Orkjaeger_MT, 0, 0, 0, FALSE );

			Mdl_ApplyOverlayMDS	(Mod_7246_SLD_Orkjaeger_MT, "ZOMBIE.MDS");

			B_Attack	(Mod_7246_SLD_Orkjaeger_MT, hero, AR_Kill, 0);

			B_SetAttitude	(Mod_7246_SLD_Orkjaeger_MT, ATT_HOSTILE);

			B_LogEntry	(TOPIC_MOD_SLD_FRIEDHOF, "Verdammt. Was für ein übler Zauber ist das schon wieder?! Mit viel Unterstützung von den beiden kann ich wohl nicht rechnen.");
		};

		// Untoten Shamanen im Sumpf spawnen

		if (Mod_NL_UDS_Spawn == 1)
		&& (Npc_GetDistToWP(hero, "WP_UNDEADSHAMANE_WAITFORPLAYER") < 300)
		{
			Mod_NL_UDS_Spawn = 2;

			Wld_InsertNpc	(Mod_10032_ORC_UndeadShamane_MT, "WP_UNDEADSHAMANE_WAITFORPLAYER");
		};

		// Orkfriedhof öffnen

		if (Mod_NL_OpenOGY == 0)
		&& (Mod_Gilde == 19)
		{
			Mod_NL_OpenOGY = 1;

			//Wld_SendTrigger	("EVT_ORCGRAVYARD_MOVER_01");
		};

		// Jagdkumpanen fliehen bekifft vor dem Gobbo

		if (Npc_KnowsInfo(hero, Info_Mod_Fester_PotionReady))
		&& (!Npc_KnowsInfo(hero, Info_Mod_Fester_BackAtCamp))
		&& (Npc_GetDistToNpc(hero, Gobbo_Fester_04) < 300)
		&& (Mod_NL_Fester_GobboFlucht == 0)
		{
			Mod_NL_Fester_GobboFlucht = 1;

			B_StartOtherRoutine	(Mod_784_SLD_Fester_MT, "FLEETOCAMP");
			B_StartOtherRoutine	(Mod_904_SLD_Engardo_MT, "FLEETOCAMP");
			B_StartOtherRoutine	(Mod_1275_SLD_Nodrak_MT, "FLEETOCAMP");
		};

		// Seeungeheuer taucht nicht korrekt auf

		if (!Npc_IsDead(Wasserdrache_11003_MT))
		{
			if (Wld_IsTime(22,00,05,00))
			&& (Npc_GetDistToWP(Wasserdrache_11003_MT, "OW_SCAVENGER_COAST_NEWCAMP_SPAWN") > 2000)
			&& (Npc_GetDistToNpc(Wasserdrache_11003_MT, hero) > 2000)
			{
				AI_Teleport	(Wasserdrache_11003_MT, "OW_SCAVENGER_COAST_NEWCAMP_SPAWN");
			}
			else if (Wld_IsTime(05,00,22,00))
			&& (Npc_GetDistToWP(Wasserdrache_11003_MT, "OW_SCAVENGER_COAST_NEWCAMP_SPAWN") <= 2000)
			&& (Npc_GetDistToNpc(Wasserdrache_11003_MT, hero) > 2000)
			{
				AI_Teleport	(Wasserdrache_11003_MT, "TOT");
			};
		}
		else if (Npc_IsDead(Wasserdrache_11003_MT))
		&& (Hlp_IsValidNpc(Wasserdrache_11003_MT))
		{
			if (Npc_GetDistToWP(Wasserdrache_11003_MT, "TOT") > 2000)
			&& (Npc_GetDistToNpc(Wasserdrache_11003_MT, hero) > 2000)
			{
				AI_Teleport	(Wasserdrache_11003_MT, "TOT");
			};
		};

		// Gardisten kommen erst, wenn Lee fertig gequatscht hat

		if (Npc_KnowsInfo(hero, Info_Mod_Lee_SchlachtDa))
		&& (!Npc_IsInState(Mod_525_SLD_Lee_MT, ZS_Talk))
		&& (Mod_NL_SchlachtDa == 0)
		{
			B_StartOtherRoutine	(Mod_7221_GRD_Gardist_MT, "START");
			B_StartOtherRoutine	(Mod_7222_GRD_Gardist_MT, "START");
			B_StartOtherRoutine	(Mod_7223_GRD_Gardist_MT, "START");
			B_StartOtherRoutine	(Mod_7224_GRD_Gardist_MT, "START");
			B_StartOtherRoutine	(Mod_7225_GRD_Gardist_MT, "START");
			B_StartOtherRoutine	(Mod_7226_GRD_Gardist_MT, "START");
			B_StartOtherRoutine	(Mod_7227_GRD_Gardist_MT, "START");
			B_StartOtherRoutine	(Mod_7228_GRD_Gardist_MT, "START");
			B_StartOtherRoutine	(Mod_7229_GRD_Gardist_MT, "START");
			B_StartOtherRoutine	(Mod_7230_GRD_Gardist_MT, "START");

			Mod_NL_SchlachtDa = 1;
		};

		// Nach dem Gespräch mit dem Schamanen erst mal ein kurzer Monolog mit Info, dass man einen Tag warten sollte

		if (Npc_KnowsInfo(hero, Info_Mod_UndeadOrkShamane_Hi))
		&& (Mod_NL_UDOS_WaitDay == 0)
		&& (!Npc_IsInState(Mod_10032_ORC_UndeadShamane_MT, ZS_Talk))
		{
			Mod_NL_UDOS_WaitDay = 1;

			AI_StandUP	(hero);

			Npc_ClearAIQueue	(hero);

			AI_Output(hero, NULL, "Info_Mod_Hero_UDOS_WaitDay_15_00"); //Ächz, das war zu viel. Ich sollte mich erst mal eine Runde schlafen legen und dann weitersehen.
		};
	};

	if (CurrentLevel == ORCGRAVEYARD_ZEN)
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Rod_OGY_GetZombie))
		&& (Mod_NL_ZombieVerwandlung == 1)
		&& (!Npc_IsInState(Mod_7533_SLD_Rod_OGY, ZS_Talk))
		{
			Mod_NL_ZombieVerwandlung = 2;

			AI_UnequipWeapons	(Mod_7260_SLD_Orkjaeger_OGY);

			Wld_PlayEffect("spellFX_Fear",  Mod_7260_SLD_Orkjaeger_OGY, Mod_7260_SLD_Orkjaeger_OGY, 0, 0, 0, FALSE );

			Mdl_ApplyOverlayMDS	(Mod_7260_SLD_Orkjaeger_OGY, "ZOMBIE.MDS");

			B_Attack	(Mod_7260_SLD_Orkjaeger_OGY, hero, AR_GuildEnemy, 0);

			B_SetAttitude	(Mod_7260_SLD_Orkjaeger_OGY, ATT_HOSTILE);

			AI_UnequipWeapons	(Mod_7259_SLD_Orkjaeger_OGY);

			Wld_PlayEffect("spellFX_Fear",  Mod_7259_SLD_Orkjaeger_OGY, Mod_7259_SLD_Orkjaeger_OGY, 0, 0, 0, FALSE );

			Mdl_ApplyOverlayMDS	(Mod_7259_SLD_Orkjaeger_OGY, "ZOMBIE.MDS");

			B_Attack	(Mod_7259_SLD_Orkjaeger_OGY, hero, AR_GuildEnemy, 0);

			B_SetAttitude	(Mod_7259_SLD_Orkjaeger_OGY, ATT_HOSTILE);

			Wld_PlayEffect("spellFX_Fear",  Mod_7533_SLD_Rod_OGY, Mod_7533_SLD_Rod_OGY, 0, 0, 0, FALSE );

			Mdl_ApplyOverlayMDS	(Mod_7533_SLD_Rod_OGY, "ZOMBIE.MDS");

			B_Attack	(Mod_7533_SLD_Rod_OGY, hero, AR_GuildEnemy, 0);

			B_SetAttitude	(Mod_7533_SLD_Rod_OGY, ATT_HOSTILE);

			AI_UnequipWeapons	(Mod_7258_TPL_Templer_OGY);

			Wld_PlayEffect("spellFX_Fear",  Mod_7258_TPL_Templer_OGY, Mod_7258_TPL_Templer_OGY, 0, 0, 0, FALSE );

			Mdl_ApplyOverlayMDS	(Mod_7258_TPL_Templer_OGY, "ZOMBIE.MDS");

			B_Attack	(Mod_7258_TPL_Templer_OGY, hero, AR_GuildEnemy, 0);

			B_SetAttitude	(Mod_7258_TPL_Templer_OGY, ATT_HOSTILE);
		};

		if (Mod_NL_ZombieVerwandlung == 1)
		&& (Mod_NL_TorOffen_OGY == 0)
		{
			Mod_NL_TorOffen_OGY = 1;

			Wld_SendTrigger	("EVT_ORCGRYRD_GATE_05");
		};

		if (Mod_NL_UOS == 4)
		&& (Npc_GetDistToWP(hero, "GRYD_052") < 500)
		{
			AI_GotoWP	(hero, "GRYD_053");

			Mod_NL_UOS = 5;
		};

		if (Mod_NL_UOS == 6)
		&& (Npc_IsDead(Mod_7266_GUR_BaalLukor_OGY))
		{
			Mod_NL_UOS = 7;

			Wld_SendTrigger	("EVT_OGY_BARRIERE");

			Mod_NL_BarriereAttack = 1;

			B_StartOtherRoutine	(Mod_7261_PSINOV_Novize_OGY, "TOT");
			B_StartOtherRoutine	(Mod_7262_PSINOV_Novize_OGY, "TOT");
			B_StartOtherRoutine	(Mod_7263_PSINOV_Novize_OGY, "TOT");
			B_StartOtherRoutine	(Mod_7264_PSINOV_Novize_OGY, "TOT");
			B_StartOtherRoutine	(Mod_7265_GUR_BaalTavor_OGY, "TOT");

			UndeadOrcWarrior_Geiselwache_01.wp	= "TOT";
			UndeadOrcWarrior_Geiselwache_02.wp	= "TOT";
			UndeadOrcWarrior_Geiselwache_03.wp	= "TOT";
			UndeadOrcWarrior_Geiselwache_04.wp	= "TOT";
			UndeadOrcWarrior_Geiselwache_05.wp	= "TOT";
			UndeadOrcWarrior_Geiselwache_06.wp	= "TOT";

			AI_Teleport	(Mod_7261_PSINOV_Novize_OGY, "TOT");
			AI_Teleport	(Mod_7262_PSINOV_Novize_OGY, "TOT");
			AI_Teleport	(Mod_7263_PSINOV_Novize_OGY, "TOT");
			AI_Teleport	(Mod_7264_PSINOV_Novize_OGY, "TOT");
			AI_Teleport	(Mod_7265_GUR_BaalTavor_OGY, "TOT");

			AI_Teleport	(UndeadOrcWarrior_Geiselwache_01, "TOT");
			AI_Teleport	(UndeadOrcWarrior_Geiselwache_02, "TOT");
			AI_Teleport	(UndeadOrcWarrior_Geiselwache_03, "TOT");
			AI_Teleport	(UndeadOrcWarrior_Geiselwache_04, "TOT");
			AI_Teleport	(UndeadOrcWarrior_Geiselwache_05, "TOT");
			AI_Teleport	(UndeadOrcWarrior_Geiselwache_06, "TOT");

			B_KillNpc	(Mod_7261_PSINOV_Novize_OGY);
			B_KillNpc	(Mod_7262_PSINOV_Novize_OGY);
			B_KillNpc	(Mod_7263_PSINOV_Novize_OGY);
			B_KillNpc	(Mod_7264_PSINOV_Novize_OGY);
			B_KillNpc	(Mod_7265_GUR_BaalTavor_OGY);
			B_KillNpc	(UndeadOrcWarrior_Geiselwache_01);
			B_KillNpc	(UndeadOrcWarrior_Geiselwache_02);
			B_KillNpc	(UndeadOrcWarrior_Geiselwache_03);
			B_KillNpc	(UndeadOrcWarrior_Geiselwache_04);
			B_KillNpc	(UndeadOrcWarrior_Geiselwache_05);
			B_KillNpc	(UndeadOrcWarrior_Geiselwache_06);

			B_LogEntry	(TOPIC_MOD_SLD_FRIEDHOF, "Die Barriere ist weg und die Geiseln frei. Jetzt gibt es nicht mehr, was den untoten Unrat vor mir schützt.");
		};

		if (Mod_NL_UOS == 6)
		&& (Mod_NL_UOS_Attack == 1)
		{
			Mod_NL_UOS_BarriereCounter += 1;

			Mod_NL_BarriereAttack = 1;

			Mod_7261_PSINOV_Novize_OGY.flags = 0;
			Mod_7262_PSINOV_Novize_OGY.flags = 0;
			Mod_7263_PSINOV_Novize_OGY.flags = 0;
			Mod_7264_PSINOV_Novize_OGY.flags = 0;
			Mod_7265_GUR_BaalTavor_OGY.flags = 0;

			if (Mod_NL_UOS_BarriereCounter == 10)
			{
				Mod_NL_UOS = 8;

				Wld_SendTrigger	("EVT_OGY_BARRIERE");

				B_LogEntry	(TOPIC_MOD_SLD_FRIEDHOF, "Tja, das lief nicht ganz so gut, die Geiseln sind hinüber. Hoffentlich erfährt niemand etwas von meinem Patzer.");
			};
		};

		if (Mod_NL_UOS == 6)
		&& (Mod_UOS_HolySpell == 1)
		{
			Mod_NL_UOS = 7;

			Wld_SendTrigger	("EVT_OGY_BARRIERE");

			B_LogEntry	(TOPIC_MOD_SLD_FRIEDHOF, "Die Barriere ist weg und die Geiseln frei. Jetzt kann ich mir endlich das Buch vom Schamanen holen.");
		};

		// Gebunden und verborgen

		if (Npc_HasItems(hero, ItWr_Siegelbuch) == 1)
		&& (Mod_NL_Siegelbuch == 0)
		{
			Mod_NL_Siegelbuch = 1;

			Log_CreateTopic	(TOPIC_MOD_NL_SIEGELBUCH, LOG_MISSION);
			B_SetTopicStatus	(TOPIC_MOD_NL_SIEGELBUCH, LOG_RUNNING);
			B_LogEntry	(TOPIC_MOD_NL_SIEGELBUCH, "Hmm, ein weiteres Buch. Scheinbar hatte dieser untote Fleischklops eine Vorliebe für bizarre Literatur.");
		};

		// Untoter Shamane nicht mehr immortal

		if (Npc_KnowsInfo(hero, Info_Mod_UndeadOrkShamane_OGY_Hi))
		&& (!Npc_IsDead(Mod_10033_ORC_UndeadShamane_OGY))
		{
			Mod_10033_ORC_UndeadShamane_OGY.flags = 0;
		};

		// Untoter Shamane teleportiert sich scheinbar manchmal nicht weg

		if (Npc_GetDistToNpc(hero, Mod_10033_ORC_UndeadShamane_OGY) < 500)
		{
			if (Mod_NL_UOS_Casting <= 3)
			&& (Npc_GetDistToWP(Mod_10033_ORC_UndeadShamane_OGY, "GRYD_020") < 1000)
			{
				AI_Teleport	(Mod_10033_ORC_UndeadShamane_OGY, "GRYD_048");

				B_StartOtherRoutine	(Mod_10033_ORC_UndeadShamane_OGY, "SECOND");

				AI_Teleport	(Mod_10033_ORC_UndeadShamane_OGY, "GRYD_048");

				Mod_NL_UOS = 3;

				Mod_NL_UOS_Casting = 3;
			}
			else if (Mod_NL_UOS_Casting <= 6)
			&& (Npc_GetDistToWP(Mod_10033_ORC_UndeadShamane_OGY, "GRYD_048") < 1000)
			{
				AI_Teleport	(Mod_10033_ORC_UndeadShamane_OGY, "GRYD_087");

				B_StartOtherRoutine	(Mod_10033_ORC_UndeadShamane_OGY, "LAST");

				AI_Teleport	(Mod_10033_ORC_UndeadShamane_OGY, "GRYD_087");

				Mod_NL_UOS = 4;

				Mod_NL_UOS_Casting = 6;
			};
		};

		// NL-Story: Held darf nicht in die Barriere	

		if (Mod_NL_UOS == 6)
		&& (Npc_GetDistToWP(hero, "GRYD_054") < 500)
		{
			AI_TurnToNpc	(hero, Mod_7265_GUR_BaalTavor_OGY);

			AI_Dodge	(hero);
		};
	};

	if (Npc_HasItems(hero, ItWr_Siegelbuch) == 1)
	&& (Mod_NL_Siegelbuch < 6)
	{
		Mod_NL_SiegelbuchCounter += 1;

		if (Mod_NL_SiegelbuchCounter >= 3)
		&& (hero.attribute[ATR_MANA] > 0)
		{
			hero.attribute[ATR_MANA] -= 1;

			Mod_NL_SiegelbuchCounter = 0;
		};
	};

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		if (Mod_NL_Siegelbuch >= 2)
		{
			MOBNAME_XR_STEINKREISMITTE = "Steinkreismitte";
		};

		// Kerker und Drachen

		if (Mod_NL_Siegelbuch == 6)
		&& (!Npc_IsInState(hero, ZS_MagicSleep))
		{
			Npc_ClearAIQueue	(hero);
			AI_StandUp	(hero);

			AI_Teleport	(hero, "NW_TAVERNE_IN_04");

			B_SetAivar(hero, AIV_INVINCIBLE, FALSE);

			B_RemoveNpc	(Kobold_11000_NW);

			Wld_InsertNpc	(Kobold_11000_NW, "NW_BIGFARM_LAKE_CAVE_03");
			B_StartOtherRoutine	(Kobold_11000_NW, "DUNGEON");

			HeroKoboldGold = (Npc_HasItems(hero, ItMi_Gold)*7)/10;

			Npc_RemoveInvItems	(hero, ItMi_Gold, HeroKoboldGold);

			Mod_NL_Siegelbuch = 7;

			Wld_PlayEffect("BLACK_SCREEN", hero, hero, 0, 0, 0, TRUE);

			Wld_SetTime	(24,00);

			AI_GotoNpc	(Mod_776_NONE_Orlan_NW, hero);
		};

		if (Npc_GetDistToWP(hero, "LICH") < 500)
		&& (Npc_KnowsInfo(hero, Info_Mod_Porthos_Hi))
		&& (Mod_NL_PalasLich < 6)
		&& (!Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Moorhexe))
		{
			if (Mod_NL_PalasLich == 0)
			{
				AI_StandUP	(hero);

				AI_Output(hero, NULL, "Info_Mod_Hero_LichDungeon_15_00"); //Und, habt ihr den Finsterling erwischt und erledigt?
			};

			if (Mod_NL_PalasLich == 5)
			{
				B_SetNpcVisual 		(Mod_7290_PAL_Athos_NW, MALE, "Ske_Head", 0, 0, ITAR_PAL_SKEL);
				B_SetNpcVisual 		(Mod_7291_PAL_Aramis_NW, MALE, "Ske_Head", 0, 0, ITAR_PAL_SKEL);
				B_SetNpcVisual 		(Mod_7292_PAL_Porthos_NW, MALE, "Ske_Head", 0, 0, ITAR_PAL_SKEL);

				Mod_7290_PAL_Athos_NW.flags = 0;
				Mod_7291_PAL_Aramis_NW.flags = 0;
				Mod_7292_PAL_Porthos_NW.flags = 0;

				Wld_InsertNpc	(Lich_11008_NW, "NW_TROLLAREA_TROLLROCKCAVE_02");
			};

			Mod_NL_PalasLich += 1;
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Lich_Blutgolem))
		&& (Mod_NL_Lich == 0)
		{
			Mod_NL_Lich = 1;

			Wld_SendTrigger	("LICHDUNGEON");

			AI_Output(hero, NULL, "Info_Mod_Hero_LichDungeon_15_01"); //Der wäre perdu.
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Lich_Unbesiegbar))
		&& (Mod_NL_HasKamm < 3)
		{
			Lich_11008_NW.flags = 2;
		};

		// Den Drachen zum Reden bringen

		if (Npc_KnowsInfo(hero, Info_Mod_Dragon_Kloster))
		&& (Mod_NL_DragonKloster == 0)
		&& (Wld_IsTime(21,00,05,00))
		{
			Mod_NL_DragonKloster = 1;

			B_StartOtherRoutine	(Mod_523_KDF_Daron_NW, "DRACHEN");
			B_StartOtherRoutine	(Mod_920_KDF_Isgaroth_NW, "DRACHEN");
			B_StartOtherRoutine	(Mod_923_NOV_Opolos_NW, "DRACHEN");

			B_RemoveNpc	(Sheep_Opolos_01);
			B_RemoveNpc	(Sheep_Opolos_02);
			B_RemoveNpc	(Sheep_Opolos_03);
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Dragon_Kloster))
		&& (Mod_NL_DragonKloster == 0)
		&& (Wld_IsTime(05,00,21,00))
		&& (Wld_GetDay() > Mod_NL_DragonKlosterTag)
		{
			Mod_NL_DragonKloster = 1;

			B_StartOtherRoutine	(Mod_523_KDF_Daron_NW, "DRACHEN");
			B_StartOtherRoutine	(Mod_920_KDF_Isgaroth_NW, "DRACHEN");
			B_StartOtherRoutine	(Mod_923_NOV_Opolos_NW, "DRACHEN");

			B_RemoveNpc	(Sheep_Opolos_01);
			B_RemoveNpc	(Sheep_Opolos_02);
			B_RemoveNpc	(Sheep_Opolos_03);
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Dragon_KlosterErfolg))
		&& (Npc_KnowsInfo(hero, Info_Mod_Lich_Unbesiegbar))
		&& (Mod_NL_Dragon_KnowsLich == 0)
		{
			B_LogEntry	(TOPIC_MOD_NL_DRAGON, "Aha, der untote Magier in seinem Kerker.");

			Mod_NL_Dragon_KnowsLich = 1;
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Dragon_KlosterErfolg))
		&& (Mod_NL_Dragon_KnowsBook == 1)
		{
			B_LogEntry	(TOPIC_MOD_NL_DRAGON, "Gegenstand der Leben birgt? Klar, der Gegenstand, an welchen der untote Magier seine Lebenskraft gebunden hat.");

			Mod_NL_Dragon_KnowsBook = 2;
		};

		if (Mod_NL_Dragon_KnowsBook == 2)
		&& (Mod_NL_Dragon_KnowsLich == 1)
		&& (Mod_NL_Dragon_KnowsFreudenspender == 0)
		{
			Mod_NL_Dragon_KnowsFreudenspender = 1;

			AI_StandUp	(hero);

			AI_Output(hero, NULL, "Info_Mod_Hero_DragonLich_Land_15_00"); //Hmm, aber im Lande des Korns der Mutter ein Moor und seine Bewohnerin, dich sich dem Mächtigen verbirgt und vermutlich den Gegenstand bei sich hat. Nun, bleibt mir wohl nichts anderes übrig, als Xardas erneut um Rat zu Fragen.

			B_LogEntry	(TOPIC_MOD_NL_DRAGON, "Hmm, aber im Lande des Korns der Mutter ein Moor und seine Bewohnerin, dich sich dem Mächtigen verbirgt und vermutlich den Gegenstand bei sich hat.");
			B_SetTopicStatus	(TOPIC_MOD_NL_DRAGON, LOG_SUCCESS);
		};

		// Stab gegen Spruchrollen

		if (Mod_NL_HeroHasStab == 0)
		&& (Npc_HasItems(hero, ItMw_PyrmansStab) == 1)
		{
			Mod_NL_HeroHasStab = 1;

			B_LogEntry	(TOPIC_MOD_NL_STAB, "Ich habe den Stab.");
		};

		if (Mod_NL_HasKamm == 2)
		{
			B_StartOtherRoutine	(Mod_924_RIT_Sergio_NW, "DRAGON");
			B_StartOtherRoutine	(Mod_533_SLD_Gorn_NW, "DRAGON");
			B_StartOtherRoutine	(Mod_528_SLD_Cord_NW, "DRAGON");

			Mod_924_RIT_Sergio_NW.guild = GIL_DMT;
			Npc_SetTrueGuild	(Mod_924_RIT_Sergio_NW, GIL_DMT);

			Mod_NL_HasKamm = 3;
		};

		if (Mod_NL_HasKamm == 3)
		&& ((Npc_KnowsInfo(hero, Info_Mod_Lich_Kamm))
		|| (Npc_KnowsInfo(hero, Info_Mod_Dragon_Kamm))) {
			if (!Npc_IsInState(Lich_11008_NW, ZS_Talk))
			&& (!Npc_IsInState(Dragon_11009_NW, ZS_Talk)) {
				Mod_NL_HasKamm = 4;

				Dragon_11009_NW.flags = 0;
				Knucker_11001_NW.flags = 0;
				Feuerdrache_11002_NW.flags = 0;

				B_KillNpc	(Lich_11008_NW);

				B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_DRAGON);
				B_SetMonsterAttitude	(GIL_DRAGON,	ATT_HOSTILE,	GIL_SEPERATOR_HUM);
			};
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Sergio_Dragon))
		&& (Dragon_11009_NW.attribute[ATR_HITPOINTS] < (Dragon_11009_NW.attribute[ATR_HITPOINTS_MAX]*9/10))
		&& (!Npc_IsInState(Mod_924_RIT_Sergio_NW, ZS_Attack))
		&& (!Npc_IsDead(Mod_924_RIT_Sergio_NW))
		&& (!Npc_IsDead(Dragon_11009_NW))
		{
			B_StartOtherRoutine	(Mod_924_RIT_Sergio_NW,	"DRAGONFIGHT");
			Mod_924_RIT_Sergio_NW.aivar[AIV_PARTYMEMBER] = TRUE;
			B_Attack	(Mod_924_RIT_Sergio_NW, Dragon_11009_NW, AR_Kill, 0);

			Mod_924_RIT_Sergio_NW.guild = GIL_OUT;
			Npc_SetTrueGuild	(Mod_924_RIT_Sergio_NW, GIL_OUT);
		};

		if (Mod_NL_HasKamm == 4)
		&& (Npc_IsDead(Lich_11008_NW))
		&& (Npc_IsDead(Dragon_11009_NW))
		&& (Npc_IsDead(Knucker_11001_NW))
		&& (Npc_IsDead(Feuerdrache_11002_NW))
		{
			B_SetTopicStatus	(TOPIC_MOD_NL_DRACHEN, LOG_SUCCESS);

			Mod_TillChange = 1;

			Mod_TillChange_Day = Wld_GetDay();

			Mod_NL_HasKamm = 5;
		};

		if (Mod_NL_HasKamm >= 3)
		{
			Dragon_11009_NW.flags = 0;
			Knucker_11001_NW.flags = 0;
			Feuerdrache_11002_NW.flags = 0;
			Lich_11008_NW.flags = 0;
		};

		// Abenteuer mit Gorn im Wald

		if (Npc_KnowsInfo(hero, Info_Mod_Gorn_VorKrypta))
		&& (Npc_IsDead(Zombie_Hel_01))
		&& (Npc_IsDead(Zombie_Hel_02))
		&& (Npc_IsDead(Zombie_Hel_03))
		&& (Npc_IsDead(Zombie_Hel_04))
		&& (Npc_IsDead(Zombie_Hel_05))
		&& (Npc_IsDead(Zombie_Hel_06))
		&& (Npc_IsDead(Zombie_Hel_07))
		&& (Npc_IsDead(Zombie_Hel_08))
		&& (Npc_IsDead(Zombie_Hel_09))
		&& (Npc_IsDead(Zombie_Hel_10))
		&& (Mod_NL_Hel == 0)
		{
			Mod_NL_Hel = 1;

			Wld_InsertNpc	(Mod_7299_OUT_Hel_NW, "NW_CRYPT_01");
		};

		// Hel

		if (!Npc_IsInState(Mod_7299_OUT_Hel_NW, ZS_Talk))
		&& (Npc_KnowsInfo(hero, Info_Mod_Hel_Hi))
		&& (Mod_Hel_GhoulSpawn == 0)
		{
			Mod_Hel_GhoulSpawn = 1;

			Wld_InsertNpc	(Ghoul_Hel_01, "NW_CRYPT_01");
			Wld_InsertNpc	(Ghoul_Hel_02, "NW_CRYPT_01");
			Wld_InsertNpc	(Ghoul_Hel_03, "NW_CRYPT_01");
			Wld_InsertNpc	(Ghoul_Hel_04, "NW_CRYPT_01");
			Wld_InsertNpc	(Ghoul_Hel_05, "NW_CRYPT_01");
			Wld_InsertNpc	(Ghoul_Hel_06, "NW_CRYPT_01");
		};

		if (!Npc_IsInState(Mod_7299_OUT_Hel_NW, ZS_Talk))
		&& (Npc_KnowsInfo(hero, Info_Mod_Hel_InKrypta))
		&& (Mod_Hel_GhoulSpawn == 1)
		{
			Mod_Hel_GhoulSpawn = 2;

			Wld_InsertNpc	(Ghoul_Hel_07, "NW_CRYPT_IN_11");
			Wld_InsertNpc	(Ghoul_Hel_08, "NW_CRYPT_IN_11");

			Wld_InsertNpc	(Crypt_Skeleton_Lord, "NW_CRYPT_IN_10");
			Wld_InsertNpc	(Skeleton, "NW_CRYPT_IN_10");
			Wld_InsertNpc	(Skeleton, "NW_CRYPT_IN_10");
		};

		// Snorre weg, wenn Stab

		if (Npc_KnowsInfo(hero, Info_Mod_Andokai_Moorhexe))
		&& (Mod_NL_SnorreWeg == 0)
		{
			B_StartOtherRoutine	(Kobold_11010_NW, "TOT");

			Mod_NL_SnorreWeg = 1;
		};

		// Effekte bei Steinkreis casten

		if (Mod_SiegelEffekt > 0)
		{
			if (Mod_SiegelEffekt == 1)
			{
				Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",  ItMi_EffektMarker, ItMi_EffektMarker, 0, 0, 0, FALSE );
			};
			if (Mod_SiegelEffekt == 5)
			{
				Wld_PlayEffect("spellFX_RingRitual1",  ItMi_EffektMarker, ItMi_EffektMarker, 0, 0, 0, FALSE );
			};
			if (Mod_SiegelEffekt == 7)
			{
				Wld_PlayEffect("spellFX_RingRitual1",  ItMi_EffektMarker, ItMi_EffektMarker, 0, 0, 0, FALSE );
			};
			if (Mod_SiegelEffekt == 9)
			{
				Wld_PlayEffect("spellFX_RingRitual1",  ItMi_EffektMarker, ItMi_EffektMarker, 0, 0, 0, FALSE );
			};
			if (Mod_SiegelEffekt == 11)
			{
				Wld_PlayEffect("spellFX_RingRitual1",  ItMi_EffektMarker, ItMi_EffektMarker, 0, 0, 0, FALSE );
			};
			if (Mod_SiegelEffekt == 13)
			{
				Mod_SiegelEffekt = 1;
			};

			Mod_SiegelEffekt += 1;
		};
	};

	if (CurrentLevel == FREEMINE_ZEN)
	{
		if (Mod_NL_Dschinn_FM == 2)
		&& (!Npc_IsInState(Dschinn_11012_FM, ZS_Talk))
		{
			Mod_NL_Dschinn_FM = 3;

			B_RemoveNpc	(Dschinn_11012_FM);
		};
	};

	if (CurrentLevel == OLDMINE_ZEN)
	{
		if (Mod_NL_Dschinn_OM == 2)
		&& (!Npc_IsInState(Dschinn_11013_OM, ZS_Talk))
		{
			Mod_NL_Dschinn_OM = 3;

			B_RemoveNpc	(Dschinn_11013_OM);
		};
	};

	if (CurrentLevel == ABANDONEDMINE_ZEN)
	{
		if (Mod_NL_Dschinn_VM == 2)
		&& (!Npc_IsInState(Dschinn_11014_VM, ZS_Talk))
		{
			Mod_NL_Dschinn_VM = 3;

			B_RemoveNpc	(Dschinn_11014_VM);
		};
	};

	if (CurrentLevel == RELENDEL_ZEN)
	{
		// Was sich nicht jedem offenbart ...

		if (Mod_NL_Grimbald == 2)
		&& (Npc_GetDistToWP(hero, "REL_006") < 500)
		{
			Mod_NL_Grimbald = 3;

			B_StartOtherRoutine	(Mod_7294_OUT_Grimbald_REL, "GUIDE");
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Moorhexe))
		&& (Mod_Moorhexe == 0)
		&& ((Npc_GetDistToWP(hero, "REL_MOOR_131") < 1000)
		|| (Npc_GetDistToWP(hero, "REL_MOOR_131") < 1000))
		{
			if (playerIsTransformed == TRUE) {
				Mod_Moorhexe = 1;

				Wld_InsertNpc	(Mod_7295_OUT_Moorhexe_REL,	"REL_MOOR_131");
			} else if (Mod_Moorhexe_Hint == FALSE) {
				Mod_Moorhexe_Hint = TRUE;
				B_LogEntry	(TOPIC_MOD_NL_MOORHEXE, "Ich spüre eine Präsenz an diesem Ort, allerdings kann ich nichts sehen. Ich sollte mich jetzt verwandeln.");
			};
		};

		if (Mod_NL_HasKamm == 0)
		&& (Npc_HasItems(hero, ItMi_Kamm) == 1)
		{
			Mod_NL_HasKamm = 1;

			B_LogEntry	(TOPIC_MOD_NL_MOORHEXE, "So was. Hier und da etwas magisches Erz eingearbeitet, aber sonst ein schlichter Kamm. Nie wäre jemand auf den Gedanken gekommen, dieser Gegenstand könnte die Lebenskraft des Untoten in sich bergen. Nun brauche ich ihn nur noch zu vernichten. Das Feuer eines Schmiedeofens dürfte diesen Zweck erfüllen.");
		};

		if ((Mod_NL_Grimbald == 3)
		|| (Mod_NL_Grimbald == 4))
		&& (Npc_KnowsInfo(hero, Info_Mod_Moorhexe_Hi))
		{
			B_StartOtherRoutine	(Mod_7294_OUT_Grimbald_REL, "TOT");

			Mod_NL_Grimbald = 5;
		};
	};

	// Drachensud der Manaverbrennung

	if (Mod_NL_DrachensudIntus == 1)
	{
		if (!Npc_IsInFightMode(hero, FMODE_NONE))
		&& (hero.attribute[ATR_MANA] > 20)
		{
			hero.attribute[ATR_MANA] -= 1;
		};
	};
};