INSTANCE Info_Mod_Snaf_Hi (C_INFO)
{
	npc		= Mod_965_STT_Snaf_MT;
	nr		= 1;
	condition	= Info_Mod_Snaf_Hi_Condition;
	information	= Info_Mod_Snaf_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Snaf_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Snaf_Hi_Info()
{
	if (Mod_Import_Snaf == LOG_SUCCESS)
	{
		AI_Output(self, hero, "Info_Mod_Snaf_Hi_06_00"); //Hey, I know you. You brought me the ingredients for my meatbug ragout once.
		AI_Output(hero, self, "Info_Mod_Snaf_Hi_15_01"); //Yes...
		AI_Output(self, hero, "Info_Mod_Snaf_Hi_06_02"); //I have to thank you again for that. I made a good living with the meatbug ragout.
		AI_Output(self, hero, "Info_Mod_Snaf_Hi_06_03"); //In return, I'll sell you some of my new merchandise. Of course, I also have meatbug ragout.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Snaf_Hi_06_04"); //Hey, new guy. If you're hungry, you can drop by my place, I have some real specialties for you.
		AI_Output(self, hero, "Info_Mod_Snaf_Hi_06_05"); //Among other things, my famous meatbug ragout.
	};

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_OLDCAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_OLDCAMP, "Snaf sells me various groceries. And of course also meatbug ragout.");
};

INSTANCE Info_Mod_Snaf_WoherZutaten (C_INFO)
{
	npc		= Mod_965_STT_Snaf_MT;
	nr		= 1;
	condition	= Info_Mod_Snaf_WoherZutaten_Condition;
	information	= Info_Mod_Snaf_WoherZutaten_Info;
	permanent	= 0;
	important	= 0;
	description	= "Where do you get all the ingredients from?";
};

FUNC INT Info_Mod_Snaf_WoherZutaten_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Snaf_WoherZutaten_Info()
{
	AI_Output(hero, self, "Info_Mod_Snaf_WoherZutaten_15_00"); //Where do you get all the ingredients from?
	AI_Output(self, hero, "Info_Mod_Snaf_WoherZutaten_06_01"); //There's always plenty of meat bugs. The hunters also bring enough green fodder from their hunts.
	AI_Output(self, hero, "Info_Mod_Snaf_WoherZutaten_06_02"); //And otherwise... what you find. Sometimes it's better not to think too much about what's inside.
};

INSTANCE Info_Mod_Snaf_Lagermusik (C_INFO)
{
	npc		= Mod_965_STT_Snaf_MT;
	nr		= 1;
	condition	= Info_Mod_Snaf_Lagermusik_Condition;
	information	= Info_Mod_Snaf_Lagermusik_Info;
	permanent	= 0;
	important	= 0;
	description	= "What do you think of camp music?";
};

FUNC INT Info_Mod_Snaf_Lagermusik_Condition()
{
	if (Mod_Gravo_Schatz == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Snaf_Lagermusik_Info()
{
	AI_Output(hero, self, "Info_Mod_Snaf_Lagermusik_15_00"); //What do you think of camp music?
	AI_Output(self, hero, "Info_Mod_Snaf_Lagermusik_06_01"); //Oh, you don't know how I miss such a thing.
	AI_Output(self, hero, "Info_Mod_Snaf_Lagermusik_06_02"); //One of them beats the strings, one the drum, and everyone sings something melancholic about the cheerful life at the king's court.
	AI_Output(hero, self, "Info_Mod_Snaf_Lagermusik_15_03"); //Gravo wants to build a whole group. Do you want to participate?
	AI_Output(self, hero, "Info_Mod_Snaf_Lagermusik_06_04"); //He wants to perform properly? Nah, I don't have time for that. I can't ignore my cooking pot.
	AI_Output(self, hero, "Info_Mod_Snaf_Lagermusik_06_05"); //But he can be sure who will be the first visitor of his performances!
};

INSTANCE Info_Mod_Snaf_Trade (C_INFO)
{
	npc		= Mod_965_STT_Snaf_MT;
	nr		= 1;
	condition	= Info_Mod_Snaf_Trade_Condition;
	information	= Info_Mod_Snaf_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Snaf_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Snaf_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Snaf_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Snaf_Pickpocket (C_INFO)
{
	npc		= Mod_965_STT_Snaf_MT;
	nr		= 1;
	condition	= Info_Mod_Snaf_Pickpocket_Condition;
	information	= Info_Mod_Snaf_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Snaf_Pickpocket_Condition()
{
	C_Beklauen	(45, ItFo_Fleischwanzenragout, 3);
};

FUNC VOID Info_Mod_Snaf_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Snaf_Pickpocket);

	Info_AddChoice	(Info_Mod_Snaf_Pickpocket, DIALOG_BACK, Info_Mod_Snaf_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Snaf_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Snaf_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Snaf_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Snaf_Pickpocket);
};

FUNC VOID Info_Mod_Snaf_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Snaf_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Snaf_Pickpocket);

		Info_AddChoice	(Info_Mod_Snaf_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Snaf_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Snaf_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Snaf_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Snaf_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Snaf_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Snaf_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Snaf_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Snaf_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Snaf_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Snaf_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Snaf_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Snaf_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Snaf_EXIT (C_INFO)
{
	npc		= Mod_965_STT_Snaf_MT;
	nr		= 1;
	condition	= Info_Mod_Snaf_EXIT_Condition;
	information	= Info_Mod_Snaf_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Snaf_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Snaf_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
