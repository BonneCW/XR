var int Mod_Bloodwyn_GuidePlayertoBartholo;
var int Mod_TriggerCloseALGate;
var int Mod_TriggerOpenOMGate;

FUNC VOID GILDENSTORY_AL()
{
	if (CurrentLevel == MINENTAL_ZEN)
	{
		// Altes Lager
		if (Npc_IsInState(Mod_1871_TPL_GorKaranto_MT, ZS_Attack))
		&& (Npc_IsInState(Mod_1872_NONE_Unbekannt_MT, ZS_Attack))
		&& (Npc_KnowsInfo(PC_Hero, Info_Mod_Scatty_ArenaFight))
		&& (Mod_GorKarantoSchwach == FALSE)
		{
			if (Mod_1872_NONE_Unbekannt_MT.attribute[ATR_HITPOINTS] <= (Mod_1872_NONE_Unbekannt_MT.attribute[ATR_HITPOINTS_MAX] / 2))
			{
				Mod_1871_TPL_GorKaranto_MT.attribute[ATR_HITPOINTS] = 1;

				Mod_1871_TPL_GorKaranto_MT.aivar[AIV_Damage] = 1;

				Mod_1872_NONE_Unbekannt_MT.flags = 2;

				Mod_GorKarantoSchwach = 1;

				B_StartOtherRoutine	(Mod_7384_OUT_Dragan_MT, "START");
			};
		};

		if (Mod_Unbekannter_Fight == 1)
		&& (Mod_GorKarantoSchwach == 3)
		{
			if (Mod_1872_NONE_Unbekannt_MT.attribute[ATR_HITPOINTS] <= (Mod_1872_NONE_Unbekannt_MT.attribute[ATR_HITPOINTS_MAX] / 2))
			{
				hero.attribute[ATR_HITPOINTS] = 2;

				hero.aivar[AIV_Damage] = 2;

				Mod_1872_NONE_Unbekannt_MT.flags = 2;

				B_LogEntry	(TOPIC_MOD_AL_ARENA, "Er hat auch micht besiegt, aber aus unerfindlichen Gründen wurde ich ziemlich rasch schwächer. Ich glaube, das berichte ich erst mal Thorus.");

				Mod_GorKarantoSchwach = 5;

				B_StartOtherRoutine	(self, "START");

				B_StartOtherRoutine	(Mod_7384_OUT_Dragan_MT, "START");

				Mod_Unbekannter_Fight = 0;
			};
			if (C_NpcIsDown(hero))
			{
				Mod_Unbekannter_Fight = 0;
			};
		};

		if (Mod_Unbekannter_Fight == 1)
		&& (Mod_GorKarantoSchwach == 8)
		{
			if (Mod_1872_NONE_Unbekannt_MT.attribute[ATR_HITPOINTS] == 1)
			{
				Mod_GorKarantoSchwach = 9;
			};
			if (C_NpcIsDown(hero))
			{
				Mod_Unbekannter_Fight = 0;
			};
		};

		if (Mod_GorKarantoSchwach == 9)
		&& (!C_NpcIsDown(Mod_1872_NONE_Unbekannt_MT))
		{
			B_StartOtherRoutine	(Mod_1872_NONE_Unbekannt_MT, "FLUCHT");
			B_StartOtherRoutine	(Mod_7384_OUT_Dragan_MT, "FLUCHT");

			B_LogEntry	(TOPIC_MOD_AL_ARENA, "Ich habe Paran in der Arena besiegt. Er ist abgehauen und wird keinen Ärger mehr machen.");

			Mod_GorKarantoSchwach = 10;
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Thorus_OrikDabei))
		&& (Mod_TemplerBeiThorus == 0)
		&& (Wld_GetDay() > Mod_OrikAbgeliefert)
		&& (Kapitel >= 2)
		{
			Mod_TemplerBeiThorus = 1;

			B_StartOtherRoutine	(Mod_966_GRD_Thorus_MT, "TEMPLER");
			B_StartOtherRoutine	(Mod_1873_TPL_GorNaKosh_MT, "TEMPLER");
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Templer))
		&& (Npc_GetDistToWP(hero, "OCC_CELLAR_BACK_LEFT_CELL") < 750)
		&& (Mod_TemplerBeiThorus == 1)
		{
			Wld_SendTrigger	("EVT_KERKERGATE_01");

			B_LogEntry	(TOPIC_MOD_AL_SCHMUGGLER, "Cutter ist tot. Ich sollte Thorus davon berichten.");

			Wld_InsertItem(ItSc_TrfRabbit, "FP_ITEM_TRFSCROLL_CUTTER");

			Mod_TemplerBeiThorus = 2;
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Thorus_CutterTot))
		&& (Npc_GetDistToWP(hero, "OCC_BARONS_DOOR") < 200)
		&& (Mod_TemplerBeiThorus == 2)
		{
			Wld_SendTrigger	("EVT_AL_PFEILNACHRICHT");

			Mod_TemplerBeiThorus = 3;
		};

		if (Npc_GetDistToWP(hero, "WP_MT_AL_HEROLERNTFLIEGEN") < 200)
		&& (Mod_TemplerBeiThorus == 4)
		{
			B_StartOtherRoutine	(Mod_1106_EBR_Bartholo_MT, "BURGFRIED");
			Npc_ClearAIQueue	(Mod_1106_EBR_Bartholo_MT);
			AI_Teleport	(Mod_1106_EBR_Bartholo_MT, "WP_MT_AL_BARTHOLO_ATTACK");

			Mod_TemplerBeiThorus = 5;
		};

		if (Mod_TemplerBeiThorus == 6)
		&& (!Npc_IsInState(Mod_1106_EBR_Bartholo_MT, ZS_Talk))
		{
			Mod_HeroFliegtAL += 1;

			if (Mod_HeroFliegtAL == 6)
			{
				Wld_PlayEffect("BLACK_SCREEN", hero, hero, 0, 0, 0, TRUE);

				Wld_InsertNpc	(Mod_1874_HMG_Makanius_MT, "OCC_MERCS_RIGHT_ROOM_BACK");
			};

			if (Mod_HeroFliegtAL == 7)
			{
				Mod_TemplerBeiThorus = 7;

				Npc_ClearAIQueue (hero);
				AI_StandUp	(hero);

				AI_Teleport	(hero, "OCC_MERCS_RIGHT_ROOM_BACK");

				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

				hero.aivar[AIV_Damage] = hero.attribute[ATR_HITPOINTS_MAX];
			};

			if (Mod_HeroFliegtAL > 7)
			&& (Npc_GetDistToWP(hero, "OCC_MERCS_RIGHT_ROOM_BACK") > 300)
			&& (!Npc_KnowsInfo(hero, Info_Mod_Makanius_Hi))
			{
				Npc_ClearAIQueue (hero);
				AI_StandUp	(hero);

				AI_Teleport	(hero, "OCC_MERCS_RIGHT_ROOM_BACK");
			};
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Dexter_Plan))
		&& (Mod_LocktGardistZuDexter == 0)
		&& (Npc_IsInState(Mod_1882_GRD_Gardist_MT, ZS_Attack))
		&& (Npc_GetDistToNpc(Mod_1882_GRD_Gardist_MT, Mod_761_BDT_Dexter_MT) < 300)
		{
			Mod_LocktGardistZuDexter = 1;

			B_StartOtherRoutine	(Mod_1882_GRD_Gardist_MT, "DEXTER");
		};

		if (Mod_AufstellungAktiviert == 1)
		{
			if (Mod_GespraechCounter_BB == 0)
			{
				Wld_SendTrigger	("BARTHOLOBLOODWYNPLAUDERN");

				CutsceneAn = TRUE;

				AI_Output(Mod_1876_EBR_Bloodwyn_MT, NULL, "Info_Mod_Bloodwyn_Bartholo_Plan_04_00"); //Ich habe das Gefühl, dass uns Alissandro gefährlich werden könnte.
			};

			if (Mod_GespraechCounter_BB == 5)
			{
				AI_Output(Mod_1876_EBR_Bloodwyn_MT, NULL, "Info_Mod_Bloodwyn_Bartholo_Plan_04_01"); //Wir wissen nicht, wo er sich versteckt hält oder wer mit ihm zusammenarbeitet.
			};

			if (Mod_GespraechCounter_BB == 10)
			{
				AI_Output(Mod_1106_EBR_Bartholo_MT, NULL, "Info_Mod_Bloodwyn_Bartholo_Plan_03_02"); //Es gibt keinen Grund beunruhigt zu sein. Wir sind gut bewacht uns sie kennen die Stellungen der Gardisten nicht.
			};

			if (Mod_GespraechCounter_BB == 15)
			{
				AI_Output(Mod_1876_EBR_Bloodwyn_MT, NULL, "Info_Mod_Bloodwyn_Bartholo_Plan_04_03"); //Die kennen meine Männer auch nicht. wenn wir diese Stellungen nicht auch bald einnehmen, hilft uns der Plan nichts.
			};

			if (Mod_GespraechCounter_BB == 22)
			{
				AI_Output(Mod_1106_EBR_Bartholo_MT, NULL, "Info_Mod_Bloodwyn_Bartholo_Plan_03_04"); //Ich kann dir den Plan geben, es wird wohl wirklich Zeit, uns vorzubereiten.
			};

			if (Mod_GespraechCounter_BB == 27)
			{
				AI_Output(Mod_1876_EBR_Bloodwyn_MT, NULL, "Info_Mod_Bloodwyn_Bartholo_Plan_04_05"); //Gut, ich werde ihn den Gardisten zur Verfügung stellen.
			};

			if (Mod_GespraechCounter_BB == 31)
			{
				AI_Output(Mod_1106_EBR_Bartholo_MT, NULL, "Info_Mod_Bloodwyn_Bartholo_Plan_03_06"); //Wo wirst du ihn aufbewahren?
			};

			if (Mod_GespraechCounter_BB == 36)
			{
				AI_Output(Mod_1876_EBR_Bloodwyn_MT, NULL, "Info_Mod_Bloodwyn_Bartholo_Plan_04_07"); //Ich lege ihn in das Haus der Gardisten, das dürfte relativ sicher sein.
			};

			if (Mod_GespraechCounter_BB == 41)
			{
				AI_Output(Mod_1106_EBR_Bartholo_MT, NULL, "Info_Mod_Bloodwyn_Bartholo_Plan_03_08"); //Das dürfte es vermutlich, allerdings sind nachts keine Gardisten dort, die ihn bewachen könnten.
			};

			if (Mod_GespraechCounter_BB == 46)
			{
				AI_Output(Mod_1876_EBR_Bloodwyn_MT, NULL, "Info_Mod_Bloodwyn_Bartholo_Plan_04_09"); //(lacht) Wer soll ihn schon stehlen? Wer in das Lager einbrechen will, müsste schon so klein wie eine Fleischwanze sein.

				B_LogEntry	(TOPIC_MOD_AL_KARTE, "Der Plan ist im Haus der Gardisten. Nachts ist es unbewacht, eine gute Gelegenheit den Plan zu stehlen.");

				Wld_InsertItem	(AL_Aufstellung, "FP_ITEM_SPAWN_AUFSTELLUNG");

				Mod_AufstellungAktiviert = 2;

				CutsceneAn = FALSE;
			};

			Mod_GespraechCounter_BB += 1;
		};

		if (Mod_AufstellungAktiviert == 2)
		&& (Npc_HasItems(hero, AL_Aufstellung) == 1)
		{
			Wld_InsertNpc	(Mod_1895_GRD_Gardist_MT, "OCC_MERCS_HALLWAY_FRONT");

			Mod_AufstellungAktiviert = 3;
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_WarnungLagerEntdeckt))
		&& (Npc_GetDistToWP(hero, "GOBBO_MASTERCAVE") < 500)
		&& (Mod_AL_EnteredGobboCaveFirstTime == FALSE)
		{
			B_LogEntry	(TOPIC_MOD_AL_KillMission, "Ich habe es geschafft, jetzt sollte ich erstmal warten.");
			B_SetTopicStatus	(TOPIC_MOD_AL_KillMission, LOG_SUCCESS);

			Wld_InsertItem	(ItWr_AL_Zufluchtsnotiz, "FP_ITEM_ZUFLUCHT_NACHRICHT");

			B_GivePlayerXP	(1000);

			Mod_AL_EnteredGobboCaveFirstTime = TRUE;
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Jackal_InOC))
		&& (Npc_GetDistToWP(Mod_1107_GRD_Jackal_MT, "WP_MT_JACKAL_BEFREIUNG") < 500)
		&& (Mod_AL_AlissandroBefreit == FALSE)
		{
			B_StartOtherRoutine	(Mod_1107_GRD_Jackal_MT, "ABHAUEN");
			B_StartOtherRoutine	(Mod_1870_EBR_Alissandro_MT, "FLUCHT");

			B_LogEntry	(TOPIC_MOD_AL_WhereAlissandro, "Jackal konnte Alissandro befreien. Wir sollten jetzt zur Zuflucht gehen.");

			Mod_AL_AlissandroBefreit = TRUE;
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Bloodwyn_EBR_Belauscht))
		&& (Mod_Bloodwyn_GuidePlayertoBartholo == FALSE) {
			if (!Npc_IsInState(Mod_1876_EBR_Bloodwyn_MT, ZS_Talk)) {
				Mod_Bloodwyn_GuidePlayertoBartholo = TRUE;

				AI_GotoWP(hero, "OCC_BARONS_GREATHALL_CENTER_FRONT");
			};
		};

		if (AustauschDialog_Demon == 1)
		{
			if (DemonKnight_Talk == 0)
			{
				AI_GotoWP	(hero, "OW_PATH_1_15");
			};

			if (DemonKnight_Talk == 2)
			{
				AI_TurnToNpc	(DemonKnight_01, hero);

				AI_Output(DemonKnight_01, NULL, "Info_Mod_DemonKnight_01_06_00"); //Halt! Der Boss hat gesagt, wenn hier einer durch will sollen wir...
			};

			if (DemonKnight_Talk == 9)
			{
				AI_TurnToNpc	(DemonKnight_01, DemonKnight_02);

				AI_Output(DemonKnight_01, NULL, "Info_Mod_DemonKnight_01_06_01"); //... ähm, was sollen wir?
			};

			if (DemonKnight_Talk == 12)
			{
				AI_TurnToNpc	(DemonKnight_02, DemonKnight_01);

				AI_Output(DemonKnight_02, NULL, "Info_Mod_DemonKnight_01_08_02"); //Ähm... Ich glaube wir sollen ihn durchlassen, oder?
			};

			if (DemonKnight_Talk == 15)
			{
				AI_TurnToNpc	(DemonKnight_01, DemonKnight_02);

				AI_Output(DemonKnight_01, NULL, "Info_Mod_DemonKnight_01_06_03"); //Nein, das war´s nicht, glaub ich...
			};

			if (DemonKnight_Talk == 20)
			{
				AI_TurnToNpc	(DemonKnight_02, DemonKnight_01);

				AI_Output(DemonKnight_02, NULL, "Info_Mod_DemonKnight_01_08_04"); //Verdammt... Hätte wissen sollen das wir nicht dieses Zeug nehmen sollen wenn wir Wache schieben...
			};

			if (DemonKnight_Talk == 25)
			{
				AI_TurnToNpc	(DemonKnight_01, DemonKnight_02);

				AI_Output(DemonKnight_01, NULL, "Info_Mod_DemonKnight_01_06_05"); //Es ist aber echt gut... Vorher habe ich ein Mädchen namens Lucy gesehen... Im Himmel, mit Diamanten...
			};

			if (DemonKnight_Talk == 35)
			{
				AI_TurnToNpc	(hero, DemonKnight_01);

				AI_Output(hero, NULL, "Info_Mod_DemonKnight_01_15_06"); //Darf ich jetzt durch oder nicht?
			};

			if (DemonKnight_Talk == 40)
			{
				AI_TurnToNpc	(DemonKnight_01, hero);

				AI_Output(DemonKnight_01, NULL, "Info_Mod_DemonKnight_01_06_07"); //Weiß nicht, ich geh mal zum Boss und frag ihn ...
			};

			if (DemonKnight_Talk == 44)
			{
				B_StartOtherRoutine	(DemonKnight_01, "ALTESLAGER");

				AI_TurnToNpc	(DemonKnight_02, hero);

				AI_Output(DemonKnight_02, NULL, "Info_Mod_DemonKnight_01_08_08"); //In der Zeit lass ich dich hier nicht durch, ja?
			};

			if (DemonKnight_Talk == 46)
			{
				AI_TurnToNpc	(hero, DemonKnight_02);

				AI_Output(hero, NULL, "Info_Mod_DemonKnight_01_15_09"); //Nein... du wirst gleich im Dreck liegen!
			};

			if (DemonKnight_Talk == 51)
			{
				B_Attack	(DemonKnight_02, hero, AR_GuildEnemy, 0);
			};

			DemonKnight_Talk += 1;
		};

		if (Mod_AL_Alissandro_WaitForOric < Wld_GetDay())
		&& (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Hagen))
		&& (Mod_AL_Oric == 0)
		{
			B_StartOtherRoutine	(Mod_1870_EBR_Alissandro_MT, "ORICDA");

			Wld_InsertNpc	(Mod_7039_PAL_Oric_MT, "OW_CAVALORN_01");
			Wld_InsertNpc	(Mod_7040_RIT_Ritter_MT, "OW_CAVALORN_01");
			Wld_InsertNpc	(Mod_7041_RIT_Ritter_MT, "OW_CAVALORN_01");
			Wld_InsertNpc	(Mod_7042_RIT_Ritter_MT, "OW_CAVALORN_01");
			Wld_InsertNpc	(Mod_7043_RIT_Ritter_MT, "OW_CAVALORN_01");
			Wld_InsertNpc	(Mod_7044_RIT_Ritter_MT, "OW_CAVALORN_01");
			Wld_InsertNpc	(Mod_7045_RIT_Ritter_MT, "OW_CAVALORN_01");

			Mod_AL_Oric = 1;
		};

		if (Mod_GomezAngriff == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Gomez_AtAL2_B))
		&& (Npc_GetDistToWP(hero, "OC_ROUND_20") < 1000)
		{
			Mod_GomezAngriff = 1;

			B_Attack	(Mod_1874_HMG_Makanius_MT, Mod_517_DMR_Gomez_MT, AR_None, 0);
			B_Attack	(Mod_7039_PAL_Oric_MT, Mod_517_DMR_Gomez_MT, AR_None, 0);
			B_Attack	(Mod_1870_EBR_Alissandro_MT, Mod_517_DMR_Gomez_MT, AR_None, 0);
		};

		if (Mod_GomezAngriff == 1)
		&& (C_NpcIsDown(Mod_517_DMR_Gomez_MT))
		{
			Mod_GomezAngriff = 2;

			B_StartOtherRoutine	(Mod_680_DMB_Xardas_MT, "GOMEZ");
			AI_Teleport	(Mod_680_DMB_Xardas_MT, "OC_ROUND_20");

			B_StartOtherRoutine	(Mod_520_DMR_Raven_MT, "ATAL");
			AI_Teleport	(Mod_520_DMR_Raven_MT, "OC_ROUND_20");
		};

		// Nicht mehr questrelevante NPC's wieder verwundbar machen

		if (Npc_KnowsInfo(hero, Info_Mod_Scatty_WannaFightUB_AK_2))
		&& (!Npc_IsDead(Mod_962_STT_Scatty_MT))
		{
			Mod_962_STT_Scatty_MT.flags = 0;
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Arto_BeiThorus))
		&& (!Npc_IsDead(Mod_1105_EBR_Arto_MT))
		{
			Mod_1105_EBR_Arto_MT.flags = 0;
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Ende))
		&& (!Npc_IsDead(Mod_1870_EBR_Alissandro_MT))
		{
			Mod_1870_EBR_Alissandro_MT.flags = 0;
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Bartholo_Ende))
		&& (!Npc_IsDead(Mod_1106_EBR_Bartholo_MT))
		{
			Mod_1106_EBR_Bartholo_MT.flags = 0;
		};

		// Cutscene Gespräch Bartholo und Bloodwyn, wenn Held festgenommen wurde

		if (Npc_KnowsInfo(hero, Info_Mod_Bartholo_KillBuddler))
		&& (!Npc_IsInState(Mod_1106_EBR_Bartholo_MT, ZS_Talk))
		&& (Mod_AL_BloodwynBartholoGefangen == 0)
		{
			Mod_AL_BloodwynBartholoGefangen = 1;

			Wld_SendTrigger	("EVT_BARTHOLOBLODDWYNGEFANGEN_CAM");

			CutsceneAn = TRUE;

			B_StartOtherRoutine	(Mod_1876_EBR_Bloodwyn_MT, "SMALLTALK");
		};

		if (Mod_AL_BloodwynBartholoGefangen == 1)
		{
			if (Mod_AL_BloodwynBartholoGefangen_Counter == 0)
			{
				AI_TurnToNpc	(Mod_1106_EBR_Bartholo_MT, Mod_1876_EBR_Bloodwyn_MT);
				AI_TurnToNpc	(Mod_1876_EBR_Bloodwyn_MT, Mod_1106_EBR_Bartholo_MT);
			};

			if (Mod_AL_BloodwynBartholoGefangen_Counter == 1)
			{
				AI_Output(Mod_1876_EBR_Bloodwyn_MT, NULL, "Info_Mod_Bloodwyn_EBR_BerichtBeiBartholo_04_00"); //Wir haben die Kerle gefunden, die für den Tod von Fletcher, Ian und Cathran verantwortlich sind.
			};

			if (Mod_AL_BloodwynBartholoGefangen_Counter == 6)
			{
				AI_Output(Mod_1106_EBR_Bartholo_MT, NULL, "Info_Mod_Bartholo_WoQuartier_03_00"); //So, dann sind auch diese Ratten in die Falle gegangen. Ich könnte euch töten, wie den Buddler, ich könnte euch auch den Snappern zum Fraß vorwerfen, wie die Köche.
			};

			if (Mod_AL_BloodwynBartholoGefangen_Counter == 11)
			{
				AI_Output(Mod_1106_EBR_Bartholo_MT, NULL, "Info_Mod_Bartholo_WoQuartier_03_01"); //Aber wenn ich schon mal so hohen Besuch habe, will ich euch einige Fragen stellen. Wo haben der alte Mann und seine Anhänger ihr Quartier?
			};

			if (Mod_AL_BloodwynBartholoGefangen_Counter == 16)
			{
				AI_Output(Mod_1876_EBR_Bloodwyn_MT, NULL, "Info_Mod_Bloodwyn_EBR_WeißVersteck_04_00"); //Sie sind im alten Bergkastell, dass habe ich bei ihrem Gespräch gehört.
			};

			if (Mod_AL_BloodwynBartholoGefangen_Counter == 21)
			{
				AI_Output(Mod_1106_EBR_Bartholo_MT, NULL, "Info_Mod_Bartholo_BloodwynGut_03_00"); //Gut Bloodwyn, nimm dir einen Gardisten und unsere zwei Freunde hier und geh zum Bergkastell, ich werde später Verstärkung nachschicken.
			};

			if (Mod_AL_BloodwynBartholoGefangen_Counter == 26)
			{
				AI_Output(Mod_1106_EBR_Bartholo_MT, NULL, "Info_Mod_Bartholo_BloodwynGut_03_01"); //Den beiden wird es sicher gefallen, bei der Vernichtung ihrer Kumpanen zu zu sehen.
			};

			if (Mod_AL_BloodwynBartholoGefangen_Counter == 31)
			{
				AI_Output(Mod_1876_EBR_Bloodwyn_MT, NULL, "Info_Mod_Bloodwyn_EBR_GotoBergkastell_04_00"); //Gut, dann kommt mit! (lacht gemein)
			};

			if (Mod_AL_BloodwynBartholoGefangen_Counter == 36)
			{
				B_LogEntry	(TOPIC_MOD_AL_KillMission, "Bartholo hat mich mit Jackal und einem Gardisten zum Kastell geschickt, er wird Verstärkung nachschicken.");

				B_StartOtherRoutine	(Mod_1106_EBR_Bartholo_MT, "BOSS");
				B_StartOtherRoutine	(Mod_1876_EBR_Bloodwyn_MT, "GOTOBERGKASTELL");
				B_StartOtherRoutine	(Mod_1145_GRD_Gardist_MT, "GOTOBERGKASTELL");
				B_StartOtherRoutine	(Mod_1107_GRD_Jackal_MT, "FOLLOWTOBERGKASTELL");

				Mod_1876_EBR_Bloodwyn_MT.flags = 0;

				Mod_AL_BloodwynBartholoGefangen = 2;

				CutsceneAn = FALSE;
			};

			Mod_AL_BloodwynBartholoGefangen_Counter += 1;
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Gomez_Angebot))
		&& (hero.attribute[ATR_HITPOINTS] <= 3)
		{
			B_StartOtherRoutine	(Mod_680_DMB_Xardas_MT, "ANGEBOT");

			B_StartOtherRoutine	(Mod_517_DMR_Gomez_MT, "START");

			AI_StartState	(Mod_517_DMR_Gomez_MT, ZS_MagicFreeze, 0, "");
		};

		if (Mod_TriggerCloseALGate == FALSE)
		&& (Npc_KnowsInfo(hero, Info_Mod_Alissandro_ThorusTot)) {
			if (Mod_ALTor_01 == 0) {
				Wld_SendTrigger	("EVT_OC_MAINGATE01_01");

				Mod_ALTor_01 = 1;
			};

			if (Mod_ALTor_03 == 0) {
				Wld_SendTrigger	("EVT_OC_MAINGATE02_02");

				Mod_ALTor_03 = 1;
			};

			Mod_TriggerCloseALGate = TRUE;
		};

		if (Mod_TriggerOpenOMGate == FALSE)
		&& (Npc_KnowsInfo(hero, Info_Mod_Alissandro_ThorusTot)) {
			if (Mod_MinentalTor == 1) {
				Wld_SendTrigger	("EVT_AM_LOB_GATE_BIG");
			};

			Mod_TriggerOpenOMGate = TRUE;
		};
	};

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		// Cornelius erst nach Gespräch killen

		if (Npc_KnowsInfo(hero, Info_Mod_Cornelius_AtMarkt))
		&& (!Npc_IsInState(Mod_571_NONE_Cornelius_NW, ZS_TALK))
		&& (Mod_AL_CorneliusTot == 0)
		{
			Mod_AL_CorneliusTot = 1;

			Mod_571_NONE_Cornelius_NW.attribute[ATR_HITPOINTS] = 0;
		};
	};

	if (CurrentLevel == OLDMINE_ZEN)
	{
		if (Mod_AL_Oric == 2)
		&& (Npc_IsDead(Mod_1031_DMR_Kurgan_OM))
		{
			Mod_AL_Oric = 3;

			B_LogEntry	(TOPIC_MOD_AL_ERSTERSCHRITT, "Kurgan ist tot. Nun sollte ich Oric davon berichten.");
		};

		if (Mod_AL_Oric == 5)
		&& (Npc_IsDead(Mod_1903_SMK_SchwarzerKrieger_OM))
		&& (Npc_IsDead(Mod_1904_SMK_SchwarzerKrieger_OM))
		&& (Npc_IsDead(Mod_1905_SMK_SchwarzerKrieger_OM))
		&& (Npc_IsDead(Mod_1906_SMK_SchwarzerKrieger_OM))
		&& (Npc_IsDead(Mod_1907_SMK_SchwarzerKrieger_OM))
		&& (Npc_IsDead(Mod_1908_SMK_SchwarzerKrieger_OM))
		&& (Npc_IsDead(Mod_1909_SMK_SchwarzerKrieger_OM))
		&& (Npc_IsDead(Mod_1910_SMK_SchwarzerKrieger_OM))
		&& (Npc_IsDead(Mod_1911_SMK_SchwarzerKrieger_OM))
		&& (Npc_IsDead(Mod_1912_SMK_SchwarzerKrieger_OM))
		&& (Npc_IsDead(Mod_1913_SMK_SchwarzerKrieger_OM))
		&& (Npc_IsDead(Mod_1914_SMK_SchwarzerKrieger_OM))
		{
			Mod_AL_Oric = 6;

			B_LogEntry	(TOPIC_MOD_AL_ERSTERSCHRITT, "Die Mine gehört uns!");
		};
	};

	if (Npc_HasItems(hero, ItMi_DemonArmor) == 1)
	{
		Npc_RemoveInvItems	(hero, ItMi_DemonArmor, 1);
		CreateInvItems	(hero, ItAr_Raven_Addon, 1);
	};
};
