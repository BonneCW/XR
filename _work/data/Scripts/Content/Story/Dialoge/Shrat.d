INSTANCE Info_Mod_Shrat_Hi (C_INFO)
{
	npc		= Mod_1119_PSINOV_Shrat_MT;
	nr		= 1;
	condition	= Info_Mod_Shrat_Hi_Condition;
	information	= Info_Mod_Shrat_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Shrat_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Shrat_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Shrat_Hi_02_00"); //Stör nicht meine Ruhe!
};

INSTANCE Info_Mod_Shrat_Woher (C_INFO)
{
	npc		= Mod_1119_PSINOV_Shrat_MT;
	nr		= 1;
	condition	= Info_Mod_Shrat_Woher_Condition;
	information	= Info_Mod_Shrat_Woher_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wieso bist du alleine in einer Hütte mitten im Sumpf?";
};

FUNC INT Info_Mod_Shrat_Woher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Shrat_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Shrat_Woher_Info()
{
	AI_Output(hero, self, "Info_Mod_Shrat_Woher_15_00"); //Wieso bist du alleine in einer Hütte mitten im Sumpf?
	AI_Output(self, hero, "Info_Mod_Shrat_Woher_02_01"); //Weil ich meine Ruhe haben will. Nie hab ich meine Ruhe gehabt.
	AI_Output(self, hero, "Info_Mod_Shrat_Woher_02_02"); //Erst musste ich auf Onars Hof den ganzen Tag schuften, bis ich mit einem seiner Schafe abgehauen bin.
	AI_Output(self, hero, "Info_Mod_Shrat_Woher_02_03"); //Als sie mich in die Kolonie geworfen haben, habe ich gedacht, dass das Sumpflager ganz gemütlich ist.
	AI_Output(self, hero, "Info_Mod_Shrat_Woher_02_04"); //Aber dort durfte ich den ganzen Tag Sumpfkraut stampfen und das war nicht das, was ich wollte.
	AI_Output(self, hero, "Info_Mod_Shrat_Woher_02_05"); //Dann bin abgehauen und hab mir hier eine kleine Hütte gebaut und endlich hab ich meine Ruhe.
};

INSTANCE Info_Mod_Shrat_Pickpocket (C_INFO)
{
	npc		= Mod_1119_PSINOV_Shrat_MT;
	nr		= 1;
	condition	= Info_Mod_Shrat_Pickpocket_Condition;
	information	= Info_Mod_Shrat_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Shrat_Pickpocket_Condition()
{
	C_Beklauen	(53, ItMi_Gold, 30);
};

FUNC VOID Info_Mod_Shrat_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Shrat_Pickpocket);

	Info_AddChoice	(Info_Mod_Shrat_Pickpocket, DIALOG_BACK, Info_Mod_Shrat_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Shrat_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Shrat_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Shrat_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Shrat_Pickpocket);
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

INSTANCE Info_Mod_Shrat_EXIT (C_INFO)
{
	npc		= Mod_1119_PSINOV_Shrat_MT;
	nr		= 1;
	condition	= Info_Mod_Shrat_EXIT_Condition;
	information	= Info_Mod_Shrat_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Shrat_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Shrat_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};