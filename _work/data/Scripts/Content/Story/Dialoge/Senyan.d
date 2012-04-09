INSTANCE Info_Mod_Senyan_Hi (C_INFO)
{
	npc		= Mod_963_BDT_Senyan_NW;
	nr		= 1;
	condition	= Info_Mod_Senyan_Hi_Condition;
	information	= Info_Mod_Senyan_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Senyan_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Senyan_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Senyan_Hi_12_00"); //Hey du! Was hast du in meinem Lager verloren?
};

INSTANCE Info_Mod_Senyan_Edgor (C_INFO)
{
	npc		= Mod_963_BDT_Senyan_NW;
	nr		= 1;
	condition	= Info_Mod_Senyan_Edgor_Condition;
	information	= Info_Mod_Senyan_Edgor_Info;
	permanent	= 0;
	important	= 0;
	description	= "Edgor schickt mich.";
};

FUNC INT Info_Mod_Senyan_Edgor_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Senyan_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Edgor_Gold))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Senyan_Edgor_Info()
{
	AI_Output(hero, self, "Info_Mod_Senyan_Edgor_15_00"); //Edgor schickt mich. Er hat mir die erste Hälfte des Losungswortes gegeben und du sollst mir jetzt die zweite Hälfte sagen.
	AI_Output(self, hero, "Info_Mod_Senyan_Edgor_12_01"); //Du willst dich uns also anschließen. Nun gut, aber vorher musst du mir beweisen das du als Bandit auch was drauf hast.
	AI_Output(self, hero, "Info_Mod_Senyan_Edgor_12_02"); //In der Stadt gibt es eine Waffenhändler, der die Waffen von Harad, dem Schmied, verkauft.
	AI_Output(self, hero, "Info_Mod_Senyan_Edgor_12_03"); //Ich will, das du ihn überfällst und ihm sein Grobes Langschwert abnimmst. Dieses bringst du mir dann.

	Log_CreateTopic	(TOPIC_MOD_SENYANSSCHWERT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SENYANSSCHWERT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SENYANSSCHWERT, "Ich soll für Senyan ein Grobes Langsschwert von Hakon klauen.");

	Mod_HakonÜberfall = 0;
};

INSTANCE Info_Mod_Senyan_HabSchwert (C_INFO)
{
	npc		= Mod_963_BDT_Senyan_NW;
	nr		= 1;
	condition	= Info_Mod_Senyan_HabSchwert_Condition;
	information	= Info_Mod_Senyan_HabSchwert_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab das Schwert.";
};

FUNC INT Info_Mod_Senyan_HabSchwert_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Senyan_Edgor))
	&& (Npc_HasItems(hero, ItMw_HakonSchwert_01) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Senyan_HabSchwert_Info()
{
	AI_Output(hero, self, "Info_Mod_Senyan_HabSchwert_15_00"); //Ich hab das Schwert.
	AI_Output(self, hero, "Info_Mod_Senyan_HabSchwert_12_01"); //Zeig her.
	AI_Output(hero, self, "Info_Mod_Senyan_HabSchwert_15_02"); //Hier ist es.

	B_GiveInvItems	(hero, self, ItMw_HakonSchwert_01, 1);

	AI_Output(self, hero, "Info_Mod_Senyan_HabSchwert_12_03"); //Gut gemacht. Der zweite Teil des Losungswortes ist: Ban
	AI_Output(self, hero, "Info_Mod_Senyan_HabSchwert_12_04"); //Du kannst jetzt in unser Hauptlager. Es befindet sich im Minental nahe der Trollschlucht.
	AI_Output(self, hero, "Info_Mod_Senyan_HabSchwert_12_05"); //Sprech dort mit Sancho, er wird dich dann reinlassen. Im Lager sprichst du dann am besten mit Dexter.

	B_LogEntry_More	(TOPIC_MOD_AUFNAHME_BANDITEN, TOPIC_MOD_SENYANSSCHWERT, "Die zweite Hälfte heißt: Ban. Damit komme ich jetzt ins Hauptlager im Minental.", "Ich habe Senyan das Schwert von Hakon gebracht.");
	B_SetTopicStatus	(TOPIC_MOD_SENYANSSCHWERT, LOG_SUCCESS);

	B_Göttergefallen(3, 1);

	B_GivePlayerXP	(200);

	B_StartOtherRoutine	(Mod_581_NONE_Hakon_NW, "START");
};

INSTANCE Info_Mod_Senyan_TomKraut (C_INFO)
{
	npc		= Mod_963_BDT_Senyan_NW;
	nr		= 1;
	condition	= Info_Mod_Senyan_TomKraut_Condition;
	information	= Info_Mod_Senyan_TomKraut_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Senyan_TomKraut_Condition()
{
	if (Mod_SenyanTom_Kraut == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Senyan_TomKraut_Info()
{
	AI_DrawWeapon	(self);

	AI_Output(self, hero, "Info_Mod_Senyan_TomKraut_12_00"); //(hektisch) Wer da? (beruhigt) Ahh, du bist es nur.

	AI_RemoveWeapon	(self);

	AI_Output(self, hero, "Info_Mod_Senyan_TomKraut_12_01"); //Hätte dich fast für einen Ordnungshüter gehalten.
	AI_Output(hero, self, "Info_Mod_Senyan_TomKraut_15_02"); //In Banditenrüstung so nah an der Stadt? Da wäre ich auch unruhig. Was ist los?
	AI_Output(self, hero, "Info_Mod_Senyan_TomKraut_12_03"); //Ärger mit der Justiz, das ist los.
	AI_Output(self, hero, "Info_Mod_Senyan_TomKraut_12_04"); //Habe vorher Tom hier getroffen und ihm einige Sumpfkrautpflanzen mitgegeben, damit er sie in der Stadt zu Stängeln weiterverarbeitet.
	AI_Output(self, hero, "Info_Mod_Senyan_TomKraut_12_05"); //Als er dann aber wieder durch das Stadttor zurück wollte, habe ich von weiten gesehen, wie Mika - der Penner - ihn plötzlich angehalten hat.
	AI_Output(self, hero, "Info_Mod_Senyan_TomKraut_12_06"); //Seitdem es irgendwelchen Ärger mit Dämonen gab, sind die Wachen wohl besonders aufmerksam.
	AI_Output(self, hero, "Info_Mod_Senyan_TomKraut_12_07"); //Jedenfalls hat er angefangen ihn zu filzen und das Kraut gefunden ...
	AI_Output(hero, self, "Info_Mod_Senyan_TomKraut_15_08"); //... und ihn dann ins Gefängnis begleitet?
	AI_Output(self, hero, "Info_Mod_Senyan_TomKraut_12_09"); //(ärgerlich, ironisch) Nein, ins Rathaus, wo er zum Stadthalter ernannt wurde.
	AI_Output(self, hero, "Info_Mod_Senyan_TomKraut_12_10"); //(bissig) Natürlich ins Gefängnis! Wohin denn sonst ... Idiot.
	AI_Output(self, hero, "Info_Mod_Senyan_TomKraut_12_11"); //Und jetzt sitze ich hier rum und habe keine Ahnung, wie ich ihn da wieder raus holen könnte.
	AI_Output(self, hero, "Info_Mod_Senyan_TomKraut_12_12"); //Ich käme ja nicht mal an den Wachen vorbei ... dafür bin ich in der Gegend schon zu bekannt, wenn du verstehst.
	AI_Output(self, hero, "Info_Mod_Senyan_TomKraut_12_13"); //Ach, scheiße. Ich hoffe nur seine Strafe fällt nicht zu hart aus.

	Log_CreateTopic	(TOPIC_MOD_TOM_KRAUT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_TOM_KRAUT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_TOM_KRAUT, "Senyan berichtete mir, dass Tom mit Sumpfkrautpflanzen erwischt wurde und wahrscheinlich im Gefängnis sitzt.");

	Mob_CreateItems	("ASSERVATENTRUHE", ItPl_SwampHerb, 3);
};

INSTANCE Info_Mod_Senyan_Pickpocket (C_INFO)
{
	npc		= Mod_963_BDT_Senyan_NW;
	nr		= 1;
	condition	= Info_Mod_Senyan_Pickpocket_Condition;
	information	= Info_Mod_Senyan_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Senyan_Pickpocket_Condition()
{
	C_Beklauen	(56, ItMi_Gold, 140);
};

FUNC VOID Info_Mod_Senyan_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Senyan_Pickpocket);

	Info_AddChoice	(Info_Mod_Senyan_Pickpocket, DIALOG_BACK, Info_Mod_Senyan_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Senyan_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Senyan_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Senyan_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Senyan_Pickpocket);
};

FUNC VOID Info_Mod_Senyan_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Senyan_Pickpocket);
};

INSTANCE Info_Mod_Senyan_EXIT (C_INFO)
{
	npc		= Mod_963_BDT_Senyan_NW;
	nr		= 1;
	condition	= Info_Mod_Senyan_EXIT_Condition;
	information	= Info_Mod_Senyan_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Senyan_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Senyan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};