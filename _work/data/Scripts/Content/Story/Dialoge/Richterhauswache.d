INSTANCE Info_Mod_Richterhauswache_Blutkelch (C_INFO)
{
	npc		= Mod_1181_MIL_Tuerwache_NW;
	nr		= 1;
	condition	= Info_Mod_Richterhauswache_Blutkelch_Condition;
	information	= Info_Mod_Richterhauswache_Blutkelch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Richterhauswache_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Yussuf_Blutkelch3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Richterhauswache_Blutkelch_Info()
{
	AI_Output(self, hero, "Info_Mod_Richterhauswache_Blutkelch_07_00"); //Halt! Eintritt nur für geladene Gäste.
	AI_Output(hero, self, "Info_Mod_Richterhauswache_Blutkelch_15_01"); //Wir wollen vor dem Richter eine Eingabe machen.
	AI_Output(self, hero, "Info_Mod_Richterhauswache_Blutkelch_07_02"); //Dann wendet euch an den Statthalter oder den Kommandanten der Stadtwache.
	AI_Output(hero, self, "Info_Mod_Richterhauswache_Blutkelch_15_03"); //Die haben uns hierher geschickt. Es geht um eine Sache der inneren Sicherheit.
	AI_Output(self, hero, "Info_Mod_Richterhauswache_Blutkelch_07_04"); //Da muss ich erst den Richter fragen. Ihr wartet hier!

	AI_StopProcessInfos	(self);

	AI_SetWalkmode 	(self, NPC_RUN);

	AI_GotoWP	(self, "NW_CITY_UPTOWN_JUDGE_05");

	AI_Wait	(hero, 2);

	AI_GotoWP	(hero, "NW_CITY_RICHTER_COOK");
	AI_GotoWP	(self, self.wp);
};

INSTANCE Info_Mod_Richterhauswache_Blutkelch2 (C_INFO)
{
	npc		= Mod_1181_MIL_Tuerwache_NW;
	nr		= 1;
	condition	= Info_Mod_Richterhauswache_Blutkelch2_Condition;
	information	= Info_Mod_Richterhauswache_Blutkelch2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Richterhauswache_Blutkelch2_Condition()
{
	if (Mod_ASS_Richter == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Richterhauswache_Blutkelch2_Info()
{
	AI_Output(self, hero, "Info_Mod_Richterhauswache_Blutkelch2_07_00"); //Nanu, wo kommst du denn her? Hab dich gar nicht reingehen sehen.
	AI_Output(hero, self, "Info_Mod_Richterhauswache_Blutkelch2_15_01"); //Ich sage nur: Innere Sicherheit. Der Fall hat sich erledigt.
	AI_Output(self, hero, "Info_Mod_Richterhauswache_Blutkelch2_07_02"); //Ich verstehe nicht.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_ASS_BLUTKELCH, "Ich habe den Blutkelch. Der Rat sollte zufrieden sein.");

	B_StartOtherRoutine	(self,	"START");
	B_StartOtherRoutine	(Mod_7113_ASS_Yussuf_NW,	"FOLLOW");
};

INSTANCE Info_Mod_Richterhauswache_Pickpocket (C_INFO)
{
	npc		= Mod_1181_MIL_Tuerwache_NW;
	nr		= 1;
	condition	= Info_Mod_Richterhauswache_Pickpocket_Condition;
	information	= Info_Mod_Richterhauswache_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Richterhauswache_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Richterhauswache_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Richterhauswache_Pickpocket);

	Info_AddChoice	(Info_Mod_Richterhauswache_Pickpocket, DIALOG_BACK, Info_Mod_Richterhauswache_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Richterhauswache_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Richterhauswache_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Richterhauswache_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Richterhauswache_Pickpocket);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Richterhauswache_EXIT (C_INFO)
{
	npc		= Mod_1181_MIL_Tuerwache_NW;
	nr		= 1;
	condition	= Info_Mod_Richterhauswache_EXIT_Condition;
	information	= Info_Mod_Richterhauswache_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Richterhauswache_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Richterhauswache_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};