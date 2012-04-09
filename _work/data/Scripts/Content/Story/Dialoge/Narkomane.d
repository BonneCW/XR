INSTANCE Info_Mod_Narkomane_Teutonica (C_INFO)
{
	npc		= Mod_7424_OUT_Narkomane_REL;
	nr		= 1;
	condition	= Info_Mod_Narkomane_Teutonica_Condition;
	information	= Info_Mod_Narkomane_Teutonica_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Narkomane_Teutonica_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Narkomane_Teutonica_Info()
{
	AI_Output(self, hero, "Info_Mod_Narkomane_Teutonica_14_00"); //(zugedröhnt) ... die Klippen ... das große, böse Monster ... haha, alte Ruinen ... große Grashüpfer ... aufrecht mit lauter Schuppen ... Schuppen, wie Fische ...

	if (Mod_NL_Teutonica >= 1)
	{
		AI_Output(self, hero, "Info_Mod_Narkomane_Teutonica_14_01"); // ... 100 Meter südöstlich wo gelandet ... alle aufgemampft ...
	};
};

INSTANCE Info_Mod_Narkomane_Pickpocket (C_INFO)
{
	npc		= Mod_7424_OUT_Narkomane_REL;
	nr		= 1;
	condition	= Info_Mod_Narkomane_Pickpocket_Condition;
	information	= Info_Mod_Narkomane_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_Narkomane_Pickpocket_Condition()
{
	C_Beklauen	(11, ItMi_Gold, 5);
};

FUNC VOID Info_Mod_Narkomane_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Narkomane_Pickpocket);

	Info_AddChoice	(Info_Mod_Narkomane_Pickpocket, DIALOG_BACK, Info_Mod_Narkomane_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Narkomane_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Narkomane_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Narkomane_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Narkomane_Pickpocket);
};

FUNC VOID Info_Mod_Narkomane_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Narkomane_Pickpocket);
};

INSTANCE Info_Mod_Narkomane_EXIT (C_INFO)
{
	npc		= Mod_7424_OUT_Narkomane_REL;
	nr		= 1;
	condition	= Info_Mod_Narkomane_EXIT_Condition;
	information	= Info_Mod_Narkomane_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Narkomane_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Narkomane_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};