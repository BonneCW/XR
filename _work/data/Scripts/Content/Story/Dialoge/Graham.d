INSTANCE Info_Mod_Graham_Hi (C_INFO)
{
	npc		= Mod_1469_BUD_Graham_MT;
	nr		= 1;
	condition	= Info_Mod_Graham_Hi_Condition;
	information	= Info_Mod_Graham_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Graham_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Graham_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Graham_Hi_36_00"); //Haven't I seen you before?
	AI_Output(hero, self, "Info_Mod_Graham_Hi_15_01"); //Anyway, you gave me one of your cards once.
	AI_Output(self, hero, "Info_Mod_Graham_Hi_36_02"); //Now I know who you are again!
	AI_Output(self, hero, "Info_Mod_Graham_Hi_36_03"); //You were the weird one, who arrived in the barrier only a few months ago and got involved with almost every influential guardsman.
	AI_Output(self, hero, "Info_Mod_Graham_Hi_36_04"); //Man, the Buddlers bet when Gomez gets too colorful and he'll have you killed.
	AI_Output(self, hero, "Info_Mod_Graham_Hi_36_05"); //And now all of a sudden you're back.
	AI_Output(hero, self, "Info_Mod_Graham_Hi_15_06"); //Yeah. That's who I am.
};

INSTANCE Info_Mod_Graham_Haendler (C_INFO)
{
	npc		= Mod_1469_BUD_Graham_MT;
	nr		= 1;
	condition	= Info_Mod_Graham_Haendler_Condition;
	information	= Info_Mod_Graham_Haendler_Info;
	permanent	= 0;
	important	= 0;
	description	= "Still selling cards?";
};

FUNC INT Info_Mod_Graham_Haendler_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Graham_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Graham_Haendler_Info()
{
	AI_Output(hero, self, "Info_Mod_Graham_Haendler_15_00"); //Still selling cards?
	AI_Output(self, hero, "Info_Mod_Graham_Haendler_36_01"); //Sure. I don't make any more, but I've got some leftovers. You can take a look at them.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_OLDCAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_OLDCAMP, "Graham sells tickets.");
};

INSTANCE Info_Mod_Graham_WasGibts (C_INFO)
{
	npc		= Mod_1469_BUD_Graham_MT;
	nr		= 1;
	condition	= Info_Mod_Graham_WasGibts_Condition;
	information	= Info_Mod_Graham_WasGibts_Info;
	permanent	= 0;
	important	= 0;
	description	= "What is there to report about the interim period?";
};

FUNC INT Info_Mod_Graham_WasGibts_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Graham_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Graham_WasGibts_Info()
{
	AI_Output(hero, self, "Info_Mod_Graham_WasGibts_15_00"); //What is there to report about the interim period?
	AI_Output(self, hero, "Info_Mod_Graham_WasGibts_36_01"); //Oh, man, where do I start?
	AI_Output(self, hero, "Info_Mod_Graham_WasGibts_36_02"); //At first everything continued normally, but shortly before the fall of the barrier Gomez went crazy and had all fire mages murdered and then disappeared without a trace with Raven and Scar.
	AI_Output(self, hero, "Info_Mod_Graham_WasGibts_36_03"); //Besides, the mine allegedly collapsed, but if Ian is to be believed, this is also questionable.
	AI_Output(self, hero, "Info_Mod_Graham_WasGibts_36_04"); //It's all very mysterious. In any case, hell broke loose in the camp and there was pure anarchy until Thorus could provide peace and quiet.
	AI_Output(self, hero, "Info_Mod_Graham_WasGibts_36_05"); //In the meantime everything has calmed down again. A little too much, if you ask me. Without the mine, there's nothing for us to do all day long.
	AI_Output(self, hero, "Info_Mod_Graham_WasGibts_36_06"); //Most people only know how to distract themselves with alcohol, swamp herb stalks or battles in the arena.
};

INSTANCE Info_Mod_Graham_Lagermusik (C_INFO)
{
	npc		= Mod_1469_BUD_Graham_MT;
	nr		= 1;
	condition	= Info_Mod_Graham_Lagermusik_Condition;
	information	= Info_Mod_Graham_Lagermusik_Info;
	permanent	= 0;
	important	= 0;
	description	= "Can you play an instrument?";
};

FUNC INT Info_Mod_Graham_Lagermusik_Condition()
{
	if (Mod_Gravo_Schatz == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Graham_Lagermusik_Info()
{
	AI_Output(hero, self, "Info_Mod_Graham_Lagermusik_15_00"); //Can you play an instrument?
	AI_Output(self, hero, "Info_Mod_Graham_Lagermusik_36_01"); //Well, I'm not a virtuoso or anything... but I can make a little noise.
	AI_Output(hero, self, "Info_Mod_Graham_Lagermusik_15_02"); //Gravo is looking for members for his group. You should check in with him sometime.
	AI_Output(self, hero, "Info_Mod_Graham_Lagermusik_36_03"); //I'd love to. But why exactly with Gravo?
	AI_Output(hero, self, "Info_Mod_Graham_Lagermusik_15_04"); //He won't bite.
	AI_Output(self, hero, "Info_Mod_Graham_Lagermusik_36_05"); //Not as long as he remembers his good upbringing....
	AI_Output(self, hero, "Info_Mod_Graham_Lagermusik_36_06"); //All right, I'll see if this is something for me.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATGRAVO");

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Graham_Trade (C_INFO)
{
	npc		= Mod_1469_BUD_Graham_MT;
	nr		= 1;
	condition	= Info_Mod_Graham_Trade_Condition;
	information	= Info_Mod_Graham_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Graham_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Graham_Haendler))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Graham_Trade_Info()
{
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Graham_Pickpocket (C_INFO)
{
	npc		= Mod_1469_BUD_Graham_MT;
	nr		= 1;
	condition	= Info_Mod_Graham_Pickpocket_Condition;
	information	= Info_Mod_Graham_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30;
};

FUNC INT Info_Mod_Graham_Pickpocket_Condition()
{
	C_Beklauen	(30, ItMi_Gold, 13);
};

FUNC VOID Info_Mod_Graham_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Graham_Pickpocket);

	Info_AddChoice	(Info_Mod_Graham_Pickpocket, DIALOG_BACK, Info_Mod_Graham_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Graham_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Graham_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Graham_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Graham_Pickpocket);
};

FUNC VOID Info_Mod_Graham_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Graham_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Graham_Pickpocket);

		Info_AddChoice	(Info_Mod_Graham_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Graham_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Graham_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Graham_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Graham_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Graham_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Graham_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Graham_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Graham_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Graham_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Graham_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Graham_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Graham_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Graham_EXIT (C_INFO)
{
	npc		= Mod_1469_BUD_Graham_MT;
	nr		= 1;
	condition	= Info_Mod_Graham_EXIT_Condition;
	information	= Info_Mod_Graham_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Graham_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Graham_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
