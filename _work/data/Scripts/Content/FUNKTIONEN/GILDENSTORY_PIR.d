FUNC VOID GILDENSTORY_PIR ()
{
	if (CurrentLevel == ADDONWORLD_ZEN)
	{
		// Teleport zu Schatzinsel

		if (Mod_VorbereitungenFertig == 5)
		&& (!Npc_IsInState(Mod_775_PIR_Skip_AW, ZS_Talk))
		{
			Mod_VorbereitungenFertig = 6;

			AI_Teleport	(hero,	"AW_DIEINSELSTARTPOINT");
		};

		// Zwischensequenz mit Hero, Greg und Skip

		if (Mod_VorbereitungenFertig == 2)
		&& (!Npc_IsInState(Mod_764_PIR_Greg_AW, ZS_Talk))
		{
			Mod_VorbereitungenFertig = 3;

			Wld_SendTrigger	("CAMERASKIPGREG");

			CutsceneAn = TRUE;
		};

		if (Mod_VorbereitungenFertig == 3)
		{
			if (Mod_SkipGreg_Counter == 0)
			{
				AI_TurnToNpc	(Mod_764_PIR_Greg_AW, Mod_775_PIR_Skip_AW);

				AI_GotoWP	(hero, "WP_BLA_PIR_02");

				AI_TurnToNpc	(hero, Mod_764_PIR_Greg_AW);

				B_StartOtherRoutine	(Mod_775_PIR_Skip_AW, "PLAUDERN");
			};

			if (Mod_SkipGreg_Counter == 1)
			{
				AI_Output(Mod_764_PIR_Greg_AW, NULL, "Info_Mod_SkipGreg_01_00"); //(brüllt laut) Halt! Skip!
			};

			if (Mod_SkipGreg_Counter == 6)
			{
				AI_TurnToNpc	(Mod_764_PIR_Greg_AW, Mod_775_PIR_Skip_AW);
				AI_TurnToNpc	(Mod_775_PIR_Skip_AW, Mod_764_PIR_Greg_AW);

				AI_Output(Mod_775_PIR_Skip_AW, NULL, "Info_Mod_SkipGreg_08_01"); //Käpt'n?
			};

			if (Mod_SkipGreg_Counter == 11)
			{
				AI_Output(Mod_764_PIR_Greg_AW, NULL, "Info_Mod_SkipGreg_01_02"); //Du solltest doch meinen Kompass suchen. Hast du ihn gefunden?
			};

			if (Mod_SkipGreg_Counter == 16)
			{
				AI_Output(Mod_775_PIR_Skip_AW, NULL, "Info_Mod_SkipGreg_08_03"); //Tschuldigung, Käpt'n. Das hab ich irgendwie vergessen.
			};

			if (Mod_SkipGreg_Counter == 21)
			{
				AI_Output(Mod_764_PIR_Greg_AW, NULL, "Info_Mod_SkipGreg_01_04"); //Vergessen? Was, wenn ich den auch vergesse und wir sind auf hoher See.
			};

			if (Mod_SkipGreg_Counter == 26)
			{
				AI_Output(Mod_764_PIR_Greg_AW, NULL, "Info_Mod_SkipGreg_01_05"); //(laut) Ich werde dich kielholen lassen!
			};

			if (Mod_SkipGreg_Counter == 31)
			{
				AI_Output(Mod_775_PIR_Skip_AW, NULL, "Info_Mod_SkipGreg_08_06"); //Erbarmen Käpt'n. Ich hab doch schon am meisten zu tun im Lager ...
			};

			if (Mod_SkipGreg_Counter == 36)
			{
				AI_TurnToNpc	(hero, Mod_775_PIR_Skip_AW);

				AI_Output(hero, NULL, "Info_Mod_SkipGreg_15_07"); //Du am meisten? Das seh ich aber anders ...
			};

			if (Mod_SkipGreg_Counter == 41)
			{
				AI_TurnToNpc	(Mod_764_PIR_Greg_AW, hero);

				AI_Output(Mod_764_PIR_Greg_AW, NULL, "Info_Mod_SkipGreg_01_08"); //Mach du das. Auf dich kann man sich wenigstens verlassen.
			};

			if (Mod_SkipGreg_Counter == 46)
			{
				AI_Output(hero, NULL, "Info_Mod_SkipGreg_15_09"); //Aha. Gut, dass du das merkst. Wo soll ich suchen?
			};

			if (Mod_SkipGreg_Counter == 51)
			{
				AI_Output(Mod_764_PIR_Greg_AW, NULL, "Info_Mod_SkipGreg_01_10"); //Irgendwo drüben am anderen Strand. Wo du den Sextant gefunden hast. Wahrscheinlich in der Höhle.
			};

			if (Mod_SkipGreg_Counter == 56)
			{
				AI_Output(hero, NULL, "Info_Mod_SkipGreg_15_11"); //Du verlierst gerne Sachen?
			};

			if (Mod_SkipGreg_Counter == 61)
			{
				AI_Output(Mod_764_PIR_Greg_AW, NULL, "Info_Mod_SkipGreg_01_12"); //Schwätzer! Ich war drüben, weil ich neugierig war, was mit den Höhlen ist.
			};

			if (Mod_SkipGreg_Counter == 66)
			{
				AI_Output(Mod_764_PIR_Greg_AW, NULL, "Info_Mod_SkipGreg_01_13"); //In einer kleineren ist eine seltsame schwarze Figur.
			};

			if (Mod_SkipGreg_Counter == 71)
			{
				AI_Output(hero, NULL, "Info_Mod_SkipGreg_15_14"); //Ich weiß. Das ist eine Beliarstatue. Mich wundert nur, wie die dort hingskommen ist ...
			};

			if (Mod_SkipGreg_Counter == 76)
			{
				AI_Output(Mod_764_PIR_Greg_AW, NULL, "Info_Mod_SkipGreg_01_15"); //Ja, und in der großen Höhle hinten wurde ich von einem Pulk Skelette angegriffen.
			};

			if (Mod_SkipGreg_Counter == 81)
			{
				AI_Output(Mod_764_PIR_Greg_AW, NULL, "Info_Mod_SkipGreg_01_16"); //Allesamt kräftige, blitzschnelle Kerle. Mir blieb nur die Flucht. Dabei hab ich wohl den Kompass verloren.
			};

			if (Mod_SkipGreg_Counter == 86)
			{
				AI_Output(hero, NULL, "Info_Mod_SkipGreg_15_17"); //Verstehe. Sind die Skelette noch dort?
			};

			if (Mod_SkipGreg_Counter == 91)
			{
				AI_Output(Mod_764_PIR_Greg_AW, NULL, "Info_Mod_SkipGreg_01_18"); //Ich denke schon. Und wahrscheinlich ein paar Warane. Die von der roten Sorte. Also zieh dich warm an, min Jung.
			};

			if (Mod_SkipGreg_Counter == 96)
			{
				AI_Output(Mod_764_PIR_Greg_AW, NULL, "Info_Mod_SkipGreg_01_19"); //Noch was. Ich glaube Samuel hat noch ein paar Eisspruchrollen rumliegen. Die könnten dir helfen.
			};

			if (Mod_SkipGreg_Counter == 101)
			{
				AI_Output(hero, NULL, "Info_Mod_SkipGreg_15_20"); //Werde mal nachschauen. Bis später.
			};

			if (Mod_SkipGreg_Counter == 106)
			{
				Mod_VorbereitungenFertig = 4;

				CutsceneAn = FALSE;

				Wld_InsertItem	(ItMi_Kompass, "FP_ITEM_KOMPASS");

				B_StartOtherRoutine	(Mod_775_PIR_Skip_AW, "START");
				B_StartOtherRoutine	(Mod_764_PIR_Greg_AW, "START");

				Log_CreateTopic	(TOPIC_MOD_GREG_KOMPASS, LOG_MISSION);
				B_SetTopicStatus	(TOPIC_MOD_GREG_KOMPASS, LOG_RUNNING);
				B_LogEntry	(TOPIC_MOD_GREG_KOMPASS, "Greg braucht noch seinen Kompass, welcher vermutlich in der großen Höhle am Südstrand liegt.");
			};

			Mod_SkipGreg_Counter += 1;
		};

		if (Npc_GetDistToWp(hero, "ADW_PIRATECAMP_CAVE1_01") < 1000)
		&& (Npc_KnowsInfo(hero, Info_Mod_Henry_Entertrupp))
		&& (Mod_SamuelIstWeg == 0)
		{
			Mod_SamuelIstWeg = 1;

			B_LogEntry	(TOPIC_MOD_HENRY_ENTERTRUPP, "Hm ... es scheint so, als wäre Samuel verschwunden. Ich sollte mich mal in seiner Höhle umsehen ...");
		};

		// Piraten aus Lager entfernen, wenn bereit zu Schatzsuche

		if (Mod_Piraten_Aufbruch == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Greg_Kompass))
		&& (Kapitel >= 4)
		&& ((!Npc_KnowsInfo(hero, Info_Mod_Myxir_Amulett))
		|| (Npc_KnowsInfo(hero, Info_Mod_Greg_AJAlive)))
		{
			B_StartOtherRoutine	(Mod_963_PIR_Malcom_NW,	"TOT");
			B_StartOtherRoutine	(Mod_928_PIR_AlligatorJack_AW,	"TOT");
			B_StartOtherRoutine	(Mod_929_PIR_Bill_AW,	"TOT");
			B_StartOtherRoutine	(Mod_930_PIR_Bones_AW,	"TOT");
			B_StartOtherRoutine	(Mod_931_PIR_Brandon_AW,	"TOT");
			B_StartOtherRoutine	(Mod_932_PIR_Francis_AW,	"TOT");
			B_StartOtherRoutine	(Mod_933_PIR_Garett_AW,	"TOT");
			B_StartOtherRoutine	(Mod_934_PIR_Henry_AW,	"TOT");
			B_StartOtherRoutine	(Mod_935_PIR_Malcom_AW,	"TOT");
			B_StartOtherRoutine	(Mod_936_PIR_Matt_AW,	"TOT");
			B_StartOtherRoutine	(Mod_938_PIR_Morgan_AW,	"TOT");
			B_StartOtherRoutine	(Mod_939_PIR_Owen_AW,	"TOT");
			B_StartOtherRoutine	(Mod_940_PIR_Samuel_AW,	"TOT");
			B_StartOtherRoutine	(Mod_941_PIR_Angus_AW,	"TOT");
			B_StartOtherRoutine	(Mod_942_PIR_Hank_AW,	"TOT");

			Mod_Piraten_Aufbruch = 1;
		};
	};

	if (CurrentLevel == DIEINSEL_ZEN)
	{
		// Teleport von Schatzinsel zur Schiffschlacht

		if (Mod_SchatzinselToSchiffschlacht == 0)
		&& (!Npc_IsInState(Mod_1540_PIR_Skip_DI, ZS_Talk))
		&& (Npc_KnowsInfo(hero, Info_Mod_Skip_DI_ZumSchiff_02))
		{
			Mod_SchatzinselToSchiffschlacht = 1;

			AI_Teleport	(hero,	"WP_DI_LEVELCHANGE");
		};

		// Brunhild darf nicht so weit weg sein vom Held

		if (Hlp_IsValidNpc(Mod_7642_OUT_Brunhild_DI))
		{
			if (Mod_7642_OUT_Brunhild_DI.aivar[AIV_Partymember] == TRUE)
			&& (Npc_GetDistToNpc(Mod_7642_OUT_Brunhild_DI, hero) > 2500)
			{
				AI_Teleport	(Mod_7642_OUT_Brunhild_DI,	"PC_HERO");
			};
		};
	};
};