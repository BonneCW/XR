INSTANCE Info_Mod_Jesper_Dieb (C_INFO)
{
	npc		= Mod_587_NONE_Jesper_NW;
	nr		= 1;
	condition	= Info_Mod_Jesper_Dieb_Condition;
	information	= Info_Mod_Jesper_Dieb_Info;
	permanent	= 0;
	important	= 0;
	description	= "(Diebeszeichen zeigen)";
};

FUNC INT Info_Mod_Jesper_Dieb_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cassia_Goldmuenzen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jesper_Dieb_Info()
{
	AI_PlayAni (hero, "T_YES");
	AI_Output(self, hero, "Info_Mod_Jesper_Dieb_09_00"); //Wie ich sehe, bist du einer von uns.
	AI_Output(self, hero, "Info_Mod_Jesper_Dieb_09_01"); //Ich kann dir beibringen zu Schleichen.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_STADT, "Jesper kann mir beibringen zu Schleichen.");
};

INSTANCE Info_Mod_Jesper_AndreVermaechtnis (C_INFO)
{
	npc		= Mod_587_NONE_Jesper_NW;
	nr		= 1;
	condition	= Info_Mod_Jesper_AndreVermaechtnis_Condition;
	information	= Info_Mod_Jesper_AndreVermaechtnis_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jesper_AndreVermaechtnis_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hagen_AndreVermaechtnis3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jesper_AndreVermaechtnis_Info()
{
	AI_TurnToNpc	(self, Mod_598_MIL_Mika_NW);

	AI_Output(self, hero, "Info_Mod_Jesper_AndreVermaechtnis_09_00"); //Na schön, dann eben nur 40 Goldmünzen. Nimm, das scheiß Ding ... Halsabschneider. Aber ... wer zum Teufel ...

	AI_TurnToNpc	(self, hero);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Jesper_Lernen (C_INFO)
{
	npc		= Mod_587_NONE_Jesper_NW;
	nr		= 1;
	condition	= Info_Mod_Jesper_Lernen_Condition;
	information	= Info_Mod_Jesper_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schleichen lernen (5 LP)";
};

FUNC INT Info_Mod_Jesper_Lernen_Condition()
{
	Info_Mod_Jesper_Lernen.description = B_BuildLearnString("Schleichen lernen", B_GetLearnCostTalent(hero, NPC_TALENT_SNEAK, 1));

	if (Npc_KnowsInfo(hero, Info_Mod_Jesper_Dieb))
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jesper_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Jesper_Lernen_15_00"); //Bring mir bei wie man schleicht.

	B_TeachThiefTalent (self, hero, NPC_TALENT_SNEAK);
};

INSTANCE Info_Mod_Jesper_Pickpocket (C_INFO)
{
	npc		= Mod_587_NONE_Jesper_NW;
	nr		= 1;
	condition	= Info_Mod_Jesper_Pickpocket_Condition;
	information	= Info_Mod_Jesper_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Jesper_Pickpocket_Condition()
{
	C_Beklauen	(110, ItMi_Gold, 2100);
};

FUNC VOID Info_Mod_Jesper_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Jesper_Pickpocket);

	Info_AddChoice	(Info_Mod_Jesper_Pickpocket, DIALOG_BACK, Info_Mod_Jesper_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Jesper_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Jesper_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Jesper_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Jesper_Pickpocket);
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

INSTANCE Info_Mod_Jesper_EXIT (C_INFO)
{
	npc		= Mod_587_NONE_Jesper_NW;
	nr		= 1;
	condition	= Info_Mod_Jesper_EXIT_Condition;
	information	= Info_Mod_Jesper_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Jesper_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Jesper_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};