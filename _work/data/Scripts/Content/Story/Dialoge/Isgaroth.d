INSTANCE Info_Mod_Isgaroth_Hi (C_INFO)
{
	npc		= Mod_920_KDF_Isgaroth_NW;
	nr		= 1;
	condition	= Info_Mod_Isgaroth_Hi_Condition;
	information	= Info_Mod_Isgaroth_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo.";
};

FUNC INT Info_Mod_Isgaroth_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Isgaroth_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Isgaroth_Hi_15_00"); //Hallo.
	AI_Output(self, hero, "Info_Mod_Isgaroth_Hi_01_01"); //Sei mir gegrüßt, Fremder.
};

INSTANCE Info_Mod_Isgaroth_Pedro (C_INFO)
{
	npc		= Mod_920_KDF_Isgaroth_NW;
	nr		= 1;
	condition	= Info_Mod_Isgaroth_Pedro_Condition;
	information	= Info_Mod_Isgaroth_Pedro_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist hier ein Novize vorbeigekommen, der es ziemlich eilig hatte?";
};

FUNC INT Info_Mod_Isgaroth_Pedro_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Parlan_Ring))
	&& (Npc_KnowsInfo(hero, Info_Mod_Isgaroth_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Parlan_Ring_Zurück))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Isgaroth_Pedro_Info()
{
	AI_Output(hero, self, "Info_Mod_Isgaroth_Pedro_15_00"); //Ist hier ein Novize vorbeigekommen, der es ziemlich eilig hatte?
	AI_Output(self, hero, "Info_Mod_Isgaroth_Pedro_01_01"); //Ja, vor einiger Zeit ist hier ein Novize vorbeigekommen. Er ist den Weg entlang gerannt.
	AI_Output(self, hero, "Info_Mod_Isgaroth_Pedro_01_02"); //Frag mal Dragomir. Er hat ein kleines Lager in der Nähe der Taverne, von da aus dürfte er gesehen haben wohin der Novize gerannt ist.

	B_LogEntry	(TOPIC_MOD_PARLAN_FEUERRING, "Isgaroth hat Pedro gesehen wie er den Weg entlang gerannt ist. Er sagt ich solle mich mal mit dem Jäger Dragomir unterhalten.");
};

INSTANCE Info_Mod_Isgaroth_Drachen (C_INFO)
{
	npc		= Mod_920_KDF_Isgaroth_NW;
	nr		= 1;
	condition	= Info_Mod_Isgaroth_Drachen_Condition;
	information	= Info_Mod_Isgaroth_Drachen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Sind dir in letzter Zeit seltsame Dinge aufgefallen?";
};

FUNC INT Info_Mod_Isgaroth_Drachen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Drachen))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Dragon_Kloster))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Isgaroth_Drachen_Info()
{
	AI_Output(hero, self, "Info_Mod_Isgaroth_Drachen_15_00"); //Sind dir in letzter Zeit seltsame Dinge aufgefallen?
	AI_Output(self, hero, "Info_Mod_Isgaroth_Drachen_01_01"); //Ja, wobei es ungewöhnliche Geräusche sind, die immer wieder von den Felsen über mir kommen.
	AI_Output(self, hero, "Info_Mod_Isgaroth_Drachen_01_02"); //Es klingt wie ... Schnauben und das Auflodern heftiger Flammen, aber einer Art von Feuer, die nicht unserer Magie entstammt.
	AI_Output(self, hero, "Info_Mod_Isgaroth_Drachen_01_03"); //Sehr ungewöhnlich und besorgniserregend.

	B_LogEntry	(TOPIC_MOD_NL_DRACHEN, "Isgaroth berichtete, dass von den Felsen über ihm immer wieder ungewöhnliche Geräusche lodernden Feuers kommen würden.");
};

INSTANCE Info_Mod_Isgaroth_Trade (C_INFO)
{
	npc		= Mod_920_KDF_Isgaroth_NW;
	nr		= 1;
	condition	= Info_Mod_Isgaroth_Trade_Condition;
	information	= Info_Mod_Isgaroth_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Isgaroth_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Isgaroth_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Isgaroth_Trade_Info()
{
	if (Mod_IsgarothHaendler == 0)
	{
		Log_CreateTopic	(TOPIC_MOD_HAENDLER_KLOSTER, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_HAENDLER_KLOSTER, "Isgaroth, welcher sich in einem Schrein vor dem Kloster Innos' befindet, kann mir Spruchrollen verkaufen.");

		Mod_IsgarothHaendler = 1;
	};

	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Isgaroth_Pickpocket (C_INFO)
{
	npc		= Mod_920_KDF_Isgaroth_NW;
	nr		= 1;
	condition	= Info_Mod_Isgaroth_Pickpocket_Condition;
	information	= Info_Mod_Isgaroth_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Isgaroth_Pickpocket_Condition()
{
	C_Beklauen	(100, ItMi_Gold, 720);
};

FUNC VOID Info_Mod_Isgaroth_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Isgaroth_Pickpocket);

	Info_AddChoice	(Info_Mod_Isgaroth_Pickpocket, DIALOG_BACK, Info_Mod_Isgaroth_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Isgaroth_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Isgaroth_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Isgaroth_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Isgaroth_Pickpocket);
};

FUNC VOID Info_Mod_Isgaroth_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Isgaroth_Pickpocket);
};

INSTANCE Info_Mod_Isgaroth_EXIT (C_INFO)
{
	npc		= Mod_920_KDF_Isgaroth_NW;
	nr		= 1;
	condition	= Info_Mod_Isgaroth_EXIT_Condition;
	information	= Info_Mod_Isgaroth_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Isgaroth_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Isgaroth_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};