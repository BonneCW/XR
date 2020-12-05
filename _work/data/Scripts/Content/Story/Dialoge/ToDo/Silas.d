INSTANCE Info_Mod_Silas_Hi (C_INFO)
{
	npc		= Mod_1291_SLD_Silas_MT;
	nr		= 1;
	condition	= Info_Mod_Silas_Hi_Condition;
	information	= Info_Mod_Silas_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'm sure you'll get a lot from the bar.";
};

FUNC INT Info_Mod_Silas_Hi_Condition()
{
	if (Npc_HasItems(hero, ItMi_Gold) >= 100)
	|| (Npc_HasItems(hero, ItMi_Joint) >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Silas_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Silas_Hi_15_00"); //I'm sure you'll get a lot from the bar.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_06_01"); //If you want me to tell you something about the camp, you'll have to let 100 gold coins jump or....

	AI_PlayAni	(self, "T_SEARCH");

	AI_Output(self, hero, "Info_Mod_Silas_Hi_06_02"); //(in a quieter tone) do you have three stems of bogweed?

	Info_ClearChoices	(Info_Mod_Silas_Hi);

	Info_AddChoice	(Info_Mod_Silas_Hi, "Unfortunately not....", Info_Mod_Silas_Hi_D);

	if (Npc_HasItems(hero, ItMi_Joint) >= 3)
	{
		Info_AddChoice	(Info_Mod_Silas_Hi, "Here are three stems.", Info_Mod_Silas_Hi_B);
	};
	if (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		Info_AddChoice	(Info_Mod_Silas_Hi, "Here's 100 gold coins.", Info_Mod_Silas_Hi_A);
	};
};

FUNC VOID Info_Mod_Silas_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Silas_Hi_C_15_00"); //So, what about the camp?
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_01"); //Well, since the fall of the barrier a lot of things have changed in the camp, which shouldn't come as a surprise, because that was the original goal on which the camp's cohesion was based.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_02"); //And when the water magicians, who had embodied a lot of authority in the camp, also left, the camp threatened to fall apart.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_03"); //Lee, probably still obsessed with the desire to take revenge on the king, wanted to prevent this by all means.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_04"); //He doesn't want to give up control of so many battle-hardened men so easily, as he might consider it a tool of his revenge on the weakened king.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_05"); //He convinced the mercenaries that they would never be able to experience freedom until the king was not dead - well, the many ores that the free mine continues to shed must have persuaded some of them to stay.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_06"); //Now that there is no longer a barrier to be blown up, it serves as a pay and the purchase of new equipment to build up a powerful force.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_07"); //To this end, he also introduced strict rules - such as the restriction of swamp herb consumption - new hierarchies and a hard drill for the fighters.
	AI_Output(hero, self, "Info_Mod_Silas_Hi_C_15_08"); //What about that Sylvio guy?
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_09"); //Lee had given him the post of second. Sylvio is a tough fighter and knows how to get the mercenaries to even more discipline with an atmosphere of fear.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_10"); //However, Sylvio herself is a corrupt filthy pig and has by far the greatest amount of filth.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_11"); //He suppresses ore and food, which were intended for the farmers for example, and lets his boys do business with the old camp.
	AI_Output(hero, self, "Info_Mod_Silas_Hi_C_15_12"); //And why does Lee let something like that happen?
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_13"); //Lee has his revenge in his head. He seems to close his eyes to other things as long as they only function somehow.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_14"); //Besides, Sylvio is also hard to prove something, because he sends his boys in all the wrongdoings and doesn't get his hands dirty.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_15"); //Well, those were probably the most important things you should know about the camp.

	Info_ClearChoices	(Info_Mod_Silas_Hi);
};

FUNC VOID Info_Mod_Silas_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Silas_Hi_D_15_00"); //Unfortunately not....
	AI_Output(self, hero, "Info_Mod_Silas_Hi_D_06_01"); //Then I don't have any information for you.

	Info_ClearChoices	(Info_Mod_Silas_Hi);
};

FUNC VOID Info_Mod_Silas_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Silas_Hi_B_15_00"); //Here are three stems.

	B_GiveInvItems	(hero, self, ItMi_Joint, 3);

	AI_Output(self, hero, "Info_Mod_Silas_Hi_B_06_01"); //Ahh, fabulous.

	Info_Mod_Silas_Hi_C();
};

FUNC VOID Info_Mod_Silas_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Silas_Hi_A_15_00"); //Here's 100 gold coins.

	B_GiveInvItems	(hero, self, ItMi_Gold, 100);

	AI_Output(self, hero, "Info_Mod_Silas_Hi_A_06_01"); //Okay, good.

	Info_Mod_Silas_Hi_C();
};

INSTANCE Info_Mod_Silas_Trade (C_INFO)
{
	npc		= Mod_1291_SLD_Silas_MT;
	nr		= 1;
	condition	= Info_Mod_Silas_Trade_Condition;
	information	= Info_Mod_Silas_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Silas_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Silas_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Silas_Trade_Info()
{
	if (Mod_SilasTrader == 0)
	{
		Mod_SilasTrader = 1;

		Log_CreateTopic	(TOPIC_MOD_HAENDLER_SOELDNER, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_HAENDLER_SOELDNER, "I can buy all kinds of groceries from Silas.");
	};

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Silas_Pickpocket (C_INFO)
{
	npc		= Mod_1291_SLD_Silas_MT;
	nr		= 1;
	condition	= Info_Mod_Silas_Pickpocket_Condition;
	information	= Info_Mod_Silas_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Silas_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 17);
};

FUNC VOID Info_Mod_Silas_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Silas_Pickpocket);

	Info_AddChoice	(Info_Mod_Silas_Pickpocket, DIALOG_BACK, Info_Mod_Silas_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Silas_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Silas_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Silas_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Silas_Pickpocket);
};

FUNC VOID Info_Mod_Silas_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Silas_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Silas_Pickpocket);

		Info_AddChoice	(Info_Mod_Silas_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Silas_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Silas_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Silas_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Silas_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Silas_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Silas_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Silas_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Silas_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Silas_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Silas_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Silas_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Silas_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Silas_EXIT (C_INFO)
{
	npc		= Mod_1291_SLD_Silas_MT;
	nr		= 1;
	condition	= Info_Mod_Silas_EXIT_Condition;
	information	= Info_Mod_Silas_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Silas_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Silas_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
