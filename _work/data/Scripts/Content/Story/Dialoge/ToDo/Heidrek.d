INSTANCE Info_Mod_Heidrek_Hi (C_INFO)
{
	npc		= Mod_1020_KGD_Heidrek_MT;
	nr		= 1;
	condition	= Info_Mod_Heidrek_Hi_Condition;
	information	= Info_Mod_Heidrek_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Scheint als hättest du 'ne Menge Arbeit!";
};

FUNC INT Info_Mod_Heidrek_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Heidrek_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Heidrek_Hi_15_00"); //Scheint als hättest du 'ne Menge Arbeit!
	AI_Output(self, hero, "Info_Mod_Heidrek_Hi_04_01"); //An Arbeit mangelt es hier im Lager wirklich nicht. Das liegt aber auch daran, dass außer Bernd und mir hier niemand was macht.
	AI_Output(hero, self, "Info_Mod_Heidrek_Hi_15_02"); //Und woran, glaubst du, liegt das?
	AI_Output(self, hero, "Info_Mod_Heidrek_Hi_04_03"); //Eine Mine wieder herzurichten ist keine Sonntag-Abend-Aufgabe. Wenn wir hier Erz abbauen wollen, müssen wir dafür auch was tun.
	AI_Output(self, hero, "Info_Mod_Heidrek_Hi_04_04"); //Aber die haben ja alle Schiss vor den Monstern in der Mine.
	AI_Output(hero, self, "Info_Mod_Heidrek_Hi_15_05"); //Du etwa nicht?
	AI_Output(self, hero, "Info_Mod_Heidrek_Hi_04_06"); //Nein, warum auch, die lassen sich genau so wie alle anderen Monster töten.
	AI_Output(hero, self, "Info_Mod_Heidrek_Hi_15_07"); //Warum gehst du dann nicht in die Mine?!
	AI_Output(self, hero, "Info_Mod_Heidrek_Hi_04_08"); //Im Gegensatz zu den meisten hier hab ich außer Muskelkraft auch noch ein anderes Argument: Ich kann schmieden!
	AI_Output(self, hero, "Info_Mod_Heidrek_Hi_04_09"); //Wenn ich in der Mine draufgehen würde, wäre das ein zu großer Verlust für das Lager, und das kann ich nicht verantworten.
	AI_Output(hero, self, "Info_Mod_Heidrek_Hi_15_10"); //(ironisch) Ah, ich verstehe ...
};

INSTANCE Info_Mod_Heidrek_InGilde (C_INFO)
{
	npc		= Mod_1020_KGD_Heidrek_MT;
	nr		= 1;
	condition	= Info_Mod_Heidrek_InGilde_Condition;
	information	= Info_Mod_Heidrek_InGilde_Info;
	permanent	= 0;
	important	= 0;
	description	= "Könntest du mich in deine Schmiedekunst einweihen?";
};

FUNC INT Info_Mod_Heidrek_InGilde_Condition()
{
	if (KG_Dabei == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Heidrek_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Heidrek_InGilde_Info()
{
	AI_Output(hero, self, "Info_Mod_Heidrek_InGilde_15_00"); //Könntest du mich in deine Schmiedekunst einweihen?
	AI_Output(self, hero, "Info_Mod_Heidrek_InGilde_04_01"); //Ich hätte es wissen müssen, schon wieder einer, der zu faul ist sich um die Mine zu kümmern.
	AI_Output(self, hero, "Info_Mod_Heidrek_InGilde_04_02"); //Das sind keine Voraussetzungen, unter denen ich dich nehmen würde. Du würdest doch sowieso nichts mit deinem Wissen anfangen, also lass mich damit in Ruhe.
	AI_Output(hero, self, "Info_Mod_Heidrek_InGilde_15_03"); //Was hat das eine mit dem ... ach vergiss es.
};

INSTANCE Info_Mod_Heidrek_Trollholz (C_INFO)
{
	npc		= Mod_1020_KGD_Heidrek_MT;
	nr		= 1;
	condition	= Info_Mod_Heidrek_Trollholz_Condition;
	information	= Info_Mod_Heidrek_Trollholz_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe hier ein Stück Trollholz.";
};

FUNC INT Info_Mod_Heidrek_Trollholz_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Granmar_Trollholz))
	&& (Npc_HasItems(hero, ItMi_Trollholz) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Heidrek_Trollholz_Info()
{
	AI_Output(hero, self, "Info_Mod_Heidrek_Trollholz_15_00"); //Ich habe hier ein Stück Trollholz. Du sollst daraus für Granmar eine Keule schnitzen.

	B_GiveInvItems	(hero, self, ItMi_Trollholz, 1);

	AI_Output(self, hero, "Info_Mod_Heidrek_Trollholz_04_01"); //In Ordnung, ich brauche dafür aber noch mindestens zwei Erzbrocken.
	AI_Output(self, hero, "Info_Mod_Heidrek_Trollholz_04_02"); //Frag mal Cathran, er müsste noch ein paar haben, vielleicht gibt er sie dir ja.

	B_LogEntry	(TOPIC_MOD_KG_TROLLHOLZ, "Heidrek braucht noch zwei Erzbrocken für die Keule. Ich sollte mal bei Cathran nachfragen ...");
};

INSTANCE Info_Mod_Heidrek_Trollholz2 (C_INFO)
{
	npc		= Mod_1020_KGD_Heidrek_MT;
	nr		= 1;
	condition	= Info_Mod_Heidrek_Trollholz2_Condition;
	information	= Info_Mod_Heidrek_Trollholz2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab die zwei Erzbrocken aufgetrieben.";
};

FUNC INT Info_Mod_Heidrek_Trollholz2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Heidrek_Trollholz))
	&& (Npc_HasItems(hero, ItMi_Nugget) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Heidrek_Trollholz2_Info()
{
	AI_Output(hero, self, "Info_Mod_Heidrek_Trollholz2_15_00"); //Ich hab die zwei Erzbrocken aufgetrieben.

	B_GiveInvItems	(hero, self, ItMi_Nugget, 2);

	AI_Output(self, hero, "Info_Mod_Heidrek_Trollholz2_04_01"); //Sehr schön, jetzt muss ich die Keule nur noch damit überziehen.
	AI_Output(self, hero, "Info_Mod_Heidrek_Trollholz2_04_02"); //Komm morgen wieder, dann dürfte sie fertig sein.

	B_LogEntry	(TOPIC_MOD_KG_TROLLHOLZ, "Heidrek überzieht die Keule nun mit Erz. Morgen wird sie fertig sein.");

	Mod_KG_Trollholz_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Heidrek_Trollholz3 (C_INFO)
{
	npc		= Mod_1020_KGD_Heidrek_MT;
	nr		= 1;
	condition	= Info_Mod_Heidrek_Trollholz3_Condition;
	information	= Info_Mod_Heidrek_Trollholz3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist die Keule fertig?";
};

FUNC INT Info_Mod_Heidrek_Trollholz3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Heidrek_Trollholz2))
	&& (Wld_GetDay() > Mod_KG_Trollholz_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Heidrek_Trollholz3_Info()
{
	AI_Output(hero, self, "Info_Mod_Heidrek_Trollholz3_15_00"); //Ist die Keule fertig?
	AI_Output(self, hero, "Info_Mod_Heidrek_Trollholz3_04_01"); //Ja, und ich muss sagen, das Ding macht ganz schön was her.

	B_GiveInvItems	(self, hero, ItMw_GranmarKeule, 1);

	AI_Output(self, hero, "Info_Mod_Heidrek_Trollholz3_04_02"); //Granmar meinte du bräuchtest auch eine.
	AI_Output(self, hero, "Info_Mod_Heidrek_Trollholz3_04_03"); //Zum Glück war das Holzstück groß genug für zwei Keulen, auch wenn deine Keule etwas kleiner ausgefallen ist.
	AI_Output(self, hero, "Info_Mod_Heidrek_Trollholz3_04_04"); //Hier hast du sie.

	B_GiveInvItems	(self, hero, ItMw_ErzKeule, 1);

	B_LogEntry	(TOPIC_MOD_KG_TROLLHOLZ, "Ich habe die Keule von Granmar bekommen und sogar noch eine kleinere für mich.");
};

INSTANCE Info_Mod_Heidrek_Pickpocket (C_INFO)
{
	npc		= Mod_1020_KGD_Heidrek_MT;
	nr		= 1;
	condition	= Info_Mod_Heidrek_Pickpocket_Condition;
	information	= Info_Mod_Heidrek_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Heidrek_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 20);
};

FUNC VOID Info_Mod_Heidrek_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Heidrek_Pickpocket);

	Info_AddChoice	(Info_Mod_Heidrek_Pickpocket, DIALOG_BACK, Info_Mod_Heidrek_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Heidrek_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Heidrek_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Heidrek_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Heidrek_Pickpocket);
};

FUNC VOID Info_Mod_Heidrek_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Heidrek_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Heidrek_Pickpocket);

		Info_AddChoice	(Info_Mod_Heidrek_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Heidrek_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Heidrek_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Heidrek_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Heidrek_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Heidrek_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Heidrek_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Heidrek_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Heidrek_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Heidrek_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Heidrek_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Heidrek_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Heidrek_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Heidrek_EXIT (C_INFO)
{
	npc		= Mod_1020_KGD_Heidrek_MT;
	nr		= 1;
	condition	= Info_Mod_Heidrek_EXIT_Condition;
	information	= Info_Mod_Heidrek_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Heidrek_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Heidrek_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};