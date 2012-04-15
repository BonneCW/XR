INSTANCE Info_Mod_Graham_Hi (C_INFO)
{
	npc		= Mod_1469_BUD_Graham_MT;
	nr		= 1;
	condition	= Info_Mod_Graham_Hi_Condition;
	information	= Info_Mod_Graham_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Graham_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Graham_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Graham_Hi_02_00"); //Hab ich dich nicht schon mal gesehen?
	AI_Output(hero, self, "Info_Mod_Graham_Hi_15_01"); //Du hast mir jedenfalls mal eine deiner Karten gegeben.
	AI_Output(self, hero, "Info_Mod_Graham_Hi_02_02"); //Jetzt weiß ich wieder, wer du bist!
	AI_Output(self, hero, "Info_Mod_Graham_Hi_02_03"); //Du warst der Komische, der erst vor ein paar Monaten in der Barriere angekommen ist und sich als Erstes hier mit so ziemlich jedem einflussreichen Gardisten angelegt hat.
	AI_Output(self, hero, "Info_Mod_Graham_Hi_02_04"); //Mann, die Buddler haben damals Wetten abgeschlossen, wann es Gomez zu bunt wird und er dich umbringen lässt.
	AI_Output(self, hero, "Info_Mod_Graham_Hi_02_05"); //Und jetzt bist du plötzlich wieder da.
	AI_Output(hero, self, "Info_Mod_Graham_Hi_15_06"); //Ja. So bin ich.
};

INSTANCE Info_Mod_Graham_Haendler (C_INFO)
{
	npc		= Mod_1469_BUD_Graham_MT;
	nr		= 1;
	condition	= Info_Mod_Graham_Haendler_Condition;
	information	= Info_Mod_Graham_Haendler_Info;
	permanent	= 0;
	important	= 0;
	description	= "Verkaufst du immer noch Karten?";
};

FUNC INT Info_Mod_Graham_Haendler_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Graham_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Graham_Haendler_Info()
{
	AI_Output(hero, self, "Info_Mod_Graham_Haendler_15_00"); //Verkaufst du immer noch Karten?
	AI_Output(self, hero, "Info_Mod_Graham_Haendler_02_01"); //Klar. Ich fertige zwar keine mehr an, aber ich hab noch ein Restangebot. Kannst sie dir ja mal anschauen.
	
	Log_CreateTopic	(TOPIC_MOD_HÄNDLER_OLDCAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HÄNDLER_OLDCAMP, "Graham verkauft Karten.");
};

INSTANCE Info_Mod_Graham_WasGibts (C_INFO)
{
	npc		= Mod_1469_BUD_Graham_MT;
	nr		= 1;
	condition	= Info_Mod_Graham_WasGibts_Condition;
	information	= Info_Mod_Graham_WasGibts_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was gibt es über die Zwischenzeit zu berichten?";
};

FUNC INT Info_Mod_Graham_WasGibts_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Graham_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Graham_WasGibts_Info()
{
	AI_Output(hero, self, "Info_Mod_Graham_WasGibts_15_00"); //Was gibt es über die Zwischenzeit zu berichten?
	AI_Output(self, hero, "Info_Mod_Graham_WasGibts_02_01"); //Oh Mann, wo soll ich da anfangen?
	AI_Output(self, hero, "Info_Mod_Graham_WasGibts_02_02"); //Erst mal lief noch alles normal weiter, aber kurz vor dem Fall der Barriere ist Gomez dann durchgedreht und hat erst alle Feuermagier ermorden lassen und ist dann mit Raven und Scar spurlos verschwunden.
	AI_Output(self, hero, "Info_Mod_Graham_WasGibts_02_03"); //Außerdem ist die Mine dann angeblich eingestürzt, aber wenn man Ian Glauben schenken darf, ist das auch fraglich.
	AI_Output(self, hero, "Info_Mod_Graham_WasGibts_02_04"); //Alles sehr mysteriös. Im Lager brach jedenfalls die Hölle los und es herrschte die reinste Anarchie, bis Thorus für Ruhe sorgen konnte.
	AI_Output(self, hero, "Info_Mod_Graham_WasGibts_02_05"); //Mittlerweile hat sich alles wieder etwas beruhigt. Etwas zu sehr, wenn du mich fragst. Ohne die Mine gibt es für uns den lieben langen Tag nichts zu tun.
	AI_Output(self, hero, "Info_Mod_Graham_WasGibts_02_06"); //Die meisten wissen sich nur mit Alkohol, Sumpfkrautstängeln oder den Kämpfen in der Arena abzulenken.
};

INSTANCE Info_Mod_Graham_Lagermusik (C_INFO)
{
	npc		= Mod_1469_BUD_Graham_MT;
	nr		= 1;
	condition	= Info_Mod_Graham_Lagermusik_Condition;
	information	= Info_Mod_Graham_Lagermusik_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du ein Instrument spielen?";
};

FUNC INT Info_Mod_Graham_Lagermusik_Condition()
{
	if (Mod_Gravo_Schatz == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Graham_Lagermusik_Info()
{
	AI_Output(hero, self, "Info_Mod_Graham_Lagermusik_15_00"); //Kannst du ein Instrument spielen?
	AI_Output(self, hero, "Info_Mod_Graham_Lagermusik_02_01"); //Na ja, ich bin kein Virtuose oder so... aber ein bisschen kann ich auf der Laute klimpern.
	AI_Output(hero, self, "Info_Mod_Graham_Lagermusik_15_02"); //Gravo sucht Mitglieder für seine Gruppe. Du solltest dich mal bei ihm melden.
	AI_Output(self, hero, "Info_Mod_Graham_Lagermusik_02_03"); //Eigentlich gern. Aber warum ausgerechnet bei Gravo?
	AI_Output(hero, self, "Info_Mod_Graham_Lagermusik_15_04"); //Er beißt schon nicht.
	AI_Output(self, hero, "Info_Mod_Graham_Lagermusik_02_05"); //Nicht, solange er sich an seine gute Erziehung erinnert...
	AI_Output(self, hero, "Info_Mod_Graham_Lagermusik_02_06"); //Na gut, ich werd mal schauen, ob das was für mich ist.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATGRAVO");

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Graham_Trade (C_INFO)
{
	npc		= Mod_1469_BUD_Graham_MT;
	nr		= 1;
	condition	= Info_Mod_Graham_Trade_Condition;
	information	= Info_Mod_Graham_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Graham_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Graham_Haendler))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Graham_Trade_Info()
{
	Backup_Questitems();

	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Graham_Pickpocket (C_INFO)
{
	npc		= Mod_1469_BUD_Graham_MT;
	nr		= 1;
	condition	= Info_Mod_Graham_Pickpocket_Condition;
	information	= Info_Mod_Graham_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_Graham_Pickpocket_Condition()
{
	C_Beklauen	(20, ItMi_Gold, 88);
};

FUNC VOID Info_Mod_Graham_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Graham_Pickpocket);

	Info_AddChoice	(Info_Mod_Graham_Pickpocket, DIALOG_BACK, Info_Mod_Graham_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Graham_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Graham_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Graham_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Graham_Pickpocket);
};

FUNC VOID Info_Mod_Graham_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Graham_Pickpocket);
};

INSTANCE Info_Mod_Graham_EXIT (C_INFO)
{
	npc		= Mod_1469_BUD_Graham_MT;
	nr		= 1;
	condition	= Info_Mod_Graham_EXIT_Condition;
	information	= Info_Mod_Graham_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Graham_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Graham_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};