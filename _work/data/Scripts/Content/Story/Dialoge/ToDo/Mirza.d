INSTANCE Info_Mod_Mirza_Hi (C_INFO)
{
	npc		= Mod_7156_ASS_Mirza_NW;
	nr		= 1;
	condition	= Info_Mod_Mirza_Hi_Condition;
	information	= Info_Mod_Mirza_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich denke, du bist die nächste Sprosse bei meiner Leiter zum Novizen.";
};

FUNC INT Info_Mod_Mirza_Hi_Condition()
{
	if (Mod_ASS_MahamadRaetsel == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mirza_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_00"); //Ich denke, du bist die nächste Sprosse bei meiner Leiter zum Novizen.
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_01"); //Das stimmt. Und es ist nicht die letzte ...
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_02"); //Schade. Was darf's denn sein?
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_03"); //Ich habe da ein Problem ...
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_04"); //Bei dem ich dir helfen soll?
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_05"); //Ganz recht. Die Angelegenheit ist etwas ... heikel ...
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_06"); //Nun erzähl schon.
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_07"); //Ich habe einen wertvollen Gegenstand verloren, den mir der Hohe Rat zur Aufbewahrung anvertraut hat.
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_08"); //Um was handelt es sich?
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_09"); //Es ist ein seltenes Amulett. Unlängst war ich nachts draußen unterwegs, um die seltene Heilknospe zu suchen. Da muss es mir aus dem Beutel gefallen sein.
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_10"); //Wo warst du unterwegs?
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_11"); //Auf dem Weg vom Leuchtturm in den großen Wald. Ich ahnte nichts Böses, da ist ein Rudel Warge über mich hergefallen.
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_12"); //Ein paar konnte ich töten, aber es waren einfach zu viele. Hab dann mein Heil in der Flucht gesucht. Und seitdem ist das Teil verschwunden.
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_13"); //Warge sagst du? Gefährliche Viecher sind das.
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_14"); //Das kannst du laut sagen. Glaubst du, du findest das für mich?
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_15"); //Ich kann's versuchen. Was würdest du tun, wenn du keine Stimme zu vergeben hättest?
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_16"); //Gute Frage. Keine Ahnung. Aber du bekommst meine Stimme. Versprochen.
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_17"); //Dein Wort in Beliars Ohr!

	Log_CreateTopic	(TOPIC_MOD_ASS_AMULETT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_AMULETT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_AMULETT, "Mirza hat ein Amulett im dunklen Wald verloren. Ich soll es finden. Bringt mir eine Stimme. Am Besten fange ich oben beim Leuchtturm an.");

	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_33");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_33");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_33");

	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_31_NAVIGATION2");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_31_NAVIGATION2");
	Wld_InsertNpc	(Warg_Mirza,	"NW_FOREST_PATH_31_NAVIGATION2");
};

INSTANCE Info_Mod_Mirza_Amulett (C_INFO)
{
	npc		= Mod_7156_ASS_Mirza_NW;
	nr		= 1;
	condition	= Info_Mod_Mirza_Amulett_Condition;
	information	= Info_Mod_Mirza_Amulett_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bin zurück. Mit Amulett.";
};

FUNC INT Info_Mod_Mirza_Amulett_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mirza_Hi))
	&& (Npc_HasItems(hero, ItAm_Mirza) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mirza_Amulett_Info()
{
	AI_Output(hero, self, "Info_Mod_Mirza_Amulett_15_00"); //Bin zurück. Mit Amulett.

	B_GiveInvItems	(hero, self, ItAm_Mirza, 1);

	AI_Output(self, hero, "Info_Mod_Mirza_Amulett_12_01"); //Wo hast du's gefunden?
	AI_Output(hero, self, "Info_Mod_Mirza_Amulett_15_02"); //Im Magen eines Warges.
	AI_Output(self, hero, "Info_Mod_Mirza_Amulett_12_03"); //Da haben wir aber Glück gehabt!
	AI_Output(hero, self, "Info_Mod_Mirza_Amulett_15_04"); //Wir? Du, würde ich sagen.
	AI_Output(self, hero, "Info_Mod_Mirza_Amulett_12_05"); //Wie auch immer. Ich stimme für dich.
	AI_Output(hero, self, "Info_Mod_Mirza_Amulett_15_06"); //Was ist das eigentlich für ein Amulett.
	AI_Output(self, hero, "Info_Mod_Mirza_Amulett_12_07"); //Das weiß ich auch nicht genau. Man munkelt, angelegt macht es unverwundbar. Aber das kann ich nicht glauben.
	AI_Output(hero, self, "Info_Mod_Mirza_Amulett_15_08"); //Hmm. Interessant! Vielleicht kann man mehr darüber erfahren.
	AI_Output(self, hero, "Info_Mod_Mirza_Amulett_12_09"); //Zu wem könnte ich noch gehen?
	AI_Output(hero, self, "Info_Mod_Mirza_Amulett_15_10"); //Probier's mal bei Aiman. Der hat immer was zu delegieren.
	AI_Output(self, hero, "Info_Mod_Mirza_Amulett_12_11"); //Ja. Mach's gut.

	B_GivePlayerXP	(100);

	B_SetTopicStatus	(TOPIC_MOD_ASS_AMULETT, LOG_SUCCESS);
	
	B_LogEntry	(TOPIC_MOD_ASS_MAGIER, "Von Mirza zu Aiman... nimmt das denn nie ein Ende?");
};

INSTANCE Info_Mod_Mirza_Blutkelch (C_INFO)
{
	npc		= Mod_7156_ASS_Mirza_NW;
	nr		= 1;
	condition	= Info_Mod_Mirza_Blutkelch_Condition;
	information	= Info_Mod_Mirza_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hab ich dich! Was wolltet ihr mit den Kelchen, sprich!";
};

FUNC INT Info_Mod_Mirza_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mufid_Verrat))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mirza_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_00"); //Hab ich dich! Was wolltet ihr mit den Kelchen, sprich!
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_01"); //Erbarmen! Wir sind im Auftrag unseres Anführers Norek unterwegs.
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_02"); //Was für ein Auftrag?
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_03"); //Wir richten eine Außenstelle für einige unserer Leute ein. Ihnen ist es zu eng geworden hier im Lager.
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_04"); //Welche Leute?
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_05"); //Nun, wir Magier ...
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_06"); //Und dazu musstet ihr den Händler erschlagen?
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_07"); //Er wohnt ganz in der Nähe. Er hätte uns bemerken können.
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_08"); //Und mich wolltet ihr auch umbringen.
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_09"); //Keine Ahnung, warum Mufid dich angegriffen hat.
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_10"); //Und der Kelch?
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_11"); //Ich weiß nichts von einem Kelch.
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_12"); //Du lügst! Du erzählst mir jetzt alles oder du wirst nie mehr Gelegenheit haben, was zu sagen.
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_13"); //Was es mit den Kelchen auf sich hat, weiß ich wirklich nicht. Da musst du den Rat fragen.
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_14"); //Und weiter?
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_15"); //Wie gesagt, Norek will, dass wir Magier uns absetzen. Dann soll Zahit, der in der Stadt ist, den Paladinen einen Tip geben, dass Assassinenkrieger sich in Nähe der Stadt befinden.
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_16"); //Norek glaubt, dass er uns Magiern damit ein Existenzrecht auf Khorinis sichern kann, damit wir uns im Land frei bewegen können und uns nicht mehr hier verstecken müssen.
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_17"); //Unglaublich! Ihr wollt eure Brüder verraten.
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_18"); //Das ist nicht meine Idee. Norek will das. Und die meisten Magier.
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_19"); //Und du, wie man sieht. Dafür stirbst du, Verräter!

	B_GivePlayerXP	(100);

	Log_CreateTopic	(TOPIC_MOD_ASS_VERSCHWOERUNG, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_VERSCHWOERUNG, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_VERSCHWOERUNG, "Hier ist eine Verschwörung im Gange. Die Magier wollen sich absetzen und dann die Krieger an die Paladine verraten. Ich muss unbedingt mit Mustafa sprechen. Am Besten unbelauscht.");
};

INSTANCE Info_Mod_Mirza_Pickpocket (C_INFO)
{
	npc		= Mod_7156_ASS_Mirza_NW;
	nr		= 1;
	condition	= Info_Mod_Mirza_Pickpocket_Condition;
	information	= Info_Mod_Mirza_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Mirza_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 23);
};

FUNC VOID Info_Mod_Mirza_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Mirza_Pickpocket);

	Info_AddChoice	(Info_Mod_Mirza_Pickpocket, DIALOG_BACK, Info_Mod_Mirza_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Mirza_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Mirza_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Mirza_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Mirza_Pickpocket);
};

FUNC VOID Info_Mod_Mirza_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Mirza_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Mirza_Pickpocket);

		Info_AddChoice	(Info_Mod_Mirza_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Mirza_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Mirza_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Mirza_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Mirza_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Mirza_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Mirza_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Mirza_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Mirza_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Mirza_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Mirza_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Mirza_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Mirza_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Mirza_EXIT (C_INFO)
{
	npc		= Mod_7156_ASS_Mirza_NW;
	nr		= 1;
	condition	= Info_Mod_Mirza_EXIT_Condition;
	information	= Info_Mod_Mirza_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Mirza_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Mirza_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};