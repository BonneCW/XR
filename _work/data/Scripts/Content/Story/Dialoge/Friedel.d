INSTANCE Info_Mod_Friedel_Hi (C_INFO)
{
	npc		= Mod_7517_OUT_Friedel_REL;
	nr		= 1;
	condition	= Info_Mod_Friedel_Hi_Condition;
	information	= Info_Mod_Friedel_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Friedel_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Friedel_Hi_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Friedel_Hi_01_00"); //Ich bin Friedel und unterrichte die jungen Männer im Kampf.

	if (Mod_Schwierigkeit != 4)
	{
		AI_Output(hero, self, "Info_Mod_Friedel_Hi_15_01"); //Kannst du auch mir etwas beibringen?
		AI_Output(self, hero, "Info_Mod_Friedel_Hi_01_02"); //Solange du unerfahren bist, werde ich dir sicher den einen oder anderen Kniff zeigen können.

		Log_CreateTopic	(TOPIC_MOD_LEHRER_KHORATA, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_LEHRER_KHORATA, "Friedel kann mir den Umgang mit Einhändern zeigen und mir helfen, stärker zu werden.");
	};
};

INSTANCE Info_Mod_Friedel_Wettstreit (C_INFO)
{
	npc		= Mod_7517_OUT_Friedel_REL;
	nr		= 1;
	condition	= Info_Mod_Friedel_Wettstreit_Condition;
	information	= Info_Mod_Friedel_Wettstreit_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich bin wegen der Rattenjagd hier.";
};

FUNC INT Info_Mod_Friedel_Wettstreit_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Friedel_Hi))
	&& (Mod_REL_Wettstreit == 1)
	&& (Mod_REL_Wettstreit_Tag < Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Friedel_Wettstreit_Info()
{
	AI_Output(hero, self, "Info_Mod_Friedel_Wettstreit_15_00"); //Ich bin wegen der Rattenjagd hier.
	AI_Output(self, hero, "Info_Mod_Friedel_Wettstreit_01_01"); //Schön! Damit hätten wir einen dritten Teilnehmer.
	AI_Output(self, hero, "Info_Mod_Friedel_Wettstreit_01_02"); //Die anderen beiden werden meine Lehrlinge sein, die bei der Rattenjagd ihre Abschlussprüfung ablegen.
	AI_Output(self, hero, "Info_Mod_Friedel_Wettstreit_01_03"); //Können wir dann starten?
	AI_Output(hero, self, "Info_Mod_Friedel_Wettstreit_15_04"); //Ich würde gern die Regeln kennen.
	AI_Output(self, hero, "Info_Mod_Friedel_Wettstreit_01_05"); //Das lässt sich einrichten!
	AI_Output(self, hero, "Info_Mod_Friedel_Wettstreit_01_06"); //Hier am Seeufer wimmelt es immer von Ratten.
	AI_Output(self, hero, "Info_Mod_Friedel_Wettstreit_01_07"); //Die Teilnehmer starten gleichzeitig und müssen alle Ratten um den See herum töten.
	AI_Output(self, hero, "Info_Mod_Friedel_Wettstreit_01_08"); //Wer dabei am erfolgreichsten ist, gewinnt und erhält einen Geldpreis.
	AI_Output(self, hero, "Info_Mod_Friedel_Wettstreit_01_09"); //Wenn du bereit bist, können wir beginnen.

	Info_ClearChoices	(Info_Mod_Friedel_Wettstreit);

	Info_AddChoice	(Info_Mod_Friedel_Wettstreit, "Ich komme gleich wieder.", Info_Mod_Friedel_Wettstreit_B);
	Info_AddChoice	(Info_Mod_Friedel_Wettstreit, "Ich bin bereit.", Info_Mod_Friedel_Wettstreit_A);
};

FUNC VOID Info_Mod_Friedel_Wettstreit_B()
{
	AI_Output(hero, self, "Info_Mod_Friedel_Wettstreit_B_15_00"); //Ich komme gleich wieder.

	Info_ClearChoices	(Info_Mod_Friedel_Wettstreit);
};

FUNC VOID Info_Mod_Friedel_Wettstreit_A()
{
	AI_Output(hero, self, "Info_Mod_Friedel_Wettstreit_A_15_00"); //Ich bin bereit.
	AI_Output(self, hero, "Info_Mod_Friedel_Wettstreit_A_01_01"); //Dann verlier keine Zeit!

	Mod_REL_Wettstreit = 2;

	B_LogEntry	(TOPIC_MOD_KHORATA_WETTSTREIT, "Ich muss nun möglichst viele Ratten am Seeufer töten.");

	Info_ClearChoices	(Info_Mod_Friedel_Wettstreit);

	AI_StopProcessInfos	(self);

	Mod_REL_Wettstreit_Tyrus = 0;
	Mod_REL_Wettstreit_Davon = 0;
	Mod_REL_Wettstreit_Hero = 0;

	B_StartOtherRoutine	(Mod_7519_OUT_Tyrus_REL, "RATTENJAGD");
	B_StartOtherRoutine	(Mod_7518_OUT_Davon_REL, "RATTENJAGD");

	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_381");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_381");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_381");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_381");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_381");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_381");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_381");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_381");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_381");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_381");

	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_380");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_380");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_380");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_380");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_380");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_380");

	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_378");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_378");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_378");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_378");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_378");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_378");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_378");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_378");

	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_376");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_376");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_376");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_376");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_376");
	Wld_InsertNpc	(Giant_Rat_Friedel, "REL_CITY_376");
};

INSTANCE Info_Mod_Friedel_Wettstreit2 (C_INFO)
{
	npc		= Mod_7517_OUT_Friedel_REL;
	nr		= 1;
	condition	= Info_Mod_Friedel_Wettstreit2_Condition;
	information	= Info_Mod_Friedel_Wettstreit2_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Friedel_Wettstreit2_Condition()
{
	if (Mod_REL_Wettstreit == 2)
	&& ((Mod_REL_Wettstreit_Hero > 0)
	|| (Mod_REL_Wettstreit_Davon > 0)
	|| (Mod_REL_Wettstreit_Tyrus > 0))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Friedel_Wettstreit2_Info()
{
	if (Mod_REL_Wettstreit_Hero > Mod_REL_Wettstreit_Tyrus)
	&& (Mod_REL_Wettstreit_Hero > Mod_REL_Wettstreit_Davon)
	{
		AI_Output(self, hero, "Info_Mod_Friedel_Wettstreit2_01_00"); //Alle Achtung, gegen dich hätte sogar ich es schwer gehabt.
		AI_Output(self, hero, "Info_Mod_Friedel_Wettstreit2_01_01"); //Dafür sollst du belohnt werden.

		B_GivePlayerXP	(50);

		B_GiveInvItems	(self, hero, ItMi_Gold, 100);

		Mod_REL_Wettstreit = 3;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Friedel_Wettstreit2_01_02"); //Heute hat es nicht gereicht.

		if (Mod_REL_Wettstreit_Verloren == 0)
		{
			AI_Output(self, hero, "Info_Mod_Friedel_Wettstreit2_01_03"); //Aber da wir dieses Jahr so viele Ratten haben, können wir morgen noch einen Wettstreit veranstalten. Vielleicht bist du dann erfolgreicher.

			Mod_REL_Wettstreit_Tag = Wld_GetDay();

			Mod_REL_Wettstreit = 1;

			Mod_REL_Wettstreit_Verloren = 1;
		}
		else
		{
			B_SetTopicStatus	(TOPIC_MOD_KHORATA_WETTSTREIT, LOG_FAILED);

			Mod_REL_Wettstreit = 4;
		};
	};

	B_StartOtherRoutine	(Mod_7519_OUT_Tyrus_REL, "START");
	B_StartOtherRoutine	(Mod_7518_OUT_Davon_REL, "START");
};

INSTANCE Info_Mod_Friedel_Buerger (C_INFO)
{
	npc		= Mod_7517_OUT_Friedel_REL;
	nr		= 1;
	condition	= Info_Mod_Friedel_Buerger_Condition;
	information	= Info_Mod_Friedel_Buerger_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_Mod_Friedel_Buerger_Condition()
{
	if (Mod_REL_Buerger == 1)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Friedel_Buerger_Info()
{
	AI_Output(self, hero, "Info_Mod_Friedel_Buerger_01_00"); //Ein neuer in unseren Reihen. Hier hast du das Startkapital.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	if (Mod_Verhandlungsgeschick > 0)
	{
		AI_Output(hero, self, "Info_Mod_Friedel_Buerger_15_01"); //Das ist aber wenig.

		if (self.aivar[AIV_Verhandlung] == TRUE)
		{
			AI_Output(self, hero, "Info_Mod_Friedel_Buerger_01_02"); //Da hast du schon Recht. Aber das hier muss reichen!

			B_GiveInvItems	(self, hero, ItMi_Gold, 200);

			B_RaiseHandelsgeschick (3);
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Friedel_Buerger_01_03"); //Das soll auch nicht für den Rest deines Lebens reichen! Geh arbeiten!
		};
	};
};

INSTANCE Info_Mod_Friedel_Unruhen (C_INFO)
{
	npc		= Mod_7517_OUT_Friedel_REL;
	nr		= 1;
	condition	= Info_Mod_Friedel_Unruhen_Condition;
	information	= Info_Mod_Friedel_Unruhen_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Wir wollen die Bergleute aufmischen. Komm mit.";
};                       

FUNC INT Info_Mod_Friedel_Unruhen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lukas_Unruhen4))
	&& (Mod_REL_LukasS == 0)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Friedel_Unruhen_Info()
{
	AI_Output(hero, self, "Info_Mod_Friedel_Unruhen_15_00"); //Wir wollen die Bergleute aufmischen. Komm mit.
	AI_Output(self, hero, "Info_Mod_Friedel_Unruhen_01_01"); //Na schön, auch wenn es so nicht richtig ist.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOWTOMINE");

	self.aivar[AIV_Partymember] = TRUE;
};

INSTANCE Info_Mod_Friedel_Freudenspender (C_INFO)
{
	npc		= Mod_7517_OUT_Friedel_REL;
	nr		= 1;
	condition	= Info_Mod_Friedel_Freudenspender_Condition;
	information	= Info_Mod_Friedel_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Willst du Freudenspender?";
};                       

FUNC INT Info_Mod_Friedel_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Friedel_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Friedel_Freudenspender_15_00"); //Willst du Freudenspender?
	AI_Output(self, hero, "Info_Mod_Friedel_Freudenspender_01_01"); //Sag mal, willst du mich verarschen? Nein, will ich nicht!
};

INSTANCE Info_Mod_Friedel_Lernen (C_INFO)
{
	npc		= Mod_7517_OUT_Friedel_REL;
	nr		= 1;
	condition	= Info_Mod_Friedel_Lernen_Condition;
	information	= Info_Mod_Friedel_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will lernen.";
};

FUNC INT Info_Mod_Friedel_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Friedel_Hi))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Friedel_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Friedel_Lernen_15_00"); //Ich will lernen.
	AI_Output(self, hero, "Info_Mod_Friedel_Lernen_01_01"); //Was willst du lernen?

	Info_ClearChoices	(Info_Mod_Friedel_Lernen);

	Info_AddChoice	(Info_Mod_Friedel_Lernen, DIALOG_BACK, Info_Mod_Friedel_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Friedel_Lernen, "(Einhandkampf)", Info_Mod_Friedel_Lernen_Einhand);
	Info_AddChoice	(Info_Mod_Friedel_Lernen, "(Stärke)", Info_Mod_Friedel_Lernen_Staerke);
};

FUNC VOID Info_Mod_Friedel_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Friedel_Lernen);
};

FUNC VOID Info_Mod_Friedel_Lernen_Einhand()
{
	Info_ClearChoices	(Info_Mod_Friedel_Lernen);

	Info_AddChoice		(Info_Mod_Friedel_Lernen, DIALOG_BACK, Info_Mod_Friedel_Lernen_Einhand_BACK);
	Info_AddChoice		(Info_Mod_Friedel_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H))		,Info_Mod_Friedel_Lernen_Einhand_5);
	Info_AddChoice		(Info_Mod_Friedel_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1))		,Info_Mod_Friedel_Lernen_Einhand_1);
};

FUNC VOID Info_Mod_Friedel_Lernen_Einhand_BACK()
{
	Info_ClearChoices	(Info_Mod_Friedel_Lernen);

	Info_AddChoice	(Info_Mod_Friedel_Lernen, DIALOG_BACK, Info_Mod_Friedel_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Friedel_Lernen, "(Einhandkampf)", Info_Mod_Friedel_Lernen_Einhand);
	Info_AddChoice	(Info_Mod_Friedel_Lernen, "(Stärke)", Info_Mod_Friedel_Lernen_Staerke);
};

FUNC VOID Info_Mod_Friedel_Lernen_Einhand_5()
{
	if B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_1H, 5, 100)
	{
		Info_ClearChoices	(Info_Mod_Friedel_Lernen);

		Info_AddChoice		(Info_Mod_Friedel_Lernen, DIALOG_BACK, Info_Mod_Friedel_Lernen_Einhand_BACK);
		Info_AddChoice		(Info_Mod_Friedel_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H))		,Info_Mod_Friedel_Lernen_Einhand_5);
		Info_AddChoice		(Info_Mod_Friedel_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1))		,Info_Mod_Friedel_Lernen_Einhand_1);
	};
};

FUNC VOID Info_Mod_Friedel_Lernen_Einhand_1()
{
	if B_TeachFightTalentPercent	(self, hero, NPC_TALENT_1H, 1, 100)
	{
		Info_ClearChoices	(Info_Mod_Friedel_Lernen);

		Info_AddChoice		(Info_Mod_Friedel_Lernen, DIALOG_BACK, Info_Mod_Friedel_Lernen_Einhand_BACK);
		Info_AddChoice		(Info_Mod_Friedel_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H))		,Info_Mod_Friedel_Lernen_Einhand_5);
		Info_AddChoice		(Info_Mod_Friedel_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1))		,Info_Mod_Friedel_Lernen_Einhand_1);
	};
};	

FUNC VOID Info_Mod_Friedel_Lernen_Staerke()
{
	Info_ClearChoices	(Info_Mod_Friedel_Lernen);

	Info_AddChoice 		(Info_Mod_Friedel_Lernen, DIALOG_BACK, Info_Mod_Friedel_Lernen_Staerke_BACK);
	Info_AddChoice		(Info_Mod_Friedel_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Friedel_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Friedel_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Friedel_Lernen_Staerke_1);
};

FUNC VOID Info_Mod_Friedel_Lernen_Staerke_BACK()
{
	Info_ClearChoices	(Info_Mod_Friedel_Lernen);

	Info_AddChoice	(Info_Mod_Friedel_Lernen, DIALOG_BACK, Info_Mod_Friedel_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Friedel_Lernen, "(Einhandkampf)", Info_Mod_Friedel_Lernen_Einhand);
	Info_AddChoice	(Info_Mod_Friedel_Lernen, "(Stärke)", Info_Mod_Friedel_Lernen_Staerke);
};

FUNC VOID Info_Mod_Friedel_Lernen_Staerke_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_STRENGTH, 5, 200);
	
	Info_ClearChoices	(Info_Mod_Friedel_Lernen);

	Info_AddChoice 		(Info_Mod_Friedel_Lernen, DIALOG_BACK, Info_Mod_Friedel_Lernen_Staerke_BACK);
	Info_AddChoice		(Info_Mod_Friedel_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Friedel_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Friedel_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Friedel_Lernen_Staerke_1);
};

FUNC VOID Info_Mod_Friedel_Lernen_Staerke_1()
{
	B_TeachAttributePoints	(self, hero, ATR_STRENGTH, 1, 200);

	Info_ClearChoices	(Info_Mod_Friedel_Lernen);

	Info_AddChoice 		(Info_Mod_Friedel_Lernen, DIALOG_BACK, Info_Mod_Friedel_Lernen_Staerke_BACK);
	Info_AddChoice		(Info_Mod_Friedel_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Friedel_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Friedel_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Friedel_Lernen_Staerke_1);
};

INSTANCE Info_Mod_Friedel_Pickpocket (C_INFO)
{
	npc		= Mod_7517_OUT_Friedel_REL;
	nr		= 1;
	condition	= Info_Mod_Friedel_Pickpocket_Condition;
	information	= Info_Mod_Friedel_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Friedel_Pickpocket_Condition()
{
	C_Beklauen	(83, ItMi_Gold, 200);
};

FUNC VOID Info_Mod_Friedel_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Friedel_Pickpocket);

	Info_AddChoice	(Info_Mod_Friedel_Pickpocket, DIALOG_BACK, Info_Mod_Friedel_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Friedel_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Friedel_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Friedel_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Friedel_Pickpocket);
};

FUNC VOID Info_Mod_Friedel_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Friedel_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Friedel_Pickpocket);

		Info_AddChoice	(Info_Mod_Friedel_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Friedel_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Friedel_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Friedel_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Friedel_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Friedel_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Friedel_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Friedel_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Friedel_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Friedel_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Friedel_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Friedel_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Friedel_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Friedel_EXIT (C_INFO)
{
	npc		= Mod_7517_OUT_Friedel_REL;
	nr		= 1;
	condition	= Info_Mod_Friedel_EXIT_Condition;
	information	= Info_Mod_Friedel_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Friedel_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Friedel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};