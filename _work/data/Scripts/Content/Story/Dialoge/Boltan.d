INSTANCE Info_Mod_Boltan_Hi (C_INFO)
{
	npc		= Mod_564_MIL_Boltan_NW;
	nr		= 1;
	condition	= Info_Mod_Boltan_Hi_Condition;
	information	= Info_Mod_Boltan_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was gibt es denn hier zu bewachen?";
};

FUNC INT Info_Mod_Boltan_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Boltan_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Boltan_Hi_15_00"); //Was gibt es denn hier zu bewachen?
	AI_Output(self, hero, "Info_Mod_Boltan_Hi_30_01"); //Hauptsächlich mein Pausenbrot.
	AI_Output(hero, self, "Info_Mod_Boltan_Hi_15_02"); //Klingt nach einer entspannten Arbeit.
	AI_Output(self, hero, "Info_Mod_Boltan_Hi_30_03"); //Ist der beliebteste Job hier. Wenn man nicht so richtig Bock aufs Trainieren hat.
	AI_Output(hero, self, "Info_Mod_Boltan_Hi_15_04"); //Dann bist du ja ein richtiger Glückspilz.
	AI_Output(self, hero, "Info_Mod_Boltan_Hi_30_05"); //Ja, Mann. Ein Glückspilz.
};

INSTANCE Info_Mod_Boltan_ZellenBelegt (C_INFO)
{
	npc		= Mod_564_MIL_Boltan_NW;
	nr		= 1;
	condition	= Info_Mod_Boltan_ZellenBelegt_Condition;
	information	= Info_Mod_Boltan_ZellenBelegt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie oft sind die Zellen denn belegt?";
};

FUNC INT Info_Mod_Boltan_ZellenBelegt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Boltan_Hi)) {
		return 1;
	};
};

FUNC VOID Info_Mod_Boltan_ZellenBelegt_Info()
{
	AI_Output(hero, self, "Info_Mod_Boltan_ZellenBelegt_15_00"); //Wie oft sind die Zellen denn belegt?
	AI_Output(self, hero, "Info_Mod_Boltan_ZellenBelegt_30_01"); //Ab und zu kommt mal einer für ein paar Tage vorbei. Matteo war drin, hat seine Kunden beschissen, Valentino war drin, hat besoffen Coragon verhauen.
	AI_Output(self, hero, "Info_Mod_Boltan_ZellenBelegt_30_02"); //Aber was Ernstes war schon lange nicht mehr dabei. Vielleicht ändert sich das jetzt.
	AI_Output(hero, self, "Info_Mod_Boltan_ZellenBelegt_15_03"); //Wieso sollte sich da was ändern?
	AI_Output(self, hero, "Info_Mod_Boltan_ZellenBelegt_30_04"); //Keine Ahnung, da kommen doch die ganzen Verbrecher aus dem Minental. Die kann man doch gut einsperren.
};

INSTANCE Info_Mod_Boltan_WasGeht (C_INFO)
{
	npc		= Mod_564_MIL_Boltan_NW;
	nr		= 1;
	condition	= Info_Mod_Boltan_WasGeht_Condition;
	information	= Info_Mod_Boltan_WasGeht_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du denn die ganze Zeit über?";
};

FUNC INT Info_Mod_Boltan_WasGeht_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Boltan_Hi)) {
		return 1;
	};
};

FUNC VOID Info_Mod_Boltan_WasGeht_Info()
{
	AI_Output(hero, self, "Info_Mod_Boltan_WasGeht_15_00"); //Was machst du denn die ganze Zeit über?
	AI_Output(self, hero, "Info_Mod_Boltan_WasGeht_30_01"); //Na ja, ich denk mir so Geschichten aus.
	AI_Output(hero, self, "Info_Mod_Boltan_WasGeht_15_02"); //Geschichten?
	AI_Output(self, hero, "Info_Mod_Boltan_WasGeht_30_03"); //Ja, Mann, Geschichten. Wenn ich ein Held wär, was ich dann so erleben würde. Ritter Boltan im Kampf gegen den Feuerdrachen, Ritter Boltan vernichtet das Beliargesindel...
	AI_Output(hero, self, "Info_Mod_Boltan_WasGeht_15_04"); //Und das schreibst du dann auf?
	AI_Output(self, hero, "Info_Mod_Boltan_WasGeht_30_05"); //Nee, schreiben kann ich nicht.
	AI_Output(hero, self, "Info_Mod_Boltan_WasGeht_15_06"); //Ist vielleicht auch besser so...
};

INSTANCE Info_Mod_Boltan_Daemonisch (C_INFO)
{
	npc		= Mod_564_MIL_Boltan_NW;
	nr		= 1;
	condition	= Info_Mod_Boltan_Daemonisch_Condition;
	information	= Info_Mod_Boltan_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Boltan_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Tengron_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Boltan_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Boltan_Daemonisch_30_00"); //He, es ist verboten, mit dem Gefangenen zu sprechen ...
	AI_Output(hero, self, "Info_Mod_Boltan_Daemonisch_15_01"); //Was? Aber ...
	AI_Output(self, hero, "Info_Mod_Boltan_Daemonisch_30_02"); //Haben einige Paladine angeordnet. Also, damit ist das Gespräch beendet.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Recht unheimlich, was Tengron mir da berichtet. Er hat demnach die Paladine und Stadtwachen leblos im Tal vorgefunden und sah sich plötzlich von Dutzenden schwarzer Schatten umgeben, die sich unter seinem Paladinlicht zerstreuten. Leider wurde ich durch einen Erlass einiger Paladine daran gehindert, noch mehr zu erfahren ...");

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Boltan_Hilfe (C_INFO)
{
	npc		= Mod_564_MIL_Boltan_NW;
	nr		= 1;
	condition	= Info_Mod_Boltan_Hilfe_Condition;
	information	= Info_Mod_Boltan_Hilfe_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Boltan_Hilfe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Meldor))
	&& (Wld_GetDay() > Mod_Andre_WaitForKnast)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Boltan_Hilfe_Info()
{
	AI_Output(self, hero, "Info_Mod_Boltan_Hilfe_30_00"); //So, du wirst mich also ablösen? Pass bloß auf, die Mistkerle sind hinterhältig.
	AI_Output(hero, self, "Info_Mod_Boltan_Hilfe_15_01"); //Ich werd's mir merken.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "PAUSE");
};

INSTANCE Info_Mod_Boltan_TomKraut (C_INFO)
{
	npc		= Mod_564_MIL_Boltan_NW;
	nr		= 1;
	condition	= Info_Mod_Boltan_TomKraut_Condition;
	information	= Info_Mod_Boltan_TomKraut_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Boltan_TomKraut_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Tom_Krautquest2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Boltan_TomKraut_Info()
{
	AI_Output(self, hero, "Info_Mod_Boltan_TomKraut_30_00"); //(unterbricht) He, du. Lord Andre hat angeordnet, dass vorerst nicht mit dem Gefangenen gesprochen wird.
	AI_Output(hero, self, "Info_Mod_Boltan_TomKraut_15_01"); //Aber ...
	AI_Output(self, hero, "Info_Mod_Boltan_TomKraut_30_02"); //Kein Aber.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_TOM_KRAUT, "Das Kraut liegt vermutlich in der Asservatentruhe hinter Andre. Es zu stehlen, wird aber wohl nichts bringen. Die Torwachen am Osttor, einschließlich Mika, können bezeugen, wie sie es ihm abgenommen haben. Tom erwähnte noch ein Kraut, das Sumpfkraut sehr ähnlich sehen soll, ehe uns Boltan die weitere Unterhaltung verbot ...");
};

INSTANCE Info_Mod_Boltan_HaradLehrling (C_INFO)
{
	npc		= Mod_564_MIL_Boltan_NW;
	nr		= 1;
	condition	= Info_Mod_Boltan_HaradLehrling_Condition;
	information	= Info_Mod_Boltan_HaradLehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "Einer der Gefangenen ist tot!";
};

FUNC INT Info_Mod_Boltan_HaradLehrling_Condition()
{
	if (Mod_HaradLehrling_Kap4 == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Boltan_HaradLehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Boltan_HaradLehrling_15_00"); //Einer der Gefangenen ist tot!
	AI_Output(self, hero, "Info_Mod_Boltan_HaradLehrling_30_01"); //Ja, stimmt. Gut beobachtet.
	AI_Output(hero, self, "Info_Mod_Boltan_HaradLehrling_15_02"); //Wollt ihr ihn nicht herausholen?
	AI_Output(self, hero, "Info_Mod_Boltan_HaradLehrling_30_03"); //Solange er nicht stinkt oder wir den Platz brauchen, kann er in seiner Zelle bleiben.
	AI_Output(self, hero, "Info_Mod_Boltan_HaradLehrling_30_04"); //Hauptsache, ich muss ihn nicht anfassen.
};

INSTANCE Info_Mod_Boltan_HaradLehrling2 (C_INFO)
{
	npc		= Mod_564_MIL_Boltan_NW;
	nr		= 1;
	condition	= Info_Mod_Boltan_HaradLehrling2_Condition;
	information	= Info_Mod_Boltan_HaradLehrling2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie ist Harad gestorben?";
};

FUNC INT Info_Mod_Boltan_HaradLehrling2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Boltan_HaradLehrling))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Boltan_HaradLehrling2_Info()
{
	AI_Output(hero, self, "Info_Mod_Boltan_HaradLehrling2_15_00"); //Wie ist Harad gestorben?
	AI_Output(self, hero, "Info_Mod_Boltan_HaradLehrling2_30_01"); //Er hatte einen Dolch dabei. Damit hat er schon wieder gegen eine Regel verstoßen.
	AI_Output(self, hero, "Info_Mod_Boltan_HaradLehrling2_30_02"); //Es ist nämlich verboten, spitze Gegenstände mit in die Zelle zu nehmen.
	AI_Output(self, hero, "Info_Mod_Boltan_HaradLehrling2_30_03"); //Na ja, er wäre so oder so in Beliars Reich gelandet.
};

INSTANCE Info_Mod_Boltan_HaradLehrling3 (C_INFO)
{
	npc		= Mod_564_MIL_Boltan_NW;
	nr		= 1;
	condition	= Info_Mod_Boltan_HaradLehrling3_Condition;
	information	= Info_Mod_Boltan_HaradLehrling3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich soll Harad aus dem Gefängnis holen!";
};

FUNC INT Info_Mod_Boltan_HaradLehrling3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest8))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Andre_HaradLehrling))
	&& (Mod_HaradLehrling_Kap4 == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Boltan_HaradLehrling3_Info()
{
	AI_Output(hero, self, "Info_Mod_Boltan_HaradLehrling3_15_00"); //Ich soll Harad aus dem Gefängnis holen!
	AI_Output(self, hero, "Info_Mod_Boltan_HaradLehrling3_30_01"); //Ja? Wer hat dir das erlaubt? Tengron? Oder Lord Andre?
	AI_Output(hero, self, "Info_Mod_Boltan_HaradLehrling3_15_02"); //Bisher niemand ...

	if (Mod_HaradLehrling_Boltan == 0)
	{
		Mod_HaradLehrling_Boltan = 1;

		B_LogEntry	(TOPIC_MOD_LEHRLING_HARAD_FOUR, "Ich brauche die Erlaubnis von Lord Andre oder Tengron, dass ich Harad aus dem Gefängnis holen kann.");
	};
};

INSTANCE Info_Mod_Boltan_Pickpocket (C_INFO)
{
	npc		= Mod_564_MIL_Boltan_NW;
	nr		= 1;
	condition	= Info_Mod_Boltan_Pickpocket_Condition;
	information	= Info_Mod_Boltan_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Boltan_Pickpocket_Condition()
{
	C_Beklauen	(80, ItMi_Gold, 25);
};

FUNC VOID Info_Mod_Boltan_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Boltan_Pickpocket);

	Info_AddChoice	(Info_Mod_Boltan_Pickpocket, DIALOG_BACK, Info_Mod_Boltan_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Boltan_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Boltan_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Boltan_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Boltan_Pickpocket);
};

FUNC VOID Info_Mod_Boltan_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Boltan_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Boltan_Pickpocket);

		Info_AddChoice	(Info_Mod_Boltan_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Boltan_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Boltan_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Boltan_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Boltan_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Boltan_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Boltan_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Boltan_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Boltan_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Boltan_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Boltan_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Boltan_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Boltan_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Boltan_EXIT (C_INFO)
{
	npc		= Mod_564_MIL_Boltan_NW;
	nr		= 1;
	condition	= Info_Mod_Boltan_EXIT_Condition;
	information	= Info_Mod_Boltan_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Boltan_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Boltan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};