FUNC VOID GILDENSTORY_PAL()
{
	// Pala-Story

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		if (Npc_GetDistToWP(PC_Hero, "NW_CITY_UPTOWN_HUT_04_01") < 200)
		&& (Mod_InErfinderhaus == FALSE)
		&& (Npc_KnowsInfo(hero, Info_Mod_Andre_Auftrag))
		{
			Mod_InErfinderhaus = TRUE;
		};

		if (Mod_MitLawrenceGesprochen == 1)
		&& (Npc_GetDistToWP(Mod_1730_MIL_Lawrence_NW, "NW_CITY_UPTOWN_PATH_12") < 1000)
		{
			AI_StandUp	(hero);

			AI_Output(PC_Hero, NULL, "Info_Mod_Hero_ErfinderLawrenceFollow_15_00"); //Ich sollte ihm folgen!

			Mod_MitLawrenceGesprochen = 2;
		};

		if (Mod_MitLawrenceGesprochen == 3)
		{
			if (Mod_MitLawrence_Counter == 0)
			{
				B_StartOtherRoutine	(Mod_1730_MIL_Lawrence_NW, "PLAUDERN");
				B_StartOtherRoutine	(Mod_591_NONE_Larius_NW, "PLAUDERN");

				CutsceneAn = TRUE;
			};
			if (Mod_MitLawrence_Counter == 5)
			{
				AI_Output(Mod_1730_MIL_Lawrence_NW, NULL, "Info_Mod_Lawrence_Larius_06_00"); //Das Fehlen des Erfinders ist aufgefallen! Die Miliz sucht ihn.
			};
			if (Mod_MitLawrence_Counter == 8)
			{
				AI_Output(Mod_591_NONE_Larius_NW, NULL, "Info_Mod_Lawrence_Larius_01_01"); //Verdammt. Woher weißt du das?
			};
			if (Mod_MitLawrence_Counter == 13)
			{
				AI_Output(Mod_1730_MIL_Lawrence_NW, NULL, "Info_Mod_Lawrence_Larius_06_02"); //Da war so ein Typ in seinem Haus und hat nach jemandem gesucht dessen Name mit L beginnt. Vielleicht hat er ja den Brief gefunden?
			};
			if (Mod_MitLawrence_Counter == 19)
			{
				AI_Output(Mod_591_NONE_Larius_NW, NULL, "Info_Mod_Lawrence_Larius_01_03"); //Hmm... dann werden wir vermutlich unsere Namen leicht verändern müssen.
			};
			if (Mod_MitLawrence_Counter == 24)
			{
				AI_Output(Mod_1730_MIL_Lawrence_NW, NULL, "Info_Mod_Lawrence_Larius_06_04"); //Ähm… das wird leider nicht mehr gehen…
			};
			if (Mod_MitLawrence_Counter == 26)
			{
				AI_Output(Mod_591_NONE_Larius_NW, NULL, "Info_Mod_Lawrence_Larius_01_05"); //Wieso nicht?
			};
			if (Mod_MitLawrence_Counter == 31)
			{
				AI_Output(Mod_1730_MIL_Lawrence_NW, NULL, "Info_Mod_Lawrence_Larius_06_06"); //Naja, ich hab ihm deinen, meinen und Luteros Namen genannt…
			};
			if (Mod_MitLawrence_Counter == 36)
			{
				AI_Output(Mod_591_NONE_Larius_NW, NULL, "Info_Mod_Lawrence_Larius_01_07"); //Du Idiot! Glaubst du er war schon bei Lutero?
			};
			if (Mod_MitLawrence_Counter == 41)
			{
				AI_Output(Mod_1730_MIL_Lawrence_NW, NULL, "Info_Mod_Lawrence_Larius_06_08"); //Ich weiss es nicht! Ich werde gleich zu ihm gehen und ihn warnen.
			};
			if (Mod_MitLawrence_Counter == 44)
			{
				AI_Output(Mod_591_NONE_Larius_NW, NULL, "Info_Mod_Lawrence_Larius_01_09"); //Du hast auch nur einen Kopf, damit’s dir nicht in den Hals regnet.
			};
			if (Mod_MitLawrence_Counter == 49)
			{
				AI_Output(Mod_591_NONE_Larius_NW, NULL, "Info_Mod_Lawrence_Larius_01_10"); //Wenn der Typ jetzt sieht, dass du zu Lutero gehst, dann wird er garantiert skeptisch! Leg ihm diesen Brief an den Austauschpunkt.
			};
			if (Mod_MitLawrence_Counter == 54)
			{
				AI_Output(Mod_1730_MIL_Lawrence_NW, NULL, "Info_Mod_Lawrence_Larius_06_11"); //Okay. Der Schläfer erwache!
			};
			if (Mod_MitLawrence_Counter == 56)
			{
				AI_Output(Mod_591_NONE_Larius_NW, NULL, "Info_Mod_Lawrence_Larius_01_12"); //Pssst! Der Schläfer erwache!
			};
			if (Mod_MitLawrence_Counter == 61)
			{
				AI_Output(PC_Hero, NULL, "Info_Mod_Hero_ErfinderLawrence_15_00"); //Ich sollte jetzt verschwinden! Aber ich sollte Lawrence im Auge behalten.
			};
			if (Mod_MitLawrence_Counter == 66)
			{
				AI_GotoWP	(PC_Hero, "NW_CITY_CITYHALL_01");

				B_LogEntry	(TOPIC_MOD_MILIZ_WISSENSCHAFTLER, "Es scheint ganz so, als würden die drei Personen zusammengehören. Sicherlich haben sie auch etwas mit dem Verschwinden des Erfinders zu tun. Ich sollte mich mal an Lawrence halten.");

				B_StartOtherRoutine (Mod_591_NONE_Larius_NW, "START");
				B_StartOtherRoutine (Mod_1730_MIL_Lawrence_NW, "AFTER");

				Mod_MitLawrenceGesprochen = 4;

				B_GivePlayerXP	(500);

				CutsceneAn = FALSE;
			};


			Mod_MitLawrence_Counter += 1;
		};

		if (Mod_MitLawrenceGesprochen == 4)
		&& (Npc_GetDistToWP(Mod_1730_MIL_Lawrence_NW, "NW_CITY_CITYHALL_08") < 500)
		&& (Npc_GetDistToWP(hero, "NW_CITY_CITYHALL_08") < 1000)
		{
			//AI_Wait (PC_Hero, 3);

			if (Mod_LawrenceLegtBrief == 0)
			{
				AI_PlayAni		(Mod_1730_MIL_Lawrence_NW, "T_SEARCH");
			};

			if (Mod_LawrenceLegtBrief == 5)
			{
				AI_PlayAni		(Mod_1730_MIL_Lawrence_NW, "T_PLUNDER");
			};

			if (Mod_LawrenceLegtBrief == 8)
			{
				Wld_InsertItem	(ItWr_ErfinderLawrenceFuerLutero, "FP_ERFINDER_BRIEFFUERLUTERO");

				Mod_MitLawrenceGesprochen = 5;

				B_StartOtherRoutine	(Mod_1730_MIL_Lawrence_NW, "NORMAL");
				//B_StartOtherRoutine	(Mod_594_NONE_Lutero_NW, "BRIEF");
			};

			Mod_LawrenceLegtBrief += 1;
		};

		if (Mod_MitLawrenceGesprochen == 6)
		&& (Npc_HasItems(hero, ItWr_ErfinderLawrenceFuerLutero) == 1)
		{
			Npc_RemoveInvItems	(hero, ItWr_ErfinderLawrenceFuerLutero, 1);

			Wld_InsertItem	(ItWr_ErfinderLawrenceFuerLutero, "FP_ERFINDER_BRIEFFUERLUTERO");
		};

		if (Mod_MitLawrenceGesprochen == 6)
		&& (Npc_GetDistToWP(Mod_594_NONE_Lutero_NW, "NW_CITY_CITYHALL_08") < 500)
		&& (Npc_GetDistToWP(hero, "NW_CITY_CITYHALL_08") < 1000)
		{
			//AI_Wait (PC_Hero, 3);

			if (Mod_LuteroLiestBrief == 0)
			{
				AI_PlayAni		(Mod_594_NONE_Lutero_NW, "T_PLUNDER");
			};

			if (Mod_LuteroLiestBrief == 2)
			{
				Wld_RemoveItem	(ItWr_ErfinderLawrenceFuerLutero);
			};

			if (Mod_LuteroLiestBrief == 3)
			{
				B_LogEntry	(TOPIC_MOD_MILIZ_WISSENSCHAFTLER, "Ich sollte erst mal mit Lutero sprechen, bevor ich zu diesem Treffen gehe.");

				Mod_MitLawrenceGesprochen = 7;

				B_StartOtherRoutine	(Mod_591_NONE_Larius_NW, "TREFFEN");
				B_StartOtherRoutine	(Mod_594_NONE_Lutero_NW, "TRADING");
			};

			Mod_LuteroLiestBrief += 1;
		};

		if (Mod_MitLawrenceGesprochen == 8)
		&& (Npc_IsInState(Mod_594_NONE_Lutero_NW, ZS_FleeToWP))
		{
			AI_StandUp	(hero);

			AI_Output(hero, NULL, "Info_Mod_Hero_ErfinderLutero_15_00"); //Ich sollte mich mal in der Nähe seines Handelspostens umsehen, vielleicht hat er dort eine Notiz liegen lassen.

			Wld_InsertItem	(ItWr_ErfinderLuteroNotiz, "FP_LUTEROSNOTIZ");

			B_LogEntry	(TOPIC_MOD_MILIZ_WISSENSCHAFTLER, "Hm, Lutero ist ziemlich schnell verschwunden. Ich sollte mich bei seinem Handelsposten umsehen, vielleicht finde ich dort etwas verdächtiges ...");

			Mod_MitLawrenceGesprochen = 9;
		};

		if (Mod_MitLawrenceGesprochen == 9)
		&& (Npc_GetDistToWP(PC_Hero, "NW_CITY_UPTOWN_PATH_10") < 300)
		{
			AI_GotoWP	(hero, "NW_CITY_UPTOWN_PATH_12");

			AI_StandUp	(hero);

			AI_Output(hero, NULL, "Info_Mod_Hero_ErfinderNotiz_15_00"); //Noch nicht!
		};

		if (Npc_IsDead(Mod_591_NONE_Larius_NW))
		&& (Npc_IsDead(Mod_594_NONE_Lutero_NW))
		&& (Npc_IsDead(Mod_1730_MIL_Lawrence_NW))
		&& (Mod_MitLawrenceGesprochen == 11)
		{
			Mod_MitLawrenceGesprochen = 12;

			B_LogEntry	(TOPIC_MOD_MILIZ_WISSENSCHAFTLER, "Ich habe Larius, Lawrence und Lutero getötet. Ich sollte sie durchsuchen, vielleicht hat einer von ihnen weitere Hinweise auf den Hintermann.");
		};

		if (Mod_PalaKapitel3 == 3)
		&& (Npc_GetDistToWP(hero, "NW_LIGHTHOUSE_OUT_01") < 2000)
		{
			if (Gidan_Counter == 0)
			{
				Wld_SendTrigger	("EVT_GURUGIDANWEG");

				B_StartOtherRoutine	(Mod_1723_MIL_Gidan_NW, "GURU");
				B_StartOtherRoutine	(Mod_1745_PSIGUR_Guru_NW, "GURU");

				CutsceneAn = TRUE;
			};

			if (Gidan_Counter == 5)
			{
				AI_Output(Mod_1745_PSIGUR_Guru_NW, NULL, "Info_Mod_PSIGUR_12_00"); //Ihr seid zurück, Meister?
			};

			if (Gidan_Counter == 10)
			{
				AI_Output(Mod_1723_MIL_Gidan_NW, NULL, "Info_Mod_PSIGUR_13_01"); //Ja! Es ist jetzt nicht mehr nötig, mich als Miliz auszugeben. Ich habe den Feind hierher gelockt.
			};

			if (Gidan_Counter == 15)
			{
				AI_Output(Mod_1723_MIL_Gidan_NW, NULL, "Info_Mod_PSIGUR_13_02"); //Er wird früher oder später kommen. Ihr könnt die hiesigen Lager abbrechen.
			};

			if (Gidan_Counter == 20)
			{
				AI_Output(Mod_1723_MIL_Gidan_NW, NULL, "Info_Mod_PSIGUR_13_03"); //Wir werden ihn in der Festung erwarten! Sein Blut wird es sein, dass den Schläfer wiedererweckt.
			};

			if (Gidan_Counter == 25)
			{
				AI_Output(Mod_1723_MIL_Gidan_NW, NULL, "Info_Mod_PSIGUR_13_04"); //Der Schläfer erwache!
			};

			if (Gidan_Counter == 28)
			{
				AI_Output(Mod_1745_PSIGUR_Guru_NW, NULL, "Info_Mod_PSIGUR_12_05"); //Der Schläfer erwache!
			};

			if (Gidan_Counter == 31)
			{
				B_StartOtherRoutine	(Mod_1723_MIL_Gidan_NW, "TELEPORT");
				B_StartOtherRoutine	(Mod_1745_PSIGUR_Guru_NW, "TELEPORT");
				B_StartOtherRoutine	(Mod_7392_PSITPL_Templer_NW, "TELEPORT");
				B_StartOtherRoutine	(Mod_7393_PSITPL_Templer_NW, "TELEPORT");
				B_StartOtherRoutine	(Mod_7392_PSITPL_Templer_NW, "TELEPORT");
				B_StartOtherRoutine	(Mod_7392_PSITPL_Templer_NW, "TELEPORT");
				B_StartOtherRoutine	(Mod_7392_PSITPL_Templer_NW, "TELEPORT");
			};

			if (Gidan_Counter == 36)
			{
				AI_Teleport	(Mod_1723_MIL_Gidan_NW, "TOT");
				AI_Teleport	(Mod_1745_PSIGUR_Guru_NW, "TOT");
				AI_Teleport	(Mod_7392_PSITPL_Templer_NW, "TOT");
				AI_Teleport	(Mod_7393_PSITPL_Templer_NW, "TOT");
				AI_Teleport	(Mod_7394_PSINOV_Novize_NW, "TOT");
				AI_Teleport	(Mod_7395_PSINOV_Novize_NW, "TOT");
				AI_Teleport	(Mod_7396_PSINOV_Novize_NW, "TOT");

				B_StartOtherRoutine	(Mod_1723_MIL_Gidan_NW, "TOT");
				B_StartOtherRoutine	(Mod_1745_PSIGUR_Guru_NW, "TOT");
				B_StartOtherRoutine	(Mod_7392_PSITPL_Templer_NW, "TOT");
				B_StartOtherRoutine	(Mod_7393_PSITPL_Templer_NW, "TOT");
				B_StartOtherRoutine	(Mod_7394_PSINOV_Novize_NW, "TOT");
				B_StartOtherRoutine	(Mod_7395_PSINOV_Novize_NW, "TOT");
				B_StartOtherRoutine	(Mod_7396_PSINOV_Novize_NW, "TOT");

				AI_Teleport	(Mod_1723_MIL_Gidan_NW, "TOT");
				AI_Teleport	(Mod_1745_PSIGUR_Guru_NW, "TOT");
				AI_Teleport	(Mod_7392_PSITPL_Templer_NW, "TOT");
				AI_Teleport	(Mod_7393_PSITPL_Templer_NW, "TOT");
				AI_Teleport	(Mod_7394_PSINOV_Novize_NW, "TOT");
				AI_Teleport	(Mod_7395_PSINOV_Novize_NW, "TOT");
				AI_Teleport	(Mod_7396_PSINOV_Novize_NW, "TOT");

				Mod_PalaKapitel3 = 4;

				CutsceneAn = FALSE;

				B_LogEntry	(TOPIC_MOD_MILIZ_GIDAN, "Gidan gehört zu den Fanatikern? Ich muss ihm folgen, doch ich weiß nicht, wo ihr Teleport hinging.");

				if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Gidan1))
				{
					B_LogEntry	(TOPIC_MOD_MILIZ_GIDAN, "Xardas ist sicher mit den zwei Pergamenthälften fertig. Vielleicht hilft mir das ja weiter.");
				}
				else
				{
					B_LogEntry	(TOPIC_MOD_MILIZ_GIDAN, "Vielleicht bringen mich die zwei Pergamenthälften, die ich gefunden habe, weiter. Ich sollte sehen, ob mir die nicht jemand zusammen setzen kann. Bestimmt ist ein Magier dazu fähig.");
				};
			};

			Gidan_Counter += 1;
		};

		if (FI_Story == 10)
		{
			FI_Story = 11;

			B_StartOtherRoutine	(Mod_540_PAL_Andre_NW, "KODEX");
		};

		if (FI_Story == 11)
		&& (Kapitel >= 5)
		&& (Npc_KnowsInfo(hero, Info_Mod_Andre_FIFinished))
		&& (Mod_REL_Stadthalter > 0)
		{
			FI_Story = 12;

			B_StartOtherRoutine	(Mod_1260_RIT_Neron_NW, "LATERNE");
			B_StartOtherRoutine	(Mod_744_MIL_Pablo_NW, "LATERNE");
			B_StartOtherRoutine	(Mod_1178_MIL_Jason_NW, "LATERNE");
			B_StartOtherRoutine	(Mod_7234_OUT_Giselle_NW, "LATERNE");

			B_KillNpc	(Mod_1178_MIL_Jason_NW);
		};

		if (FI_Story == 12)
		&& (Npc_KnowsInfo(hero, Info_Mod_Neron_Hi))
		&& (!Npc_KnowsInfo(hero, Info_Mod_Andre_RLMord))
		{
			Info_Mod_Andre_RLMord.description = "Neron schickt mich.";
		};

		if (Mod_PAL_Galf == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Galf_Hi))
		&& (!Npc_IsInState(Mod_7235_NONE_Galf_NW, ZS_Talk))
		{
			Mod_PAL_Galf = 1;

			PrintScreen ("Galf stürmt aus dem Zimmer", -1, YPOS_LevelUp, FONT_Screen, 2);

			Wld_PlayEffect("BLACK_SCREEN", hero, hero, 0, 0, 0, TRUE);

			AI_Teleport	(Mod_7235_NONE_Galf_NW, "NW_CITY_HABOUR_PUFF_IN_07");

			B_StartOtherRoutine	(Mod_7235_NONE_Galf_NW, "KO");

			AI_Teleport	(Mod_7235_NONE_Galf_NW, "NW_CITY_HABOUR_PUFF_IN_07");
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Guru_Gelaber))
		&& (!Npc_IsInState(Mod_7236_GUR_Guru_NW, ZS_Talk))
		&& (Mod_PAL_HeroBot == 0)
		{
			Mod_PAL_HeroBot = 1;

			Npc_SetTarget	(HeroBot_NW, Mod_7236_GUR_Guru_NW);
			Npc_GetTarget	(HeroBot_NW);

			AI_StartState	(HeroBot_NW, ZS_Attack, 0, "");
		};

		if (Mod_PAL_GiselleKerze == 1)
		&& (!Npc_IsInState(Mod_7234_OUT_Giselle_NW, ZS_Talk))
		{
			Mod_PAL_GiselleKerze = 2;

			Wld_SendTrigger	("EVT_KERZE_GISELLE");
		};

		// Die Falle

		if (Mod_PAL_GangsterArmor == 1)
		&& (Npc_GetDistToWP(hero, "MARKT") < 500)
		&& (Mod_PAL_HeroBotFollow == 0)
		{
			B_StartOtherRoutine	(HeroBot_NW, "FOLLOW");

			AI_Teleport	(HeroBot_NW, "MARKT");

			Mod_PAL_HeroBotFollow = 1;
		};

		if (Mod_PAL_HeroBotFollow == 1)
		&& (Npc_GetDistToNpc(hero, HeroBot_NW) > 4000)
		{
			Mod_PAL_HeroBotFollow = 0;

			B_StartOtherRoutine	(HeroBot_NW, "TOT");

			PrintScreen ("Der Roboter hat dich verloren!", -1, YPOS_LevelUp, FONT_Screen, 2);
		};

		if (Mod_PAL_HeroBot == 17)
		&& ((Npc_KnowsInfo(hero, Info_Mod_Lukas_Andre))
		|| (Npc_KnowsInfo(hero, Info_Mod_Wendel_Andre))
		|| (Npc_KnowsInfo(hero, Info_Mod_Theodorus_Andre)))
		{
			Mod_PAL_HeroBot = 18;

			Mob_CreateItems	("ANDRETRUHE", ItPo_Health_03, 5);
			Mob_CreateItems	("ANDRETRUHE", ItPo_Mana_03, 3);
			Mob_CreateItems	("ANDRETRUHE", ItWr_Milizregeln, 1);

			B_RemoveNpc	(Mod_540_PAL_Andre_NW);
			B_RemoveNpc	(HeroBot_NW);
		};

		if (Mod_PAL_MikaHehler == 0)
		{
			if (Npc_KnowsInfo(hero, Info_Mod_Mika_AndreVermaechtnis))
			&& (!Npc_IsInState(Mod_598_MIL_Mika_NW, ZS_Talk))
			{
				Mod_PAL_MikaHehler = 1;

				B_StartOtherRoutine	(Mod_598_MIL_Mika_NW, "FLUCHT");
				B_StartOtherRoutine	(Mod_587_NONE_Jesper_NW, "FLUCHT");
			};
		};

		if (Mod_PAL_MikaHehler == 1)
		&& (!Npc_KnowsInfo(hero, Info_Mod_Mika_AndreVermaechtnis2))
		{
			if (Npc_GetDistToNpc(hero, Mod_598_MIL_Mika_NW) >= 4000)
			|| (Npc_GetDistToNpc(hero, Mod_587_NONE_Jesper_NW) >= 4000)
			{
				Mod_PAL_MikaHehler = 2;

				B_RemoveNpc	(Mod_598_MIL_Mika_NW);
				B_RemoveNpc	(Mod_587_NONE_Jesper_NW);
			};
		};

		if (Mod_PAL_Diebesgilde_Aktion == 0)
		{
			if (Npc_KnowsInfo(hero, Info_Mod_Cassia_AndreVermaechtnis))
			&& (!Npc_IsInState(Mod_568_NONE_Cassia_NW, ZS_Talk))
			{
				Mod_PAL_Diebesgilde_Aktion = 1;

				B_StartOtherRoutine	(Mod_755_MIL_Wambo_NW, "DIEB2");
				B_StartOtherRoutine	(Mod_744_MIL_Pablo_NW, "DIEB2");
				B_StartOtherRoutine	(Mod_564_MIL_Boltan_NW, "DIEB2");
				B_StartOtherRoutine	(Mod_596_MIL_Martin_NW, "DIEB2");

				Mod_746_NONE_Ramirez_NW.guild = GIL_STRF;
				Npc_SetTrueGuild (Mod_746_NONE_Ramirez_NW, GIL_STRF);

				Mod_748_NONE_Rengaru_NW.guild = GIL_STRF;
				Npc_SetTrueGuild (Mod_748_NONE_Rengaru_NW, GIL_STRF);

				Mod_568_NONE_Cassia_NW.guild = GIL_STRF;
				Npc_SetTrueGuild (Mod_568_NONE_Cassia_NW, GIL_STRF);
			};
		};

		if (Mod_PAL_Diebesgilde == 0)
		{
			if (Npc_IsDead(Mod_746_NONE_Ramirez_NW))
			&& (Npc_IsDead(Mod_748_NONE_Rengaru_NW))
			&& (Npc_IsDead(Mod_568_NONE_Cassia_NW))
			{
				Mod_PAL_Diebesgilde = 1;
			};
		};

		if (Mod_PAL_Grim == 0)
		{
			if (Npc_KnowsInfo(hero, Info_Mod_Grim_NW_Hi))
			{
				if (!Npc_IsInState(Mod_7686_BUD_Grim_NW, ZS_Talk))
				{
					CreateInvItems	(Mod_7686_BUD_Grim_NW, ItAr_Dementor, 1);

					AI_UnequipArmor (Mod_7686_BUD_Grim_NW);

					AI_EquipArmor	(Mod_7686_BUD_Grim_NW, ItAr_Dementor);

					CreateInvItems	(Mod_7687_GRD_Gardist_NW, ItAr_Dementor, 1);

					AI_UnequipArmor (Mod_7687_GRD_Gardist_NW);

					AI_EquipArmor	(Mod_7687_GRD_Gardist_NW, ItAr_Dementor);

					CreateInvItems	(Mod_7688_STT_Schatten_NW, ItAr_Dementor, 1);

					AI_UnequipArmor (Mod_7688_STT_Schatten_NW);

					AI_EquipArmor	(Mod_7688_STT_Schatten_NW, ItAr_Dementor);

					CreateInvItems	(Mod_7689_BUD_Buddler_NW, ItAr_Dementor, 1);

					AI_UnequipArmor (Mod_7689_BUD_Buddler_NW);

					AI_EquipArmor	(Mod_7689_BUD_Buddler_NW, ItAr_Dementor);

					CreateInvItems	(Mod_7690_STT_Schatten_NW, ItAr_Dementor, 1);

					AI_UnequipArmor (Mod_7690_STT_Schatten_NW);

					AI_EquipArmor	(Mod_7690_STT_Schatten_NW, ItAr_Dementor);

					CreateInvItems	(Mod_7691_BUD_Buddler_NW, ItAr_Dementor, 1);

					AI_UnequipArmor (Mod_7691_BUD_Buddler_NW);

					AI_EquipArmor	(Mod_7691_BUD_Buddler_NW, ItAr_Dementor);

					Mod_PAL_Grim = 1;
				};
			};
		};
	};

	if (CurrentLevel == FLIEGENDEINSEL_ZEN)
	{
		if (Mod_FI_Quest == FALSE)
		{
			Log_CreateTopic	(TOPIC_MOD_PAL_FI, LOG_MISSION);
			B_SetTopicStatus	(TOPIC_MOD_PAL_FI, LOG_RUNNING);
			B_LogEntry	(TOPIC_MOD_PAL_FI, "Ich bin auf einer fliegenden Insel gelandet. Ich sollte dem Weg folgen und sehen, wohin er mich führt.");

			Mod_FI_Quest = TRUE;
		};

		if (FI_Story == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Gidan_FI_Hi))
		&& (!Npc_IsInState(Mod_1974_MIL_Gidan_FI, ZS_Talk))
		{
			FI_Story = 1;

			Wld_InsertNpc	(Erzgolem_01, "FI_56");
			Wld_InsertNpc	(Erzgolem_02, "FI_55");
			Wld_InsertNpc	(Erzgolem_03, "FI_54");
			Wld_InsertNpc	(Erzgolem_04, "FI_52");
		};

		if (FI_Story == 1)
		&& (Npc_IsDead(Erzgolem_01))
		&& (Npc_IsDead(Erzgolem_02))
		&& (Npc_IsDead(Erzgolem_03))
		&& (Npc_IsDead(Erzgolem_04))
		{
			FI_Story = 2;

			B_StartOtherRoutine	(Mod_1974_MIL_Gidan_FI, "START");
		};

		if (FI_Story == 2)
		&& (Npc_KnowsInfo(hero, Info_Mod_Gidan_FI_FirstWaveDead))
		&& (!Npc_IsInState(Mod_1974_MIL_Gidan_FI, ZS_Talk))
		{
			FI_Story = 3;

			Wld_InsertNpc	(Erzgolem_05, "FI_56");
			Wld_InsertNpc	(Erzgolem_06, "FI_55");
			Wld_InsertNpc	(Erzgolem_07, "FI_54");
			Wld_InsertNpc	(Erzgolem_08, "FI_52");

			Wld_InsertNpc	(Mod_1975_PSITPL_Templer_FI, "FI_57");
			Wld_InsertNpc	(Mod_1976_PSITPL_Templer_FI, "FI_57");
			Wld_InsertNpc	(Mod_1977_PSITPL_Templer_FI, "FI_57");
			Wld_InsertNpc	(Mod_1978_PSITPL_Templer_FI, "FI_57");
			Wld_InsertNpc	(Mod_1979_PSIGUR_Guru_FI, "FI_57");
			Wld_InsertNpc	(Mod_1980_PSIGUR_Guru_FI, "FI_57");
		};

		if (FI_Story == 3)
		&& (Npc_IsDead(Erzgolem_05))
		&& (Npc_IsDead(Erzgolem_06))
		&& (Npc_IsDead(Erzgolem_07))
		&& (Npc_IsDead(Erzgolem_08))
		&& (Npc_IsDead(Mod_1975_PSITPL_Templer_FI))
		&& (Npc_IsDead(Mod_1976_PSITPL_Templer_FI))
		&& (Npc_IsDead(Mod_1977_PSITPL_Templer_FI))
		&& (Npc_IsDead(Mod_1978_PSITPL_Templer_FI))
		&& (Npc_IsDead(Mod_1979_PSIGUR_Guru_FI))
		&& (Npc_IsDead(Mod_1980_PSIGUR_Guru_FI))
		{
			FI_Story = 4;

			B_StartOtherRoutine	(Mod_1974_MIL_Gidan_FI, "START");
		};

		if (FI_Story == 4)
		&& (Npc_KnowsInfo(hero, Info_Mod_Gidan_FI_SecondWaveDead))
		&& (!Npc_IsInState(Mod_1974_MIL_Gidan_FI, ZS_Talk))
		{
			FI_Story = 5;

			Wld_InsertNpc	(Mod_1982_PSITPL_Templer_FI, "FI_57");
			Wld_InsertNpc	(Mod_1983_PSITPL_Templer_FI, "FI_57");
			Wld_InsertNpc	(Mod_1984_PSITPL_Templer_FI, "FI_57");
			Wld_InsertNpc	(Mod_1985_PSITPL_Templer_FI, "FI_57");
			Wld_InsertNpc	(Mod_1986_PSIGUR_Guru_FI, "FI_57");
			Wld_InsertNpc	(Mod_1987_PSIGUR_Guru_FI, "FI_57");
			Wld_InsertNpc	(Mod_1988_PSIGUR_Guru_FI, "FI_57");

			B_StartOtherRoutine	(Mod_1974_MIL_Gidan_FI, "REDE");
		};

		if (FI_Story == 5)
		&& (Npc_GetDistToWP(Mod_1981_Kolam_FI, "FI_59") < 200)
		&& (Npc_GetDistToWP(Mod_1974_MIL_Gidan_FI, "FI_58") < 200)
		{
			Wld_SendTrigger	("REDE_01");

			CutsceneAn = TRUE;

			AI_GotoWP	(hero, "FI_75");

			FI_Story = 6;
		};

		if (FI_Story == 6)
		{
			if (FI_Rede == 0)
			{
				AI_TurnToNpc	(Kolam, hero);
				AI_TurnToNpc	(Gidan_FI, Kolam);
				AI_TurnToNpc	(hero, Kolam);

				AI_Output(Kolam, NULL, "Info_Mod_FI_Rede_03_00"); //Da bist du ja!
			};

			if (FI_Rede == 5)
			{
				AI_Output(Gidan_FI, NULL, "Info_Mod_FI_Rede_13_01"); //Onkel!
			};

			if (FI_Rede == 10)
			{
				AI_TurnToNpc	(Kolam, Gidan_FI);

				AI_Output(Kolam, NULL, "Info_Mod_FI_Rede_03_02"); //Schweig! Ich begrüße gerade unseren Gast.
			};

			if (FI_Rede == 15)
			{
				AI_Output(Gidan_FI, NULL, "Info_Mod_FI_Rede_13_03"); //Lass ihn uns töten! Mit seinem Blut können wir den Schläfer endlich wiedererwecken!
			};

			if (FI_Rede == 20)
			{
				AI_Output(Kolam, NULL, "Info_Mod_FI_Rede_03_04"); //(lacht) Den Schläfer? SIEH IN DIR AN!
			};

			if (FI_Rede == 23)
			{
				Wld_InsertNpc	(Sleeper, "FI_50");

				AI_Teleport	(Sleeper, "FI_50");
			};

			if (FI_Rede == 25)
			{
				AI_TurnToNpc	(Gidan_FI, Sleeper);
				AI_TurnToNpc	(hero, Sleeper);

				Wld_SendTrigger	("REDE_02");

				B_StartOtherRoutine	(Mod_1982_PSITPL_Templer_FI, "SLEEPER");
				B_StartOtherRoutine	(Mod_1983_PSITPL_Templer_FI, "SLEEPER");
				B_StartOtherRoutine	(Mod_1984_PSITPL_Templer_FI, "SLEEPER");
				B_StartOtherRoutine	(Mod_1985_PSITPL_Templer_FI, "SLEEPER");
				B_StartOtherRoutine	(Mod_1986_PSIGUR_Guru_FI, "SLEEPER");
				B_StartOtherRoutine	(Mod_1987_PSIGUR_Guru_FI, "SLEEPER");
				B_StartOtherRoutine	(Mod_1988_PSIGUR_Guru_FI, "SLEEPER");
			};

			if (FI_Rede == 35)
			{
				Wld_SendTrigger	("REDE_03");

				AI_TurnToNpc	(Gidan_FI, Kolam);
				AI_TurnToNpc	(hero, Kolam);

				AI_Output(Gidan_FI, NULL, "Info_Mod_FI_Rede_13_05"); //Wie ... Wie ... Wie ist das möglich? Der Schläfer ist zu uns zurückgekehrt? Heil dem Schläfer!
			};

			if (FI_Rede == 40)
			{
				AI_TurnToNpc	(Kolam, Gidan_FI);

				AI_Output(Kolam, NULL, "Info_Mod_FI_Rede_03_06"); //Halt's Maul!
			};

			if (FI_Rede == 45)
			{
				AI_Output(Gidan_FI, NULL, "Info_Mod_FI_Rede_13_07"); //Was?
			};

			if (FI_Rede == 50)
			{
				AI_Output(Kolam, NULL, "Info_Mod_FI_Rede_03_08"); //Dass du Idiot deinen eigenen "Gott" nicht erkennst!
			};

			if (FI_Rede == 55)
			{
				AI_Output(Gidan_FI, NULL, "Info_Mod_FI_Rede_13_09"); //Wie meinst du das?
			};

			if (FI_Rede == 60)
			{
				AI_Output(Kolam, NULL, "Info_Mod_FI_Rede_03_10"); //Das ist nur ein Roboter! Aber durch ihn konnte ich all diese dummen Sektenspinner kontrollieren!
			};

			if (FI_Rede == 65)
			{
				AI_Output(Kolam, NULL, "Info_Mod_FI_Rede_03_11"); //Allerdings brauch ich die jetzt nicht mehr.
			};

			if (FI_Rede == 70)
			{
				Wld_SendTrigger	("REDE_04");
			};

			if (FI_Rede == 72)
			{
				Wld_SendTrigger	("REDE_05");

				AI_Output(Gidan_FI, NULL, "Info_Mod_FI_Rede_13_12"); //Was soll das? Willst du denn den Schläfer nicht wiedererwecken?
			};

			if (FI_Rede == 77)
			{
				AI_Output(Kolam, NULL, "Info_Mod_FI_Rede_03_13"); //Du verstehst es nicht oder? Man kann den Schläfer nicht wiedererwecken. Er wurde verbannt! Der einzige der das könnte ist Beliar selbst!
			};

			if (FI_Rede == 82)
			{
				AI_Output(Kolam, NULL, "Info_Mod_FI_Rede_03_14"); //Was du vor dir siehst ist ein Roboter!
			};

			if (FI_Rede == 87)
			{
				AI_Output(Gidan_FI, NULL, "Info_Mod_FI_Rede_13_15"); //Ein Roboter ...? Dann hat der Erfinder ihn dir gebaut?
			};

			if (FI_Rede == 92)
			{
				AI_Output(Kolam, NULL, "Info_Mod_FI_Rede_03_16"); //Haha ganz recht, der ominöse Erfinder.
			};

			if (FI_Rede == 97)
			{
				AI_Output(Gidan_FI, NULL, "Info_Mod_FI_Rede_13_17"); //Also hast das alles nur ... inszeniert?
			};

			if (FI_Rede == 102)
			{
				AI_Output(Kolam, NULL, "Info_Mod_FI_Rede_03_18"); //Ja! Du bist doch genauso verrückt wie mein fehlgeleiteter Bruder!
			};

			if (FI_Rede == 107)
			{
				AI_Output(Gidan_FI, NULL, "Info_Mod_FI_Rede_13_19"); //Aber ... Aber ...
			};

			if (FI_Rede == 112)
			{
				AI_Output(Kolam, NULL, "Info_Mod_FI_Rede_03_20"); //Stotter hier nicht rum!
			};

			if (FI_Rede == 117)
			{
				AI_Output(Gidan_FI, NULL, "Info_Mod_FI_Rede_13_21"); //Aber Onkel! Du hast gesagt du willst den Tod meines Vaters, deines Bruders rächen und uns den Schläfer wiedergeben!
			};

			if (FI_Rede == 122)
			{
				AI_Output(Kolam, NULL, "Info_Mod_FI_Rede_03_22"); //Da hast du deinen Schläfer, du Idiot. SCHLÄFER1.0 ANGRIFF INITIALISIEREN!

				B_Attack	(Sleeper, Gidan_FI, AR_None, 0);
			};

			if (FI_Rede == 125)
			{
				FI_Story = 7;

				CutsceneAn = FALSE;
			};

			FI_Rede += 1;
		};

		if (FI_Story == 7)
		&& (NpC_KnowsInfo(hero, Info_Mod_Kolam_Hi))
		&& (!Npc_IsInState(Mod_1981_Kolam_FI, ZS_Talk))
		{
			B_Attack	(Sleeper, hero, AR_Kill, 0);

			FI_Story = 8;
		};

		if (Mod_Sleeper_01 == 1)
		&& (Mod_Sleeper_02 == 1)
		&& (Mod_Sleeper_03 == 1)
		&& (FI_Story == 8)
		{
			if (!Npc_IsDead(Sleeper))
			{
				B_MagicHurtNpc	(hero, Sleeper, 999999);
			};

			AI_Teleport	(hero, "FI_82");

			AI_Teleport	(Mod_1981_Kolam_FI, "FI_81");

			B_StartOtherRoutine	(Mod_1981_Kolam_FI, "ENDE");
			Wld_InsertNpc	(HeroBot_FI, "FI_83");

			AI_Teleport	(Mod_1981_Kolam_FI, "FI_81");

			FI_Story = 9;
		};

		if (FI_Story == 9)
		&& (NpC_KnowsInfo(hero, Info_Mod_Kolam_SleeperDead))
		&& (!Npc_IsInState(Mod_1981_Kolam_FI, ZS_Talk))
		{
			PrintScreen ("Gidan stürmt heran und stürzt zusammen mit Cor Kolam und dem Helden-Bot über die Klippe", -1, YPOS_LevelUp, FONT_Screen, 2);

			Wld_PlayEffect("BLACK_SCREEN", hero, hero, 0, 0, 0, TRUE);

			AI_Teleport	(HeroBot_FI, "TOT");
			AI_Teleport	(Mod_1974_MIL_Gidan_FI, "TOT");
			AI_Teleport	(Mod_1981_Kolam_FI, "TOT");

			B_StartOtherRoutine	(Mod_1981_Kolam_FI, "TOT");
			B_StartOtherRoutine	(HeroBot_FI, "TOT");
			B_StartOtherRoutine	(Mod_1974_MIL_Gidan_FI, "TOT");

			AI_Teleport	(HeroBot_FI, "TOT");
			AI_Teleport	(Mod_1974_MIL_Gidan_FI, "TOT");
			AI_Teleport	(Mod_1981_Kolam_FI, "TOT");

			FI_Story = 10;

			CreateInvItems	(hero, ItWr_SektisTeleport3, 1);

			PrintScreen ("Teleport-Spruchrolle erhalten", -1, -1, FONT_Screen, 2);

			B_LogEntry	(TOPIC_MOD_PAL_FI, "Gidan hat sich geopfert und Cor Kolam und den Helden-Bot mit in die Tiefe gerissen. Ich sollte jetzt zurück nach Khorinis gehen und Lord Andre informieren. Vielleicht funktioniert die Spruchrolle, die mich hierher gebracht hat, auch wieder zurück?");
		};
	};

	if (CurrentLevel == RELENDEL_ZEN)
	{
		if (Mod_PAL_HeroBotFollow == 1)
		&& (Mod_PAL_HeroBot == 3)
		{
			Wld_InsertNpc	(HeroBot_REL, "REL_005");
			Wld_InsertNpc	(Mod_7240_PAL_Andre_REL, "REL_CITY_085");

			Mod_PAL_HeroBotFollow = 2;
			Mod_PAL_HeroBot = 4;
		};

		if (Mod_PAL_HeroBotFollow == 2)
		&& (Npc_GetDistToWP(hero, "REL_CITY_002") < 1000)
		&& (Mod_PAL_HeroBot == 4)
		{
			Mod_PAL_HeroBot = 5;

			B_StartOtherRoutine	(HeroBot_REL, "WAIT");
		};

		if (Mod_PAL_HeroBot == 5)
		&& (Npc_GetDistToWP(hero, "REL_CITY_085") < 300)
		{
			Npc_ClearAIQueue(Mod_7240_PAL_Andre_REL);
			AI_StandUp(Mod_7240_PAL_Andre_REL);
			B_Attack	(Mod_7240_PAL_Andre_REL, hero, AR_None, 0);

			Mod_PAL_HeroBot = 6;

			var int mvrPtr; mvrPtr = MEM_SearchVobByName("EVT_OFENKLAPPEN");
			var zCMover mvr; mvr = MEM_PtrToInst(mvrPtr);
			if (mvr.actKeyframe == 0) {
				Wld_SendTrigger	("EVT_OFENKLAPPEN");
			};

			Mdl_RemoveOverlayMDS	(hero, "HUMANS_SPRINT.MDS");
		};

		if (Mod_PAL_HeroBot == 7)
		&& (C_NpcIsDown(hero))
		{
			AI_TurnToNpc	(Mod_7240_PAL_Andre_REL, hero);

			AI_UnequipArmor	(hero);
			B_GiveInvItems	(hero, Mod_7240_PAL_Andre_REL, ItAr_Gangster, 1);
			AI_EquipArmor	(Mod_7240_PAL_Andre_REL, ItAr_Gangster);

			Mod_PAL_HeroBot = 8;
		};

		if (Mod_PAL_HeroBot == 6)
		&& (C_NpcIsDown(hero))
		{
			AI_TurnToNpc	(Mod_7240_PAL_Andre_REL, hero);

			AI_UnequipArmor	(Mod_7240_PAL_Andre_REL);
			B_GiveInvItems	(Mod_7240_PAL_Andre_REL, hero, ItAr_PAL_H, 1);

			Mod_PAL_HeroBot = 7;
		};

		if (Mod_PAL_HeroBot == 8)
		{
			AI_TurnToNpc	(Mod_7240_PAL_Andre_REL, hero);

			AI_Output(Mod_7240_PAL_Andre_REL, NULL, "Info_Mod_Andre_REL_Sorry_40_00"); //Tut mir leid, Junge, das mit dem Ausgang hat nicht wirklich funktioniert.

			Mod_PAL_HeroBot = 9;
		};

		if (Mod_PAL_HeroBot >= 9)
		&& (Mod_PAL_HeroBot < 14)
		{
			Mod_PAL_HeroBot += 1;
		};

		if (Mod_PAL_HeroBot == 14)
		{
			B_StartOtherRoutine	(Mod_7240_PAL_Andre_REL, "OFEN");
			B_StartOtherRoutine	(HeroBot_REL, "OFEN");

			AI_Teleport	(HeroBot_REL, "REL_CITY_043");

			AI_StopProcessInfos	(hero);

			Mod_PAL_HeroBot = 15;
		};

		if (Mod_PAL_HeroBot == 15)
		&& (Npc_GetDistToWP(HeroBot_REL, "REL_CITY_338") < 250)
		&& (Npc_GetDistToWP(Mod_7240_PAL_Andre_REL, "REL_CITY_338") < 250)
		{
			Wld_PlayEffect	("spellFX_Firestorm_SPREAD", Mod_7240_PAL_Andre_REL, Mod_7240_PAL_Andre_REL, 0, 0, 0, FALSE);

			B_RemoveNpc	(Mod_7240_PAL_Andre_REL);
			B_RemoveNpc	(HeroBot_REL);

			Wld_SendTrigger	("EVT_OFENKLAPPEN");

			Mod_PAL_HeroBot = 16;

			if (Mod_REL_Stadthalter == 1)
			{
				B_StartOtherRoutine	(Mod_7382_OUT_Theodorus_REL,	"ANDRE");
			}
			else if (Mod_REL_Stadthalter == 2)
			{
				B_StartOtherRoutine	(Mod_7480_OUT_Wendel_REL,	"ANDRE");
			}
			else
			{
				B_StartOtherRoutine	(Mod_7516_OUT_Lukas_REL,	"ANDRE");
			};
		};

		if (Mod_PAL_HeroBot == 16)
		{
			Wld_PlayEffect("BLACK_SCREEN", hero, hero, 0, 0, 0, TRUE);

			AI_Teleport	(hero, "REL_CITY_028");

			Wld_SetTime	(32,00);

			Mod_PAL_HeroBot = 17;
		};
	};

	if (CurrentLevel == MINENTAL_ZEN)
	{
		if (Mod_Kap4_KGOrks == 1)
		{
			if (Npc_KnowsInfo(hero, Info_Mod_Hymir_Treue3))
			&& (!Npc_IsInState(Mod_1016_KGD_Hymir_MT, ZS_Talk))
			{
				AI_Teleport	(Mod_1016_KGD_Hymir_MT, "TOT");
				B_StartOtherRoutine	(Mod_1016_KGD_Hymir_MT, "TOT");
				AI_Teleport	(Mod_1016_KGD_Hymir_MT, "TOT");

				AI_Teleport	(Mod_7698_PAL_Hagen_MT, "TOT");
				B_StartOtherRoutine	(Mod_7698_PAL_Hagen_MT, "TOT");
				AI_Teleport	(Mod_7698_PAL_Hagen_MT, "TOT");

				B_RemoveNpc	(Mod_7698_PAL_Hagen_MT);

				Mod_Kap4_KGOrks = 2;
			};
		};
	};
};