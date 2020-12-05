INSTANCE Info_Mod_Rudolf_Hi (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_Hi_Condition;
	information	= Info_Mod_Rudolf_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rudolf_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Rudolf_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Rudolf_Hi_05_00"); //Fresh produce, fresh produce. Food of all kinds only with me!

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_KHORATA, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_KHORATA, "Rudolf in Khorata sells all kinds of food.");
};

INSTANCE Info_Mod_Rudolf_Aufgabe (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_Aufgabe_Condition;
	information	= Info_Mod_Rudolf_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Can I do you any good?";
};

FUNC INT Info_Mod_Rudolf_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rudolf_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rudolf_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Rudolf_Aufgabe_15_00"); //Can I do you any good?
	AI_Output(self, hero, "Info_Mod_Rudolf_Aufgabe_05_01"); //Something good?
	AI_Output(hero, self, "Info_Mod_Rudolf_Aufgabe_15_02"); //Yeah, anything that's close to your heart...
	AI_Output(self, hero, "Info_Mod_Rudolf_Aufgabe_05_03"); //Hm... you could go to Erika's. She has a particularly good liquor on offer there.
	AI_Output(self, hero, "Info_Mod_Rudolf_Aufgabe_05_04"); //You could get it for me. I'll give you the gold for it, too, if you brought it to me.
	AI_Output(hero, self, "Info_Mod_Rudolf_Aufgabe_15_05"); //Whatever you say.
};

INSTANCE Info_Mod_Rudolf_HabSchnaps (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_HabSchnaps_Condition;
	information	= Info_Mod_Rudolf_HabSchnaps_Info;
	permanent	= 0;
	important	= 0;
	description	= "I got the booze for you.";
};

FUNC INT Info_Mod_Rudolf_HabSchnaps_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rudolf_Aufgabe))
	&& (Npc_HasItems(hero, ItFo_BoozeRudolf) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rudolf_HabSchnaps_Info()
{
	AI_Output(hero, self, "Info_Mod_Rudolf_HabSchnaps_15_00"); //I got the booze for you.
	AI_Output(self, hero, "Info_Mod_Rudolf_HabSchnaps_05_01"); //Give me that stuff, then.
	AI_Output(hero, self, "Info_Mod_Rudolf_HabSchnaps_15_02"); //Here you have it.

	B_GiveInvItems	(hero, self, ItFo_BoozeRudolf, 1);

	AI_Output(self, hero, "Info_Mod_Rudolf_HabSchnaps_05_03"); //Ah... I'd like to try it sometime.

	B_UseItem	(self, ItFo_BoozeRudolf);

	AI_Output(self, hero, "Info_Mod_Rudolf_HabSchnaps_05_04"); //Oh, that's quite a punch...
	AI_Output(hero, self, "Info_Mod_Rudolf_HabSchnaps_15_05"); //What about my gold?
	AI_Output(self, hero, "Info_Mod_Rudolf_HabSchnaps_05_06"); //Yeah, take this.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Rudolf_HabSchnaps_05_07"); //Now let me enjoy my fine wine.

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Rudolf_Nagelnachschub (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_Nagelnachschub_Condition;
	information	= Info_Mod_Rudolf_Nagelnachschub_Info;
	permanent	= 0;
	important	= 0;
	description	= "Do you have nails?";
};

FUNC INT Info_Mod_Rudolf_Nagelnachschub_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lukas_Wettstreit))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rudolf_Nagelnachschub_Info()
{
	AI_Output(hero, self, "Info_Mod_Rudolf_Nagelnachschub_15_00"); //Do you have nails?
	AI_Output(self, hero, "Info_Mod_Rudolf_Nagelnachschub_05_01"); //You can check my fruit to see if I've hidden nails somewhere.
	AI_Output(self, hero, "Info_Mod_Rudolf_Nagelnachschub_05_02"); //And if you don't find what you're looking for, I don't have any.
};

INSTANCE Info_Mod_Rudolf_Kissen (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_Kissen_Condition;
	information	= Info_Mod_Rudolf_Kissen_Info;
	permanent	= 0;
	important	= 0;
	description	= "I need something soft.";
};

FUNC INT Info_Mod_Rudolf_Kissen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rudolf_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Malik_Aufgabe))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kissen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rudolf_Kissen_Info()
{
	AI_Output(hero, self, "Info_Mod_Rudolf_Kissen_15_00"); //I need something soft.
	AI_Output(self, hero, "Info_Mod_Rudolf_Kissen_05_01"); //That's where I can offer my highland cheese. It melts on the tongue.
	AI_Output(hero, self, "Info_Mod_Rudolf_Kissen_15_02"); //It stinks.
	AI_Output(self, hero, "Info_Mod_Rudolf_Kissen_05_03"); //So what? Otherwise it wouldn't be cheese.
	AI_Output(hero, self, "Info_Mod_Rudolf_Kissen_15_04"); //True enough. No, thank you. I'll see you around.
	AI_Output(self, hero, "Info_Mod_Rudolf_Kissen_05_05"); //If you mean...
};

INSTANCE Info_Mod_Rudolf_Kimon (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_Kimon_Condition;
	information	= Info_Mod_Rudolf_Kimon_Info;
	permanent	= 0;
	important	= 0;
	description	= "Do you have anything other than food?";
};

FUNC INT Info_Mod_Rudolf_Kimon_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rudolf_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Penner_Kimon))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kimon))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rudolf_Kimon_Info()
{
	AI_Output(hero, self, "Info_Mod_Rudolf_Kimon_15_00"); //Do you have anything other than food?
	AI_Output(self, hero, "Info_Mod_Rudolf_Kimon_05_01"); //Nothing, really.
	AI_Output(hero, self, "Info_Mod_Rudolf_Kimon_15_02"); //Actually? Perhaps you do? Pleasure giver, perhaps?
	AI_Output(self, hero, "Info_Mod_Rudolf_Kimon_05_03"); //I wish I had! I hear it's even better than the liquor from the Erika.
	AI_Output(hero, self, "Info_Mod_Rudolf_Kimon_15_04"); //I was just asking. No hard feelings.
};

INSTANCE Info_Mod_Rudolf_Trade (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_Trade_Condition;
	information	= Info_Mod_Rudolf_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Rudolf_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rudolf_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rudolf_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Rudolf_Pickpocket (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_Pickpocket_Condition;
	information	= Info_Mod_Rudolf_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Rudolf_Pickpocket_Condition()
{
	C_Beklauen	(97, ItFo_Booze, 2);
};

FUNC VOID Info_Mod_Rudolf_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Rudolf_Pickpocket);

	Info_AddChoice	(Info_Mod_Rudolf_Pickpocket, DIALOG_BACK, Info_Mod_Rudolf_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Rudolf_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Rudolf_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Rudolf_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Rudolf_Pickpocket);
};

FUNC VOID Info_Mod_Rudolf_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Rudolf_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Rudolf_Pickpocket);

		Info_AddChoice	(Info_Mod_Rudolf_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Rudolf_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Rudolf_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Rudolf_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Rudolf_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Rudolf_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Rudolf_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Rudolf_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Rudolf_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Rudolf_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Rudolf_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Rudolf_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Rudolf_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Rudolf_EXIT (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_EXIT_Condition;
	information	= Info_Mod_Rudolf_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Rudolf_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Rudolf_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
