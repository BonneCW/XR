INSTANCE Info_Mod_Mahamad_Hi (C_INFO)
{
	npc		= Mod_7150_ASS_Mahamad_NW;
	nr		= 1;
	condition	= Info_Mod_Mahamad_Hi_Condition;
	information	= Info_Mod_Mahamad_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "With Beliar! I'm the one asked here.";
};

FUNC INT Info_Mod_Mahamad_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Malek_Manaextrakt))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mahamad_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Hi_15_00"); //With Beliar! I'm the one asked here.
	AI_Output(self, hero, "Info_Mod_Mahamad_Hi_01_01"); //Quite rightly, it seems to me. Seems more capable than the other crooks.
	AI_Output(hero, self, "Info_Mod_Mahamad_Hi_15_02"); //I already feel like a crook. You need me?
	AI_Output(self, hero, "Info_Mod_Mahamad_Hi_01_03"); //Actually, I don't. But you need me and my voice.
	AI_Output(hero, self, "Info_Mod_Mahamad_Hi_15_04"); //True enough. What do I have to do?
	AI_Output(self, hero, "Info_Mod_Mahamad_Hi_01_05"); //A magician is expected to have a certain mental maturity and intelligence.
	AI_Output(self, hero, "Info_Mod_Mahamad_Hi_01_06"); //My job is to test whether there are at least some approaches available for you to meet these requirements.
	AI_Output(hero, self, "Info_Mod_Mahamad_Hi_15_07"); //I guess I didn't fall on my head.
	AI_Output(self, hero, "Info_Mod_Mahamad_Hi_01_08"); //We'll see about that. You will have to solve some puzzles and answer questions. Can you actually read?
	AI_Output(hero, self, "Info_Mod_Mahamad_Hi_15_09"); //That's what I mean. We're good to go.
	AI_Output(self, hero, "Info_Mod_Mahamad_Hi_01_10"); //Very well. Here's four slips of paper. Find the answers and come to me.

	CreateInvItems	(hero, ItWr_MahamadRaetsel1, 1);
	CreateInvItems	(hero, ItWr_MahamadRaetsel2, 1);
	CreateInvItems	(hero, ItWr_MahamadRaetsel3, 1);
	CreateInvItems	(hero, ItWr_MahamadRaetsel4, 1);

	B_ShowGivenThings	("4 cards received");

	Log_CreateTopic	(TOPIC_MOD_ASS_SCHLAUFUCHS, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_SCHLAUFUCHS, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_SCHLAUFUCHS, "Mahamad wants to test my intelligence. He gave me four pieces of paper with a riddle.");
};

INSTANCE Info_Mod_Mahamad_Schlaufuchs (C_INFO)
{
	npc		= Mod_7150_ASS_Mahamad_NW;
	nr		= 1;
	condition	= Info_Mod_Mahamad_Schlaufuchs_Condition;
	information	= Info_Mod_Mahamad_Schlaufuchs_Info;
	permanent	= 1;
	important	= 0;
	description	= "You can test me.";
};

FUNC INT Info_Mod_Mahamad_Schlaufuchs_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mahamad_Hi))
	&& (Mod_ASS_MahamadRaetsel == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_Info()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_15_00"); //You can test me.
	AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_01_01"); //You've got it all figured out?
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_15_02"); //Yeah.
	AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_01_03"); //Then I would like to know how much the top quality wine costs.

	Mod_ASS_MahamadRaetsel_Niete = 0;

	Info_ClearChoices	(Info_Mod_Mahamad_Schlaufuchs);

	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "I counted 200 gold.", Info_Mod_Mahamad_Schlaufuchs_C);
	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "I counted 175 gold.", Info_Mod_Mahamad_Schlaufuchs_B);
	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "I counted 150 gold.", Info_Mod_Mahamad_Schlaufuchs_A);
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_D()
{
	AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_D_01_00"); //And how many triangles have you counted?

	Info_ClearChoices	(Info_Mod_Mahamad_Schlaufuchs);

	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "I think it's 35 triangles.", Info_Mod_Mahamad_Schlaufuchs_G);
	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "I think it's 25 triangles.", Info_Mod_Mahamad_Schlaufuchs_F);
	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "I think there are 20 triangles.", Info_Mod_Mahamad_Schlaufuchs_E);
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_C()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_C_15_00"); //I counted 200 gold.

	Mod_ASS_MahamadRaetsel_Niete += 1;

	Info_Mod_Mahamad_Schlaufuchs_D();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_B()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_B_15_00"); //I counted 175 gold.

	Mod_ASS_MahamadRaetsel_Niete += 1;

	Info_Mod_Mahamad_Schlaufuchs_D();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_A()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_A_15_00"); //I counted 150 gold.

	Info_Mod_Mahamad_Schlaufuchs_D();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_H()
{
	AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_H_01_00"); //Uh-huh. What about the series of numbers?

	Info_ClearChoices	(Info_Mod_Mahamad_Schlaufuchs);

	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "It was a little difficult. I got 7-4 upstairs and 14-16 downstairs.", Info_Mod_Mahamad_Schlaufuchs_K);
	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "It was a little difficult. I got six thirty-six upstairs and fifteen seventeen downstairs.", Info_Mod_Mahamad_Schlaufuchs_J);
	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "It was a little difficult. I got 5 2 upstairs and 17 19 downstairs.", Info_Mod_Mahamad_Schlaufuchs_I);
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_M()
{
	AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_M_01_00"); //And the last task. How long does medicine last?

	Info_ClearChoices	(Info_Mod_Mahamad_Schlaufuchs);

	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "1 hour.", Info_Mod_Mahamad_Schlaufuchs_P);
	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "Two hours.", Info_Mod_Mahamad_Schlaufuchs_O);
	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "1 1/2 hours.", Info_Mod_Mahamad_Schlaufuchs_N);
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_G()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_G_15_00"); //I think it's 35 triangles.

	Info_Mod_Mahamad_Schlaufuchs_H();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_F()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_F_15_00"); //I think it's 25 triangles.

	Mod_ASS_MahamadRaetsel_Niete += 1;

	Info_Mod_Mahamad_Schlaufuchs_H();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_E()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_E_15_00"); //I think there are 20 triangles.

	Mod_ASS_MahamadRaetsel_Niete += 1;

	Info_Mod_Mahamad_Schlaufuchs_H();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_L()
{
	if (Mod_ASS_MahamadRaetsel_Niete >= 2)
	{
		AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_L_01_00"); //Your answers weren't bad, but I guess it's not enough. Learn, read the books, get ready. Most novices here have the same problem.
	}
	else if (Mod_ASS_MahamadRaetsel_Niete >= 1)
	{
		AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_L_01_01"); //You really surprise me. I didn't think you'd get that result. I have to say, you're on your way up. I want to give you another chance.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_L_01_02"); //Perfect! It's all right. It's really fun with you. You're sure of my vote.
		AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_L_15_03"); //So what happens next?
		AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_L_01_04"); //I think Mirza has something else for you.

		B_GivePlayerXP	(250);

		Mod_ASS_MahamadRaetsel = 1;

		B_SetTopicStatus	(TOPIC_MOD_ASS_SCHLAUFUCHS, LOG_SUCCESS);
	
		B_LogEntry	(TOPIC_MOD_ASS_MAGIER, "");
	};

	Info_ClearChoices	(Info_Mod_Mahamad_Schlaufuchs);
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_K()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_K_15_00"); //It was a little difficult. I got 7-4 upstairs and 14-16 downstairs.

	Mod_ASS_MahamadRaetsel_Niete += 1;

	Info_Mod_Mahamad_Schlaufuchs_M();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_J()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_J_15_00"); //It was a little difficult. I got six thirty-six upstairs and fifteen seventeen downstairs.

	Info_Mod_Mahamad_Schlaufuchs_M();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_I()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_I_15_00"); //It was a little difficult. I got 5 2 upstairs and 17 19 downstairs.

	Mod_ASS_MahamadRaetsel_Niete += 1;

	Info_Mod_Mahamad_Schlaufuchs_M();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_P()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_P_15_00"); //1 hour.

	Info_Mod_Mahamad_Schlaufuchs_L();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_O()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_O_15_00"); //Two hours.

	Mod_ASS_MahamadRaetsel_Niete += 1;

	Info_Mod_Mahamad_Schlaufuchs_L();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_N()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_N_15_00"); //1 1/2 hours.

	Mod_ASS_MahamadRaetsel_Niete += 1;

	Info_Mod_Mahamad_Schlaufuchs_L();
};

INSTANCE Info_Mod_Mahamad_Blutkelch (C_INFO)
{
	npc		= Mod_7150_ASS_Mahamad_NW;
	nr		= 1;
	condition	= Info_Mod_Mahamad_Blutkelch_Condition;
	information	= Info_Mod_Mahamad_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hello! Kais tells me you have part of a message. Can I have one?";
};

FUNC INT Info_Mod_Mahamad_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kais_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mahamad_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Blutkelch_15_00"); //Hello! Kais tells me you have part of a message. Can I have one?
	AI_Output(self, hero, "Info_Mod_Mahamad_Blutkelch_01_01"); //Here, I can't handle this. But be careful! It's an old parchment.

	B_GiveInvItems	(self, hero, ItWr_BlutkelchZettel2, 1);

	AI_Output(hero, self, "Info_Mod_Mahamad_Blutkelch_15_02"); //I'll be careful.

	if (Npc_HasItems(hero, ItWr_BlutkelchZettel1) == 1)
	&& (Npc_HasItems(hero, ItWr_BlutkelchZettel2) == 1)
	&& (Npc_HasItems(hero, ItWr_BlutkelchZettel3) == 1)
	{
		Log_CreateTopic	(TOPIC_MOD_ASS_LASTBLUTKELCH, LOG_MISSION);
		B_SetTopicStatus	(TOPIC_MOD_ASS_LASTBLUTKELCH, LOG_RUNNING);
		B_LogEntry	(TOPIC_MOD_ASS_LASTBLUTKELCH, "Received a piece of ancient parchment from Kais, Mahamad and Norek to decipher the message. Amir took them to the camp. Let's see....");
	};
};

INSTANCE Info_Mod_Mahamad_Pickpocket (C_INFO)
{
	npc		= Mod_7150_ASS_Mahamad_NW;
	nr		= 1;
	condition	= Info_Mod_Mahamad_Pickpocket_Condition;
	information	= Info_Mod_Mahamad_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Mahamad_Pickpocket_Condition()
{
	C_Beklauen	(88, ItMi_Gold, 29);
};

FUNC VOID Info_Mod_Mahamad_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Mahamad_Pickpocket);

	Info_AddChoice	(Info_Mod_Mahamad_Pickpocket, DIALOG_BACK, Info_Mod_Mahamad_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Mahamad_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Mahamad_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Mahamad_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Mahamad_Pickpocket);
};

FUNC VOID Info_Mod_Mahamad_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Mahamad_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Mahamad_Pickpocket);

		Info_AddChoice	(Info_Mod_Mahamad_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Mahamad_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Mahamad_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Mahamad_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Mahamad_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Mahamad_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Mahamad_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Mahamad_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Mahamad_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Mahamad_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Mahamad_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Mahamad_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Mahamad_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Mahamad_EXIT (C_INFO)
{
	npc		= Mod_7150_ASS_Mahamad_NW;
	nr		= 1;
	condition	= Info_Mod_Mahamad_EXIT_Condition;
	information	= Info_Mod_Mahamad_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Mahamad_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Mahamad_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
