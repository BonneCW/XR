INSTANCE Info_Mod_Gandal_Lehrer (C_INFO)
{
	npc		= Mod_7653_JG_Gandal_JL;
	nr		= 1;
	condition	= Info_Mod_Gandal_Lehrer_Condition;
	information	= Info_Mod_Gandal_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Einen guten Bogen hast du da.";
};

FUNC INT Info_Mod_Gandal_Lehrer_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gandal_Lehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Gandal_Lehrer_15_00"); //Einen guten Bogen hast du da.
	AI_Output(self, hero, "Info_Mod_Gandal_Lehrer_12_01"); //Aber ja. Mein bestes Stück. Extra für mich gemacht.
	AI_Output(hero, self, "Info_Mod_Gandal_Lehrer_15_02"); //Von wem?
	AI_Output(self, hero, "Info_Mod_Gandal_Lehrer_12_03"); //Vom Bogner in der Stadt. Er hatte damals noch Eisenholz vom Festland zum Bögen bauen.
	AI_Output(hero, self, "Info_Mod_Gandal_Lehrer_15_04"); //Was meinst du mit damals?
	AI_Output(self, hero, "Info_Mod_Gandal_Lehrer_12_05"); //Das ist lange her. Noch bevor die Barriere entstand. Einige von uns waren da schon hier.
	AI_Output(self, hero, "Info_Mod_Gandal_Lehrer_12_06"); //Wir haben für die Lager und die Minen gejagt und manchmal auch für die Leute in der Stadt.
	AI_Output(hero, self, "Info_Mod_Gandal_Lehrer_15_07"); //Dann bist du ja nicht mehr der Jüngste ...

	if (Mod_Schwierigkeit != 4)
	{
		AI_Output(self, hero, "Info_Mod_Gandal_Lehrer_12_08"); //Mag sein. Aber dir kann ich noch allemal was beibringen.

		Log_CreateTopic	(TOPIC_MOD_LEHRER_WALDIS, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_LEHRER_WALDIS, "Gandal kann mir Bogenschießen beibringen.");
	};
};

INSTANCE Info_Mod_Gandal_Lernen_Bogen (C_INFO)
{
	npc		= Mod_7653_JG_Gandal_JL;
	nr		= 1;
	condition	= Info_Mod_Gandal_Lernen_Bogen_Condition;
	information	= Info_Mod_Gandal_Lernen_Bogen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir Bogenschießen bei.";
};

FUNC INT Info_Mod_Gandal_Lernen_Bogen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gandal_Lehrer))
	&& (hero.hitchance[NPC_TALENT_BOW] < 100)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gandal_Lernen_Bogen_Info()
{
	AI_Output(hero, self, "Info_Mod_Gandal_Lernen_Bogen_15_00"); //Bring mir Bogenschießen bei.

	Info_ClearChoices	(Info_Mod_Gandal_Lernen_Bogen);
	
	Info_AddChoice	(Info_Mod_Gandal_Lernen_Bogen, "Zurück.", Info_Mod_Gandal_Lernen_Bogen_BACK);
	Info_AddChoice	(Info_Mod_Gandal_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_BOW)), Info_Mod_Gandal_Lernen_Bogen_5);
	Info_AddChoice	(Info_Mod_Gandal_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1)), Info_Mod_Gandal_Lernen_Bogen_1);
};

FUNC VOID Info_Mod_Gandal_Lernen_Bogen_BACK()
{
	Info_ClearChoices	(Info_Mod_Gandal_Lernen_Bogen);
};

FUNC VOID Info_Mod_Gandal_Lernen_Bogen_5()
{
	B_TeachFightTalentPercent_New (self, hero, NPC_TALENT_BOW, 5, 100);

	Info_ClearChoices	(Info_Mod_Gandal_Lernen_Bogen);

	Info_AddChoice	(Info_Mod_Gandal_Lernen_Bogen, "Zurück.", Info_Mod_Gandal_Lernen_Bogen_BACK);
	Info_AddChoice	(Info_Mod_Gandal_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_BOW)), Info_Mod_Gandal_Lernen_Bogen_5);
	Info_AddChoice	(Info_Mod_Gandal_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1)), Info_Mod_Gandal_Lernen_Bogen_1);
};

FUNC VOID Info_Mod_Gandal_Lernen_Bogen_1()
{
	B_TeachFightTalentPercent (self, hero, NPC_TALENT_BOW, 1, 100);

	Info_ClearChoices	(Info_Mod_Gandal_Lernen_Bogen);

	Info_AddChoice	(Info_Mod_Gandal_Lernen_Bogen, "Zurück.", Info_Mod_Gandal_Lernen_Bogen_BACK);
	Info_AddChoice	(Info_Mod_Gandal_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_BOW)), Info_Mod_Gandal_Lernen_Bogen_5);
	Info_AddChoice	(Info_Mod_Gandal_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1)), Info_Mod_Gandal_Lernen_Bogen_1);
};

INSTANCE Info_Mod_Gandal_Pickpocket (C_INFO)
{
	npc		= Mod_7653_JG_Gandal_JL;
	nr		= 1;
	condition	= Info_Mod_Gandal_Pickpocket_Condition;
	information	= Info_Mod_Gandal_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Gandal_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 130);
};

FUNC VOID Info_Mod_Gandal_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Gandal_Pickpocket);

	Info_AddChoice	(Info_Mod_Gandal_Pickpocket, DIALOG_BACK, Info_Mod_Gandal_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Gandal_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Gandal_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Gandal_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Gandal_Pickpocket);
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

INSTANCE Info_Mod_Gandal_EXIT (C_INFO)
{
	npc		= Mod_7653_JG_Gandal_JL;
	nr		= 1;
	condition	= Info_Mod_Gandal_EXIT_Condition;
	information	= Info_Mod_Gandal_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gandal_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gandal_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};