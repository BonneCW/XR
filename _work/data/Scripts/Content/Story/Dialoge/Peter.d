INSTANCE Info_Mod_Peter_Hi (C_INFO)
{
	npc		= Mod_7386_OUT_Peter_REL;
	nr		= 1;
	condition	= Info_Mod_Peter_Hi_Condition;
	information	= Info_Mod_Peter_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Peter_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Peter_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Peter_Hi_14_00"); //Willkommen in meinem Gasthaus, dem besten und einzigen in Khorata.
	AI_Output(self, hero, "Info_Mod_Peter_Hi_14_01"); //Bier und Essen kannst du hier bekommen.

	Log_CreateTopic	(TOPIC_MOD_HÄNDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HÄNDLER_STADT, "Peter verkauft Lebensmittel");
};

INSTANCE Info_Mod_Peter_Elvira (C_INFO)
{
	npc		= Mod_7386_OUT_Peter_REL;
	nr		= 1;
	condition	= Info_Mod_Peter_Elvira_Condition;
	information	= Info_Mod_Peter_Elvira_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Kannst du mir vielleicht was über Elvira erzählen?";
};                       

FUNC INT Info_Mod_Peter_Elvira_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cassia_Elvira))
	&& (Npc_HasItems(Mod_7499_KDF_Elvira_REL, ItKe_RELMagier) == 1)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 40)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Peter_Elvira_Info()
{
	AI_Output(hero, self, "Info_Mod_Peter_Elvira_15_00"); //Kannst du mir vielleicht was über Elvira erzählen?
	AI_Output(self, hero, "Info_Mod_Peter_Elvira_14_01"); //Ahh, die Feuermagierin.
	AI_Output(self, hero, "Info_Mod_Peter_Elvira_14_02"); //Ja, hähä, Hier haben schon viele ein Auge auf sie geworfen ... aber glaub mir, bei der hast du keine Chance ... es sei denn ... ne, vergiss es ...
	AI_Output(hero, self, "Info_Mod_Peter_Elvira_15_03"); //Ja, sag schon.

	B_GiveInvItems	(hero, self, ItMi_Gold, 40);

	AI_Output(self, hero, "Info_Mod_Peter_Elvira_14_04"); //Also, einmal war die hier um zu predigen.
	AI_Output(self, hero, "Info_Mod_Peter_Elvira_14_05"); //Mitten in der Kneipe, zwischen den ganzen Trinkern hier, kannst du dir das Vorstellen, die ganze Testosteron geschwängerte Meute.
	AI_Output(self, hero, "Info_Mod_Peter_Elvira_14_06"); //Ich hab ihr ein Glas von meinem besten Klosterwein angeboten und sie ... lehnt einfach ab und fragt stattdessen, ob ich den auch alkoholfrei hätte.
	AI_Output(self, hero, "Info_Mod_Peter_Elvira_14_07"); //Nun, ich möchte ja nicht tratschen, aber das mit dem Frauen und Akohol ... wer weiß.
	AI_Output(self, hero, "Info_Mod_Peter_Elvira_14_08"); //Aber hey, ich hab nichts gesagt.
};

INSTANCE Info_Mod_Peter_Freudenspender (C_INFO)
{
	npc		= Mod_7386_OUT_Peter_REL;
	nr		= 1;
	condition	= Info_Mod_Peter_Freudenspender_Condition;
	information	= Info_Mod_Peter_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Kannst du Freudenspender gebrauchen?";
};                       

FUNC INT Info_Mod_Peter_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Peter_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Peter_Freudenspender_15_00"); //Kannst du Freudenspender gebrauchen?
	AI_Output(self, hero, "Info_Mod_Peter_Freudenspender_14_01"); //Ich verkauf das Zeug selbst, Mann. Wenn du was zu verschenken hast, dann her damit. Sonst nicht.
};

INSTANCE Info_Mod_Peter_Trade (C_INFO)
{
	npc		= Mod_7386_OUT_Peter_REL;
	nr		= 1;
	condition	= Info_Mod_Peter_Trade_Condition;
	information	= Info_Mod_Peter_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Peter_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Peter_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Peter_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Peter_Pickpocket (C_INFO)
{
	npc		= Mod_7386_OUT_Peter_REL;
	nr		= 1;
	condition	= Info_Mod_Peter_Pickpocket_Condition;
	information	= Info_Mod_Peter_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Peter_Pickpocket_Condition()
{
	C_Beklauen	(79, ItMi_Gold, 680);
};

FUNC VOID Info_Mod_Peter_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Peter_Pickpocket);

	Info_AddChoice	(Info_Mod_Peter_Pickpocket, DIALOG_BACK, Info_Mod_Peter_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Peter_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Peter_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Peter_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Peter_Pickpocket);
};

FUNC VOID Info_Mod_Peter_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Peter_Pickpocket);
};

INSTANCE Info_Mod_Peter_EXIT (C_INFO)
{
	npc		= Mod_7386_OUT_Peter_REL;
	nr		= 1;
	condition	= Info_Mod_Peter_EXIT_Condition;
	information	= Info_Mod_Peter_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Peter_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Peter_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};