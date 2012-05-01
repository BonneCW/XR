INSTANCE Info_Mod_Opolos_Daemonisch (C_INFO)
{
	npc		= Mod_923_NOV_Opolos_NW;
	nr		= 1;
	condition	= Info_Mod_Opolos_Daemonisch_Condition;
	information	= Info_Mod_Opolos_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Opolos_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Babo_Daemonisch2))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Opolos_Drachenangriff))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Opolos_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Opolos_Daemonisch_12_00"); //Hmm, ja Babo hat sich wirklich rasch erholt. Nur etwas frische Luft schnappen und er ist wie ausgewechselt.
	AI_Output(hero, self, "Info_Mod_Opolos_Daemonisch_15_01"); //Frische Luft schnappen? Was meinst du?
	AI_Output(self, hero, "Info_Mod_Opolos_Daemonisch_12_02"); //Naja, andere Novizen haben ihn glaube ich zu einem kleinen Spaziergang ermuntert. Und danach war er wie neu ...
	AI_Output(self, hero, "Info_Mod_Opolos_Daemonisch_12_03"); //Jaja, die Jungs gehen in letzter Zeit ziemlich oft raus, irgendwelche Erledigungen in der Taverne oder der Stadt.
	AI_Output(self, hero, "Info_Mod_Opolos_Daemonisch_12_04"); //Ich jedoch muss hier bleiben und die Schafe hüten. Na ja, wenigstens hat mich die Magenerkrankung nicht erwischt.
	AI_Output(hero, self, "Info_Mod_Opolos_Daemonisch_15_05"); //Magenerkrankung?
	AI_Output(self, hero, "Info_Mod_Opolos_Daemonisch_12_06"); //Ja, einige Novizen haben seit paar Tagen Magenprobleme und können kaum noch was Essen.
	AI_Output(self, hero, "Info_Mod_Opolos_Daemonisch_12_07"); //Sogar den Klosterwein nach dem Gebet vertragen sie vorläufig nicht.
	AI_Output(self, hero, "Info_Mod_Opolos_Daemonisch_12_08"); //Sind wegen der Sache auch etwas abgemagert und können nur noch leichte Aufgaben erfüllen, wie eben die Botengänge.

	B_GivePlayerXP	(200);

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Aha. Ein kurzer abendlicher Spaziergang soll Babo also wieder auf die Beine geholfen haben, zu welchem ihn andere Novizen ermuntert hatten. Derweil hindert eine Magenerkrankung viele Novizen daran den Klosterwein zu trinken. Sie sollen auch merklich an Körperfülle verloren haben, wie Opolos berichtet.");
};

INSTANCE Info_Mod_Opolos_Drachenangriff (C_INFO)
{
	npc		= Mod_923_NOV_Opolos_NW;
	nr		= 1;
	condition	= Info_Mod_Opolos_Drachenangriff_Condition;
	information	= Info_Mod_Opolos_Drachenangriff_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo, was machst du denn hier?";
};

FUNC INT Info_Mod_Opolos_Drachenangriff_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragon_Kloster))
	&& (Mod_NL_DragonKloster == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Opolos_Drachenangriff_Info()
{
	AI_Output(hero, self, "Info_Mod_Opolos_Drachenangriff_15_00"); //Hallo, was machst du denn hier? Solltest du nicht im Kloster deinen Aufgaben nachgehen?
	AI_Output(self, hero, "Info_Mod_Opolos_Drachenangriff_12_01"); //(betrunken) Meinen Aufgaben?!
	AI_Output(self, hero, "Info_Mod_Opolos_Drachenangriff_12_02"); //Als die Horde Dämonen über unser Kloster hereinbrach, wurden alle Schafe gefressen, die ich doch behüten sollte.
	AI_Output(self, hero, "Info_Mod_Opolos_Drachenangriff_12_03"); //Man hat mich nun aus dem Kloster geworfen, da man mir vorwarf, meiner Aufgabe nicht gewissenhaft genug nachgekommen zu sein.
	AI_Output(self, hero, "Info_Mod_Opolos_Drachenangriff_12_04"); //(kurze Pause) Ach, Innos scheint in diesen finsteren Tagen wirklich fern zu sein.
};

INSTANCE Info_Mod_Opolos_Unkraut (C_INFO)
{
	npc		= Mod_923_NOV_Opolos_NW;
	nr		= 1;
	condition	= Info_Mod_Opolos_Unkraut_Condition;
	information	= Info_Mod_Opolos_Unkraut_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Opolos_Unkraut_Condition()
{
	if (Npc_HasItems(hero, ItPl_Unkraut_Gorax) == 8)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Opolos_Unkraut_Info()
{
	AI_Output(self, hero, "Info_Mod_Opolos_Unkraut_12_00"); //He, wie ich gesehen habe, hast du das ganze Unkraut um die Weinreben rausgerissen.
	AI_Output(hero, self, "Info_Mod_Opolos_Unkraut_15_01"); //Ja, wieso?
	AI_Output(self, hero, "Info_Mod_Opolos_Unkraut_12_02"); //Nun, weil sie meinen Schafen sehr gut schmecken. Wie du siehst, findest du auch auf der Wiese kein einziges Unkrautpflänzchen.
	AI_Output(self, hero, "Info_Mod_Opolos_Unkraut_12_03"); //Zu den Reben konnte ich sie natürlich nicht schicken, da sie diese sonst mit gefressen hätten.
	AI_Output(self, hero, "Info_Mod_Opolos_Unkraut_12_04"); //Aber da du sie ja alle rausgerissen hast ...
	AI_Output(hero, self, "Info_Mod_Opolos_Unkraut_15_05"); //Natürlich, ich brauche sie nicht ... hier hast du sie.

	B_GiveInvItems	(hero, self, ItPl_Unkraut_Gorax, 8);

	AI_Output(self, hero, "Info_Mod_Opolos_Unkraut_12_06"); //Super.

	AI_GotoNpc	(self, Sheep_Opolos_01);

	AI_TurnToNpc	(self, Sheep_Opolos_01);

	AI_PlayAni	(self, "T_PLUNDER");

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Opolos_Unkraut_12_07"); //Ja, das schmeckt ihnen... . Danke dir.

	B_GivePlayerXP	(80);
};

INSTANCE Info_Mod_Opolos_Pickpocket (C_INFO)
{
	npc		= Mod_923_NOV_Opolos_NW;
	nr		= 1;
	condition	= Info_Mod_Opolos_Pickpocket_Condition;
	information	= Info_Mod_Opolos_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Opolos_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Opolos_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Opolos_Pickpocket);

	Info_AddChoice	(Info_Mod_Opolos_Pickpocket, DIALOG_BACK, Info_Mod_Opolos_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Opolos_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Opolos_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Opolos_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Opolos_Pickpocket);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Opolos_EXIT (C_INFO)
{
	npc		= Mod_923_NOV_Opolos_NW;
	nr		= 1;
	condition	= Info_Mod_Opolos_EXIT_Condition;
	information	= Info_Mod_Opolos_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Opolos_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Opolos_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};