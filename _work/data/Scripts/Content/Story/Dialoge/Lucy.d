INSTANCE Info_Mod_Lucy_Hi (C_INFO)
{
	npc		= Mod_593_NONE_Lucy_NW;
	nr		= 1;
	condition	= Info_Mod_Lucy_Hi_Condition;
	information	= Info_Mod_Lucy_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Lucy_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lucy_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Lucy_Hi_17_01"); //Ich bin Lucy und arbeite hier.
};

INSTANCE Info_Mod_Lucy_Sumpfkraut (C_INFO)
{
	npc		= Mod_593_NONE_Lucy_NW;
	nr		= 1;
	condition	= Info_Mod_Lucy_Sumpfkraut_Condition;
	information	= Info_Mod_Lucy_Sumpfkraut_Info;
	permanent	= 0;
	important	= 0;
	description	= "Weißt du, wo ich Sumpfkraut bekommen kann?";
};

FUNC INT Info_Mod_Lucy_Sumpfkraut_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lucy_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Moe_Sumpfkraut))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lucy_Sumpfkraut_Info()
{
	AI_Output(hero, self, "Info_Mod_Lucy_Sumpfkraut_15_00"); //Weißt du, wo ich Sumpfkraut bekommen kann?
	AI_Output(self, hero, "Info_Mod_Lucy_Sumpfkraut_17_01"); //Für 50 Gold sag ich dir, wo du welches bekommst.

	Info_ClearChoices	(Info_Mod_Lucy_Sumpfkraut);

	Info_AddChoice	(Info_Mod_Lucy_Sumpfkraut, "Vergiss es.", Info_Mod_Lucy_Sumpfkraut_B);
	if (Npc_HasItems(hero, ItMi_Gold) >= 50)
	{
		Info_AddChoice	(Info_Mod_Lucy_Sumpfkraut, "Hier hast du das Gold (50 Gold geben)", Info_Mod_Lucy_Sumpfkraut_A);
	};
};

FUNC VOID Info_Mod_Lucy_Sumpfkraut_B()
{
	AI_Output(hero, self, "Info_Mod_Lucy_Sumpfkraut_B_15_00"); //Vergiss es.
	AI_Output(self, hero, "Info_Mod_Lucy_Sumpfkraut_B_17_01"); //Dann belästige mich nicht.

	Info_ClearChoices	(Info_Mod_Lucy_Sumpfkraut);
};

FUNC VOID Info_Mod_Lucy_Sumpfkraut_A()
{
	AI_Output(hero, self, "Info_Mod_Lucy_Sumpfkraut_A_15_00"); //Hier hast du das Gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Lucy_Sumpfkraut_A_17_01"); //Borka verkauft Sumpfkraut.

	Mod_Borka_Sumpfkraut = 1;

	Info_ClearChoices	(Info_Mod_Lucy_Sumpfkraut);
};

INSTANCE Info_Mod_Lucy_Pickpocket (C_INFO)
{
	npc		= Mod_593_NONE_Lucy_NW;
	nr		= 1;
	condition	= Info_Mod_Lucy_Pickpocket_Condition;
	information	= Info_Mod_Lucy_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Lucy_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Lucy_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Lucy_Pickpocket);

	Info_AddChoice	(Info_Mod_Lucy_Pickpocket, DIALOG_BACK, Info_Mod_Lucy_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Lucy_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Lucy_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Lucy_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Lucy_Pickpocket);
};

FUNC VOID Info_Mod_Lucy_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Lucy_Pickpocket);
};

INSTANCE Info_Mod_Lucy_EXIT (C_INFO)
{
	npc		= Mod_593_NONE_Lucy_NW;
	nr		= 1;
	condition	= Info_Mod_Lucy_EXIT_Condition;
	information	= Info_Mod_Lucy_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Lucy_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lucy_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};