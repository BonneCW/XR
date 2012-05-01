INSTANCE Info_Mod_Henrik_Hi (C_INFO)
{
	npc		= Mod_7383_OUT_Henrik_REL;
	nr		= 1;
	condition	= Info_Mod_Henrik_Hi_Condition;
	information	= Info_Mod_Henrik_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie läuft die Arbeit?";
};

FUNC INT Info_Mod_Henrik_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Henrik_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Henrik_Hi_15_00"); //Wie läuft die Arbeit?
	AI_Output(self, hero, "Info_Mod_Henrik_Hi_07_01"); //Nicht gut. Wir haben schon so wenige Fischchen in unserem See ... und es werden immer weniger!
	AI_Output(hero, self, "Info_Mod_Henrik_Hi_15_02"); //Warum das?
	AI_Output(self, hero, "Info_Mod_Henrik_Hi_07_03"); //In dem Wald gegenüber gibt es wahre Horden von Molerats.
	AI_Output(self, hero, "Info_Mod_Henrik_Hi_07_04"); //Vincent, unser Jäger, scheint nicht allzu erfolgreich in letzter Zeit zu sein, und so werden es immer mehr.
	AI_Output(self, hero, "Info_Mod_Henrik_Hi_07_05"); //Die Molerats gehen gern zur Abkühlung schwimmen und schleppen dabei Unmengen an Dreck mit ins Wasser.
	AI_Output(self, hero, "Info_Mod_Henrik_Hi_07_06"); //Kein Wunder, dass die Fischchen alle verrecken. Würde ich an deren Stelle auch tun. Muss an dem Freudenspender liegen ...
	AI_Output(hero, self, "Info_Mod_Henrik_Hi_15_07"); //Wie meinen?
	AI_Output(self, hero, "Info_Mod_Henrik_Hi_07_08"); //Dass Vincent nicht mehr erfolgreich jagt. Der ist doch immer zugedröhnt. Also - übernimmst du die Sache mit den Molerats?

	Info_ClearChoices	(Info_Mod_Henrik_Hi);

	Info_AddChoice	(Info_Mod_Henrik_Hi, "Man muss der Natur manchmal ihren Lauf lassen.", Info_Mod_Henrik_Hi_B);
	Info_AddChoice	(Info_Mod_Henrik_Hi, "Kein Problem.", Info_Mod_Henrik_Hi_A);
};


FUNC VOID Info_Mod_Henrik_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Henrik_Hi_B_15_00"); //Man muss der Natur manchmal ihren Lauf lassen.

	Info_ClearChoices	(Info_Mod_Henrik_Hi);
};

FUNC VOID Info_Mod_Henrik_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Henrik_Hi_A_15_00"); //Kein Problem.
	AI_Output(self, hero, "Info_Mod_Henrik_Hi_A_07_01"); //Schön!
	AI_Output(self, hero, "Info_Mod_Henrik_Hi_A_07_02"); //Bei mir wirkt das Zeug übrigens nicht ...
	AI_Output(hero, self, "Info_Mod_Henrik_Hi_A_15_03"); //Was?
	AI_Output(self, hero, "Info_Mod_Henrik_Hi_A_07_04"); //Freudenspender! Okay?
	AI_Output(hero, self, "Info_Mod_Henrik_Hi_A_15_05"); //Alles klar!

	Log_CreateTopic	(TOPIC_MOD_KHORATA_SCHWEINE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_SCHWEINE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KHORATA_SCHWEINE, "Der Fischer Henrik beschwert sich darüber, dass die Molerats auf der Waldseite des großen Sees diesen beim Baden verdrecken und dadurch die Fische sterben. Ich soll die Molerats also gehörig dezimieren.");

	Mod_Henrik_Schweine = 1;

	Info_ClearChoices	(Info_Mod_Henrik_Hi);
};

INSTANCE Info_Mod_Henrik_MoleratsTot (C_INFO)
{
	npc		= Mod_7383_OUT_Henrik_REL;
	nr		= 1;
	condition	= Info_Mod_Henrik_MoleratsTot_Condition;
	information	= Info_Mod_Henrik_MoleratsTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe die Molerats erlegt.";
};

FUNC INT Info_Mod_Henrik_MoleratsTot_Condition()
{
	if (Mod_Henrik_Schweine == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Henrik_MoleratsTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Henrik_MoleratsTot_15_00"); //Ich habe die Molerats erlegt.
	AI_Output(self, hero, "Info_Mod_Henrik_MoleratsTot_07_01"); //Dankesehr! Hier hast du eine Flasche Grog als Belohnung, die brauche ich nicht mehr.

	B_GiveInvItems	(self, hero, ItFo_Addon_Grog, 1);

	AI_Output(self, hero, "Info_Mod_Henrik_MoleratsTot_07_02"); //Mach's gut!

	AI_StopProcessInfos	(self);

	B_SetTopicStatus	(TOPIC_MOD_KHORATA_SCHWEINE, LOG_SUCCESS);

	B_GivePlayerXP	(100);

	CurrentNQ += 1;

	Mod_REL_QuestCounter += 1;
};

INSTANCE Info_Mod_Henrik_Freudenspender (C_INFO)
{
	npc		= Mod_7383_OUT_Henrik_REL;
	nr		= 1;
	condition	= Info_Mod_Henrik_Freudenspender_Condition;
	information	= Info_Mod_Henrik_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Freudenspender gegen die Einsamkeit?";
};                       

FUNC INT Info_Mod_Henrik_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Henrik_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Henrik_Freudenspender_15_00"); //Freudenspender gegen die Einsamkeit?
	AI_Output(self, hero, "Info_Mod_Henrik_Freudenspender_07_01"); //Ja, ja, sehr gut.

	B_GiveInvItems	(hero, self, ItMi_Freudenspender, 1);

	B_GiveInvItems	(self, hero, ItMi_Gold, 10);

	AI_Output(self, hero, "Info_Mod_Henrik_Freudenspender_07_02"); //Sie beißen gut an, was?
	AI_Output(hero, self, "Info_Mod_Henrik_Freudenspender_15_03"); //Wer?
	AI_Output(self, hero, "Info_Mod_Henrik_Freudenspender_07_04"); //Die dummen Fischchen. Okay?
	AI_Output(hero, self, "Info_Mod_Henrik_Freudenspender_15_05"); //Klar.

	Mod_Freudenspender	+= 1;
};

INSTANCE Info_Mod_Henrik_Pickpocket (C_INFO)
{
	npc		= Mod_7383_OUT_Henrik_REL;
	nr		= 1;
	condition	= Info_Mod_Henrik_Pickpocket_Condition;
	information	= Info_Mod_Henrik_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Henrik_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 150);
};

FUNC VOID Info_Mod_Henrik_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Henrik_Pickpocket);

	Info_AddChoice	(Info_Mod_Henrik_Pickpocket, DIALOG_BACK, Info_Mod_Henrik_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Henrik_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Henrik_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Henrik_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Henrik_Pickpocket);
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

INSTANCE Info_Mod_Henrik_EXIT (C_INFO)
{
	npc		= Mod_7383_OUT_Henrik_REL;
	nr		= 1;
	condition	= Info_Mod_Henrik_EXIT_Condition;
	information	= Info_Mod_Henrik_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Henrik_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Henrik_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};