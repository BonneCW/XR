INSTANCE Info_Mod_Ehnim_Hi (C_INFO)
{
	npc		= Mod_903_BAU_Ehnim_NW;
	nr		= 1;
	condition	= Info_Mod_Ehnim_Hi_Condition;
	information	= Info_Mod_Ehnim_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier, nimm den Heiltrank.";
};

FUNC INT Info_Mod_Ehnim_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Telbor_Hi))
	&& ((Npc_HasItems(hero, ItPo_Health_01) > 0)
	|| (Npc_HasItems(hero, ItPo_Health_02) > 0)
	|| (Npc_HasItems(hero, ItPo_Health_03) > 0)
	|| (Npc_HasItems(hero, ItPo_Health_05) > 0)
	|| (Npc_HasItems(hero, ItPo_Health_06) > 0)
	|| (Npc_HasItems(hero, ItPo_Health_07) > 0))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ehnim_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Ehnim_Hi_15_00"); //Hier, nimm den Heiltrank.

	Info_ClearChoices	(Info_Mod_Ehnim_Hi);

	if (Npc_HasItems(hero, ItPo_Health_03) > 0)
	{
		Info_AddChoice	(Info_Mod_Ehnim_Hi, "Elixier der Heilung", Info_Mod_Ehnim_Hi_F);
	};
	if (Npc_HasItems(hero, ItPo_Health_02) > 0)
	{
		Info_AddChoice	(Info_Mod_Ehnim_Hi, "Extrakt der Heilung", Info_Mod_Ehnim_Hi_E);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) > 0)
	{
		Info_AddChoice	(Info_Mod_Ehnim_Hi, "Essenz der Heilung", Info_Mod_Ehnim_Hi_D);
	};
	if (Npc_HasItems(hero, ItPo_Health_07) > 0)
	{
		Info_AddChoice	(Info_Mod_Ehnim_Hi, "Trank der leichten Heilung", Info_Mod_Ehnim_Hi_C);
	};
	if (Npc_HasItems(hero, ItPo_Health_06) > 0)
	{
		Info_AddChoice	(Info_Mod_Ehnim_Hi, "Leichter Heiltrank", Info_Mod_Ehnim_Hi_B);
	};
	if (Npc_HasItems(hero, ItPo_Health_05) > 0)
	{
		Info_AddChoice	(Info_Mod_Ehnim_Hi, "Trank der schnellen Heilung", Info_Mod_Ehnim_Hi_A);
	};
};

FUNC VOID Info_Mod_Ehnim_Hi_G()
{
	AI_Output(self, hero, "Info_Mod_Ehnim_Hi_G_12_00"); //Ahh, hab Dank. Durch deine Hilfe geht es mir schon viel besser.

	B_LogEntry	(TOPIC_MOD_AKILSHOF, "Ehnim konnte ich mit einem Heiltrank Linderung verschaffen.");

	Info_ClearChoices	(Info_Mod_Ehnim_Hi);
};

FUNC VOID Info_Mod_Ehnim_Hi_F()
{
	B_GiveInvItems	(hero, self, ItPo_Health_03, 1);

	B_UseItem	(self, ItPo_Health_03);

	B_GivePlayerXP	(300);

	Info_Mod_Ehnim_Hi_G();
};

FUNC VOID Info_Mod_Ehnim_Hi_E()
{
	B_GiveInvItems	(hero, self, ItPo_Health_02, 1);

	B_UseItem	(self, ItPo_Health_02);

	B_GivePlayerXP	(200);

	Info_Mod_Ehnim_Hi_G();
};

FUNC VOID Info_Mod_Ehnim_Hi_D()
{
	B_GiveInvItems	(hero, self, ItPo_Health_01, 1);

	B_UseItem	(self, ItPo_Health_01);

	B_GivePlayerXP	(100);

	Info_Mod_Ehnim_Hi_G();
};

FUNC VOID Info_Mod_Ehnim_Hi_C()
{
	B_GiveInvItems	(hero, self, ItPo_Health_07, 1);

	B_UseItem	(self, ItPo_Health_07);

	B_GivePlayerXP	(100);

	Info_Mod_Ehnim_Hi_G();
};

FUNC VOID Info_Mod_Ehnim_Hi_B()
{
	B_GiveInvItems	(hero, self, ItPo_Health_06, 1);

	B_UseItem	(self, ItPo_Health_06);

	B_GivePlayerXP	(100);

	Info_Mod_Ehnim_Hi_G();
};

FUNC VOID Info_Mod_Ehnim_Hi_A()
{
	B_GiveInvItems	(hero, self, ItPo_Health_05, 1);

	B_UseItem	(self, ItPo_Health_05);

	B_GivePlayerXP	(100);

	Info_Mod_Ehnim_Hi_G();
};

INSTANCE Info_Mod_Ehnim_Pickpocket (C_INFO)
{
	npc		= Mod_903_BAU_Ehnim_NW;
	nr		= 1;
	condition	= Info_Mod_Ehnim_Pickpocket_Condition;
	information	= Info_Mod_Ehnim_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_Ehnim_Pickpocket_Condition()
{
	C_Beklauen	(14, ItMi_Gold, 9);
};

FUNC VOID Info_Mod_Ehnim_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Ehnim_Pickpocket);

	Info_AddChoice	(Info_Mod_Ehnim_Pickpocket, DIALOG_BACK, Info_Mod_Ehnim_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Ehnim_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Ehnim_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Ehnim_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Ehnim_Pickpocket);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Ehnim_EXIT (C_INFO)
{
	npc		= Mod_903_BAU_Ehnim_NW;
	nr		= 1;
	condition	= Info_Mod_Ehnim_EXIT_Condition;
	information	= Info_Mod_Ehnim_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ehnim_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ehnim_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};