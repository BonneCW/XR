INSTANCE Info_Mod_Snaf_Hi (C_INFO)
{
	npc		= Mod_965_STT_Snaf_MT;
	nr		= 1;
	condition	= Info_Mod_Snaf_Hi_Condition;
	information	= Info_Mod_Snaf_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Snaf_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Snaf_Hi_Info()
{
	if (Mod_Import_Snaf == LOG_SUCCESS)
	{
		AI_Output(self, hero, "Info_Mod_Snaf_Hi_01_00"); //Hey, ich kenne dich doch. Du hast mir doch mal die Zutaten für mein Fleischwanzenragout gebracht.
		AI_Output(hero, self, "Info_Mod_Snaf_Hi_15_01"); //Ja ...
		AI_Output(self, hero, "Info_Mod_Snaf_Hi_01_02"); //Ich muss mich nochmal bei dir dafür bedanken. Ich habe mit dem Fleischwanzenragout gut verdient.
		AI_Output(self, hero, "Info_Mod_Snaf_Hi_01_03"); //Als Dank werde ich dir ein paar meiner neuen Waren verkaufen. Natürlich habe ich auch Fleischwanzenragout.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Snaf_Hi_01_04"); //Hey, Neuer. Wenn du Hunger hast, kannst du bei mir vorbeischauen, ich hab da ein paar echte Spezialitäten im Angebot.
		AI_Output(self, hero, "Info_Mod_Snaf_Hi_01_05"); //Unter anderem mein berühmtes Fleischwanzenragout.
	};

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_OLDCAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_OLDCAMP, "Snaf verkauft mir verschiedene Lebensmittel. Und natürlich auch Fleischwanzenragout.");
};

INSTANCE Info_Mod_Snaf_WoherZutaten (C_INFO)
{
	npc		= Mod_965_STT_Snaf_MT;
	nr		= 1;
	condition	= Info_Mod_Snaf_WoherZutaten_Condition;
	information	= Info_Mod_Snaf_WoherZutaten_Info;
	permanent	= 0;
	important	= 0;
	description	= "Woher bekommst du denn noch die ganzen Zutaten?";
};

FUNC INT Info_Mod_Snaf_WoherZutaten_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Snaf_WoherZutaten_Info()
{
	AI_Output(hero, self, "Info_Mod_Snaf_WoherZutaten_15_00"); //Woher bekommst du denn noch die ganzen Zutaten?
	AI_Output(self, hero, "Info_Mod_Snaf_WoherZutaten_01_01"); //Fleischwanzen gibt's immer genug. Außerdem bringen die Jäger genug Grünfutter mit von ihren Jagden.
	AI_Output(self, hero, "Info_Mod_Snaf_WoherZutaten_01_02"); //Und sonst ... was man so findet. Manchmal ist es besser, nicht zu viel drüber nachzudenken, was drin ist.
};

INSTANCE Info_Mod_Snaf_Lagermusik (C_INFO)
{
	npc		= Mod_965_STT_Snaf_MT;
	nr		= 1;
	condition	= Info_Mod_Snaf_Lagermusik_Condition;
	information	= Info_Mod_Snaf_Lagermusik_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was hältst du von Lagermusik?";
};

FUNC INT Info_Mod_Snaf_Lagermusik_Condition()
{
	if (Mod_Gravo_Schatz == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Snaf_Lagermusik_Info()
{
	AI_Output(hero, self, "Info_Mod_Snaf_Lagermusik_15_00"); //Was hältst du von Lagermusik?
	AI_Output(self, hero, "Info_Mod_Snaf_Lagermusik_01_01"); //(wollüstig) Oh, du weißt ja gar nicht, wie ich so etwas vermisse.
	AI_Output(self, hero, "Info_Mod_Snaf_Lagermusik_01_02"); //Abends am Marktplatz zusammenkommen, einer schlägt die Saiten, einer die Trommel, und alle singen was Melancholisches vom heiteren Leben am Hof des Königs.
	AI_Output(hero, self, "Info_Mod_Snaf_Lagermusik_15_03"); //Gravo will eine ganze Gruppe aufbauen. Willst du teilnehmen?
	AI_Output(self, hero, "Info_Mod_Snaf_Lagermusik_01_04"); //Er will richtig auftreten? Nee, dazu fehlt mir die Zeit. Ich kann doch meinen Kochtopf nicht außer Acht lassen.
	AI_Output(self, hero, "Info_Mod_Snaf_Lagermusik_01_05"); //Aber er kann sich sicher sein, wer der erste Besucher seiner Auftritte sein wird!
};

INSTANCE Info_Mod_Snaf_Trade (C_INFO)
{
	npc		= Mod_965_STT_Snaf_MT;
	nr		= 1;
	condition	= Info_Mod_Snaf_Trade_Condition;
	information	= Info_Mod_Snaf_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Snaf_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Snaf_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Snaf_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Snaf_Pickpocket (C_INFO)
{
	npc		= Mod_965_STT_Snaf_MT;
	nr		= 1;
	condition	= Info_Mod_Snaf_Pickpocket_Condition;
	information	= Info_Mod_Snaf_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Snaf_Pickpocket_Condition()
{
	C_Beklauen	(45, ItMi_Gold, 200);
};

FUNC VOID Info_Mod_Snaf_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Snaf_Pickpocket);

	Info_AddChoice	(Info_Mod_Snaf_Pickpocket, DIALOG_BACK, Info_Mod_Snaf_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Snaf_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Snaf_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Snaf_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Snaf_Pickpocket);
};

FUNC VOID Info_Mod_Snaf_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Snaf_Pickpocket);
};

INSTANCE Info_Mod_Snaf_EXIT (C_INFO)
{
	npc		= Mod_965_STT_Snaf_MT;
	nr		= 1;
	condition	= Info_Mod_Snaf_EXIT_Condition;
	information	= Info_Mod_Snaf_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Snaf_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Snaf_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};