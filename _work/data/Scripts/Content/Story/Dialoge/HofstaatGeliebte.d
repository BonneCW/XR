INSTANCE Info_Mod_HofstaatGeliebte_Spezialtrunken (C_INFO)
{
	npc		= Mod_7339_HS_Geliebte_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatGeliebte_Spezialtrunken_Condition;
	information	= Info_Mod_HofstaatGeliebte_Spezialtrunken_Info;
	permanent	= 0;
	important	= 0;
	description	= "Einen Schluck Spezialtrunken?";
};

FUNC INT Info_Mod_HofstaatGeliebte_Spezialtrunken_Condition()
{
	if (Npc_HasItems(hero, ItFo_Spezialtrunken) >= 1)
	&& (Mod_SL_PartGeliebte == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatGeliebte_Spezialtrunken_Info()
{
	AI_Output(hero, self, "Info_Mod_HofstaatGeliebte_Spezialtrunken_15_00"); //Einen Schluck Spezialtrunken?

	B_GiveInvItems	(hero, self, ItFo_Spezialtrunken, 1);

	CreateInvItems	(self, ItFo_Booze, 1);

	B_UseItem	(self, ItFo_Booze);

	Mod_SL_PartGeliebte = 5;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_HofstaatGeliebte_Pickpocket (C_INFO)
{
	npc		= Mod_7339_HS_Geliebte_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatGeliebte_Pickpocket_Condition;
	information	= Info_Mod_HofstaatGeliebte_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_HofstaatGeliebte_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_HofstaatGeliebte_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HofstaatGeliebte_Pickpocket);

	Info_AddChoice	(Info_Mod_HofstaatGeliebte_Pickpocket, DIALOG_BACK, Info_Mod_HofstaatGeliebte_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HofstaatGeliebte_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HofstaatGeliebte_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HofstaatGeliebte_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HofstaatGeliebte_Pickpocket);
};

FUNC VOID Info_Mod_HofstaatGeliebte_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_HofstaatGeliebte_Pickpocket);
};

INSTANCE Info_Mod_HofstaatGeliebte_EXIT (C_INFO)
{
	npc		= Mod_7339_HS_Geliebte_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatGeliebte_EXIT_Condition;
	information	= Info_Mod_HofstaatGeliebte_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HofstaatGeliebte_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatGeliebte_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};