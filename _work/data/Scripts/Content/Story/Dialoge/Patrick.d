INSTANCE Info_Mod_Patrick_Hi (C_INFO)
{
	npc		= Mod_792_SLD_Patrick_MT;
	nr		= 1;
	condition	= Info_Mod_Patrick_Hi_Condition;
	information	= Info_Mod_Patrick_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo, wie sieht’s aus?";
};

FUNC INT Info_Mod_Patrick_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Patrick_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Patrick_Hi_15_00"); //Hallo, wie sieht’s aus?
	AI_Output(self, hero, "Info_Mod_Patrick_Hi_07_01"); //Naja, ist gar nicht so einfach, aus den Jungs echte Kämpfer zu machen.
};

INSTANCE Info_Mod_Patrick_Training (C_INFO)
{
	npc		= Mod_792_SLD_Patrick_MT;
	nr		= 1;
	condition	= Info_Mod_Patrick_Training_Condition;
	information	= Info_Mod_Patrick_Training_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich irgendwie helfen?";
};

FUNC INT Info_Mod_Patrick_Training_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Patrick_Hi))
	&& (hero.guild == GIL_MIL)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Patrick_Training_Info()
{
	AI_Output(hero, self, "Info_Mod_Patrick_Training_15_00"); //Kann ich irgendwie helfen?
	AI_Output(self, hero, "Info_Mod_Patrick_Training_07_01"); //Ja, das könntest du in der Tat. Einige von den Jungs haben sich ziemlich lange vor der Training gedrückt.
	AI_Output(self, hero, "Info_Mod_Patrick_Training_07_02"); //Da wären Shrike, Rath und Blade. Sag ihnen, dass sie mal ihre lahmen Knochen zu mir bewegen sollen.

	Log_CreateTopic	(TOPIC_MOD_SLD_PATRICK, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SLD_PATRICK, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SLD_PATRICK, "Patrick meinte, ich soll Shrike, Rath und Blade zum Training holen.");
};

INSTANCE Info_Mod_Patrick_SindAlleDa (C_INFO)
{
	npc		= Mod_792_SLD_Patrick_MT;
	nr		= 1;
	condition	= Info_Mod_Patrick_SindAlleDa_Condition;
	information	= Info_Mod_Patrick_SindAlleDa_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Patrick_SindAlleDa_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Patrick_Training))
	&& (Mod_SLD_Rath == 3)
	&& (Mod_SLD_Shrike == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Blade_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Patrick_SindAlleDa_Info()
{
	AI_Output(self, hero, "Info_Mod_Patrick_SindAlleDa_07_00"); //Ausgezeichnet, Rath und Blade hast du schon mal dazu bewegt zum Training zu erscheinen. Jetzt fehlt nur noch Shrike.
	AI_Output(hero, self, "Info_Mod_Patrick_SindAlleDa_15_01"); //Was, aber ich habe ihn doch losgeschickt ...
	AI_Output(self, hero, "Info_Mod_Patrick_SindAlleDa_07_02"); //Achso, nun, bei ihm dauert das meistens etwas länger, da er noch häufig einen Umweg in die Kneipe macht. Also, geh hin und mach ihm Beine.

	B_LogEntry	(TOPIC_MOD_SLD_PATRICK, "Na toll, jetzt darf ich Shrike aus der Kneipe zum Training beordern.");
};

INSTANCE Info_Mod_Patrick_ShrikeNichtInKneipe (C_INFO)
{
	npc		= Mod_792_SLD_Patrick_MT;
	nr		= 1;
	condition	= Info_Mod_Patrick_ShrikeNichtInKneipe_Condition;
	information	= Info_Mod_Patrick_ShrikeNichtInKneipe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Shrike war nicht in der Kneipe.";
};

FUNC INT Info_Mod_Patrick_ShrikeNichtInKneipe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Patrick_SindAlleDa))
	&& (Mod_SLD_Shrike == 2)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Patrick_ShrikeDa))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Patrick_ShrikeNichtInKneipe_Info()
{
	AI_Output(hero, self, "Info_Mod_Patrick_ShrikeNichtInKneipe_15_00"); //Shrike war nicht in der Kneipe.
	AI_Output(self, hero, "Info_Mod_Patrick_ShrikeNichtInKneipe_07_01"); //Hmm, achso. Ähhm, dann würde ich an deiner Stelle mal vor dem Lager vorbeischauen.

	B_LogEntry	(TOPIC_MOD_SLD_PATRICK, "Patrick meinte, dass Shrike vor dem Lager sein könnte.");
};

INSTANCE Info_Mod_Patrick_ShrikeDa (C_INFO)
{
	npc		= Mod_792_SLD_Patrick_MT;
	nr		= 1;
	condition	= Info_Mod_Patrick_ShrikeDa_Condition;
	information	= Info_Mod_Patrick_ShrikeDa_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Patrick_ShrikeDa_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Shrike_NoSmokingNow))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Patrick_ShrikeDa_Info()
{
	AI_Output(self, hero, "Info_Mod_Patrick_ShrikeDa_07_00"); //Hey, du hast es tatsächlich geschafft auch noch Shrike zum Training zu bewegen. Ich bin beeindruckt.
	AI_Output(self, hero, "Info_Mod_Patrick_ShrikeDa_07_01"); //Hier hast du etwas Gold und Erz. Lee bekommt nur das Beste von mir zu hören.

	B_ShowGivenThings	("300 Gold und 4 Erz erhalten");

	CreateInvItems	(hero, ItMi_Gold, 300);
	CreateInvItems	(hero, ItMi_Nugget, 4);

	B_GivePlayerXP	(400);

	B_SetTopicStatus	(TOPIC_MOD_SLD_PATRICK, LOG_SUCCESS);

	B_StartOtherRoutine	(Mod_1292_SLD_Shrike_MT, "TRAINING");
};

INSTANCE Info_Mod_Patrick_Pickpocket (C_INFO)
{
	npc		= Mod_792_SLD_Patrick_MT;
	nr		= 1;
	condition	= Info_Mod_Patrick_Pickpocket_Condition;
	information	= Info_Mod_Patrick_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Patrick_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 15);
};

FUNC VOID Info_Mod_Patrick_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Patrick_Pickpocket);

	Info_AddChoice	(Info_Mod_Patrick_Pickpocket, DIALOG_BACK, Info_Mod_Patrick_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Patrick_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Patrick_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Patrick_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Patrick_Pickpocket);
};

FUNC VOID Info_Mod_Patrick_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Patrick_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Patrick_Pickpocket);

		Info_AddChoice	(Info_Mod_Patrick_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Patrick_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Patrick_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Patrick_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Patrick_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Patrick_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Patrick_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Patrick_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Patrick_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Patrick_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Patrick_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Patrick_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Patrick_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Patrick_EXIT (C_INFO)
{
	npc		= Mod_792_SLD_Patrick_MT;
	nr		= 1;
	condition	= Info_Mod_Patrick_EXIT_Condition;
	information	= Info_Mod_Patrick_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Patrick_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Patrick_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};