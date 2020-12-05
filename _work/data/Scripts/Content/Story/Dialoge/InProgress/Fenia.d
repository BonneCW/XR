INSTANCE Info_Mod_Fenia_Hi (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_Hi_Condition;
	information	= Info_Mod_Fenia_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fenia_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fenia_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Fenia_Hi_19_00"); //Hi, I'm Fenia. Do you need something to eat?
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Fenia seems to be dealing in food.");
};

INSTANCE Info_Mod_Fenia_MatteoLehrling1 (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_MatteoLehrling1_Condition;
	information	= Info_Mod_Fenia_MatteoLehrling1_Info;
	permanent	= 0;
	important	= 0;
	description	= "Did something just move under your feet? (place apple)";
};

FUNC INT Info_Mod_Fenia_MatteoLehrling1_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Fenia_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_MatteoLehrling1_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL01");

	AI_PlayAni	(self, "T_PLUNDER");

	B_Say	(hero, self, "$PLACEAPFEL02");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Fenia_Apfel = 1;
};

INSTANCE Info_Mod_Fenia_MatteoLehrling2 (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_MatteoLehrling2_Condition;
	information	= Info_Mod_Fenia_MatteoLehrling2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, ain't they looking for him over there? (place apple)";
};

FUNC INT Info_Mod_Fenia_MatteoLehrling2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Fenia_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_MatteoLehrling2_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL03");

	AI_PlayAni	(self, "T_SEARCH");

	B_Say	(hero, self, "$PLACEAPFEL04");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Fenia_Apfel = 1;
};

INSTANCE Info_Mod_Fenia_MatteoLehrling3 (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_MatteoLehrling3_Condition;
	information	= Info_Mod_Fenia_MatteoLehrling3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nice apples you have there... (place apple)";
};

FUNC INT Info_Mod_Fenia_MatteoLehrling3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Fenia_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_MatteoLehrling3_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL05");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Fenia_Apfel = 1;
};

INSTANCE Info_Mod_Fenia_Daemonisch (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_Daemonisch_Condition;
	information	= Info_Mod_Fenia_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fenia_Daemonisch_Condition()
{
	if (Mod_HQ_Daemonisch == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Fenia_Daemonisch_19_00"); //Man, he ran quickly to the south gate.
	
	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "That must be him. To the south gate, after.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Fenia_Wanzen (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_Wanzen_Condition;
	information	= Info_Mod_Fenia_Wanzen_Info;
	permanent	= 0;
	important	= 0;
	description	= "What are you doing here?";
};

FUNC INT Info_Mod_Fenia_Wanzen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Edda_WanzenBack))
	&& (Eddas_Wanzen_Back == 2)
	&& (Wld_IsTime(22,05,04,55))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_Wanzen_Info()
{
	AI_Output(hero, self, "Info_Mod_Fenia_Wanzen_15_00"); //What are you doing here?
	AI_Output(self, hero, "Info_Mod_Fenia_Wanzen_19_01"); //(feels caught) Uh.... nothing at all.
	AI_Output(hero, self, "Info_Mod_Fenia_Wanzen_15_02"); //You wouldn't have anything to do with the bugs in Eddie's cabin, would you?
	AI_Output(self, hero, "Info_Mod_Fenia_Wanzen_19_03"); //Uh... Me?
	AI_Output(hero, self, "Info_Mod_Fenia_Wanzen_15_04"); //Yeah, you.
	AI_Output(self, hero, "Info_Mod_Fenia_Wanzen_19_05"); //Well, uh... it's different, so you think.
	AI_Output(hero, self, "Info_Mod_Fenia_Wanzen_15_06"); //What's it like?
	AI_Output(self, hero, "Info_Mod_Fenia_Wanzen_19_07"); //Edda deserves it, you know? She tried to hook up with my husband.
	AI_Output(hero, self, "Info_Mod_Fenia_Wanzen_15_08"); //And that's why you put meat bugs in her cabin? She'll be happy to know that.
	AI_Output(self, hero, "Info_Mod_Fenia_Wanzen_19_09"); //Please don't betray me.
	AI_Output(hero, self, "Info_Mod_Fenia_Wanzen_15_10"); //Why wouldn't I do that?
	AI_Output(self, hero, "Info_Mod_Fenia_Wanzen_19_11"); //I can pay you. I'm a trader, I have gold.

	B_StartOtherRoutine	(self, "START");

	Info_ClearChoices	(Info_Mod_Fenia_Wanzen);

	Info_AddChoice	(Info_Mod_Fenia_Wanzen, "All right, I won't tell Edda.", Info_Mod_Fenia_Wanzen_Fenia);
	Info_AddChoice	(Info_Mod_Fenia_Wanzen, "No, I'll tell Edda everything.", Info_Mod_Fenia_Wanzen_Edda);
};

FUNC VOID Info_Mod_Fenia_Wanzen_Fenia()
{
	AI_Output(hero, self, "Info_Mod_Fenia_Wanzen_Fenia_15_00"); //All right, I won't tell Edda.
	AI_Output(self, hero, "Info_Mod_Fenia_Wanzen_Fenia_19_01"); //Thank you, Edda would have killed me. Here's your gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_GivePlayerXP	(50);

	Eddas_Wanzen_Back = 4;

	B_Göttergefallen (2, 1);

	Info_ClearChoices	(Info_Mod_Fenia_Wanzen);

	B_LogEntry	(TOPIC_MOD_EDDASWANZENBACK, "I took Fenia's offer and I'm not gonna give her away to Edda.");

	B_SetTopicStatus	(TOPIC_MOD_EDDASWANZENBACK, LOG_SUCCESS);

	CurrentNQ += 1;
};

FUNC VOID Info_Mod_Fenia_Wanzen_Edda()
{
	AI_Output(hero, self, "Info_Mod_Fenia_Wanzen_Edda_15_00"); //No, I'll tell Edda everything.
	AI_Output(self, hero, "Info_Mod_Fenia_Wanzen_Edda_19_01"); //Oh, no, she's gonna kill me.

	Eddas_Wanzen_Back = 3;

	Info_ClearChoices	(Info_Mod_Fenia_Wanzen);
};

INSTANCE Info_Mod_Fenia_AllesKlar (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_AllesKlar_Condition;
	information	= Info_Mod_Fenia_AllesKlar_Info;
	permanent	= 0;
	important	= 0;
	description	= "Are you all right?";
};

FUNC INT Info_Mod_Fenia_AllesKlar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fenia_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_AllesKlar_Info()
{
	AI_Output(hero, self, "Info_Mod_Fenia_AllesKlar_15_00"); //Are you all right?
	AI_Output(self, hero, "Info_Mod_Fenia_AllesKlar_19_01"); //Do I look that depressed? That would be bad for business.
	AI_Output(hero, self, "Info_Mod_Fenia_AllesKlar_15_02"); //What's bothering you?
	AI_Output(self, hero, "Info_Mod_Fenia_AllesKlar_19_03"); //I catch my husband Halvor again and again looking for strange women.
	AI_Output(self, hero, "Info_Mod_Fenia_AllesKlar_19_04"); //But I also have the feeling that all women are trying to dissuade me from using my neck.
	AI_Output(hero, self, "Info_Mod_Fenia_AllesKlar_15_05"); //Did you ever talk to him about that?
	AI_Output(self, hero, "Info_Mod_Fenia_AllesKlar_19_06"); //Mal? I always confront him, but he denies everything vehemently and talks himself out with sales talks and so on.
	AI_Output(self, hero, "Info_Mod_Fenia_AllesKlar_19_07"); //I'll catch him in the act...
};

INSTANCE Info_Mod_Fenia_BH (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_BH_Condition;
	information	= Info_Mod_Fenia_BH_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fenia_BH_Condition()
{
	if (Mod_Garvell_Fenia == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_BH_Info()
{
	AI_Output(self, hero, "Info_Mod_Fenia_BH_19_00"); //You greasy rascal! Will you get your hands off my...? mine let go!
	AI_Output(hero, self, "Info_Mod_Fenia_BH_15_01"); //But...
	AI_Output(self, hero, "Info_Mod_Fenia_BH_19_02"); //I suppose you've come up with an excuse to take part in this action.
	AI_Output(self, hero, "Info_Mod_Fenia_BH_19_03"); //Shut up and stay away from me!

	B_LogEntry	(TOPIC_MOD_GARVELL_FENIA, "Somebody set me up big time....");
};

INSTANCE Info_Mod_Fenia_BH2 (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_BH2_Condition;
	information	= Info_Mod_Fenia_BH2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fenia_BH2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garvell_Fenia3))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_BH2_Info()
{
	AI_Output(self, hero, "Info_Mod_Fenia_BH2_19_00"); //Let's forget about my business... mine Yeah?
	AI_Output(hero, self, "Info_Mod_Fenia_BH2_15_01"); //Won't happen again.
};

INSTANCE Info_Mod_Fenia_Trade (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_Trade_Condition;
	information	= Info_Mod_Fenia_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Fenia_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fenia_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Fenia_Pickpocket (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_Pickpocket_Condition;
	information	= Info_Mod_Fenia_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60_Female;
};

FUNC INT Info_Mod_Fenia_Pickpocket_Condition()
{
	C_Beklauen	(40, ItMi_Gold, 15);
};

FUNC VOID Info_Mod_Fenia_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Fenia_Pickpocket);

	Info_AddChoice	(Info_Mod_Fenia_Pickpocket, DIALOG_BACK, Info_Mod_Fenia_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Fenia_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Fenia_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Fenia_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Fenia_Pickpocket);
};

FUNC VOID Info_Mod_Fenia_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Fenia_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Fenia_Pickpocket);

		Info_AddChoice	(Info_Mod_Fenia_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Fenia_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Fenia_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Fenia_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Fenia_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Fenia_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Fenia_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Fenia_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Fenia_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Fenia_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Fenia_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Fenia_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Fenia_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Fenia_EXIT (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_EXIT_Condition;
	information	= Info_Mod_Fenia_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Fenia_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fenia_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
