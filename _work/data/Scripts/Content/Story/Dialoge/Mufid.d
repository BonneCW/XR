INSTANCE Info_Mod_Mufid_Verrat (C_INFO)
{
	npc		= Mod_7149_ASS_Mufid_NW;
	nr		= 1;
	condition	= Info_Mod_Mufid_Verrat_Condition;
	information	= Info_Mod_Mufid_Verrat_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Mufid_Verrat_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Amir_Blutkelch))
	&& (Npc_GetDistToWP(hero, "NW_BIGFARM_LAKE_CAVE_07") < 500)
	&& (Mod_Smalltalk_Assassine4 == 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mufid_Verrat_Info()
{
	AI_Output(self, hero, "Info_Mod_Mufid_Verrat_13_00"); //Was suchst du hier? Hau ab!
	AI_Output(hero, self, "Info_Mod_Mufid_Verrat_15_01"); //Ich suche den 3. Kelch. Einer von euch hat ihn.
	AI_Output(self, hero, "Info_Mod_Mufid_Verrat_13_02"); //Quatsch. Wir wissen nichts von einem Kelch. Wir haben den Auftrag, ein Außenlager einzurichten.
	AI_Output(hero, self, "Info_Mod_Mufid_Verrat_15_03"); //Da hab ich aber was anderes gehört. Außerden nützt euch der Kelch nichts. Ihr habt den Händler nicht umgebracht.
	AI_Output(self, hero, "Info_Mod_Mufid_Verrat_13_04"); //Dachte, er wäre tot. Kann ich ja noch nachholen. Aber erst bist du dran, Schnüffler.

	B_LogEntry	(TOPIC_MOD_ASS_LASTBLUTKELCH, "Ich habe Mufid und Mirza auf frischer Tat ertappt. Mirza ist allerdings geflohen. Ich sollte zusehen, dass ich ihn finde.");

	CreateInvItems	(self, ItKe_Mufid, 1);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_7156_ASS_Mirza_NW,	"FLUCHT");

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};

INSTANCE Info_Mod_Mufid_Trade (C_INFO)
{
	npc		= Mod_7149_ASS_Mufid_NW;
	nr		= 1;
	condition	= Info_Mod_Mufid_Trade_Condition;
	information	= Info_Mod_Mufid_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Mufid_Trade_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Mufid_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Mufid_Pickpocket (C_INFO)
{
	npc		= Mod_7149_ASS_Mufid_NW;
	nr		= 1;
	condition	= Info_Mod_Mufid_Pickpocket_Condition;
	information	= Info_Mod_Mufid_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Mufid_Pickpocket_Condition()
{
	C_Beklauen	(66, ItMi_Gold, 22);
};

FUNC VOID Info_Mod_Mufid_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Mufid_Pickpocket);

	Info_AddChoice	(Info_Mod_Mufid_Pickpocket, DIALOG_BACK, Info_Mod_Mufid_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Mufid_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Mufid_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Mufid_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Mufid_Pickpocket);
};

FUNC VOID Info_Mod_Mufid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Mufid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Mufid_Pickpocket);

		Info_AddChoice	(Info_Mod_Mufid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Mufid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Mufid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Mufid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Mufid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Mufid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Mufid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Mufid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Mufid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Mufid_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Mufid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Mufid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Mufid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Mufid_EXIT (C_INFO)
{
	npc		= Mod_7149_ASS_Mufid_NW;
	nr		= 1;
	condition	= Info_Mod_Mufid_EXIT_Condition;
	information	= Info_Mod_Mufid_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Mufid_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Mufid_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};