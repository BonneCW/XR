INSTANCE Info_Mod_Boltan_Hi (C_INFO)
{
	npc		= Mod_564_MIL_Boltan_NW;
	nr		= 1;
	condition	= Info_Mod_Boltan_Hi_Condition;
	information	= Info_Mod_Boltan_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Boltan_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Boltan_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Boltan_Hi_05_01"); //Ich bin Boltan, die Gefängniswache.
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
	AI_Output(self, hero, "Info_Mod_Boltan_Daemonisch_05_00"); //He, es ist verboten mit dem Delinquenten zu sprechen ...
	AI_Output(hero, self, "Info_Mod_Boltan_Daemonisch_15_01"); //Was? Aber ...
	AI_Output(self, hero, "Info_Mod_Boltan_Daemonisch_05_02"); //Haben einige Paladine angeordnet. Also, damit ist das Gespräch beendet.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Recht unheimlich, was Tengron mir da berichtet. Er hat demnach die Paladine und Stadtwachen leblos im Tal vorgefunden und sah sich plötzlich von dutzenden schwarzer Schatten umgeben, die sich unter seinem Paladinlicht zerstreuten. Leider wurde ich durch einen Erlass einiger Paladine daran gehindert, noch mehr zu erfahren ...");

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
	AI_Output(self, hero, "Info_Mod_Boltan_Hilfe_05_00"); //So, du wirst mich also ablösen? Pass bloß auf, die Hunde sind heimtückisch.
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
	AI_Output(self, hero, "Info_Mod_Boltan_TomKraut_05_00"); //(unterbricht) He du. Lord Andre hat angeordnet, dass vorerst nicht mit dem Gefangenen gesprochen wird.
	AI_Output(hero, self, "Info_Mod_Boltan_TomKraut_15_01"); //Aber ...
	AI_Output(self, hero, "Info_Mod_Boltan_TomKraut_05_02"); //Kein aber.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_TOM_KRAUT, "Das Kraut liegt vermutlich in der Asservatentruhe hinter Andre. Es zu stehlen, wird aber wohl nichts bringen. Die Torwachen am Osttor, einschließlich Mika, können bezeugen, wie sie es ihm abgenommen haben. Tom erwähnte noch ein Kraut, dass Sumpfkraut sehr ähnlich sehen soll, ehe uns Boltan die weitere Unterhaltung verbot ...");
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
	AI_Output(self, hero, "Info_Mod_Boltan_HaradLehrling_05_01"); //Ja, stimmt. Gut beobachtet.
	AI_Output(hero, self, "Info_Mod_Boltan_HaradLehrling_15_02"); //Wollt ihr in nicht herausholen?
	AI_Output(self, hero, "Info_Mod_Boltan_HaradLehrling_05_03"); //Solange er nicht stinkt oder wir den Platz brauchen, kann er in seiner Zelle bleiben.
	AI_Output(self, hero, "Info_Mod_Boltan_HaradLehrling_05_04"); //Hauptsache, ich muss ihn nicht anfassen.
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
	AI_Output(self, hero, "Info_Mod_Boltan_HaradLehrling2_05_01"); //Er hatte einen Dolch dabei. Damit hat er schon wieder gegen eine Regel verstoßen.
	AI_Output(self, hero, "Info_Mod_Boltan_HaradLehrling2_05_02"); //Es ist nämlich verboten, spitze Gegenstände mit in die Zelle zu nehmen.
	AI_Output(self, hero, "Info_Mod_Boltan_HaradLehrling2_05_03"); //Na ja, er wäre so oder so in Beliars Reich gelandet.
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
	AI_Output(self, hero, "Info_Mod_Boltan_HaradLehrling3_05_01"); //Ja? Wer hat dir das erlaubt? Tengron? Oder Lord Andre?
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
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Boltan_Pickpocket_Condition()
{
	C_Beklauen	(80, ItMi_Gold, 250);
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
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Boltan_Pickpocket);
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