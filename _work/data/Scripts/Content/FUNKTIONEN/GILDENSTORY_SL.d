FUNC VOID GILDENSTORY_SL()
{
	// Sumpflager

	if (CurrentLevel == RELENDEL_ZEN)
	{
		if (Mod_Freudenspender == 5)
		&& (Mod_SabineInRelendel == 1)
		{
			Mod_SabineInRelendel = 2;

			AI_Teleport	(Mod_7010_HS_Sabine_REL, "REL_259");
			B_StartOtherRoutine	(Mod_7010_HS_Sabine_REL, "HOFSTAAT");
		};

		if (Mod_Hofstaat_Alex_Intro == 1)
		{
			if (Mod_Hofstaat_Alex_Intro_Counter == 0)
			{
				AI_TurnToNpc	(Mod_7011_HS_Alex_REL, hero);

				AI_Output(Mod_7011_HS_Alex_REL, NULL, "Info_Mod_Alex_Hofstaat_Intro_08_00"); //Halt!
			};

			if (Mod_Hofstaat_Alex_Intro_Counter == 5)
			{
				AI_TurnToNpc	(hero, Mod_7011_HS_Alex_REL);
				AI_PlayAni	(hero, "T_SEARCH");

				AI_Output(hero, NULL, "Info_Mod_Alex_Hofstaat_Intro_15_01"); //Hm?
			};

			if (Mod_Hofstaat_Alex_Intro_Counter == 10)
			{
				AI_TurnToNpc	(Mod_7011_HS_Alex_REL, hero);

				AI_Output(Mod_7011_HS_Alex_REL, NULL, "Info_Mod_Alex_Hofstaat_Intro_08_02"); //Hier unten!
			};

			if (Mod_Hofstaat_Alex_Intro_Counter == 15)
			{
				AI_Output(hero, NULL, "Info_Mod_Alex_Hofstaat_Intro_15_03"); //Was machst du da unten?
			};

			if (Mod_Hofstaat_Alex_Intro_Counter == 20)
			{
				AI_Output(Mod_7011_HS_Alex_REL, NULL, "Info_Mod_Alex_Hofstaat_Intro_08_04"); //Sieht man das nicht? Ich buddle!
			};

			if (Mod_Hofstaat_Alex_Intro_Counter == 25)
			{
				AI_Output(hero, NULL, "Info_Mod_Alex_Hofstaat_Intro_15_05"); //Du ... buddelst?
			};

			if (Mod_Hofstaat_Alex_Intro_Counter == 30)
			{
				AI_Output(Mod_7011_HS_Alex_REL, NULL, "Info_Mod_Alex_Hofstaat_Intro_08_06"); //Jop.
			};

			if (Mod_Hofstaat_Alex_Intro_Counter == 35)
			{
				AI_Output(hero, NULL, "Info_Mod_Alex_Hofstaat_Intro_15_07"); //Und ... warum buddelst du?
			};

			if (Mod_Hofstaat_Alex_Intro_Counter == 40)
			{
				AI_Output(Mod_7011_HS_Alex_REL, NULL, "Info_Mod_Alex_Hofstaat_Intro_08_08"); //Naja, ich bin der königliche Lochgräber.
			};

			if (Mod_Hofstaat_Alex_Intro_Counter == 45)
			{
				AI_Output(hero, NULL, "Info_Mod_Alex_Hofstaat_Intro_15_09"); //Du bist ein Lochgräber?
			};

			if (Mod_Hofstaat_Alex_Intro_Counter == 50)
			{
				AI_Output(Mod_7011_HS_Alex_REL, NULL, "Info_Mod_Alex_Hofstaat_Intro_08_10"); //Königlicher Lochgräber!
			};

			if (Mod_Hofstaat_Alex_Intro_Counter == 55)
			{
				AI_Output(hero, NULL, "Info_Mod_Alex_Hofstaat_Intro_15_11"); //Na gut, aber was willst du von mir?
			};

			if (Mod_Hofstaat_Alex_Intro_Counter == 60)
			{
				AI_Output(Mod_7011_HS_Alex_REL, NULL, "Info_Mod_Alex_Hofstaat_Intro_08_12"); //Wie du siehst ist das Loch hier sehr tief.
			};

			if (Mod_Hofstaat_Alex_Intro_Counter == 65)
			{
				AI_Output(hero, NULL, "Info_Mod_Alex_Hofstaat_Intro_15_13"); //Und du willst, dass ich dir raus helfe?
			};

			if (Mod_Hofstaat_Alex_Intro_Counter == 70)
			{
				AI_Output(Mod_7011_HS_Alex_REL, NULL, "Info_Mod_Alex_Hofstaat_Intro_08_14"); //Nein.
			};

			if (Mod_Hofstaat_Alex_Intro_Counter == 75)
			{
				AI_Output(hero, NULL, "Info_Mod_Alex_Hofstaat_Intro_15_15"); //Achso ...
			};

			if (Mod_Hofstaat_Alex_Intro_Counter == 80)
			{
				AI_Output(Mod_7011_HS_Alex_REL, NULL, "Info_Mod_Alex_Hofstaat_Intro_08_16"); //Ich wollte dir nur mein Loch zeigen.
			};

			if (Mod_Hofstaat_Alex_Intro_Counter == 85)
			{
				AI_Output(hero, NULL, "Info_Mod_Alex_Hofstaat_Intro_15_17"); //Wenn das so ist ... Bis später.
			};

			if (Mod_Hofstaat_Alex_Intro_Counter == 90)
			{
				AI_Output(Mod_7011_HS_Alex_REL, NULL, "Info_Mod_Alex_Hofstaat_Intro_08_18"); //Bis später.
			};

			if (Mod_Hofstaat_Alex_Intro_Counter == 95)
			{
				B_StartOtherRoutine	(Mod_7011_HS_Alex_REL, "START");

				Mod_Hofstaat_Alex_Intro = 2;

				CutsceneAn = FALSE;
			};

			Mod_Hofstaat_Alex_Intro_Counter += 1;
		};

		if (Npc_GetDistToWp(hero, "REL_235") < 300)
		&& (Mod_Hofstaat_Alex_Intro == 0)
		{
			Mod_Hofstaat_Alex_Intro = 1;

			B_StartOtherRoutine	(Mod_7011_HS_Alex_REL, "INTRO");

			AI_GotoWP	(hero, "REL_236");

			Wld_SendTrigger	("HOFSTAATALEXINTRO");

			CutsceneAn = TRUE;
		};

		if (Mod_Hofstaat_Alex_Intro == 3)
		{
			if (Mod_Hofstaat_Typ_Intro_Counter == 2)
			{
				AI_TurnToNpc	(hero, Mod_7012_HS_Typ_REL);
				AI_TurnToNpc	(Mod_7012_HS_Typ_REL, hero);

				AI_Output(hero, NULL, "Info_Mod_Typ_Hofstaat_Intro_15_00"); //Was machst du hier?
			};

			if (Mod_Hofstaat_Typ_Intro_Counter == 7)
			{
				AI_Output(Mod_7012_HS_Typ_REL, NULL, "Info_Mod_Typ_Hofstaat_Intro_06_01"); //Ich steh' 'rum und bin lecker.
			};

			if (Mod_Hofstaat_Typ_Intro_Counter == 12)
			{
				AI_Output(hero, NULL, "Info_Mod_Typ_Hofstaat_Intro_15_02"); //Du ... bist lecker?
			};

			if (Mod_Hofstaat_Typ_Intro_Counter == 17)
			{
				AI_Output(Mod_7012_HS_Typ_REL, NULL, "Info_Mod_Typ_Hofstaat_Intro_06_03"); //Ja ... (kurze Pause) verdammt lecker.
			};

			if (Mod_Hofstaat_Typ_Intro_Counter == 22)
			{
				AI_Output(hero, NULL, "Info_Mod_Typ_Hofstaat_Intro_15_04"); //Warum?
			};

			if (Mod_Hofstaat_Typ_Intro_Counter == 27)
			{
				AI_Output(Mod_7012_HS_Typ_REL, NULL, "Info_Mod_Typ_Hofstaat_Intro_06_05"); //Ich bin königlich ...
			};

			if (Mod_Hofstaat_Typ_Intro_Counter == 30)
			{
				B_StartOtherRoutine	(Mod_7013_HS_Fluffy_REL, "KILLER");
			};

			if (Mod_Hofstaat_Typ_Intro_Counter == 32)
			{
				AI_Output(hero, NULL, "Info_Mod_Typ_Hofstaat_Intro_15_06"); //Was zum Teufel ...
			};

			if (Mod_Hofstaat_Typ_Intro_Counter == 50)
			{
				AI_PlayAni	(Mod_7013_HS_Fluffy_REL, "T_FISTHIT");
			};

			if (Mod_Hofstaat_Typ_Intro_Counter == 51)
			{
				AI_PlayAni	(Mod_7012_HS_Typ_REL, "T_DEAD");
				Mod_7012_HS_Typ_REL.attribute[ATR_HITPOINTS] = 0;
			};

			if (Mod_Hofstaat_Typ_Intro_Counter == 55)
			{
				B_StartOtherRoutine	(Mod_7013_HS_Fluffy_REL, "PRESTART");

				Mod_Hofstaat_Alex_Intro = 4;

				CutsceneAn = FALSE;
			};

			Mod_Hofstaat_Typ_Intro_Counter += 1;
		};

		if (Npc_GetDistToWp(hero, "REL_241") < 300)
		&& (Mod_Hofstaat_Alex_Intro == 2)
		{
			Mod_Hofstaat_Alex_Intro = 3;

			AI_GotoWP	(hero, "REL_249");

			Wld_SendTrigger	("HOFSTAATTYPINTRO");

			CutsceneAn = TRUE;
		};

		if (Npc_KnowsInfo(hero, Info_Mod_HofstaatRaufbold_Meer))
		&& (!Npc_IsInState(Mod_7284_HS_Raufbold_REL, ZS_Talk))
		&& (Mod_SL_Meer == 0)
		{
			Mod_SL_Meer = 1;

			AI_StandUp	(hero);

			AI_Output(hero, NULL, "Info_Mod_Hero_Meer_15_00"); //Ich sollte im Sumpflager vorbeischauen.

			B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Ich sollte im Sumpflager vorbeischauen.");
		};

		if (!Npc_IsInState(Mod_7011_HS_Alex_REL, ZS_Talk))
		&& (Mod_SL_Meer == 6)
		&& (Wld_GetDay()-1 > Mod_SL_AlexGraben)
		{
			Mod_SL_Meer = 7;

			B_StartOtherRoutine	(Mod_7011_HS_Alex_REL, "VORTOR");
		};

		if (Npc_KnowsInfo(hero, Info_Mod_HofstaatHundefutter_Hi))
		&& (Mod_SL_PartFluffy == 0)
		&& (!Npc_IsInState(Mod_7334_HS_Typ_REL, ZS_Talk))
		{
			if (Mod_SL_PartFluffy_Counter == 0)
			{
				B_StartOtherRoutine	(Mod_7013_HS_Fluffy_REL, "KILLER");
			};

			if (Mod_SL_PartFluffy_Counter == 10)
			{
				AI_PlayAni	(Mod_7013_HS_Fluffy_REL, "T_FISTHIT");
			};

			if (Mod_SL_PartFluffy_Counter == 11)
			{
				AI_PlayAni	(Mod_7334_HS_Typ_REL, "T_DEAD");
				Mod_7334_HS_Typ_REL.attribute[ATR_HITPOINTS] = 0;
			};

			if (Mod_SL_PartFluffy_Counter == 15)
			{
				B_StartOtherRoutine	(Mod_7013_HS_Fluffy_REL, "PRESTART");

				Mod_SL_PartFluffy = 1;

				B_LogEntry	(TOPIC_MOD_SL_FLUFFY, "Fluffy hat das Hundefutter verspeist. Ich sollte mich nach dem neuen Hundefutter umsehen.");
			};

			Mod_SL_PartFluffy_Counter += 1;
		};

		if (Npc_KnowsInfo(hero, Info_Mod_HofstaatNewHundefutter_Hi))
		&& (Mod_SL_PartFluffy == 1)
		&& (!Npc_IsInState(Mod_7335_HS_Typ_REL, ZS_Talk))
		&& (Wld_GetDay() > Mod_SL_PartFluffy_Day)
		{
			B_RemoveNpc	(Mod_7013_HS_Fluffy_REL);
			B_RemoveNpc	(Mod_7335_HS_Typ_REL);

			B_StartOtherRoutine	(Mod_7285_HS_Koenig_REL, "FLUFFY");

			Mod_SL_PartFluffy = 2;
		};

		if (Npc_KnowsInfo(hero, Info_Mod_HofstaatGeliebte_Spezialtrunken))
		&& (Mod_SL_PartGeliebte == 5)
		&& (!Npc_IsInState(Mod_7339_HS_Geliebte_REL, ZS_Talk))
		{
			PrintScreen ("Eine heiße Nacht später", -1, YPOS_LevelUp, FONT_Screen, 2);

			Wld_PlayEffect("BLACK_SCREEN", hero, hero, 0, 0, 0, TRUE);

			Mod_SL_PartGeliebte = 6;
		};

		if (Mod_SL_Schwaechen == 1)
		&& (Mod_SL_PartFluffy == 5)
		&& (Mod_SL_PartLochgraeber == 4)
		&& (Mod_SL_PartGeliebte == 8)
		&& (Mod_SL_PartBlind == 5)
		&& (Mod_SL_PartBrunnen == 3)
		{
			Mod_SL_Schwaechen = 2;
		};

		if (Mod_SL_Schwaechen == 6)
		&& (Mod_SL_HofstaatFutsch < Wld_GetDay())
		{
			B_StartOtherRoutine	(Mod_7285_HS_Koenig_REL, "ENDE");

			Mod_SL_Schwaechen = 7;
		};
	};

	if (CurrentLevel == HALLUZINATION_ZEN)
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Meer_Hi))
		&& (!Npc_IsInState(Mod_7330_Meer_HAL, ZS_Talk))
		{
			AI_Teleport	(hero, "HALU_04");
			Spine_OverallSaveSetInt("HalluHS", 1);
			CheckHalluAchievement();
		};
	};

	if (CurrentLevel == MINENTAL_ZEN)
	{
		if (Npc_KnowsInfo(hero, Info_Mod_HofstaatKoenig_MT_Fest))
		&& (Mod_SL_KingAtSwamp == 1)
		&& (!Npc_IsInState(Mod_7331_HS_Koenig_MT, ZS_Talk))
		{
			PrintScreen ("Eine durchzechte Nacht später", -1, YPOS_LevelUp, FONT_Screen, 2);

			Wld_PlayEffect("BLACK_SCREEN", hero, hero, 0, 0, 0, TRUE);

			B_RemoveNpc	(Mod_7331_HS_Koenig_MT);

			Mod_SL_KingAtSwamp = 2;

			PC_Sleep (7);
		};

		// Leichengase

		if (Mod_Leichengase_InsertProbe == 1)
		&& (Mod_IstGolem == FALSE) {
			CreateInvItems	(hero, ItMi_Sumpfhaiprobe, 1);

			Mod_Leichengase_InsertProbe = 2;
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Caine_Leichengase))
		&& (Mod_Caine_Leichengase == 0)
		{
			if (Npc_GetDistToWP(hero, "SUMPFHAIPROBE_01") < 500)
			|| (Npc_GetDistToWP(hero, "SUMPFHAIPROBE_02") < 500)
			{
				if (Mod_IstGolem == TRUE)
				{
					Print	("Sumpfhaiprobe erhalten");

					B_LogEntry	(TOPIC_MOD_SL_LEICHENGASE, "Ich hab die Sumpfhaiprobe. Jetzt nichts wie zurück zu Baal Caine.");

					Mod_Caine_Leichengase = 1;

					Mod_Leichengase_InsertProbe = 1;
				}
				else
				{
					B_MagicHurtNpc	(hero, hero, 30);
				};
			};
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Caine_Leichengase3))
		&& (Mod_Caine_Leichengase == 1)
		{
			if (!Npc_IsInState(Mod_1116_PSINOV_Caine_MT, ZS_Talk))
			{
				Mod_Caine_Leichengase = 2;
			};
		};

		if (Mod_Caine_Leichengase == 2)
		{
			LeichengaseScene();
		};

		if (Mod_Leichengase_Kraut == 3)
		{
			if (Npc_GetDistToWP(hero, "SPAWNOW_PATH_190_MOVMENT") < 500)
			{
				B_LogEntry	(TOPIC_MOD_SL_LEICHENGASE, "Ich sollte jetzt die Spruchrolle benutzen.");

				Mod_Leichengase_Kraut = 4;
			};
		};

		if (Mod_Leichengase_Kraut == 5)
		{
			if (Npc_GetDistToWP(hero, "LOCATION_12_01") < 500)
			{
				AI_GotoWP	(Krauttroll, "SPAWNOW_PATH_190_MOVMENT");

				Mod_Leichengase_Kraut = 6;
			};
		};

		if (Mod_Leichengase_Kraut == 6)
		{
			if (Npc_GetDistToWP(Krauttroll, "SPAWNOW_PATH_190_MOVMENT") < 500)
			{
				Wld_PlayEffect	("SCREEN_BLACK", hero, hero, 0, 0, 0, FALSE);

				Wld_InsertItem	(ItMi_Trollhaufen, "FP_ITEM_TROLLHAUFEN");

				B_RemoveNpc	(Krautschaf);

				Mod_Leichengase_Kraut = 7;
			};
		};

		if (Mod_Leichengase_Kraut == 1)
		|| (Mod_Leichengase_Kraut == 2)
		{
			if (Npc_GetDistToWP(hero, "SPAWNOW_PATH_190_MOVMENT") < 500)
			{
				Npc_RemoveInvItems	(hero, ItMi_Sumpfkraeuter_Molerat, 1);
				Npc_RemoveInvItems	(hero, ItMi_Schafsmagen, 1);

				AI_GotoWP	(hero, "SPAWNOW_PATH_190_MOVMENT");

				AI_PlayAni	(hero, "T_PLUNDER");

				AI_GotoWP	(hero, "OW_PATH_190");

				Wld_InsertNpc	(Krauttroll,	"LOCATION_12_01");

				Mod_Leichengase_Kraut = 3;
			};
		};

		// Eine Hüterklinge

		if (Mod_TPL_HK_Ydran == 0)
		{
			if (Npc_KnowsInfo(hero, Info_Mod_Namib_Hueterklinge))
			{
				var ocNpc her; her = Hlp_GetNpc(hero);

				if (her.focus_vob)
				{
					if (Hlp_Is_oCMob(her.focus_vob))
					{
						var oCMobContainer her_focusMob;
						MEM_AssignInst (her_focusMob, her.focus_vob);

						if (Hlp_StrCmp(her_focusMob._zCObject_objectName, "YDRANSGRAB") == TRUE)
						{
							Mod_TPL_HK_Ydran = 1;

							B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Sehr lustig. Offenbar ist Baal Ydran schon ein Weilchen tot. Ich muss wohl nochmal mit Baal Namib sprechen.");
						};
					};
				};
			};
		};

		if (Mod_TPL_HK_Ydran == 4)
		{
			if (Npc_IsDead(Shadowbeast_GorNaKosh))
			{
				Mod_TPL_HK_Ydran = 5;

				Wld_InsertNpc	(Mod_7721_OUT_Rank_MT, "MT_EREMIT_05");
			};
		};

		// Dieses unheimliche Heulen

		if (Mod_Fortuno_Sumpfmensch_Scene == 1)
		{
			if (!Npc_IsInState(Mod_2008_PSINOV_Ghorim_MT, ZS_Talk))
			{
				FortunoSumpfmensch_Scene();
			};
		};
		
		if (Mod_Darrion_Sumpfmensch == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Balor_Sumpfmensch3))
		&& (Wld_IsTime(22,00,04,00))
		&& (Npc_GetDistToNpc(hero, Mod_2014_PSINOV_Darrion_MT) < 1000) {
			Mod_Darrion_Sumpfmensch = 1;
			B_StartOtherRoutine(Mod_2014_PSINOV_Darrion_MT, "SUMPFMENSCH");
			Wld_InsertNpc(SwampGolem_Sumpfmensch_01, "PATH_TAKE_HERB_024");
		};
		
		if (Mod_Darrion_Sumpfmensch == 1)
		&& (Npc_IsInState(SwampGolem_Sumpfmensch_01, ZS_MM_Attack))
		&& (Mod_2014_PSINOV_Darrion_MT.attribute[ATR_HITPOINTS] < Mod_2014_PSINOV_Darrion_MT.attribute[ATR_HITPOINTS_MAX]) {
			Mod_Darrion_Sumpfmensch = 2;
			Npc_ClearAIQueue(Mod_2014_PSINOV_Darrion_MT);
			AI_StandUp(Mod_2014_PSINOV_Darrion_MT);
			B_StartOtherRoutine(Mod_2014_PSINOV_Darrion_MT, "KO");
		};
		
		if (Mod_Darrion_Sumpfmensch == 2)
		&& (Npc_IsDead(SwampGolem_Sumpfmensch_01)) {
			Mod_Darrion_Sumpfmensch = 3;
			
			AI_Teleport(hero, "PSI_26_HUT_IN");
			
			B_StartOtherRoutine(Mod_2014_PSINOV_Darrion_MT, "KOATHOME");
			B_StartOtherRoutine(Mod_2013_PSINOV_Joru_MT, "ATDARRION");
			
			PrintScreen ("Etwas später...", -1, YPOS_LevelUp, FONT_Screen, 2);
			Wld_PlayEffect("BLACK_SCREEN", hero, hero, 0, 0, 0, TRUE);
		};
		
		if (Mod_Darrion_Sumpfmensch == 3)
		&& (Npc_KnowsInfo(hero, Info_Mod_Eremit_Sumpfmensch2)) {
			Mod_Darrion_Sumpfmensch = 4;
			
			B_StartOtherRoutine(Mod_3001_PSINOV_Balor_MT, "ATEINGANG");
		};
		
		if (Mod_Darrion_Sumpfmensch == 4)
		&& (Npc_KnowsInfo(hero, Info_Mod_Darrion_Sumpfmensch4))
		&& (Npc_IsDead(SwampGolem_Sumpfmensch_03)) {
			Mod_Darrion_Sumpfmensch = 5;
			
			Wld_InsertNpc(SwampGolem_Sumpfmensch_04, "OW_PATH_BLOODFLY11_SPAWN01");
			Wld_InsertNpc(SwampGolem_100001_MT, "OW_PATH_BLOODFLY11_SPAWN01");
		};
		
		if (Mod_Darrion_Sumpfmensch == 5)
		&& (Npc_IsDead(SwampGolem_Sumpfmensch_04)) {
			Mod_Darrion_Sumpfmensch = 6;
			
			AI_Teleport(hero, "PSI_11_HUT_EX");
			
			B_StartOtherRoutine(Mod_2014_PSINOV_Darrion_MT, "ATJORU");
			B_StartOtherRoutine(SwampGolem_100001_MT, "ATJORU");
			
			PrintScreen ("Etwas später...", -1, YPOS_LevelUp, FONT_Screen, 2);
			Wld_PlayEffect("BLACK_SCREEN", hero, hero, 0, 0, 0, TRUE);
		};
	};

	if (Mod_Leichengase_Kraut == 0)
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_Leichengase))
		&& (!Npc_IsInState(Mod_759_NONE_Dragomir_NW, ZS_Talk))
		&& (Npc_HasItems(hero, ItMi_Sumpfkraeuter) == 1)
		&& (Npc_HasItems(hero, ItMi_Moleratlubric_MIS) >= 1)
		{
			Mod_Leichengase_Kraut = 1;

			Npc_RemoveInvItems	(hero, ItMi_Sumpfkraeuter, 1);
			Npc_RemoveInvItems	(hero, ItMi_Moleratlubric_MIS, 1);

			CreateInvItems	(hero, ItMi_Sumpfkraeuter_Molerat, 1);

			B_LogEntry	(TOPIC_MOD_SL_LEICHENGASE, "Ich habe den Beutel mit Moleratfett eingerieben. Jetzt sollte ich zur Trollschlucht im Minental gehen, um die Kräuter zu den Trollen zu bringen.");
		};
		if (Npc_KnowsInfo(hero, Info_Mod_Lobart_Leichengase3))
		&& (Npc_HasItems(hero, ItMi_Schafsmagen) == 1)
		{
			Mod_Leichengase_Kraut = 2;

			B_LogEntry	(TOPIC_MOD_SL_LEICHENGASE, "Ich habe einen mit den Kräutern gefüllten Schafsmagen. Jetzt sollte ich zur Trollschlucht im Minental gehen, um die Kräuter zu den Trollen zu bringen.");
		};
	};
};