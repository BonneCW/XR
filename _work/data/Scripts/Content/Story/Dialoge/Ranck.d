INSTANCE Info_Mod_Ranck_FreudenspenderMachtBlind (C_INFO)
{
	npc		= Mod_7351_OUT_Ranck_REL;
	nr		= 1;
	condition	= Info_Mod_Ranck_FreudenspenderMachtBlind_Condition;
	information	= Info_Mod_Ranck_FreudenspenderMachtBlind_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ranck_FreudenspenderMachtBlind_Condition()
{
	if (Mod_SL_PartBlind == 1)
	&& (Mod_SL_PartBlind_Counter >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ranck_FreudenspenderMachtBlind_Info()
{
	AI_Output(self, hero, "Info_Mod_Ranck_FreudenspenderMachtBlind_12_00"); //Ganz nett, was du hier abziehst, aber so wirst du nie fertig.

	B_Say	(hero, self, "$WASMEINSTDU");

	AI_Output(self, hero, "Info_Mod_Ranck_FreudenspenderMachtBlind_12_01"); //Genau das, was ich sage. Ich mach dir ein Angebot.
	AI_Output(self, hero, "Info_Mod_Ranck_FreudenspenderMachtBlind_12_02"); //Gib mir, sagen wir 1000 Goldstücke und ich werde dir unter die Arme greifen.

	Mod_SL_PartBlind = 2;

	B_LogEntry	(TOPIC_MOD_SL_BLIND, "Ein Typ namens Ranck hat mir wegen den Gerüchten über Freudenspender seine Hiilfe angeboten. Ich soll ihm dafür allerdings 1000 Goldmünzen geben.");
};

INSTANCE Info_Mod_Ranck_FreudenspenderHelper (C_INFO)
{
	npc		= Mod_7351_OUT_Ranck_REL;
	nr		= 1;
	condition	= Info_Mod_Ranck_FreudenspenderHelper_Condition;
	information	= Info_Mod_Ranck_FreudenspenderHelper_Info;
	permanent	= 0;
	important	= 0;
	description	= "Na gut, hier.";
};

FUNC INT Info_Mod_Ranck_FreudenspenderHelper_Condition()
{
	if (Mod_SL_PartBlind == 2)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ranck_FreudenspenderHelper_Info()
{
	AI_Output(hero, self, "Info_Mod_Ranck_FreudenspenderHelper_15_00"); //Na gut, hier.

	B_GiveInvItems	(hero, self, ItMi_Gold, 1000);

	AI_Output(self, hero, "Info_Mod_Ranck_FreudenspenderHelper_12_01"); //Gut, lass mich nur machen.
	AI_Output(self, hero, "Info_Mod_Ranck_FreudenspenderHelper_12_02"); //(laut) Hallo? Hallo?! Wie spät ist es?
	AI_Output(self, hero, "Info_Mod_Ranck_FreudenspenderHelper_12_03"); //Es ist alles so dunkel, aber ich spüre doch die Sonne auf meiner Haut!
	AI_Output(self, hero, "Info_Mod_Ranck_FreudenspenderHelper_12_04"); //Ist hier jemand?! Ich sehe nichts (immer panischer werdend) Ich ... Ich ... ICH BIN BLIND!
	AI_Output(self, hero, "Info_Mod_Ranck_FreudenspenderHelper_12_05"); //Verdammtes Freudenspender, hätte ich doch die Finger davon gelassen. Man hat mich doch gewarnt, dass es blind macht.
	AI_Output(self, hero, "Info_Mod_Ranck_FreudenspenderHelper_12_06"); //Ohhh, ich armer Tor! Adieu grausame Welt, so kann ich nicht Leben!

	Mod_SL_PartBlind = 3;

	B_LogEntry	(TOPIC_MOD_SL_BLIND, "Ranck hat eine ganz schöne Show abgezogen. Das sollte die Leute in Khorata überzeugt haben.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FLEE");
};

INSTANCE Info_Mod_Ranck_Pickpocket (C_INFO)
{
	npc		= Mod_7351_OUT_Ranck_REL;
	nr		= 1;
	condition	= Info_Mod_Ranck_Pickpocket_Condition;
	information	= Info_Mod_Ranck_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Ranck_Pickpocket_Condition()
{
	C_Beklauen	(72, ItMi_Gold, 600);
};

FUNC VOID Info_Mod_Ranck_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Ranck_Pickpocket);

	Info_AddChoice	(Info_Mod_Ranck_Pickpocket, DIALOG_BACK, Info_Mod_Ranck_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Ranck_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Ranck_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Ranck_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Ranck_Pickpocket);
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

INSTANCE Info_Mod_Ranck_EXIT (C_INFO)
{
	npc		= Mod_7351_OUT_Ranck_REL;
	nr		= 1;
	condition	= Info_Mod_Ranck_EXIT_Condition;
	information	= Info_Mod_Ranck_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ranck_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ranck_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};