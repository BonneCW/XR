INSTANCE Info_Mod_Heiler_Hi (C_INFO)
{
	npc		= Mod_7476_OUT_Arzt_REL;
	nr		= 1;
	condition	= Info_Mod_Heiler_Hi_Condition;
	information	= Info_Mod_Heiler_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mich heilen?";
};

FUNC INT Info_Mod_Heiler_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Heiler_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Heiler_Hi_15_00"); //Kannst du mich heilen?
	AI_Output(self, hero, "Info_Mod_Heiler_Hi_10_01"); //Kann ich schon, gegen Bezahlung.
};

INSTANCE Info_Mod_Heiler_Endres (C_INFO)
{
	npc		= Mod_7476_OUT_Arzt_REL;
	nr		= 1;
	condition	= Info_Mod_Heiler_Endres_Condition;
	information	= Info_Mod_Heiler_Endres_Info;
	permanent	= 0;
	important	= 0;
	description	= "Woran ist Endres gestorben?";
};

FUNC INT Info_Mod_Heiler_Endres_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Juliana_Endres))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Heiler_Endres_Info()
{
	AI_Output(hero, self, "Info_Mod_Heiler_Endres_15_00"); //Woran ist Endres gestorben?
	AI_Output(self, hero, "Info_Mod_Heiler_Endres_10_01"); //Ich bin mir nicht ganz sicher, aber möglicherweise ... ja, doch, es könnte an dem faustgroßen Loch im Hinterkopf liegen.
	AI_Output(hero, self, "Info_Mod_Heiler_Endres_15_02"); //Mit was für einer Waffe ist die Wunde geschlagen worden?
	AI_Output(self, hero, "Info_Mod_Heiler_Endres_10_03"); //Mit einer gebogenen Klinge. Sieht mir stark nach einer Sense oder Spitzhacke aus.
	AI_Output(self, hero, "Info_Mod_Heiler_Endres_10_04"); //Das Loch ist nicht senkrecht in den Hinterkopf geschlagen, sondern leicht gekrümmt.
	AI_Output(hero, self, "Info_Mod_Heiler_Endres_15_05"); //Dann muss es ein Mord gewesen sein?
	AI_Output(self, hero, "Info_Mod_Heiler_Endres_10_06"); //Ob Mord, Totschlag oder Versehen - es ist eindeutig von fremder Hand herbeigeführt worden.
	AI_Output(hero, self, "Info_Mod_Heiler_Endres_15_07"); //Danke für die Auskunft.

	B_LogEntry	(TOPIC_MOD_KHORATA_ENDRES, "Es gibt ein weiteres Indiz dafür, dass einer der Bergleute für den Tod Endres' verantwortlich ist - und zwar die gebogene Tatwaffe.");
};

INSTANCE Info_Mod_Heiler_Endres02 (C_INFO)
{
	npc		= Mod_7476_OUT_Arzt_REL;
	nr		= 1;
	condition	= Info_Mod_Heiler_Endres02_Condition;
	information	= Info_Mod_Heiler_Endres02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du wirst der Erpressung verdächtigt.";
};

FUNC INT Info_Mod_Heiler_Endres02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Leonhard_Endres))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Heiler_Endres02_Info()
{
	AI_Output(hero, self, "Info_Mod_Heiler_Endres02_15_00"); //Du wirst der Erpressung verdächtigt.
	AI_Output(self, hero, "Info_Mod_Heiler_Endres02_10_01"); //Na, was wird das denn? Eine Verleumdungskampagne?
	AI_Output(hero, self, "Info_Mod_Heiler_Endres02_15_02"); //Darf ich dir ein paar Fragen stellen?
	AI_Output(hero, self, "Info_Mod_Heiler_Endres02_15_03"); //Wenn du unschuldig bist, hast du nichts zu befürchten.
	AI_Output(self, hero, "Info_Mod_Heiler_Endres02_10_04"); //(mürrisch) Fang schon an.
};

INSTANCE Info_Mod_Heiler_Endres03 (C_INFO)
{
	npc		= Mod_7476_OUT_Arzt_REL;
	nr		= 1;
	condition	= Info_Mod_Heiler_Endres03_Condition;
	information	= Info_Mod_Heiler_Endres03_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was hast du zum Zeitpunkt von Endres' Tod getrieben?";
};

FUNC INT Info_Mod_Heiler_Endres03_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Heiler_Endres02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Heiler_Endres03_Info()
{
	AI_Output(hero, self, "Info_Mod_Heiler_Endres03_15_00"); //Was hast du zum Zeitpunkt von Endres' Tod getrieben?
	AI_Output(self, hero, "Info_Mod_Heiler_Endres03_10_01"); //Ich war hier im Haus und habe mich um meinen Patienten gekümmert.
	AI_Output(self, hero, "Info_Mod_Heiler_Endres03_10_02"); //Den ganzen Tag habe ich das Haus nicht verlassen.

	B_LogEntry	(TOPIC_MOD_KHORATA_ENDRES, "Der Arzt gibt an, sich den ganzen Tag über zu Hause um seinen Patienten gekümmert zu haben.");
};

INSTANCE Info_Mod_Heiler_Endres04 (C_INFO)
{
	npc		= Mod_7476_OUT_Arzt_REL;
	nr		= 1;
	condition	= Info_Mod_Heiler_Endres04_Condition;
	information	= Info_Mod_Heiler_Endres04_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was weißt du vom Verhältnis zwischen Endres und seiner Frau?";
};

FUNC INT Info_Mod_Heiler_Endres04_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Heiler_Endres02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Heiler_Endres04_Info()
{
	AI_Output(hero, self, "Info_Mod_Heiler_Endres04_15_00"); //Was weißt du vom Verhältnis zwischen Endres und seiner Frau?
	AI_Output(self, hero, "Info_Mod_Heiler_Endres04_10_01"); //Ha, Juliana war unzufrieden mit ihrer Beziehung. Sie hat ihn verehrt, und er war vertieft in seine Arbeit.

	B_LogEntry	(TOPIC_MOD_KHORATA_ENDRES, "Julianas Liebe zu Endres soll nicht voll von ihm erwidert worden sein.");
};

INSTANCE Info_Mod_Heiler_Endres05 (C_INFO)
{
	npc		= Mod_7476_OUT_Arzt_REL;
	nr		= 1;
	condition	= Info_Mod_Heiler_Endres05_Condition;
	information	= Info_Mod_Heiler_Endres05_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was weißt du vom Verhältnis zwischen Endres und Wendel?";
};

FUNC INT Info_Mod_Heiler_Endres05_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Heiler_Endres02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Heiler_Endres05_Info()
{
	AI_Output(hero, self, "Info_Mod_Heiler_Endres05_15_00"); //Was weißt du vom Verhältnis zwischen Endres und Wendel?
	AI_Output(self, hero, "Info_Mod_Heiler_Endres05_10_01"); //Die beiden hatten ein gutes Verhältnis zueinander, schätz ich. Endres war Wendels Idol.

	B_LogEntry	(TOPIC_MOD_KHORATA_ENDRES, "Den Angaben des Arztes zufolge habe es nie ein Problem zwischen Endres und Wendel gegeben.");
};

INSTANCE Info_Mod_Heiler_Endres06 (C_INFO)
{
	npc		= Mod_7476_OUT_Arzt_REL;
	nr		= 1;
	condition	= Info_Mod_Heiler_Endres06_Condition;
	information	= Info_Mod_Heiler_Endres06_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du stehst unter dringendem Tatverdacht.";
};

FUNC INT Info_Mod_Heiler_Endres06_Condition()
{
	if (Mod_EndresIndizien == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Heiler_Endres06_Info()
{
	AI_Output(hero, self, "Info_Mod_Heiler_Endres06_15_00"); //Du stehst unter dringendem Tatverdacht.
	AI_Output(self, hero, "Info_Mod_Heiler_Endres06_10_01"); //(unbeeindruckt) Interessant.
	AI_Output(hero, self, "Info_Mod_Heiler_Endres06_15_02"); //Ich möchte das Haus durchsuchen.
	AI_Output(self, hero, "Info_Mod_Heiler_Endres06_10_03"); //Das wird leider nicht möglich sein.
	AI_Output(hero, self, "Info_Mod_Heiler_Endres06_15_04"); //Warum?
	AI_Output(self, hero, "Info_Mod_Heiler_Endres06_10_05"); //Weil ich es nicht gestatte.
	AI_Output(hero, self, "Info_Mod_Heiler_Endres06_15_06"); //Dann wird der Richter es mir gestatten. Bin gleich zurück.
	AI_Output(self, hero, "Info_Mod_Heiler_Endres06_10_07"); //Na schön. Du hast es so gewollt. Ihr alle habt es so gewollt. (laut) Rühr dich nicht vom Fleck!
	AI_Output(hero, self, "Info_Mod_Heiler_Endres06_15_08"); //Was ist los?
	AI_Output(self, hero, "Info_Mod_Heiler_Endres06_10_09"); //Ja, ich habe Wendel ermordet. Ich habe Juliana verführt, habe Unzüchtiges mit ihr getrieben.
	AI_Output(self, hero, "Info_Mod_Heiler_Endres06_10_10"); //Und ich bereue es nicht. Ich liebe sie.

	AI_PlayAni  (self, "T_MAGRUN_2_HEASHOOT");
	AI_PlayAni  (self, "T_HEASHOT_2_STAND");

	AI_Output(self, hero, "Info_Mod_Heiler_Endres06_10_11"); //(fassungslos) Nein, NEIN!
	AI_Output(hero, self, "Info_Mod_Heiler_Endres06_15_12"); //Es gibt wohl doch eine höhere Gerechtigkeit.
	AI_Output(self, hero, "Info_Mod_Heiler_Endres06_10_13"); //Das ist nicht möglich!

	B_LogEntry	(TOPIC_MOD_KHORATA_ENDRES, "Der Arzt hat sich hinter Endres' Rücken an Juliana vergangen. Doch das reichte ihm anscheinend nicht, und so räumte ihren Mann aus dem Weg. Ach, die Liebe ...");

	B_StartOtherRoutine	(self, "TOT");

	Info_ClearChoices	(Info_Mod_Heiler_Endres06);

	Info_AddChoice	(Info_Mod_Heiler_Endres06, "Ich werde Endres eigenhändig rächen!", Info_Mod_Heiler_Endres06_B);
	Info_AddChoice	(Info_Mod_Heiler_Endres06, "Du wanderst jetzt hinter Gitter.", Info_Mod_Heiler_Endres06_A);
};

FUNC VOID Info_Mod_Heiler_Endres06_B()
{
	Info_ClearChoices	(Info_Mod_Heiler_Endres06);

	Mod_EndresIndizien = 3;

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};

FUNC VOID Info_Mod_Heiler_Endres06_A()
{
	Info_ClearChoices	(Info_Mod_Heiler_Endres06);

	AI_StopProcessInfos	(self);

	Mod_EndresIndizien = 5;

	Wld_PlayEffect("BLACK_SCREEN", hero, hero, 0, 0, 0, TRUE);
};

INSTANCE Info_Mod_Heiler_Heilen (C_INFO)
{
	npc		= Mod_7476_OUT_Arzt_REL;
	nr		= 1;
	condition	= Info_Mod_Heiler_Heilen_Condition;
	information	= Info_Mod_Heiler_Heilen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Heile mich (75 Gold)";
};

FUNC INT Info_Mod_Heiler_Heilen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Heiler_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Heiler_Heilen_Info()
{
	AI_Output(hero, self, "Info_Mod_Heiler_Heilen_15_00"); //Heile mich.

	if (Npc_HasItems(hero, ItMi_Gold) >= 75)
	{
		B_GiveInvItems	(hero, self, ItMi_Gold, 75);

		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Heiler_Heilen_10_01"); //Kein Gold, keine Heilung.
	};
};

INSTANCE Info_Mod_Heiler_WasGeht (C_INFO)
{
	npc		= Mod_7476_OUT_Arzt_REL;
	nr		= 1;
	condition	= Info_Mod_Heiler_WasGeht_Condition;
	information	= Info_Mod_Heiler_WasGeht_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie läuft's?";
};

FUNC INT Info_Mod_Heiler_WasGeht_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Heiler_WasGeht_Info()
{
	AI_Output(hero, self, "Info_Mod_Heiler_WasGeht_15_00"); //Wie läuft's?
	AI_Output(self, hero, "Info_Mod_Heiler_WasGeht_10_01"); //Ohne Unterbrechungen liefe es reibungslos, oh ja.
};

INSTANCE Info_Mod_Heiler_Freudenspender (C_INFO)
{
	npc		= Mod_7476_OUT_Arzt_REL;
	nr		= 1;
	condition	= Info_Mod_Heiler_Freudenspender_Condition;
	information	= Info_Mod_Heiler_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Freudenspender für den entspannten Feierabend?";
};                       

FUNC INT Info_Mod_Heiler_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Heiler_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Heiler_Freudenspender_15_00"); //Freudenspender für den entspannten Feierabend?
	AI_Output(self, hero, "Info_Mod_Heiler_Freudenspender_10_01"); //Keine schlechte Idee.

	B_GiveInvItems	(hero, self, ItMi_Freudenspender, 1);

	B_GiveInvItems	(self, hero, ItMi_Gold, 10);

	Mod_Freudenspender += 1;
};

INSTANCE Info_Mod_Heiler_Pickpocket (C_INFO)
{
	npc		= Mod_7476_OUT_Arzt_REL;
	nr		= 1;
	condition	= Info_Mod_Heiler_Pickpocket_Condition;
	information	= Info_Mod_Heiler_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Heiler_Pickpocket_Condition()
{
	C_Beklauen	(53, ItPo_Health_Addon_04, 2);
};

FUNC VOID Info_Mod_Heiler_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Heiler_Pickpocket);

	Info_AddChoice	(Info_Mod_Heiler_Pickpocket, DIALOG_BACK, Info_Mod_Heiler_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Heiler_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Heiler_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Heiler_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Heiler_Pickpocket);
};

FUNC VOID Info_Mod_Heiler_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Heiler_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Heiler_Pickpocket);

		Info_AddChoice	(Info_Mod_Heiler_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Heiler_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Heiler_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Heiler_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Heiler_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Heiler_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Heiler_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Heiler_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Heiler_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Heiler_Pickpocket);

		AI_StopProcessInfos	(self);

		B_Attack (self, hero, AR_Theft, 1);
	}
	else
	{
		if (rnd >= 75)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 200);
		}
		else if (rnd >= 50)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 100);
		}
		else if (rnd >= 25)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 50);
		};

		B_Say	(self, hero, "$PICKPOCKET_BESTECHUNG_01");

		Info_ClearChoices	(Info_Mod_Heiler_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Heiler_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Heiler_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Heiler_EXIT (C_INFO)
{
	npc		= Mod_7476_OUT_Arzt_REL;
	nr		= 1;
	condition	= Info_Mod_Heiler_EXIT_Condition;
	information	= Info_Mod_Heiler_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Heiler_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Heiler_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};