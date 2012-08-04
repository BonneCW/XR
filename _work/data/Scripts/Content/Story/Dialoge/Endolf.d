INSTANCE Info_Mod_Endolf_Hi (C_INFO)
{
	npc		= Mod_1590_SLD_Endolf_FM;
	nr		= 1;
	condition	= Info_Mod_Endolf_Hi_Condition;
	information	= Info_Mod_Endolf_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Endolf_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Endolf_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Endolf_Hi_09_00"); //Na endlich Unterstützung. Beim letzten Angriff der Viecher haben wir wieder einen Mann verloren.
	AI_Output(hero, self, "Info_Mod_Endolf_Hi_15_01"); //Seit wann erfolgen diese beharrlichen Attacken der Crawler?
	AI_Output(self, hero, "Info_Mod_Endolf_Hi_09_02"); //Erst seit kurzem. Es hat wie aus dem Nichts, ganz plötzlich angefangen. Ganz abscheuliche, stinkende Viecher.
	AI_Output(self, hero, "Info_Mod_Endolf_Hi_09_03"); //Jedes mal, wenn wir unsere Jungs losgeschickt haben, um sie abzuschlachten, kamen nach kurzer Zeit genau so viele nach.
	AI_Output(self, hero, "Info_Mod_Endolf_Hi_09_04"); //Vor einigen Stunden kamen nun so viele von ihnen, dass sie uns überrannt haben, einige von unseren Jungs draufgegangen sind.
	AI_Output(self, hero, "Info_Mod_Endolf_Hi_09_05"); //Wir mussten uns zurückziehen und verbarrikadierten uns hier.
	AI_Output(hero, self, "Info_Mod_Endolf_Hi_15_06"); //Tja, dann darf ich wohl alleine nachforschen, was es mit der Bedrohung durch die stinkenden Crawler auf sich hat.
	AI_Output(self, hero, "Info_Mod_Endolf_Hi_09_07"); //Naja, du würdest uns hier unten echt damit helfen. Das immer so viele von den Viechern nachkommen wird wohl bedeuten, dass ...
	AI_Output(hero, self, "Info_Mod_Endolf_Hi_15_08"); //... (ermüdet) sich hier wohl ein Nest befindet.
	AI_Output(self, hero, "Info_Mod_Endolf_Hi_09_09"); //Naja, als die Barriere noch stand hast du in der Mine ...
	AI_Output(hero, self, "Info_Mod_Endolf_Hi_15_10"); //(genervt) Das hat aber weite Kreise gezogen, die Sache mit der Mine des Alten Lagers.
	AI_Output(hero, self, "Info_Mod_Endolf_Hi_15_11"); //Und jetzt soll ich deswegen im Alleingang sämtliche Crawlerköniginnen auf ganz Khorinis ...
	AI_Output(self, hero, "Info_Mod_Endolf_Hi_09_12"); //Und wir halten hier so lange die Stellung. Viel Glück.
	AI_Output(hero, self, "Info_Mod_Endolf_Hi_15_13"); //(halblaut) Grmpf, du mich auch ...

	B_LogEntry	(TOPIC_MOD_NL_CRAWLER, "Na toll. Diesmal darf ich wie immer alleine losziehen, um den Ursprung der stinkenden Crawler zu finden. Dürfte wohl wieder eine Minecrawlerkönigin sein ...");
};

INSTANCE Info_Mod_Endolf_Gormgniez (C_INFO)
{
	npc		= Mod_1590_SLD_Endolf_FM;
	nr		= 1;
	condition	= Info_Mod_Endolf_Gormgniez_Condition;
	information	= Info_Mod_Endolf_Gormgniez_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Endolf_Gormgniez_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gormgniez_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Endolf_Gormgniez_Info()
{
	AI_Output(self, hero, "Info_Mod_Endolf_Gormgniez_09_00"); //Und, konntest du den Ursprung des ganzen Übels ausfindig machen und vernichten?
	AI_Output(hero, self, "Info_Mod_Endolf_Gormgniez_15_01"); //Ja, es ist mir gelungen.
	AI_Output(self, hero, "Info_Mod_Endolf_Gormgniez_09_02"); //Ausgezeichnet, dann kann die Arbeit jetzt in aller Ruhe weitergehen.
	AI_Output(self, hero, "Info_Mod_Endolf_Gormgniez_09_03"); //Hier, nimm dieses Erz als Dank.
	
	B_GiveInvItems	(self, hero, ItMi_Nugget, 10);

	B_GivePlayerXP	(400);
};

INSTANCE Info_Mod_Endolf_Pickpocket (C_INFO)
{
	npc		= Mod_1590_SLD_Endolf_FM;
	nr		= 1;
	condition	= Info_Mod_Endolf_Pickpocket_Condition;
	information	= Info_Mod_Endolf_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Endolf_Pickpocket_Condition()
{
	C_Beklauen	(75, ItMi_Nugget, 2);
};

FUNC VOID Info_Mod_Endolf_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Endolf_Pickpocket);

	Info_AddChoice	(Info_Mod_Endolf_Pickpocket, DIALOG_BACK, Info_Mod_Endolf_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Endolf_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Endolf_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Endolf_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Endolf_Pickpocket);
};

FUNC VOID Info_Mod_Endolf_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Endolf_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Endolf_Pickpocket);

		Info_AddChoice	(Info_Mod_Endolf_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Endolf_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Endolf_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Endolf_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Endolf_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Endolf_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Endolf_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Endolf_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Endolf_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Endolf_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Endolf_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Endolf_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Endolf_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Endolf_EXIT (C_INFO)
{
	npc		= Mod_1590_SLD_Endolf_FM;
	nr		= 1;
	condition	= Info_Mod_Endolf_EXIT_Condition;
	information	= Info_Mod_Endolf_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Endolf_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Endolf_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};