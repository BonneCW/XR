INSTANCE Info_Mod_Sabine_Hi (C_INFO)
{
	npc		= Mod_7010_HS_Sabine_REL;
	nr		= 1;
	condition	= Info_Mod_Sabine_Hi_Condition;
	information	= Info_Mod_Sabine_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Who are you?";
};

FUNC INT Info_Mod_Sabine_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_NoDeal))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sabine_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_01"); //My name is Sabine, my mark of the royal spice henchwoman!
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_02"); //Spice merchant?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_03"); //Royal spice dealer!
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_04"); //And what kind of spices are you trading?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_05"); //None.
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_06"); //Then why is your name a spice dealer?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_07"); //Royal spice dealer!
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_08"); //... na gut. Warum heißt du dann "royal spice dealer"?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_09"); //I act. And I like spices.
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_10"); //Then what are you dealing with?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_11"); //Pleasure giver.
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_12"); //Pleasure giver?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_13"); //Yes! Royal giver of joy!
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_14"); //Where'd you get it?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_15"); //It's grown in the yard! Under the leadership of our great king!
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_16"); //Wo liegt dieser "court"?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_17"); //I have a map to help me find my way home!
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_18"); //Let me guess. She's royal too?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_19"); //Schonmal was von 'ner "royal menu" gehört? Ne, das ist nur 'ne stinknormale Karte.
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_20"); //We can go home together, but I've got to sell five more bottles of delights.
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_21"); //Take it and bring it to the people, then we can go.

	B_GiveInvItems	(self, hero, ItMi_Freudenspender, 5);

	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_22"); //All right...

	B_LogEntry	(TOPIC_MOD_SEKTE_Freudenspender, "Sabine, the royal spice merchant, sold in Khorata. She gets it from the court. A map shows where it is located. Sabine, however, wants to accompany me there when I have sold the five bottles with joyful donors.");
};

INSTANCE Info_Mod_Sabine_Heiraten_01 (C_INFO)
{
	npc		= Mod_7010_HS_Sabine_REL;
	nr		= 1;
	condition	= Info_Mod_Sabine_Heiraten_01_Condition;
	information	= Info_Mod_Sabine_Heiraten_01_Info;
	permanent	= 0;
	important	= 0;
	description	= "Will you marry me?";
};

FUNC INT Info_Mod_Sabine_Heiraten_01_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatTuersteher_Hi))
	&& (Mod_HS_DarfZuKing == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sabine_Heiraten_01_Info()
{
	B_Say (hero, self, "$WANNAMARRY");

	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_01_17_01"); //No.
};

INSTANCE Info_Mod_Sabine_Heiraten_02 (C_INFO)
{
	npc		= Mod_7010_HS_Sabine_REL;
	nr		= 1;
	condition	= Info_Mod_Sabine_Heiraten_02_Condition;
	information	= Info_Mod_Sabine_Heiraten_02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Would you like to join me for a treat?";
};

FUNC INT Info_Mod_Sabine_Heiraten_02_Condition()
{
	if (Npc_HasItems(self, ItFo_Trunken) > 0)
	&& (Npc_HasItems(self, ItMi_Freudenspender_Sabine) == 0)
	&& (Mod_Sekte_Verheiratet == 0)
	&& (Mod_HSBook == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Heiraten_01))
	&& (Mod_HS_DarfZuKing == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sabine_Heiraten_02_Info()
{
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_02_15_00"); //Would you like to join me for a treat?
	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_02_17_01"); //All right, all right.

	B_UseItem	(self, ItFo_Trunken);

	Info_ClearChoices	(Info_Mod_Sabine_Heiraten_02);

	Info_AddChoice	(Info_Mod_Sabine_Heiraten_02, "I'm a man, you're a woman, what are we waiting for?", Info_Mod_Sabine_Heiraten_02_D);
	Info_AddChoice	(Info_Mod_Sabine_Heiraten_02, "Your clothes would look better on my floor.", Info_Mod_Sabine_Heiraten_02_C);
	Info_AddChoice	(Info_Mod_Sabine_Heiraten_02, "Do you come here often?", Info_Mod_Sabine_Heiraten_02_B);
	Info_AddChoice	(Info_Mod_Sabine_Heiraten_02, "You look damn good.", Info_Mod_Sabine_Heiraten_02_A);
};

FUNC VOID Info_Mod_Sabine_Heiraten_02_E()
{
	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_02_E_17_00"); //Rascals, I won't put up with that!

	B_LogEntry	(TOPIC_MOD_SEKTE_Freudenspender, "Sabine still won't marry me. I think I should stop by the ladies' man again.");

	Info_ClearChoices	(Info_Mod_Sabine_Heiraten_02);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Sabine_Heiraten_02_D()
{
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_02_D_15_00"); //I'm a man, you're a woman, what are we waiting for?

	Info_Mod_Sabine_Heiraten_02_E();
};

FUNC VOID Info_Mod_Sabine_Heiraten_02_C()
{
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_02_C_15_00"); //Your clothes would look better on my floor.

	Info_Mod_Sabine_Heiraten_02_E();
};

FUNC VOID Info_Mod_Sabine_Heiraten_02_B()
{
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_02_B_15_00"); //Do you come here often?

	Info_Mod_Sabine_Heiraten_02_E();
};

FUNC VOID Info_Mod_Sabine_Heiraten_02_A()
{
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_02_A_15_00"); //You look damn good.

	Info_Mod_Sabine_Heiraten_02_E();
};

INSTANCE Info_Mod_Sabine_Heiraten_03 (C_INFO)
{
	npc		= Mod_7010_HS_Sabine_REL;
	nr		= 1;
	condition	= Info_Mod_Sabine_Heiraten_03_Condition;
	information	= Info_Mod_Sabine_Heiraten_03_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'm sorry about last time.";
};

FUNC INT Info_Mod_Sabine_Heiraten_03_Condition()
{
	if (Npc_HasItems(self, ItFo_Trunken) > 0)
	&& (Npc_HasItems(self, ItMi_Freudenspender_Sabine) == 0)
	&& (Mod_Sekte_Verheiratet == 0)
	&& (Mod_HSBook2 == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Heiraten_02))
	&& (Mod_HS_DarfZuKing == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sabine_Heiraten_03_Info()
{
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_03_15_00"); //I'm sorry about last time. Do you want to take something to make reconciliation with me?
	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_03_17_01"); //All right, all right.

	B_UseItem	(self, ItFo_Trunken);

	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_03_15_02"); //Do you have a carrier pigeon? I promised to write to my mother as soon as I found my dream girl.
	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_03_17_03"); //(giggles)
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_03_15_04"); //You look like my fourth girlfriend.
	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_03_17_05"); //Oh, how many girlfriends have you had?
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_03_15_06"); //Three.
	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_03_17_03"); //(giggles)
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_03_15_07"); //If I asked you to marry me, would it be the same answer to that question?
	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_03_17_08"); //You're gonna have to try this.

	B_Say (hero, self, "$WANNAMARRY");

	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_03_17_09"); //Yes, I do!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_7270_OUT_Weiberheld_REL, "SABINE");
};

INSTANCE Info_Mod_Sabine_FreudenspenderVerkauft (C_INFO)
{
	npc		= Mod_7010_HS_Sabine_REL;
	nr		= 1;
	condition	= Info_Mod_Sabine_FreudenspenderVerkauft_Condition;
	information	= Info_Mod_Sabine_FreudenspenderVerkauft_Info;
	permanent	= 0;
	important	= 0;
	description	= "Where were you suddenly?";
};

FUNC INT Info_Mod_Sabine_FreudenspenderVerkauft_Condition()
{
	if (Mod_Freudenspender == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sabine_FreudenspenderVerkauft_Info()
{
	AI_Output(hero, self, "Info_Mod_Sabine_FreudenspenderVerkauft_15_00"); //Where were you suddenly?
	AI_Output(self, hero, "Info_Mod_Sabine_FreudenspenderVerkauft_17_01"); //I had to leave.
	AI_Output(hero, self, "Info_Mod_Sabine_FreudenspenderVerkauft_15_02"); //Gone?
	AI_Output(self, hero, "Info_Mod_Sabine_FreudenspenderVerkauft_17_03"); //Yeah, gone. Important things and stuff.
	AI_Output(hero, self, "Info_Mod_Sabine_FreudenspenderVerkauft_15_04"); //Aha... I sold your delights anyway.
	AI_Output(self, hero, "Info_Mod_Sabine_FreudenspenderVerkauft_17_05"); //Fine. Here's two bottles of joy as a reward.

	B_GiveInvItems	(self, hero, ItMi_Freudenspender, 2);

	AI_Output(hero, self, "Info_Mod_Sabine_FreudenspenderVerkauft_15_06"); //Uh... thank you.

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Sabine_Trade (C_INFO)
{
	npc		= Mod_7010_HS_Sabine_REL;
	nr		= 1;
	condition	= Info_Mod_Sabine_Trade_Condition;
	information	= Info_Mod_Sabine_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Sabine_Trade_Condition()
{
	if ((Npc_HasItems(self, ItMi_Freudenspender_Sabine) == 1)
	|| (Npc_HasItems(self, ItFo_Trunken) == 0))
	&& (Mod_Sekte_Verheiratet == 0)
	&& (Mod_HSBook == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Heiraten_01))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sabine_Trade_Info()
{
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Sabine_Pickpocket (C_INFO)
{
	npc		= Mod_7010_HS_Sabine_REL;
	nr		= 1;
	condition	= Info_Mod_Sabine_Pickpocket_Condition;
	information	= Info_Mod_Sabine_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120_Female;
};

FUNC INT Info_Mod_Sabine_Pickpocket_Condition()
{
	C_Beklauen	(105, ItMi_Freudenspender, 4);
};

FUNC VOID Info_Mod_Sabine_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Sabine_Pickpocket);

	Info_AddChoice	(Info_Mod_Sabine_Pickpocket, DIALOG_BACK, Info_Mod_Sabine_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Sabine_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Sabine_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Sabine_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Sabine_Pickpocket);
};

FUNC VOID Info_Mod_Sabine_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Sabine_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Sabine_Pickpocket);

		Info_AddChoice	(Info_Mod_Sabine_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Sabine_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Sabine_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Sabine_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Sabine_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Sabine_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Sabine_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Sabine_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Sabine_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Sabine_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Sabine_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Sabine_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Sabine_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Sabine_EXIT (C_INFO)
{
	npc		= Mod_7010_HS_Sabine_REL;
	nr		= 1;
	condition	= Info_Mod_Sabine_EXIT_Condition;
	information	= Info_Mod_Sabine_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Sabine_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sabine_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
