INSTANCE Info_Mod_Wasili_BelohnungMaria (C_INFO)
{
	npc		= Mod_100_BAU_Wasili_NW;
	nr		= 1;
	condition	= Info_Mod_Wasili_BelohnungMaria_Condition;
	information	= Info_Mod_Wasili_BelohnungMaria_Info;
	permanent	= 0;
	important	= 0;
	description	= "Maria meinte, du solltest mir noch 200 Goldmünzen geben.";
};

FUNC INT Info_Mod_Wasili_BelohnungMaria_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Maria_BelohnungOnar))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wasili_BelohnungMaria_Info()
{
	AI_Output(hero, self, "Info_Mod_Wasili_BelohnungMaria_15_00"); //Maria meinte, du solltest mir noch 200 Goldmünzen geben.
	AI_Output(self, hero, "Info_Mod_Wasili_BelohnungMaria_01_01"); //Was?! Und wenn Onar davon erfährt? Dann wird mich nicht mal Maria vor seinem Zorn schützten können.
	AI_Output(self, hero, "Info_Mod_Wasili_BelohnungMaria_01_02"); //100 Goldmünzen. Mehr kann ich dir nicht geben.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	Mod_WM_WasiliTag = Wld_GetDay();
	Mod_WM_WasiliQuest = 1;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Wasili_Verbannt_01 (C_INFO)
{
	npc		= Mod_100_BAU_Wasili_NW;
	nr		= 1;
	condition	= Info_Mod_Wasili_Verbannt_01_Condition;
	information	= Info_Mod_Wasili_Verbannt_01_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wasili_Verbannt_01_Condition()
{
	if (Mod_WM_WasiliQuest == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wasili_Verbannt_01_Info()
{
	AI_Output(self, hero, "Info_Mod_Wasili_Verbannt_01_01_00"); //(lallend) Verdammmte Scheiße. Vom Hof hat er mich geschmissen.
	AI_Output(hero, self, "Info_Mod_Wasili_Verbannt_01_15_01"); //Was ist passiert?
	AI_Output(self, hero, "Info_Mod_Wasili_Verbannt_01_01_02"); //(vorwurfsvoll) Dieser Mistkerl Onar hat mich vom Hof geworfen, weil ich dir das Gold gegeben habe.
	AI_Output(self, hero, "Info_Mod_Wasili_Verbannt_01_01_03"); //Jetzt kann ich nichts anderes machen, als hier beim Feldräuberdreck herumzusetzen und zu saufen.
	AI_Output(self, hero, "Info_Mod_Wasili_Verbannt_01_01_04"); //Und wenn Thekla mir nicht hin und wieder was zu Essen vorbeibringen würde, müsste ich elendig vor Hunger krepieren.

	Info_ClearChoices	(Info_Mod_Wasili_Verbannt_01);

	Info_AddChoice	(Info_Mod_Wasili_Verbannt_01, "Interessiert mich nicht.", Info_Mod_Wasili_Verbannt_01_B);
	Info_AddChoice	(Info_Mod_Wasili_Verbannt_01, "Was lässt sich da machen?", Info_Mod_Wasili_Verbannt_01_A);
};

FUNC VOID Info_Mod_Wasili_Verbannt_01_B()
{
	AI_Output(hero, self, "Info_Mod_Wasili_Verbannt_01_B_15_00"); //Interessiert mich nicht.
	AI_Output(self, hero, "Info_Mod_Wasili_Verbannt_01_B_01_01"); //Es interessiert dich nicht?! Wegen dir bin ich hier gelandet, du verdammter Bastard. Ich muss dir wohl die Fresse polieren.
	
	Info_ClearChoices	(Info_Mod_Wasili_Verbannt_01);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);
};

FUNC VOID Info_Mod_Wasili_Verbannt_01_A()
{
	AI_Output(hero, self, "Info_Mod_Wasili_Verbannt_01_A_15_00"); //Was lässt sich da machen?
	AI_Output(self, hero, "Info_Mod_Wasili_Verbannt_01_A_01_01"); //Was sich machen lässt? Diesem Onar ordentlich in den Arsch treten sollte man.
	AI_Output(self, hero, "Info_Mod_Wasili_Verbannt_01_A_01_02"); //Dem würde ich eine ordentliche Portion von diesem Feldräuberdreck in seinen Schnaps mischen, wenn ich könnte.
	
	Mod_WM_WasiliQuest = 3;

	Mob_CreateItems	("ONARSTRUHE", ItFo_OnarsSchnaps, 1);

	Log_CreateTopic	(TOPIC_MOD_ADANOS_WASILI, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ADANOS_WASILI, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ADANOS_WASILI, "Onar hat Wasili vom Hof verbannt, weil er mir damals das Geld geben hatte. Jemand sollte mit Onar sprechen, damit Wasili wieder zurück kann.");

	Info_ClearChoices	(Info_Mod_Wasili_Verbannt_01);
};

INSTANCE Info_Mod_Wasili_Verbannt_02 (C_INFO)
{
	npc		= Mod_100_BAU_Wasili_NW;
	nr		= 1;
	condition	= Info_Mod_Wasili_Verbannt_02_Condition;
	information	= Info_Mod_Wasili_Verbannt_02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier, ich habe etwas zu Essen von Thekla für dich.";
};

FUNC INT Info_Mod_Wasili_Verbannt_02_Condition()
{
	if (Mod_WM_WasiliQuest == 3)
	&& (Npc_HasItems(hero, ItMi_EsspaketWasili) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wasili_Verbannt_02_Info()
{
	AI_Output(hero, self, "Info_Mod_Wasili_Verbannt_02_15_00"); //Hier, ich habe etwas zu Essen von Thekla für dich.

	B_GiveInvItems	(hero, self, ItMi_EsspaketWasili, 1);

	AI_Output(self, hero, "Info_Mod_Wasili_Verbannt_02_01_01"); //(lallend) Hab vielen Dank. Ich sterbe schon vor Hunger.

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Wasili_Verbannt_03 (C_INFO)
{
	npc		= Mod_100_BAU_Wasili_NW;
	nr		= 1;
	condition	= Info_Mod_Wasili_Verbannt_03_Condition;
	information	= Info_Mod_Wasili_Verbannt_03_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe Onar’s Schnaps.";
};

FUNC INT Info_Mod_Wasili_Verbannt_03_Condition()
{
	if (Mod_WM_WasiliQuest == 3)
	&& (Npc_HasItems(hero, ItFo_OnarsSchnaps) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wasili_Verbannt_03_Info()
{
	AI_Output(hero, self, "Info_Mod_Wasili_Verbannt_03_15_00"); //Ich habe Onar’s Schnaps.

	B_GiveInvItems	(hero, self, ItFo_OnarsSchnaps, 1);

	AI_Output(self, hero, "Info_Mod_Wasili_Verbannt_03_01_01"); //Ha, dann mal her damit. Zuerst der Feldräuberdreck und dann ...

	AI_PlayAni (self, "T_PLUNDER");
	AI_PlayAni (self,"T_STAND_2_PEE");
	AI_PlayAni (self,"T_PEE_2_STAND");

	AI_Output(self, hero, "Info_Mod_Wasili_Verbannt_03_01_02"); //So, dass dürfte dem alten Schwein ordentlich auf den Magen schlagen. (lacht betrunken)

	B_GiveInvItems	(self, hero, ItFo_OnarsSchnaps2, 1);

	B_LogEntry	(TOPIC_MOD_ADANOS_WASILI, "Wasili hat Onar’s Schnaps präpariert. Jetzt muss ich ihn nur noch dorthin zurückbringen, woher ich ihn geholt habe.");
};

INSTANCE Info_Mod_Wasili_Pickpocket (C_INFO)
{
	npc		= Mod_100_BAU_Wasili_NW;
	nr		= 1;
	condition	= Info_Mod_Wasili_Pickpocket_Condition;
	information	= Info_Mod_Wasili_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Wasili_Pickpocket_Condition()
{
	C_Beklauen	(75, ItMi_Gold, 300);
};

FUNC VOID Info_Mod_Wasili_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Wasili_Pickpocket);

	Info_AddChoice	(Info_Mod_Wasili_Pickpocket, DIALOG_BACK, Info_Mod_Wasili_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Wasili_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Wasili_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Wasili_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Wasili_Pickpocket);
};

FUNC VOID Info_Mod_Wasili_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Wasili_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Wasili_Pickpocket);

		Info_AddChoice	(Info_Mod_Wasili_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Wasili_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Wasili_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Wasili_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Wasili_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Wasili_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Wasili_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Wasili_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Wasili_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Wasili_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Wasili_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Wasili_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Wasili_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Wasili_EXIT (C_INFO)
{
	npc		= Mod_100_BAU_Wasili_NW;
	nr		= 1;
	condition	= Info_Mod_Wasili_EXIT_Condition;
	information	= Info_Mod_Wasili_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Wasili_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wasili_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};