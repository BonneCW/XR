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

FUNC VOID Info_Mod_Ehnim_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Ehnim_Pickpocket);
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