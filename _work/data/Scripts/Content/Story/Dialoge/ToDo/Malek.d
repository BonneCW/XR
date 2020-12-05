INSTANCE Info_Mod_Malek_Hi (C_INFO)
{
	npc		= Mod_7154_ASS_Malek_NW;
	nr		= 1;
	condition	= Info_Mod_Malek_Hi_Condition;
	information	= Info_Mod_Malek_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Slysze, ze brakuje ci many.";
};

FUNC INT Info_Mod_Malek_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kamal_Zutaten2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Malek_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Malek_Hi_15_00"); //Slysze, ze brakuje ci many.
	AI_Output(self, hero, "Info_Mod_Malek_Hi_08_01"); //Beliar! Masz racje, masz racje. Zostalem ostatnio magikiem. Jakos wykorzystuje to zbyt wiele podczas cwiczen.
	AI_Output(hero, self, "Info_Mod_Malek_Hi_15_02"); //Jesli masz wystarczajaco duzo pieniedzy, dostaniem cie troche.
	AI_Output(self, hero, "Info_Mod_Malek_Hi_08_03"); //Jestes smieszny. Jak dostajesz tu zbyt wiele pieniedzy?
	AI_Output(hero, self, "Info_Mod_Malek_Hi_15_04"); //To wystarczy. Ale oddaje mi pan swój glos.
	AI_Output(self, hero, "Info_Mod_Malek_Hi_08_05"); //Jesli dostajesz mi 20 butelek wyciagu z maniku, tak.
	AI_Output(hero, self, "Info_Mod_Malek_Hi_15_06"); //Cóz, zobaczcie to pózniej.

	Log_CreateTopic	(TOPIC_MOD_ASS_MANAEXTRAKT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_MANAEXTRAKT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_MANAEXTRAKT, "Czarodziej Malek potrzebuje 20 butelek wyciagu z many. Prawdopodobnie znajde ja w miescie.");
};

INSTANCE Info_Mod_Malek_Manaextrakt (C_INFO)
{
	npc		= Mod_7154_ASS_Malek_NW;
	nr		= 1;
	condition	= Info_Mod_Malek_Manaextrakt_Condition;
	information	= Info_Mod_Malek_Manaextrakt_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Malek_Manaextrakt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Malek_Hi))
	&& (Npc_HasItems(hero, ItPo_Mana_02) >= 20)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Malek_Manaextrakt_Info()
{
	AI_Output(self, hero, "Info_Mod_Malek_Manaextrakt_08_00"); //Czy....?
	AI_Output(hero, self, "Info_Mod_Malek_Manaextrakt_15_01"); //Tak, tutaj jest 20 butelek.

	B_GiveInvItems	(hero, self, ItPo_Mana_02, 20);

	AI_Output(self, hero, "Info_Mod_Malek_Manaextrakt_08_02"); //Optymalny. Potem moge wrócic do....
	AI_Output(hero, self, "Info_Mod_Malek_Manaextrakt_15_03"); //A Twój glos?
	AI_Output(self, hero, "Info_Mod_Malek_Manaextrakt_08_04"); //To Twoja. Jest to jedyne naturalne.
	AI_Output(self, hero, "Info_Mod_Malek_Manaextrakt_08_05"); //Jeszcze jedna rzecz. Mahamad szuka cie.
	AI_Output(hero, self, "Info_Mod_Malek_Manaextrakt_15_06"); //Jestem gonna go zobaczyc.

	B_SetTopicStatus	(TOPIC_MOD_ASS_MANAEXTRAKT, LOG_SUCCESS);
	
	B_LogEntry	(TOPIC_MOD_ASS_MAGIER, "");

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Malek_Pickpocket (C_INFO)
{
	npc		= Mod_7154_ASS_Malek_NW;
	nr		= 1;
	condition	= Info_Mod_Malek_Pickpocket_Condition;
	information	= Info_Mod_Malek_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Malek_Pickpocket_Condition()
{
	C_Beklauen	(62, ItMi_Gold, 24);
};

FUNC VOID Info_Mod_Malek_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Malek_Pickpocket);

	Info_AddChoice	(Info_Mod_Malek_Pickpocket, DIALOG_BACK, Info_Mod_Malek_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Malek_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Malek_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Malek_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Malek_Pickpocket);
};

FUNC VOID Info_Mod_Malek_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Malek_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Malek_Pickpocket);

		Info_AddChoice	(Info_Mod_Malek_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Malek_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Malek_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Malek_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Malek_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Malek_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Malek_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Malek_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Malek_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Malek_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Malek_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Malek_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Malek_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Malek_EXIT (C_INFO)
{
	npc		= Mod_7154_ASS_Malek_NW;
	nr		= 1;
	condition	= Info_Mod_Malek_EXIT_Condition;
	information	= Info_Mod_Malek_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Malek_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Malek_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
