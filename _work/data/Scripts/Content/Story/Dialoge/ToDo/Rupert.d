INSTANCE Info_Mod_Rupert_Hi (C_INFO)
{
	npc		= Mod_750_NONE_Rupert_NW;
	nr		= 1;
	condition	= Info_Mod_Rupert_Hi_Condition;
	information	= Info_Mod_Rupert_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Are you trading?";
};

FUNC INT Info_Mod_Rupert_Hi_Condition()
{
	if (Mod_IstLehrling == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rupert_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Rupert_Hi_15_00"); //Are you trading?
	AI_Output(self, hero, "Info_Mod_Rupert_Hi_03_01"); //(pressing around) Uh.... well.... not really today.
	AI_Output(hero, self, "Info_Mod_Rupert_Hi_15_02"); //You don't like my face, do you?
	AI_Output(self, hero, "Info_Mod_Rupert_Hi_03_03"); //No, no, it's just... (whispers) Garond doesn't like it when I sell you convicts.
	AI_Output(self, hero, "Info_Mod_Rupert_Hi_03_04"); //And I don't have my trading license for long, you know?

	Info_ClearChoices	(Info_Mod_Rupert_Hi);

	Info_AddChoice	(Info_Mod_Rupert_Hi, "Give me the goods or I'll spill!", Info_Mod_Rupert_Hi_C);
	Info_AddChoice	(Info_Mod_Rupert_Hi, "I completely understand. You're a coward.", Info_Mod_Rupert_Hi_B);
	Info_AddChoice	(Info_Mod_Rupert_Hi, "All right, then, don't.", Info_Mod_Rupert_Hi_A);
};

FUNC VOID Info_Mod_Rupert_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Rupert_Hi_C_15_00"); //Give me the goods or I'll spill!
	AI_Output(self, hero, "Info_Mod_Rupert_Hi_C_03_01"); //Don't do anything stupid!

	Info_ClearChoices	(Info_Mod_Rupert_Hi);

	Info_AddChoice	(Info_Mod_Rupert_Hi, "You asked for it!", Info_Mod_Rupert_Hi_E);
	Info_AddChoice	(Info_Mod_Rupert_Hi, "We'll talk again.", Info_Mod_Rupert_Hi_D);
};

FUNC VOID Info_Mod_Rupert_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Rupert_Hi_B_15_00"); //I completely understand. You're a coward.
	AI_Output(self, hero, "Info_Mod_Rupert_Hi_B_03_01"); //I am not! I have to see where I'm staying.
	AI_Output(hero, self, "Info_Mod_Rupert_Hi_B_15_02"); //You can stay where the pepper grows.

	Info_ClearChoices	(Info_Mod_Rupert_Hi);
};

FUNC VOID Info_Mod_Rupert_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Rupert_Hi_A_15_00"); //All right, then, don't.
	AI_Output(self, hero, "Info_Mod_Rupert_Hi_A_03_01"); //Thank you for understanding. Later, maybe.

	Info_ClearChoices	(Info_Mod_Rupert_Hi);
};

FUNC VOID Info_Mod_Rupert_Hi_E()
{
	AI_Output(hero, self, "Info_Mod_Rupert_Hi_E_15_00"); //You asked for it!
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_Rupert_Hi);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);
};

FUNC VOID Info_Mod_Rupert_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Rupert_Hi_D_15_00"); //I'll talk to you later.

	Info_ClearChoices	(Info_Mod_Rupert_Hi);
};

INSTANCE Info_Mod_Rupert_Handelt (C_INFO)
{
	npc		= Mod_750_NONE_Rupert_NW;
	nr		= 1;
	condition	= Info_Mod_Rupert_Handelt_Condition;
	information	= Info_Mod_Rupert_Handelt_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rupert_Handelt_Condition()
{
	if (Mod_IstLehrling == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rupert_Handelt_Info()
{
	AI_Output(self, hero, "Info_Mod_Rupert_Handelt_03_00"); //Wait a minute, I'd be dealing with you now.

	Info_ClearChoices	(Info_Mod_Rupert_Handelt);

	Info_AddChoice	(Info_Mod_Rupert_Handelt, "Forget about it. My gold goes to dealers other than you.", Info_Mod_Rupert_Handelt_B);
	Info_AddChoice	(Info_Mod_Rupert_Handelt, "Well, let me see it.", Info_Mod_Rupert_Handelt_A);
};

FUNC VOID Info_Mod_Rupert_Handelt_B()
{
	AI_Output(hero, self, "Info_Mod_Rupert_Handelt_B_15_00"); //Forget about it. My gold goes to dealers other than you.

	Info_ClearChoices	(Info_Mod_Rupert_Handelt);
};

FUNC VOID Info_Mod_Rupert_Handelt_A()
{
	AI_Output(hero, self, "Info_Mod_Rupert_Handelt_A_15_00"); //Well, let me see it.
	AI_Output(self, hero, "Info_Mod_Rupert_Handelt_A_03_01"); //Take your pick!

	Info_ClearChoices	(Info_Mod_Rupert_Handelt);

	Mod_RupertHandelt = 1;

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Rupert's trading with me now.");
};

INSTANCE Info_Mod_Rupert_MatteoLehrling1 (C_INFO)
{
	npc		= Mod_750_NONE_Rupert_NW;
	nr		= 1;
	condition	= Info_Mod_Rupert_MatteoLehrling1_Condition;
	information	= Info_Mod_Rupert_MatteoLehrling1_Info;
	permanent	= 0;
	important	= 0;
	description	= "Did something just move under your feet? (place apple)";
};

FUNC INT Info_Mod_Rupert_MatteoLehrling1_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Rupert_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rupert_MatteoLehrling1_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL01");

	AI_PlayAni	(self, "T_PLUNDER");

	B_Say	(hero, self, "$PLACEAPFEL02");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Rupert_Apfel = 1;
};

INSTANCE Info_Mod_Rupert_MatteoLehrling2 (C_INFO)
{
	npc		= Mod_750_NONE_Rupert_NW;
	nr		= 1;
	condition	= Info_Mod_Rupert_MatteoLehrling2_Condition;
	information	= Info_Mod_Rupert_MatteoLehrling2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, ain't they looking for him over there? (place apple)";
};

FUNC INT Info_Mod_Rupert_MatteoLehrling2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Rupert_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rupert_MatteoLehrling2_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL03");

	AI_PlayAni	(self, "T_SEARCH");

	B_Say	(hero, self, "$PLACEAPFEL04");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Rupert_Apfel = 1;
};

INSTANCE Info_Mod_Rupert_MatteoLehrling3 (C_INFO)
{
	npc		= Mod_750_NONE_Rupert_NW;
	nr		= 1;
	condition	= Info_Mod_Rupert_MatteoLehrling3_Condition;
	information	= Info_Mod_Rupert_MatteoLehrling3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nice apples you have there... (place apple)";
};

FUNC INT Info_Mod_Rupert_MatteoLehrling3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Rupert_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rupert_MatteoLehrling3_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL05");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Rupert_Apfel = 1;
};

INSTANCE Info_Mod_Rupert_Daemonisch (C_INFO)
{
	npc		= Mod_750_NONE_Rupert_NW;
	nr		= 1;
	condition	= Info_Mod_Rupert_Daemonisch_Condition;
	information	= Info_Mod_Rupert_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rupert_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brian_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rupert_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Rupert_Daemonisch_03_00"); //Hey, you move around a lot and you know your way around.
	AI_Output(hero, self, "Info_Mod_Rupert_Daemonisch_15_01"); //Yeah, why?
	AI_Output(self, hero, "Info_Mod_Rupert_Daemonisch_03_02"); //Shh, not so loud. I don't know if we're being overheard....
	AI_Output(self, hero, "Info_Mod_Rupert_Daemonisch_03_03"); //I saw strange things in the evening outside the city and I'm not sure what to think of them.
	AI_Output(self, hero, "Info_Mod_Rupert_Daemonisch_03_04"); //Right now I don't really know who I can trust from the city....
	AI_Output(hero, self, "Info_Mod_Rupert_Daemonisch_15_05"); //What the hell happened?
	AI_Output(self, hero, "Info_Mod_Rupert_Daemonisch_03_06"); //(quietly) Just come over here late at night. Then I'll show you what I'm talking about.

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Rupert wants to meet me at the south gate late in the evening to show me something. He was very careful, as if he had to fear being overheard.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "DAEMONISCH2");
};

INSTANCE Info_Mod_Rupert_Daemonisch2 (C_INFO)
{
	npc		= Mod_750_NONE_Rupert_NW;
	nr		= 1;
	condition	= Info_Mod_Rupert_Daemonisch2_Condition;
	information	= Info_Mod_Rupert_Daemonisch2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rupert_Daemonisch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rupert_Daemonisch))
	&& (Wld_IsTime(21,00,05,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rupert_Daemonisch2_Info()
{
	AI_Output(self, hero, "Info_Mod_Rupert_Daemonisch2_03_00"); //Oh, there you are. Accompany me unobtrusively....

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "DAEMONISCHER");
};

INSTANCE Info_Mod_Rupert_Daemonisch3 (C_INFO)
{
	npc		= Mod_750_NONE_Rupert_NW;
	nr		= 1;
	condition	= Info_Mod_Rupert_Daemonisch3_Condition;
	information	= Info_Mod_Rupert_Daemonisch3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rupert_Daemonisch3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rupert_Daemonisch2))
	&& (Npc_GetDistToWP(self, "NW_FARM1_CITYWALL_02_B") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rupert_Daemonisch3_Info()
{
	AI_Output(self, hero, "Info_Mod_Rupert_Daemonisch3_03_00"); //Well, here we are.
	AI_Output(hero, self, "Info_Mod_Rupert_Daemonisch3_15_01"); //But... There's nothing here.
	AI_Output(self, hero, "Info_Mod_Rupert_Daemonisch3_03_02"); //Not yet.
	AI_Output(hero, self, "Info_Mod_Rupert_Daemonisch3_15_03"); //Hey, what are you doing?
	AI_Output(self, hero, "Info_Mod_Rupert_Daemonisch3_03_04"); //I'm just preparing everything.
	AI_Output(self, hero, "Info_Mod_Rupert_Daemonisch3_03_05"); //Now get ready to join us.... or die.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
	AI_Teleport	(self, "TOT");
};

INSTANCE Info_Mod_Rupert_Trade (C_INFO)
{
	npc		= Mod_750_NONE_Rupert_NW;
	nr		= 1;
	condition	= Info_Mod_Rupert_Trade_Condition;
	information	= Info_Mod_Rupert_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Rupert_Trade_Condition()
{
	if (Mod_RupertHandelt == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rupert_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Rupert_Pickpocket (C_INFO)
{
	npc		= Mod_750_NONE_Rupert_NW;
	nr		= 1;
	condition	= Info_Mod_Rupert_Pickpocket_Condition;
	information	= Info_Mod_Rupert_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Rupert_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 17);
};

FUNC VOID Info_Mod_Rupert_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Rupert_Pickpocket);

	Info_AddChoice	(Info_Mod_Rupert_Pickpocket, DIALOG_BACK, Info_Mod_Rupert_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Rupert_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Rupert_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Rupert_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Rupert_Pickpocket);
};

FUNC VOID Info_Mod_Rupert_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Rupert_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Rupert_Pickpocket);

		Info_AddChoice	(Info_Mod_Rupert_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Rupert_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Rupert_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Rupert_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Rupert_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Rupert_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Rupert_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Rupert_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Rupert_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Rupert_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Rupert_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Rupert_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Rupert_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Rupert_EXIT (C_INFO)
{
	npc		= Mod_750_NONE_Rupert_NW;
	nr		= 1;
	condition	= Info_Mod_Rupert_EXIT_Condition;
	information	= Info_Mod_Rupert_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Rupert_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Rupert_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
