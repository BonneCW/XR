INSTANCE Info_Mod_Erika_Hi (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Hi_Condition;
	information	= Info_Mod_Erika_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Who are you?";
};

FUNC INT Info_Mod_Erika_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Erika_Hi_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Erika_Hi_43_01"); //I'm a trader. I sell everything you need in everyday life.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_KHORATA, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_KHORATA, "Erika trades in commodities on the marketplace.");
};

INSTANCE Info_Mod_Erika_Landvermessung (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Landvermessung_Condition;
	information	= Info_Mod_Erika_Landvermessung_Info;
	permanent	= 0;
	important	= 0;
	description	= "You know what Hubert means by his booze?";
};

FUNC INT Info_Mod_Erika_Landvermessung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erika_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Hubert_Landvermessung))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Hubert_LandvermessungAlk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erika_Landvermessung_Info()
{
	AI_Output(hero, self, "Info_Mod_Erika_Landvermessung_15_00"); //You know what Hubert means by his booze?
	AI_Output(self, hero, "Info_Mod_Erika_Landvermessung_43_01"); //(resolute) Of course you do! Only yesterday I forbade him to buy alcohol from me. The man drinks himself dead!

	Info_ClearChoices	(Info_Mod_Erika_Landvermessung);

	Info_AddChoice	(Info_Mod_Erika_Landvermessung, "All right, I'll look somewhere else...", Info_Mod_Erika_Landvermessung_B);
	Info_AddChoice	(Info_Mod_Erika_Landvermessung, "Can I have his booze?", Info_Mod_Erika_Landvermessung_A);
};

FUNC VOID Info_Mod_Erika_Landvermessung_B()
{
	AI_Output(hero, self, "Info_Mod_Erika_Landvermessung_B_15_00"); //All right, I'll look somewhere else...

	Info_ClearChoices	(Info_Mod_Erika_Landvermessung);
};

FUNC VOID Info_Mod_Erika_Landvermessung_A()
{
	AI_Output(hero, self, "Info_Mod_Erika_Landvermessung_A_15_00"); //Can I have his booze?
	AI_Output(self, hero, "Info_Mod_Erika_Landvermessung_A_43_01"); //(ironic) Of course! No, that's not possible. I have hidden almost all alcoholic products in a chest at home, so that Hubert has no way of getting them.

	Info_ClearChoices	(Info_Mod_Erika_Landvermessung);

	Info_AddChoice	(Info_Mod_Erika_Landvermessung, "Too bad, there's nothing to be done.", Info_Mod_Erika_Landvermessung_D);
	Info_AddChoice	(Info_Mod_Erika_Landvermessung, "And which house is yours?", Info_Mod_Erika_Landvermessung_C);
};

FUNC VOID Info_Mod_Erika_Landvermessung_D()
{
	AI_Output(hero, self, "Info_Mod_Erika_Landvermessung_D_15_00"); //Too bad, there's nothing to be done.

	Info_ClearChoices	(Info_Mod_Erika_Landvermessung);
};

FUNC VOID Info_Mod_Erika_Landvermessung_C()
{
	AI_Output(hero, self, "Info_Mod_Erika_Landvermessung_C_15_00"); //And which house is yours?
	AI_Output(self, hero, "Info_Mod_Erika_Landvermessung_C_43_01"); //It is situated on the big lake in this town, not far from the market place. But tell me something.... why do you want to know that so much?
	AI_Output(hero, self, "Info_Mod_Erika_Landvermessung_C_15_02"); //No one understands the lonely heroes....

	B_LogEntry	(TOPIC_MOD_KHORATA_LANDVERMESSUNG, "The merchant Erika has stored her alcohol in a chest in her house by the city's lake.");

	Info_ClearChoices	(Info_Mod_Erika_Landvermessung);
};

INSTANCE Info_Mod_Erika_Nagelnachschub (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Nagelnachschub_Condition;
	information	= Info_Mod_Erika_Nagelnachschub_Info;
	permanent	= 0;
	important	= 0;
	description 	= "I'm looking for nails.";
};                       

FUNC INT Info_Mod_Erika_Nagelnachschub_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lukas_Wettstreit))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Erika_Nagelnachschub_Info()
{
	AI_Output(hero, self, "Info_Mod_Erika_Nagelnachschub_15_00"); //I'm looking for nails.
	AI_Output(self, hero, "Info_Mod_Erika_Nagelnachschub_43_01"); //You're not gonna nail me tonight, are you?
	AI_Output(hero, self, "Info_Mod_Erika_Nagelnachschub_15_02"); //Um...
	AI_Output(self, hero, "Info_Mod_Erika_Nagelnachschub_43_03"); //Yes, yes, always disturb other people's sleep!
	AI_Output(self, hero, "Info_Mod_Erika_Nagelnachschub_43_04"); //What are the laws that forbid this?
	AI_Output(hero, self, "Info_Mod_Erika_Nagelnachschub_15_05"); //I don't need the nails myself.
	AI_Output(self, hero, "Info_Mod_Erika_Nagelnachschub_43_06"); //After all.
	AI_Output(hero, self, "Info_Mod_Erika_Nagelnachschub_15_07"); //Do you have any?
	AI_Output(self, hero, "Info_Mod_Erika_Nagelnachschub_43_08"); //Yeah. For one small favor, I'd leave you a package.
	AI_Output(hero, self, "Info_Mod_Erika_Nagelnachschub_15_09"); //What kind of favor is that?
	AI_Output(self, hero, "Info_Mod_Erika_Nagelnachschub_43_10"); //Bring this letter from me to Wendel. (giggles girlishly)

	B_GiveInvItems	(self, hero, ItWr_ErikaLiebesbrief, 1);

	B_LogEntry	(TOPIC_MOD_KHORATA_NAGELNACHSCHUB, "Erika gave me a letter for Wendel.");
};

INSTANCE Info_Mod_Erika_Nagelnachschub2 (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Nagelnachschub2_Condition;
	information	= Info_Mod_Erika_Nagelnachschub2_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Your letter has arrived.";
};                       

FUNC INT Info_Mod_Erika_Nagelnachschub2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wendel_Nagelnachschub))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Erika_Nagelnachschub2_Info()
{
	AI_Output(hero, self, "Info_Mod_Erika_Nagelnachschub2_15_00"); //Your letter has arrived.
	AI_Output(self, hero, "Info_Mod_Erika_Nagelnachschub2_43_01"); //I'm curious to know what he'll say.
	AI_Output(self, hero, "Info_Mod_Erika_Nagelnachschub2_43_02"); //You've got your nails, but don't you dare hammer around at night!

	B_GiveInvItems	(self, hero, ItMi_Nagelpaket, 1);

	B_GivePlayerXP	(50);

	B_LogEntry	(TOPIC_MOD_KHORATA_NAGELNACHSCHUB, "Erika gave me the nails.");
};

INSTANCE Info_Mod_Erika_Kissen (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Kissen_Condition;
	information	= Info_Mod_Erika_Kissen_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Do you have something like a pillow for the head?";
};                       

FUNC INT Info_Mod_Erika_Kissen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erika_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Malik_Aufgabe))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kissen))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Erika_Kissen_Info()
{
	AI_Output(hero, self, "Info_Mod_Erika_Kissen_15_00"); //Do you have something like a pillow for the head?
	AI_Output(self, hero, "Info_Mod_Erika_Kissen_43_01"); //You're a fighter?
	AI_Output(hero, self, "Info_Mod_Erika_Kissen_15_02"); //No, for sleeping. Put your head on it. Lying softly....
	AI_Output(self, hero, "Info_Mod_Erika_Kissen_43_03"); //I could think of a fur roller.
	AI_Output(hero, self, "Info_Mod_Erika_Kissen_15_04"); //I can't do that. It's not soft enough and stinks.
	AI_Output(self, hero, "Info_Mod_Erika_Kissen_43_05"); //Then I can't help you either.
	AI_Output(self, hero, "Info_Mod_Erika_Kissen_43_06"); //Maybe Daniel in the next room. He deals in magical things. Or Morpheus over there. An eerie man...
	AI_Output(hero, self, "Info_Mod_Erika_Kissen_15_07"); //Thanks anyway.
};

INSTANCE Info_Mod_Erika_Kimon (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Kimon_Condition;
	information	= Info_Mod_Erika_Kimon_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Good woman, can you give me joy?";
};                       

FUNC INT Info_Mod_Erika_Kimon_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erika_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Penner_Kimon))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kimon))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Erika_Kimon_Info()
{
	AI_Output(hero, self, "Info_Mod_Erika_Kimon_15_00"); //Good woman, can you give me joy?
	AI_Output(self, hero, "Info_Mod_Erika_Kimon_43_01"); //Get out of here, you bastard! I'm an honest woman.
	AI_Output(hero, self, "Info_Mod_Erika_Kimon_15_02"); //I must have said it wrong. I'm looking for gourmets.
	AI_Output(self, hero, "Info_Mod_Erika_Kimon_43_03"); //Not with me, you punk.
};

INSTANCE Info_Mod_Erika_WendelS (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_WendelS_Condition;
	information	= Info_Mod_Erika_WendelS_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_Mod_Erika_WendelS_Condition()
{
	if (Mod_REL_Stadthalter == 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Erika_WendelS_Info()
{
	AI_Output(self, hero, "Info_Mod_Erika_WendelS_43_00"); //Since Wendel became a town governor, he has overruled numerous useless rules and regulations, so that we traders now earn even more.
	AI_Output(self, hero, "Info_Mod_Erika_WendelS_43_01"); //I hear you were the one who promoted Wendel to his post?
	AI_Output(hero, self, "Info_Mod_Erika_WendelS_15_02"); //That's one way to put it.
	AI_Output(self, hero, "Info_Mod_Erika_WendelS_43_03"); //Then I must thank you for your decision. I have a particularly crunchy and sweet apple here, I would like to give it to you.

	B_GiveInvItems	(self, hero, ItFo_AppleErika, 1);
};

INSTANCE Info_Mod_Erika_Freudenspender (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Freudenspender_Condition;
	information	= Info_Mod_Erika_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Can you use glee dispensers?";
};                       

FUNC INT Info_Mod_Erika_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Erika_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Erika_Freudenspender_15_00"); //Can you use glee dispensers?
	AI_Output(self, hero, "Info_Mod_Erika_Freudenspender_43_01"); //Don't tempt me! No, I'm not allowed!
};

INSTANCE Info_Mod_Erika_Trade (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Trade_Condition;
	information	= Info_Mod_Erika_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Erika_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erika_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erika_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Erika_Pickpocket (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Pickpocket_Condition;
	information	= Info_Mod_Erika_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Erika_Pickpocket_Condition()
{
	C_Beklauen	(53, ItMi_Gold, 16);
};

FUNC VOID Info_Mod_Erika_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Erika_Pickpocket);

	Info_AddChoice	(Info_Mod_Erika_Pickpocket, DIALOG_BACK, Info_Mod_Erika_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Erika_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Erika_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Erika_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Erika_Pickpocket);
};

FUNC VOID Info_Mod_Erika_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Erika_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Erika_Pickpocket);

		Info_AddChoice	(Info_Mod_Erika_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Erika_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Erika_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Erika_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Erika_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Erika_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Erika_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Erika_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Erika_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Erika_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Erika_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Erika_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Erika_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Erika_EXIT (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_EXIT_Condition;
	information	= Info_Mod_Erika_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Erika_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Erika_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
