INSTANCE Info_Mod_Josef_Infos (C_INFO)
{
	npc		= Mod_550_NONE_Josef_NW;
	nr		= 1;
	condition	= Info_Mod_Josef_Infos_Condition;
	information	= Info_Mod_Josef_Infos_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du Josef?";
};

FUNC INT Info_Mod_Josef_Infos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Fanatiker))
	&& (Npc_HasItems(hero, ItMi_Joint) >= 1)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Andre_Erfahrung_Fanatiker))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Josef_Infos_Info()
{
	AI_Output(hero, self, "Info_Mod_Josef_Infos_15_00"); //Bist du Josef?
	AI_Output(self, hero, "Info_Mod_Josef_Infos_13_01"); //Ja, der bin ich. Was willst du von mir?
	AI_Output(hero, self, "Info_Mod_Josef_Infos_15_02"); //Ich bin auf der Suche nach ein paar fehlgeleiteten Gurus.
	AI_Output(self, hero, "Info_Mod_Josef_Infos_13_03"); //Lass mich in Ruhe mit dem Scheiß Mann, mit der Sekte hab ich nichts mehr am Hut.
	AI_Output(hero, self, "Info_Mod_Josef_Infos_15_04"); //Würde ein bisschen Sumpfkraut deine Zunge lockern?
	AI_Output(self, hero, "Info_Mod_Josef_Infos_13_05"); //Verdammte Scheiße ... gib schon her.

	B_GiveInvItems	(hero, self, ItMi_Joint, 1);

	B_UseItem	(self, ItMi_Joint);

	AI_Output(self, hero, "Info_Mod_Josef_Infos_13_06"); //Was willst du wissen
	AI_Output(hero, self, "Info_Mod_Josef_Infos_15_07"); //Wo finde ich den Rest der Sekte?
	AI_Output(self, hero, "Info_Mod_Josef_Infos_13_08"); //Ich bin mit denen nach Khorinis gezogen, die haben sich allerdings getrennt.
	AI_Output(self, hero, "Info_Mod_Josef_Infos_13_09"); //Die einen sind in 'ner Höhle, außerhalb von Khorinis in der Nähe des Hafenviertels. Die Anderen sind auf die Anhöhe, direkt vor Khorinis, da bei dem Leuchtturm.
	AI_Output(self, hero, "Info_Mod_Josef_Infos_13_10"); //Frag' mich nicht, was die da wollen, die haben sich da richtig verbarrikadiert, zu denen wirste kaum kommen.
	AI_Output(self, hero, "Info_Mod_Josef_Infos_13_11"); //Solltest die eh besser noch in Ruhe lassen, solange du nicht genau weißt, was die vorhaben. Und jetzt hau ab!

	B_LogEntry	(TOPIC_MOD_MILIZ_SEKTENSPINNER, "Josef hat mir gesagt, dass es zwei Gruppe gibt. Die eine ist in einer Höhle außerhalb von Khorinis in der Nähe des Hafenviertels, die andere beim Leuchtturm. Den Leuchtturm sollte ich lieber vorerst unberührt lassen.");
};

INSTANCE Info_Mod_Josef_Crawlersekret (C_INFO)
{
	npc		= Mod_550_NONE_Josef_NW;
	nr		= 1;
	condition	= Info_Mod_Josef_Crawlersekret_Condition;
	information	= Info_Mod_Josef_Crawlersekret_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kennst du einen Ort, an dem ich ein starkes Minecrawler-Sekret bekommen kann?";
};

FUNC INT Info_Mod_Josef_Crawlersekret_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Lehrling))
	&& (Mod_MinecrawlerEi >= 0)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Constantino_Stimme))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Josef_Crawlersekret_Info()
{
	AI_Output(hero, self, "Info_Mod_Josef_Crawlersekret_15_00"); //Kennst du einen Ort, an dem ich ein starkes Minecrawler-Sekret bekommen kann?
	AI_Output(self, hero, "Info_Mod_Josef_Crawlersekret_13_01"); //Wenn ich mich nicht irre, hat Fortuno was von dem Zeug verkauft. Solltest mal bei ihm vorbei schauen.
};

INSTANCE Info_Mod_Josef_Pickpocket (C_INFO)
{
	npc		= Mod_550_NONE_Josef_NW;
	nr		= 1;
	condition	= Info_Mod_Josef_Pickpocket_Condition;
	information	= Info_Mod_Josef_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Josef_Pickpocket_Condition()
{
	C_Beklauen	(40, ItMi_SumpfTabak, 2);
};

FUNC VOID Info_Mod_Josef_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Josef_Pickpocket);

	Info_AddChoice	(Info_Mod_Josef_Pickpocket, DIALOG_BACK, Info_Mod_Josef_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Josef_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Josef_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Josef_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Josef_Pickpocket);
};

FUNC VOID Info_Mod_Josef_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Josef_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Josef_Pickpocket);

		Info_AddChoice	(Info_Mod_Josef_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Josef_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Josef_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Josef_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Josef_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Josef_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Josef_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Josef_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Josef_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Josef_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Josef_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Josef_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Josef_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Josef_EXIT (C_INFO)
{
	npc		= Mod_550_NONE_Josef_NW;
	nr		= 1;
	condition	= Info_Mod_Josef_EXIT_Condition;
	information	= Info_Mod_Josef_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Josef_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Josef_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};