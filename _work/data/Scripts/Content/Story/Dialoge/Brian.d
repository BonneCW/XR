INSTANCE Info_Mod_Brian_Hi (C_INFO)
{
	npc		= Mod_566_NONE_Brian_NW;
	nr		= 1;
	condition	= Info_Mod_Brian_Hi_Condition;
	information	= Info_Mod_Brian_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Harad's apprentice, I presume?";
};

FUNC INT Info_Mod_Brian_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brian_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Brian_Hi_15_00"); //Harad's apprentice, I presume?
	AI_Output(self, hero, "Info_Mod_Brian_Hi_27_01"); //Just a moment ago, yeah!
	AI_Output(hero, self, "Info_Mod_Brian_Hi_15_02"); //Just a moment ago?
	AI_Output(self, hero, "Info_Mod_Brian_Hi_27_03"); //If the slightest detail should happen, I have been his apprentice for the longest time. Screw him, then.
	AI_Output(hero, self, "Info_Mod_Brian_Hi_15_04"); //Why are you so angry?
	AI_Output(self, hero, "Info_Mod_Brian_Hi_27_05"); //Because Harad's a complete asshole, yeah.
	AI_Output(self, hero, "Info_Mod_Brian_Hi_27_06"); //Crying all day long with his aches and pains, he criticizes everything I do in the same breath.
	AI_Output(self, hero, "Info_Mod_Brian_Hi_27_07"); //You can't please the egoist!
};

INSTANCE Info_Mod_Brian_HaradLehrling (C_INFO)
{
	npc		= Mod_566_NONE_Brian_NW;
	nr		= 1;
	condition	= Info_Mod_Brian_HaradLehrling_Condition;
	information	= Info_Mod_Brian_HaradLehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'd like to be an apprentice blacksmith.";
};

FUNC INT Info_Mod_Brian_HaradLehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brian_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Harad_DeinLehrlingStattBrian))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brian_HaradLehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Brian_HaradLehrling_15_00"); //I'd like to be an apprentice blacksmith.
	AI_Output(hero, self, "Info_Mod_Brian_HaradLehrling_15_01"); //But Harad says he only wants to teach one apprentice at a time.
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_27_02"); //Ha! I know a very simple solution!
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_27_03"); //I would rather become a fisherman than allow myself to be exploited here any longer.
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_27_04"); //So - be quiet. Be an apprentice. I wish you every success, and I hope you'll give him a few of me on the jaw.

	Mod_Brian_KeinLehrling_Day = Wld_GetDay();

	Info_ClearChoices	(Info_Mod_Brian_HaradLehrling);

	Info_AddChoice	(Info_Mod_Brian_HaradLehrling, "Don't you want to reconsider?", Info_Mod_Brian_HaradLehrling_B);
	Info_AddChoice	(Info_Mod_Brian_HaradLehrling, "Uh... thank you.", Info_Mod_Brian_HaradLehrling_A);
};

FUNC VOID Info_Mod_Brian_HaradLehrling_B()
{
	AI_Output(hero, self, "Info_Mod_Brian_HaradLehrling_B_15_00"); //Don't you want to reconsider?
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_B_27_01"); //There's nothing more to think about. Every day I wished I had started a different teaching.
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_B_27_02"); //And now you're giving me the opportunity. I'm not gonna let that pass.
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_B_27_03"); //I'm still a free man tonight!

	Info_ClearChoices	(Info_Mod_Brian_HaradLehrling);
};

FUNC VOID Info_Mod_Brian_HaradLehrling_A()
{
	AI_Output(hero, self, "Info_Mod_Brian_HaradLehrling_A_15_00"); //Uh... thank you.
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_A_27_01"); //You don't have to thank me.
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_A_27_02"); //If I really wanted to help you, I would keep you from becoming Harad's apprentice with my hands and feet.
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_A_27_03"); //But I don't really care. Either you are able to suffer, you can sit against him or after a short period of time you can listen to him in an unnerved way.
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_A_27_04"); //I'm gonna quit right now.

	Info_ClearChoices	(Info_Mod_Brian_HaradLehrling);
};

INSTANCE Info_Mod_Brian_KeinLehrlingMehr01 (C_INFO)
{
	npc		= Mod_566_NONE_Brian_NW;
	nr		= 1;
	condition	= Info_Mod_Brian_KeinLehrlingMehr01_Condition;
	information	= Info_Mod_Brian_KeinLehrlingMehr01_Info;
	permanent	= 0;
	important	= 0;
	description	= "How's your work?";
};

FUNC INT Info_Mod_Brian_KeinLehrlingMehr01_Condition()
{
	if (Mod_Brian_KeinLehrling == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brian_KeinLehrlingMehr01_Info()
{
	AI_Output(hero, self, "Info_Mod_Brian_KeinLehrlingMehr01_15_00"); //How's work?
	AI_Output(self, hero, "Info_Mod_Brian_KeinLehrlingMehr01_27_01"); //I love the tranquility of fishing. Easy to maintain and to let your thoughts wander....
};

INSTANCE Info_Mod_Brian_KeinLehrlingMehr02 (C_INFO)
{
	npc		= Mod_566_NONE_Brian_NW;
	nr		= 1;
	condition	= Info_Mod_Brian_KeinLehrlingMehr02_Condition;
	information	= Info_Mod_Brian_KeinLehrlingMehr02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Still trading?";
};

FUNC INT Info_Mod_Brian_KeinLehrlingMehr02_Condition()
{
	if (Mod_Brian_KeinLehrling == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brian_KeinLehrlingMehr02_Info()
{
	AI_Output(hero, self, "Info_Mod_Brian_KeinLehrlingMehr02_15_00"); //Still trading?
	AI_Output(self, hero, "Info_Mod_Brian_KeinLehrlingMehr02_27_01"); //Since Harad kicked me out after our conversation, I still have some stuff from the old days with me.
	AI_Output(self, hero, "Info_Mod_Brian_KeinLehrlingMehr02_27_02"); //You're welcome to buy it.
};

INSTANCE Info_Mod_Brian_Daemonisch (C_INFO)
{
	npc		= Mod_566_NONE_Brian_NW;
	nr		= 1;
	condition	= Info_Mod_Brian_Daemonisch_Condition;
	information	= Info_Mod_Brian_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brian_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brian_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Brian_Daemonisch_27_00"); //What, what are you doing here? You're not one of them, are you? Be warned, I will fight to the death.
	AI_Output(hero, self, "Info_Mod_Brian_Daemonisch_15_01"); //Calm down for now. What are you talking about?
	AI_Output(self, hero, "Info_Mod_Brian_Daemonisch_27_02"); //You don't seem to be one of them.
	AI_Output(self, hero, "Info_Mod_Brian_Daemonisch_27_03"); //The black shadows... you need to know that the city...
	AI_Output(self, hero, "Info_Mod_Brian_Daemonisch_27_04"); //Rupert, he.... Beware of the darkness...

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_1248_RIT_Ritter_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1249_RIT_Ritter_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1250_RIT_Ritter_NW, "DAEMONISCH");
};

var int Mod_Brian_Trader;

INSTANCE Info_Mod_Brian_Trade (C_INFO)
{
	npc		= Mod_566_NONE_Brian_NW;
	nr		= 1;
	condition	= Info_Mod_Brian_Trade_Condition;
	information	= Info_Mod_Brian_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Brian_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brian_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brian_Trade_Info()
{
	if (!Mod_Brian_Trader) {
		Mod_Brian_Trader = TRUE;
		
		Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Brian can sell me some forging supplies.");
	};
	
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Brian_Pickpocket (C_INFO)
{
	npc		= Mod_566_NONE_Brian_NW;
	nr		= 1;
	condition	= Info_Mod_Brian_Pickpocket_Condition;
	information	= Info_Mod_Brian_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Brian_Pickpocket_Condition()
{
	C_Beklauen	(40, ItMiSwordRaw, 3);
};

FUNC VOID Info_Mod_Brian_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Brian_Pickpocket);

	Info_AddChoice	(Info_Mod_Brian_Pickpocket, DIALOG_BACK, Info_Mod_Brian_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Brian_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Brian_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Brian_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Brian_Pickpocket);
};

FUNC VOID Info_Mod_Brian_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Brian_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Brian_Pickpocket);

		Info_AddChoice	(Info_Mod_Brian_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Brian_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Brian_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Brian_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Brian_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Brian_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Brian_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Brian_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Brian_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Brian_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Brian_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Brian_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Brian_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Brian_EXIT (C_INFO)
{
	npc		= Mod_566_NONE_Brian_NW;
	nr		= 1;
	condition	= Info_Mod_Brian_EXIT_Condition;
	information	= Info_Mod_Brian_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Brian_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brian_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
