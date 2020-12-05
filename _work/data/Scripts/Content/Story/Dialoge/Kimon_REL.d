INSTANCE Info_Mod_Kimon_REL_Hi (C_INFO)
{
	npc		= Mod_7771_FH_Kimon_REL;
	nr		= 1;
	condition	= Info_Mod_Kimon_REL_Hi_Condition;
	information	= Info_Mod_Kimon_REL_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Kimon_REL_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kimon_REL_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_00"); //So we meet again. On the road?
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Hi_15_01"); //You say it. I always have things to do.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_02"); //So do I. My business is booming again. Just...
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Hi_15_03"); //Just?
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_04"); //There's an important customer interested in glee dispensers. This is well known in Khorata.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_05"); //I also have good relations there, but I am unable to find a supplier.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_06"); //The judge and the governor obviously have their hands on it.
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Hi_15_07"); //And who makes the stuff?
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_08"); //These are supposed to be the people of the court. But access to them is blocked by a magical barrier. No one can get through.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_09"); //I tried it myself, but it forced me to turn back every time, whether I wanted to or not.
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Hi_15_10"); //Strange. And why are you telling me this?
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_11"); //You're more successful than I am. Maybe you can spot a supplier while you're in Khorata.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_12"); //It's not supposed to be your damage. Three portions would be enough for me....
};

INSTANCE Info_Mod_Kimon_REL_Freudenspender (C_INFO)
{
	npc		= Mod_7771_FH_Kimon_REL;
	nr		= 1;
	condition	= Info_Mod_Kimon_REL_Freudenspender_Condition;
	information	= Info_Mod_Kimon_REL_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'll ask around on occasion.";
};

FUNC INT Info_Mod_Kimon_REL_Freudenspender_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kimon_REL_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kimon_REL_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Freudenspender_15_00"); //I'll ask around on occasion.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Freudenspender_34_01"); //If you find anything, come back to me.

	Log_CreateTopic	(TOPIC_MOD_KIMON_FREUDENSPENDER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KIMON_FREUDENSPENDER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KIMON_FREUDENSPENDER, "Dealer Kimon wants to resell delights three times. I'm supposed to find a supplier in Khorata. I think the bum's the right address.");
};

INSTANCE Info_Mod_Kimon_REL_Freudenspender2 (C_INFO)
{
	npc		= Mod_7771_FH_Kimon_REL;
	nr		= 1;
	condition	= Info_Mod_Kimon_REL_Freudenspender2_Condition;
	information	= Info_Mod_Kimon_REL_Freudenspender2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Kimon_REL_Freudenspender2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_PennerVater_Kimon2))
	&& (Npc_HasItems(hero, ItMi_Freudenspender) >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kimon_REL_Freudenspender2_Info()
{
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Freudenspender2_34_00"); //Did you do something?
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Freudenspender2_15_01"); //But yes, yes. Not only the supplier, but also the goods. Here.

	B_GiveInvItems	(hero, self, ItMi_Freudenspender, 3);

	AI_Output(self, hero, "Info_Mod_Kimon_REL_Freudenspender2_34_02"); //Fantastic! Did you have expenses?
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Freudenspender2_15_03"); //Yeah, about 350 gold.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Freudenspender2_34_04"); //Here you go back and 350 for your trouble.
	
	B_GiveInvItems (self, hero, ItMi_Gold, 700);
	
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Freudenspender2_15_05"); //See you another time.

	B_SetTopicStatus	(TOPIC_MOD_KIMON_FREUDENSPENDER, LOG_SUCCESS);

	CurrentNQ += 1;

	B_GivePlayerXP	(150);
};

INSTANCE Info_Mod_Kimon_REL_Trade (C_INFO)
{
	npc		= Mod_7771_FH_Kimon_REL;
	nr		= 1;
	condition	= Info_Mod_Kimon_REL_Trade_Condition;
	information	= Info_Mod_Kimon_REL_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Kimon_REL_Trade_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kimon_REL_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Kimon_REL_Pickpocket (C_INFO)
{
	npc		= Mod_7771_FH_Kimon_REL;
	nr		= 1;
	condition	= Info_Mod_Kimon_REL_Pickpocket_Condition;
	information	= Info_Mod_Kimon_REL_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Kimon_REL_Pickpocket_Condition()
{
	C_Beklauen	(70, ItMi_Gold, 24);
};

FUNC VOID Info_Mod_Kimon_REL_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Kimon_REL_Pickpocket);

	Info_AddChoice	(Info_Mod_Kimon_REL_Pickpocket, DIALOG_BACK, Info_Mod_Kimon_REL_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Kimon_REL_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Kimon_REL_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Kimon_REL_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Kimon_REL_Pickpocket);
};

FUNC VOID Info_Mod_Kimon_REL_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Kimon_REL_Pickpocket);
};

INSTANCE Info_Mod_Kimon_REL_EXIT (C_INFO)
{
	npc		= Mod_7771_FH_Kimon_REL;
	nr		= 1;
	condition	= Info_Mod_Kimon_REL_EXIT_Condition;
	information	= Info_Mod_Kimon_REL_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Kimon_REL_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kimon_REL_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
