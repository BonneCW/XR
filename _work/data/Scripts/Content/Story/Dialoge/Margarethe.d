INSTANCE Info_Mod_Margarethe_Hi (C_INFO)
{
	npc		= Mod_7365_OUT_Margarethe_REL;
	nr		= 1;
	condition	= Info_Mod_Margarethe_Hi_Condition;
	information	= Info_Mod_Margarethe_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du siehst nicht glücklich aus.";
};

FUNC INT Info_Mod_Margarethe_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Margarethe_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Margarethe_Hi_15_00"); //Du siehst nicht glücklich aus.
	AI_Output(self, hero, "Info_Mod_Margarethe_Hi_17_01"); //(zittrig) Sie haben sie mitgenommen! Eingesperrt! In Ketten gelegt! (schluchzt)
	AI_Output(hero, self, "Info_Mod_Margarethe_Hi_15_02"); //Jetzt mal ganz ruhig.
	AI_Output(self, hero, "Info_Mod_Margarethe_Hi_17_03"); //(atmet tief durch) Anna ... sie ist meine Schwester ... es wurde viel gemunkelt, dass sie eine Hexe sei ... sich Beliar verschrieben habe.
	AI_Output(self, hero, "Info_Mod_Margarethe_Hi_17_04"); //Es trifft immer die Kräuterkundigen! Irgendjemand muss sie denunziert haben ...
	AI_Output(self, hero, "Info_Mod_Margarethe_Hi_17_05"); //Ich war gerade bei ihr, als sie kamen. (schluchzt)

	Info_ClearChoices	(Info_Mod_Margarethe_Hi);

	Info_AddChoice	(Info_Mod_Margarethe_Hi, "Weißt du, wer Anna denunziert hat?", Info_Mod_Margarethe_Hi_B);
	Info_AddChoice	(Info_Mod_Margarethe_Hi, "Wer ist gekommen?", Info_Mod_Margarethe_Hi_A);
};

FUNC VOID Info_Mod_Margarethe_Hi_C()
{
	Info_ClearChoices	(Info_Mod_Margarethe_Hi);

	Info_AddChoice	(Info_Mod_Margarethe_Hi, "Anna wird nicht ohne Grund abgeführt worden sein.", Info_Mod_Margarethe_Hi_E);
	Info_AddChoice	(Info_Mod_Margarethe_Hi, "Was können wir tun?", Info_Mod_Margarethe_Hi_D);
};

FUNC VOID Info_Mod_Margarethe_Hi_E()
{
	AI_Output(hero, self, "Info_Mod_Margarethe_Hi_E_15_00"); //Anna wird nicht ohne Grund abgeführt worden sein. Ich werde mich hüten, gegen das Gesetz vorzugehen.
	AI_Output(self, hero, "Info_Mod_Margarethe_Hi_E_17_01"); //(ruft) Du bist genauso dumm wie die anderen auch! Lass mich in Ruhe!
	
	Info_ClearChoices	(Info_Mod_Margarethe_Hi);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Margarethe_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Margarethe_Hi_D_15_00"); //Was können wir tun?
	AI_Output(self, hero, "Info_Mod_Margarethe_Hi_D_17_01"); //Erzähl Ulrich davon. Er ist Annas und mein Bruder ... er wohnt nur ein paar Häuser weiter.
	AI_Output(self, hero, "Info_Mod_Margarethe_Hi_D_17_02"); //Ich, ich weiß nicht mehr weiter ... Sie wird jetzt sicher gefoltert, Anna, wir müssen irgendwie helfen!
	AI_Output(hero, self, "Info_Mod_Margarethe_Hi_D_15_03"); //Das kriegen wir schon wieder hin.
	
	Log_CreateTopic	(TOPIC_MOD_KHORATA_HEXENWAHN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_HEXENWAHN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KHORATA_HEXENWAHN, "Marias Schwester Anna ist bei den Bewohnern Khoratas als Hexe verschrien und deswegen gefänglich eingezogen worden. Maria hat mich gebeten, ihren Bruder Ulrich, der in der Nähe von Anna wohnt, davon zu berichten und einen Weg zu suchen, Anna zu helfen.");

	Info_ClearChoices	(Info_Mod_Margarethe_Hi);

	Mod_AnnaQuest = 3;
};

FUNC VOID Info_Mod_Margarethe_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Margarethe_Hi_B_15_00"); //Weißt du, wer Anna denunziert hat?
	AI_Output(self, hero, "Info_Mod_Margarethe_Hi_B_17_01"); //Nein, weiß ich nicht. (bitter) Es wäre fast jedem Einfältigen hier zuzutrauen, dass er die Ammenmärchen von Hexen glaubt.

	Mod_AnnaQuest += 1;
	
	if (Mod_AnnaQuest == 1)
	{
		Info_ClearChoices	(Info_Mod_Margarethe_Hi);

		Info_AddChoice	(Info_Mod_Margarethe_Hi, "Wer ist gekommen?", Info_Mod_Margarethe_Hi_A);
	}
	else
	{
		Info_Mod_Margarethe_Hi_C();
	};
};

FUNC VOID Info_Mod_Margarethe_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Margarethe_Hi_A_15_00"); //Wer ist gekommen?
	AI_Output(self, hero, "Info_Mod_Margarethe_Hi_A_17_01"); //Die Schöppen! Haben sie herumgestoßen und begrapscht, und dann wurde sie ins Gefängnis abgeführt. Ich habe versucht zu helfen ...

	Mod_AnnaQuest += 1;
	
	if (Mod_AnnaQuest == 1)
	{
		Info_ClearChoices	(Info_Mod_Margarethe_Hi);

		Info_AddChoice	(Info_Mod_Margarethe_Hi, "Weißt du, wer Anna denunziert hat?", Info_Mod_Margarethe_Hi_B);
	}
	else
	{
		Info_Mod_Margarethe_Hi_C();
	};
};

INSTANCE Info_Mod_Margarethe_AnnaBefreit (C_INFO)
{
	npc		= Mod_7365_OUT_Margarethe_REL;
	nr		= 1;
	condition	= Info_Mod_Margarethe_AnnaBefreit_Condition;
	information	= Info_Mod_Margarethe_AnnaBefreit_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Margarethe_AnnaBefreit_Condition()
{
	if (Mod_AnnaQuest == 9)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Margarethe_AnnaBefreit_Info()
{
	AI_Output(self, hero, "Info_Mod_Margarethe_AnnaBefreit_17_00"); //Das Gerücht verbreitet sich schon in der ganzen Stadt! Habt ihr wirklich alle getötet?
	AI_Output(hero, self, "Info_Mod_Margarethe_AnnaBefreit_15_01"); //Ja.
	AI_Output(self, hero, "Info_Mod_Margarethe_AnnaBefreit_17_02"); //Oh Adanos, uns steht noch Schreckliches bevor!
};

INSTANCE Info_Mod_Margarethe_UlrichKO (C_INFO)
{
	npc		= Mod_7365_OUT_Margarethe_REL;
	nr		= 1;
	condition	= Info_Mod_Margarethe_UlrichKO_Condition;
	information	= Info_Mod_Margarethe_UlrichKO_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Margarethe_UlrichKO_Condition()
{
	if (Mod_AnnaQuest == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Margarethe_UlrichKO_Info()
{
	AI_Output(self, hero, "Info_Mod_Margarethe_UlrichKO_17_00"); //Das Gerücht verbreitet sich schon in der ganzen Stadt! Ulrich wollte wirklich alle töten?
	AI_Output(hero, self, "Info_Mod_Margarethe_UlrichKO_15_01"); //Ja.
	AI_Output(self, hero, "Info_Mod_Margarethe_UlrichKO_17_02"); //Ich kann dir deine Entscheidung nicht verübeln, aber ich heiße sie nicht gut.
};

INSTANCE Info_Mod_Margarethe_Freudenspender (C_INFO)
{
	npc		= Mod_7365_OUT_Margarethe_REL;
	nr		= 1;
	condition	= Info_Mod_Margarethe_Freudenspender_Condition;
	information	= Info_Mod_Margarethe_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Magst du mir etwas Freudenspender abnehmen?";
};                       

FUNC INT Info_Mod_Margarethe_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Margarethe_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Margarethe_Freudenspender_15_00"); //Magst du mir etwas Freudenspender abnehmen?
	AI_Output(self, hero, "Info_Mod_Margarethe_Freudenspender_17_01"); //Mein Rat ist: Vernichte es. Es richtet nichts Gutes an.
};

INSTANCE Info_Mod_Margarethe_Pickpocket (C_INFO)
{
	npc		= Mod_7365_OUT_Margarethe_REL;
	nr		= 1;
	condition	= Info_Mod_Margarethe_Pickpocket_Condition;
	information	= Info_Mod_Margarethe_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90_Female;
};

FUNC INT Info_Mod_Margarethe_Pickpocket_Condition()
{
	C_Beklauen	(65, ItMi_Gold, 150);
};

FUNC VOID Info_Mod_Margarethe_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Margarethe_Pickpocket);

	Info_AddChoice	(Info_Mod_Margarethe_Pickpocket, DIALOG_BACK, Info_Mod_Margarethe_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Margarethe_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Margarethe_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Margarethe_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Margarethe_Pickpocket);
};

FUNC VOID Info_Mod_Margarethe_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Margarethe_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Margarethe_Pickpocket);

		Info_AddChoice	(Info_Mod_Margarethe_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Margarethe_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Margarethe_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Margarethe_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Margarethe_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Margarethe_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Margarethe_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Margarethe_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Margarethe_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Margarethe_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Margarethe_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Margarethe_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Margarethe_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Margarethe_EXIT (C_INFO)
{
	npc		= Mod_7365_OUT_Margarethe_REL;
	nr		= 1;
	condition	= Info_Mod_Margarethe_EXIT_Condition;
	information	= Info_Mod_Margarethe_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Margarethe_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Margarethe_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};