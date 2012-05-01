INSTANCE Info_Mod_Malek_Hi (C_INFO)
{
	npc		= Mod_7154_ASS_Malek_NW;
	nr		= 1;
	condition	= Info_Mod_Malek_Hi_Condition;
	information	= Info_Mod_Malek_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich höre, du bist knapp an Mana.";
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
	AI_Output(hero, self, "Info_Mod_Malek_Hi_15_00"); //Ich höre, du bist knapp an Mana.
	AI_Output(self, hero, "Info_Mod_Malek_Hi_08_01"); //Bei Beliar! Du hast recht. Ich bin erst kürzlich Magier geworden. Irgendwie verbrauche ich zuviel von dem Zeug bei meinen Übungen.
	AI_Output(hero, self, "Info_Mod_Malek_Hi_15_02"); //Wenn du genug Geld hast, besorg ich dir welches.
	AI_Output(self, hero, "Info_Mod_Malek_Hi_08_03"); //Du bist lustig. Wie soll man hier zu viel Geld kommen?
	AI_Output(hero, self, "Info_Mod_Malek_Hi_15_04"); //Auch wahr. Aber deine Stimme gibst du mir.
	AI_Output(self, hero, "Info_Mod_Malek_Hi_08_05"); //Wenn du mir 20 Flaschen Manaextrakt besorgst, ja.
	AI_Output(hero, self, "Info_Mod_Malek_Hi_15_06"); //Na, dann bis später.

	Log_CreateTopic	(TOPIC_MOD_ASS_MANAEXTRAKT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_MANAEXTRAKT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_MANAEXTRAKT, "Der Magier Malek braucht 20 Flaschen Manaextrakt. Das werde ich wohl in der Stadt finden.");
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
	AI_Output(self, hero, "Info_Mod_Malek_Manaextrakt_08_00"); //Und, hast du ... ?
	AI_Output(hero, self, "Info_Mod_Malek_Manaextrakt_15_01"); //Ja, hier sind 20 Flaschen.

	B_GiveInvItems	(hero, self, ItPo_Mana_02, 20);

	AI_Output(self, hero, "Info_Mod_Malek_Manaextrakt_08_02"); //Optimal. Dann kann ich ja wieder ...
	AI_Output(hero, self, "Info_Mod_Malek_Manaextrakt_15_03"); //Und deine Stimme?
	AI_Output(self, hero, "Info_Mod_Malek_Manaextrakt_08_04"); //Gehört dir. Ist doch selbstverständlich.
	AI_Output(self, hero, "Info_Mod_Malek_Manaextrakt_08_05"); //Noch was. Mahamad sucht dich.
	AI_Output(hero, self, "Info_Mod_Malek_Manaextrakt_15_06"); //Dann werde ich mal zu ihm gehen.

	B_SetTopicStatus	(TOPIC_MOD_ASS_MANAEXTRAKT, LOG_SUCCESS);

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
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Malek_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
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