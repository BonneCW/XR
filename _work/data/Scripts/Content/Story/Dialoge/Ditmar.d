INSTANCE Info_Mod_Ditmar_Hi (C_INFO)
{
	npc		= Mod_7722_OUT_Ditmar_REL;
	nr		= 1;
	condition	= Info_Mod_Ditmar_Hi_Condition;
	information	= Info_Mod_Ditmar_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warum ist es hier so ruhig?";
};

FUNC INT Info_Mod_Ditmar_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ditmar_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Ditmar_Hi_15_00"); //Warum ist es hier so ruhig? Sollte es in Gasthäusern nicht Lärm geben?
	AI_Output(self, hero, "Info_Mod_Ditmar_Hi_26_01"); //(gedämpft) Schau doch mal zu dem Tisch da vorn. Da sitzen die drei Gründe dafür, dass hier keiner mehr was sagen mag.
	AI_Output(hero, self, "Info_Mod_Ditmar_Hi_15_02"); //Ein ... etwas ungewohntes Bild.
	AI_Output(self, hero, "Info_Mod_Ditmar_Hi_26_03"); //Du sagst es.
	AI_Output(hero, self, "Info_Mod_Ditmar_Hi_15_04"); //Wie konnte das bloß geschehen?
	AI_Output(self, hero, "Info_Mod_Ditmar_Hi_26_05"); //(verzweifelt) Weiß ich doch nicht! Die marschieren hier einfach ein wie die Orks in Myrtana und bestehen darauf, dass sie sich hier aufhalten dürfen.
	AI_Output(self, hero, "Info_Mod_Ditmar_Hi_26_06"); //Seitdem können meine Gäste keine normalen Stammtischgespräche mehr führen, weil die Weiber alles mithören.

	Info_ClearChoices	(Info_Mod_Ditmar_Hi);

	Info_AddChoice	(Info_Mod_Ditmar_Hi, "Ruft mich, wenn es schwerwiegendere Probleme gibt.", Info_Mod_Ditmar_Hi_C);
	Info_AddChoice	(Info_Mod_Ditmar_Hi, "Na und? Die Frauen sind vollkommen im Recht.", Info_Mod_Ditmar_Hi_B);
	Info_AddChoice	(Info_Mod_Ditmar_Hi, "Ich verstehe das Problem.", Info_Mod_Ditmar_Hi_A);
};

FUNC VOID Info_Mod_Ditmar_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Ditmar_Hi_C_15_00"); //Ruft mich, wenn es schwerwiegendere Probleme gibt.

	Info_ClearChoices	(Info_Mod_Ditmar_Hi);
};

FUNC VOID Info_Mod_Ditmar_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Ditmar_Hi_D_15_00"); //Ich schau mal.

	Mod_Kneipe_Ditmar = 1;

	Log_CreateTopic	(TOPIC_MOD_DITMAR_DICKELUFT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_DITMAR_DICKELUFT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_DITMAR_DICKELUFT, "Drei Frauen im gesetzten Alter haben es sich in den Kopf gesetzt, ihre Tage im Gasthaus zu verbringen. Dem Wirt passt das allerdings gar nicht, weil kein Platz mehr für seine Stammtischgespräche bleibt. Ich soll eine Lösung finden, um die drei zu verscheuchen.");

	Info_ClearChoices	(Info_Mod_Ditmar_Hi);
};

FUNC VOID Info_Mod_Ditmar_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Ditmar_Hi_B_15_00"); //Na und? Die Frauen sind vollkommen im Recht.
	AI_Output(self, hero, "Info_Mod_Ditmar_Hi_B_26_01"); //Ja, schon, deswegen habe ich ja auch nur versucht, sie durch Bitten zum Gehen zu bewegen. Aber fruchtlos, wie du siehst.
	AI_Output(self, hero, "Info_Mod_Ditmar_Hi_B_26_02"); //Vielleicht findest du ja einen Weg, sie von hier zu vertreiben ... es soll auch nicht zu deinem Schaden sein!

	Info_Mod_Ditmar_Hi_D();
};

FUNC VOID Info_Mod_Ditmar_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Ditmar_Hi_A_15_00"); //Ich verstehe das Problem.
	AI_Output(self, hero, "Info_Mod_Ditmar_Hi_A_26_01"); //Jemand muss sie von hier vertreiben ... alles Bitten hat nichts geholfen.
	AI_Output(self, hero, "Info_Mod_Ditmar_Hi_A_26_02"); //Wenn es dir gelingt, soll es dein Schaden nicht sein!

	Info_Mod_Ditmar_Hi_D();
};

INSTANCE Info_Mod_Ditmar_DeinLaden (C_INFO)
{
	npc		= Mod_7722_OUT_Ditmar_REL;
	nr		= 1;
	condition	= Info_Mod_Ditmar_DeinLaden_Condition;
	information	= Info_Mod_Ditmar_DeinLaden_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist das hier dein Laden?";
};

FUNC INT Info_Mod_Ditmar_DeinLaden_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ditmar_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ditmar_DeinLaden_Info()
{
	AI_Output(hero, self, "Info_Mod_Ditmar_DeinLaden_15_00"); //Ist das hier dein Laden?
	AI_Output(self, hero, "Info_Mod_Ditmar_DeinLaden_26_01"); //(geübt) Jawoll. Ein echter Familienbetrieb.
	AI_Output(self, hero, "Info_Mod_Ditmar_DeinLaden_26_02"); //Was zu trinken gibt es bei meiner Tochter, nur meine Frau gibt's nicht mehr, Adanos habe sie selig.
};

INSTANCE Info_Mod_Ditmar_Geruechte (C_INFO)
{
	npc		= Mod_7722_OUT_Ditmar_REL;
	nr		= 1;
	condition	= Info_Mod_Ditmar_Geruechte_Condition;
	information	= Info_Mod_Ditmar_Geruechte_Info;
	permanent	= 1;
	important	= 0;
	description	= "Was hast du an Gerüchten anzubieten?";
};

FUNC INT Info_Mod_Ditmar_Geruechte_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ditmar_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ditmar_Geruechte_Info()
{
	var int didicounter;
	didicounter = 0;

	AI_Output(hero, self, "Info_Mod_Ditmar_Geruechte_15_00"); //Was hast du an Gerüchten anzubieten?

	if (Mod_Jim_Schutz < 2)
	&& (Npc_KnowsInfo(hero, Info_Mod_Endres_Hi))
	{
		AI_Output(self, hero, "Info_Mod_Ditmar_Geruechte_26_01"); //Auf dem Friedhof nahe dem Pass zu den Hofstaatlern soll es angeblich spuken.
		AI_Output(self, hero, "Info_Mod_Ditmar_Geruechte_26_02"); //Mehrere Buddler wollen von dort auf dem Heimweg markerschütternde Geräusche gehört haben.

		didicounter += 1;
	};
	if (Npc_KnowsInfo(hero, Info_Mod_Anna_Hi))
	{
		AI_Output(self, hero, "Info_Mod_Ditmar_Geruechte_26_03"); //Maria wurde angeblich schon wieder beim Hexen erwischt.
		AI_Output(self, hero, "Info_Mod_Ditmar_Geruechte_26_04"); //Wenn du mich fragst, ist es nur eine Frage der Zeit, bis sie endlich verbrannt wird.

		didicounter += 1;
	};
	if (Npc_KnowsInfo(hero, Info_Mod_Theodorus_Unruhen4))
	{
		AI_Output(self, hero, "Info_Mod_Ditmar_Geruechte_26_05"); //Theodorus macht sich nicht gerade beliebt bei den Leuten. An seiner Stelle wäre ich vorsichtiger.

		didicounter += 1;
	};
	if (didicounter == 0)
	{
		AI_Output(self, hero, "Info_Mod_Ditmar_Geruechte_26_06"); //Es passiert in Khorata so viel Komisches, aber was Besonderes war in letzter Zeit nicht dabei.
	};
};

INSTANCE Info_Mod_Ditmar_Buerger (C_INFO)
{
	npc		= Mod_7722_OUT_Ditmar_REL;
	nr		= 1;
	condition	= Info_Mod_Ditmar_Buerger_Condition;
	information	= Info_Mod_Ditmar_Buerger_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ditmar_Buerger_Condition()
{
	if (Mod_REL_Buerger == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ditmar_Buerger_Info()
{
	AI_Output(self, hero, "Info_Mod_Ditmar_Buerger_26_00"); //Jeder hat's schon mitbekommen, dass du ab heute zu uns gehörst.
	AI_Output(self, hero, "Info_Mod_Ditmar_Buerger_26_01"); //Das will begossen werden!

	CreateInvItems	(self, ItFo_Beer, 1);
	CreateInvItems	(hero, ItFo_Beer, 1);

	B_UseItem	(self, ItFo_Beer);
	B_UseItem	(hero, ItFo_Beer);

	AI_Output(self, hero, "Info_Mod_Ditmar_Buerger_26_02"); //Viel Spaß hier! Und Spaß kannst du haben. (augenzwinkernd) Nur nicht mit meiner Salmey, verstanden?
};

INSTANCE Info_Mod_Ditmar_Pickpocket (C_INFO)
{
	npc		= Mod_7722_OUT_Ditmar_REL;
	nr		= 1;
	condition	= Info_Mod_Ditmar_Pickpocket_Condition;
	information	= Info_Mod_Ditmar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Ditmar_Pickpocket_Condition()
{
	C_Beklauen	(98, ItMi_Gold, 45);
};

FUNC VOID Info_Mod_Ditmar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Ditmar_Pickpocket);

	Info_AddChoice	(Info_Mod_Ditmar_Pickpocket, DIALOG_BACK, Info_Mod_Ditmar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Ditmar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Ditmar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Ditmar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Ditmar_Pickpocket);
};

FUNC VOID Info_Mod_Ditmar_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Ditmar_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Ditmar_Pickpocket);

		Info_AddChoice	(Info_Mod_Ditmar_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Ditmar_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Ditmar_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Ditmar_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Ditmar_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Ditmar_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Ditmar_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Ditmar_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Ditmar_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Ditmar_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Ditmar_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Ditmar_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Ditmar_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Ditmar_EXIT (C_INFO)
{
	npc		= Mod_7722_OUT_Ditmar_REL;
	nr		= 1;
	condition	= Info_Mod_Ditmar_EXIT_Condition;
	information	= Info_Mod_Ditmar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ditmar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ditmar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};