INSTANCE Info_Mod_GorNaRan_Urs (C_INFO)
{
	npc		= Mod_2009_TPL_GorNaRan_MT;
	nr		= 1;
	condition	= Info_Mod_GorNaRan_Urs_Condition;
	information	= Info_Mod_GorNaRan_Urs_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_GorNaRan_Urs_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Darrion_Urs))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_GorNaRan_Urs_Info()
{
	AI_Output(self, hero, "Info_Mod_GorNaRan_Urs_13_00"); //Ahh, eine Klinge aus gesegnetem Stahl.
	AI_Output(self, hero, "Info_Mod_GorNaRan_Urs_13_01"); //Mal schauen, ob sich die naturmagischen Untriebe besser in den Griff bekommen lassen.
	AI_Output(self, hero, "Info_Mod_GorNaRan_Urs_13_02"); //Ich werde sie gleich an dieser besonders hartnäckigen Staude da vorne erproben.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "STAUDE");

	Wld_InsertNpc	(Alraune_Sumpfis,	"PATH_AROUND_PSI09");
};

INSTANCE Info_Mod_GorNaRan_Urs2 (C_INFO)
{
	npc		= Mod_2009_TPL_GorNaRan_MT;
	nr		= 1;
	condition	= Info_Mod_GorNaRan_Urs2_Condition;
	information	= Info_Mod_GorNaRan_Urs2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_GorNaRan_Urs2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_GorNaRan_Urs))
	&& (Npc_IsDead(Alraune_Sumpfis))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_GorNaRan_Urs2_Info()
{
	AI_Output(self, hero, "Info_Mod_GorNaRan_Urs2_13_00"); //Großartig, die Klinge geht durch das Kraut, wie durch Butter.
	AI_Output(self, hero, "Info_Mod_GorNaRan_Urs2_13_01"); //Du kannst zu Darrion zurückgehen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_GorNaRan_Hueterklinge (C_INFO)
{
	npc		= Mod_2009_TPL_GorNaRan_MT;
	nr		= 1;
	condition	= Info_Mod_GorNaRan_Hueterklinge_Condition;
	information	= Info_Mod_GorNaRan_Hueterklinge_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie bist du zu den Rohstoffen für deine Hüterklinge gekommen?";
};

FUNC INT Info_Mod_GorNaRan_Hueterklinge_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hueterklinge))
	&& (Mod_TPL_Hueterklinge == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_GorNaRan_Hueterklinge_Info()
{
	AI_Output(hero, self, "Info_Mod_GorNaRan_Hueterklinge_15_00"); //Wie bist du zu den Rohstoffen für deine Hüterklinge gekommen?
	AI_Output(self, hero, "Info_Mod_GorNaRan_Hueterklinge_13_01"); //Darüber sollte ich eigentlich nicht sprechen .. aber ich war auch mal in deiner Situation ...
	AI_Output(self, hero, "Info_Mod_GorNaRan_Hueterklinge_13_02"); //Diese Spinner wollen von dir auch all die Zutaten, die man niemals im Leben auftreiben kann?
	AI_Output(self, hero, "Info_Mod_GorNaRan_Hueterklinge_13_03"); //Blut, das durch 4 Herzen geflossen ist und eine Lurkerklaue, die Großvater, Vater und Sohn das Leben nahm sollte ich besorgen!
	AI_Output(self, hero, "Info_Mod_GorNaRan_Hueterklinge_13_04"); //Ich hab dem Schmied einfach stinknormales Blut und eine gewöhnliche Lurkerklaue gebracht!

	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Gor Na Ran sagt, er hat für seine Hüterklinge gewöhnliche Zutaten bei der Schmiede abgeliefert. Einen Versuch wäre es wert.");
};

INSTANCE Info_Mod_GorNaRan_Pickpocket (C_INFO)
{
	npc		= Mod_2009_TPL_GorNaRan_MT;
	nr		= 1;
	condition	= Info_Mod_GorNaRan_Pickpocket_Condition;
	information	= Info_Mod_GorNaRan_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_GorNaRan_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_GorNaRan_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_GorNaRan_Pickpocket);

	Info_AddChoice	(Info_Mod_GorNaRan_Pickpocket, DIALOG_BACK, Info_Mod_GorNaRan_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_GorNaRan_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_GorNaRan_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_GorNaRan_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_GorNaRan_Pickpocket);
};

FUNC VOID Info_Mod_GorNaRan_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_GorNaRan_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_GorNaRan_Pickpocket);

		Info_AddChoice	(Info_Mod_GorNaRan_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_GorNaRan_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_GorNaRan_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_GorNaRan_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_GorNaRan_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_GorNaRan_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_GorNaRan_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_GorNaRan_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_GorNaRan_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_GorNaRan_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_GorNaRan_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_GorNaRan_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_GorNaRan_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_GorNaRan_EXIT (C_INFO)
{
	npc		= Mod_2009_TPL_GorNaRan_MT;
	nr		= 1;
	condition	= Info_Mod_GorNaRan_EXIT_Condition;
	information	= Info_Mod_GorNaRan_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_GorNaRan_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_GorNaRan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};