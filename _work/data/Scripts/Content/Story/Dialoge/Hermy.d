INSTANCE Info_Mod_Hermy_Hi (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_Hi_Condition;
	information	= Info_Mod_Hermy_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi. I'm new here.";
};

FUNC INT Info_Mod_Hermy_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hermy_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Hi_15_00"); //Hi. I'm new here.
	AI_Output(self, hero, "Info_Mod_Hermy_Hi_01_01"); //Greetings to me. Finally, I'm not the new guy here. (laughs)
	AI_Output(self, hero, "Info_Mod_Hermy_Hi_01_02"); //My name is Hermann, but everyone here calls with Hermy.
	AI_Output(hero, self, "Info_Mod_Hermy_Hi_15_03"); //What are you doing here?
	AI_Output(self, hero, "Info_Mod_Hermy_Hi_01_04"); //I deal in transformation roles. I can offer you a few simple roles, but I only sell the valuable sayings to members.
	AI_Output(hero, self, "Info_Mod_Hermy_Hi_15_05"); //I'll come back to that.
	AI_Output(self, hero, "Info_Mod_Hermy_Hi_01_06"); //With me, you're always welcome.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_VM, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_VM, "Hermy's selling conversion castors.");
};

INSTANCE Info_Mod_Hermy_QuestHermy (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_QuestHermy_Condition;
	information	= Info_Mod_Hermy_QuestHermy_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hermy_QuestHermy_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Faice_QuestHermy))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hermy_QuestHermy_Info()
{
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_01_00"); //You must be the new guy. I'm Hermann, but please call me Hermy.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_01_01"); //Faice sends you, right?

	Info_ClearChoices	(Info_Mod_Hermy_QuestHermy);

	Info_AddChoice	(Info_Mod_Hermy_QuestHermy, "You're a very smart one.", Info_Mod_Hermy_QuestHermy_B);
	Info_AddChoice	(Info_Mod_Hermy_QuestHermy, "That's how it is.", Info_Mod_Hermy_QuestHermy_A);
};

FUNC VOID Info_Mod_Hermy_QuestHermy_B()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_B_15_00"); //You're a very smart one.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_B_01_01"); //Hey, I can tell if you're kidding me.

	Info_ClearChoices	(Info_Mod_Hermy_QuestHermy);

	Info_AddChoice	(Info_Mod_Hermy_QuestHermy, "And how do you feel about it?", Info_Mod_Hermy_QuestHermy_D);
	Info_AddChoice	(Info_Mod_Hermy_QuestHermy, "I didn't mean to bullshit you.", Info_Mod_Hermy_QuestHermy_C);
};

FUNC VOID Info_Mod_Hermy_QuestHermy_E()
{
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_E_01_00"); //So it is the case that, according to a study, there should be a tunnel underneath the Old Library, where these stinking orcs have settled.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_E_01_01"); //Dort sollen noch ein paar Spruchrollen "Harpie Transformation" zu finden sein.

	Info_ClearChoices	(Info_Mod_Hermy_QuestHermy);

	Info_AddChoice	(Info_Mod_Hermy_QuestHermy, "What do I have to do with this?", Info_Mod_Hermy_QuestHermy_G);
	Info_AddChoice	(Info_Mod_Hermy_QuestHermy, "And I'm supposed to get it, right?", Info_Mod_Hermy_QuestHermy_F);
};

FUNC VOID Info_Mod_Hermy_QuestHermy_A()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_A_15_00"); //That's how it is.

	Info_Mod_Hermy_QuestHermy_E();
};

FUNC VOID Info_Mod_Hermy_QuestHermy_D()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_D_15_00"); //And how do you feel about it?
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_D_01_01"); //You weren't kidding me.
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_D_15_02"); //Right. What's so important now?

	Info_Mod_Hermy_QuestHermy_E();
};

FUNC VOID Info_Mod_Hermy_QuestHermy_C()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_C_15_00"); //I didn't mean to bullshit you.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_C_01_01"); //I've noticed that.

	Info_Mod_Hermy_QuestHermy_E();
};

FUNC VOID Info_Mod_Hermy_QuestHermy_H()
{
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_H_01_00"); //It would be really nice of you to go there for us.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_H_01_01"); //Besides, it'll help you advance on your recording.

	Info_ClearChoices	(Info_Mod_Hermy_QuestHermy);

	Info_AddChoice	(Info_Mod_Hermy_QuestHermy, "But I'm not interested.", Info_Mod_Hermy_QuestHermy_J);
	Info_AddChoice	(Info_Mod_Hermy_QuestHermy, "Okay, I'll do it.", Info_Mod_Hermy_QuestHermy_I);
};

FUNC VOID Info_Mod_Hermy_QuestHermy_G()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_G_15_00"); //What do I have to do with this?

	Info_Mod_Hermy_QuestHermy_H();
};

FUNC VOID Info_Mod_Hermy_QuestHermy_F()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_F_15_00"); //And I'm supposed to get it, right?
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_F_01_01"); //Right. We are very busy at the moment.

	Info_Mod_Hermy_QuestHermy_H();
};

FUNC VOID Info_Mod_Hermy_QuestHermy_J()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_J_15_00"); //But I'm not interested.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_J_01_01"); //That's a pity. But you can always come back if you decide otherwise.

	Info_ClearChoices	(Info_Mod_Hermy_QuestHermy);
};

FUNC VOID Info_Mod_Hermy_QuestHermy_I()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_I_15_00"); //Okay, I'll do it.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_I_01_01"); //Very good. Very good. Go to the Old Library and talk to those stinking creatures.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_I_01_02"); //I hope they can tell you more than our old scrolls.

	B_LogEntry	(TOPIC_MOD_FAICE_HARPIE, "I have the task to go to the rock fortress and ask the orcs about a possible tunnel, because there the transformation spell to the harpie is supposed to be there.");

	Mod_Hermy_KnowsQuest = 1;

	Wld_SendTrigger	("EVT_OW_MOUNTAINRUIN_01");

	Info_ClearChoices	(Info_Mod_Hermy_QuestHermy);
};

INSTANCE Info_Mod_Hermy_QuestHermyDoch (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_QuestHermyDoch_Condition;
	information	= Info_Mod_Hermy_QuestHermyDoch_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'll go to the Orcs.";
};

FUNC INT Info_Mod_Hermy_QuestHermyDoch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hermy_QuestHermy))
	&& (Mod_Hermy_KnowsQuest == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hermy_QuestHermyDoch_Info()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermyDoch_15_00"); //I'll go to the Orcs.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermyDoch_01_01"); //That's swell. Then go to the mountain fortress and talk to the orcs.

	B_LogEntry	(TOPIC_MOD_FAICE_HARPIE, "I have the task to go to the rock fortress and ask the orcs about a possible tunnel, because there the transformation spell to the harpie is supposed to be there.");

	Mod_Hermy_KnowsQuest = 1;

	Wld_SendTrigger	("EVT_OW_MOUNTAINRUIN_01");
};

INSTANCE Info_Mod_Hermy_Harpie (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_Harpie_Condition;
	information	= Info_Mod_Hermy_Harpie_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hermy_Harpie_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Grubuz_Emerin))
	&& (Mod_Hermy_KnowsQuest == 9)
	&& (Npc_HasItems(hero, ItSc_TrfHarpie) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hermy_Harpie_Info()
{
	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_01_00"); //And? How's it looking? Have you got the spell?
	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_15_01"); //Of course, of course.
	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_01_02"); //Can I see him? I'll take him to Faice's house.

	Info_ClearChoices	(Info_Mod_Hermy_Harpie);

	Info_AddChoice	(Info_Mod_Hermy_Harpie, "Here, take it.", Info_Mod_Hermy_Harpie_B);
	Info_AddChoice	(Info_Mod_Hermy_Harpie, "And take all the glory? No, thanks, I'll go myself.", Info_Mod_Hermy_Harpie_A);
};

FUNC VOID Info_Mod_Hermy_Harpie_B()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_B_15_00"); //Here you have it.

	B_GiveInvItems	(hero, self, ItSc_TrfHarpie, 1);

	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_B_01_01"); //Thanks, you can go.

	Info_ClearChoices	(Info_Mod_Hermy_Harpie);

	Info_AddChoice	(Info_Mod_Hermy_Harpie, "Okay, see you around.", Info_Mod_Hermy_Harpie_D);
	Info_AddChoice	(Info_Mod_Hermy_Harpie, "That was quite a tough adventure....", Info_Mod_Hermy_Harpie_E);
};

FUNC VOID Info_Mod_Hermy_Harpie_E()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_E_15_00"); //That was quite a tough adventure....
	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_E_01_01"); //Here's 500 gold coins. That's all there is.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_E_15_02"); //Thank you very much.
	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_E_01_03"); //Take care of yourself.

	Info_ClearChoices	(Info_Mod_Hermy_Harpie);

	B_SetTopicStatus	(TOPIC_MOD_FAICE_HARPIE, LOG_SUCCESS);

	B_GivePlayerXP	(750);

	Mod_Hermy_KnowsQuest = 10;
};

FUNC VOID Info_Mod_Hermy_Harpie_A()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_A_15_00"); //And take all the glory? No, thanks, I'll go myself.
	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_A_01_01"); //This isn't about glory. Now be reasonable and give me the role of spell.

	Info_ClearChoices	(Info_Mod_Hermy_Harpie);

	Info_AddChoice	(Info_Mod_Hermy_Harpie, "Here, take it.", Info_Mod_Hermy_Harpie_B);
	Info_AddChoice	(Info_Mod_Hermy_Harpie, "I'm not even thinking about it.", Info_Mod_Hermy_Harpie_C);
};

FUNC VOID Info_Mod_Hermy_Harpie_D()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_D_15_00"); //Okay, see you around.
	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_D_01_01"); //Take care of yourself.

	Info_ClearChoices	(Info_Mod_Hermy_Harpie);

	B_SetTopicStatus	(TOPIC_MOD_FAICE_HARPIE, LOG_SUCCESS);

	B_GivePlayerXP	(750);

	Mod_Hermy_KnowsQuest = 10;
};

FUNC VOID Info_Mod_Hermy_Harpie_C()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_C_15_00"); //I'm not even thinking about it.
	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_C_01_01"); //Be reasonable. You want some gold?
	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_C_15_02"); //Better than nothing.
	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_C_01_03"); //Here's 500 gold coins. That's all there is.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_C_01_04"); //Do I get the spell now?
	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_C_15_05"); //Here you have it.

	B_GiveInvItems	(hero, self, ItSc_TrfHarpie, 1);

	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_C_01_06"); //Thanks. You can go now.

	Info_ClearChoices	(Info_Mod_Hermy_Harpie);

	B_SetTopicStatus	(TOPIC_MOD_FAICE_HARPIE, LOG_SUCCESS);

	B_GivePlayerXP	(750);

	Mod_Hermy_KnowsQuest = 10;
};

INSTANCE Info_Mod_Hermy_Faice01 (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_Faice01_Condition;
	information	= Info_Mod_Hermy_Faice01_Info;
	permanent	= 0;
	important	= 0;
	description	= "Have you seen anything suspicious lately?";
};

FUNC INT Info_Mod_Hermy_Faice01_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Furt_Faice02))
	&& (Mod_VMG_FaiceGifty_Gift == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hermy_Faice01_Info()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Faice01_15_00"); //Have you seen anything suspicious lately?
	AI_Output(self, hero, "Info_Mod_Hermy_Faice01_01_01"); //Hm, now that you're saying it. Furt's been acting a little weird lately.
};

INSTANCE Info_Mod_Hermy_Faice02 (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_Faice02_Condition;
	information	= Info_Mod_Hermy_Faice02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Do you know about the poisoning of Faice's role?";
};

FUNC INT Info_Mod_Hermy_Faice02_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Furt_Faice02))
	&& (Mod_VMG_FaiceGifty_Gift == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hermy_Faice02_Info()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Faice02_15_00"); //Do you know about the poisoning of Faice's role?
	AI_Output(self, hero, "Info_Mod_Hermy_Faice02_01_01"); //No more than you, I guess.
};

INSTANCE Info_Mod_Hermy_Faice03 (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_Faice03_Condition;
	information	= Info_Mod_Hermy_Faice03_Info;
	permanent	= 0;
	important	= 0;
	description	= "Have you noticed anything about anyone?";
};

FUNC INT Info_Mod_Hermy_Faice03_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Furt_Faice02))
	&& (Mod_VMG_FaiceGifty_Gift == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hermy_Faice03_Info()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Faice03_15_00"); //Have you noticed anything about anyone?
	AI_Output(self, hero, "Info_Mod_Hermy_Faice03_01_01"); //Talk to Furt. He might know more.
};

INSTANCE Info_Mod_Hermy_Trade (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_Trade_Condition;
	information	= Info_Mod_Hermy_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Hermy_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hermy_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hermy_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Hermy_Pickpocket (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_Pickpocket_Condition;
	information	= Info_Mod_Hermy_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Hermy_Pickpocket_Condition()
{
	C_Beklauen	(87, ItSc_TrfHarpie, 1);
};

FUNC VOID Info_Mod_Hermy_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Hermy_Pickpocket);

	Info_AddChoice	(Info_Mod_Hermy_Pickpocket, DIALOG_BACK, Info_Mod_Hermy_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Hermy_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Hermy_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Hermy_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Hermy_Pickpocket);
};

FUNC VOID Info_Mod_Hermy_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Hermy_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Hermy_Pickpocket);

		Info_AddChoice	(Info_Mod_Hermy_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Hermy_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Hermy_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Hermy_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Hermy_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Hermy_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Hermy_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Hermy_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Hermy_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Hermy_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Hermy_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Hermy_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Hermy_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Hermy_EXIT (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_EXIT_Condition;
	information	= Info_Mod_Hermy_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hermy_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hermy_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
