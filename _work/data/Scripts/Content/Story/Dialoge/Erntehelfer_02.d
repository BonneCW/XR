INSTANCE Info_Mod_Erntehelfer_02_Hi (C_INFO)
{
	npc		= Mod_7639_OUT_Erntehelfer_REL;
	nr		= 1;
	condition	= Info_Mod_Erntehelfer_02_Hi_Condition;
	information	= Info_Mod_Erntehelfer_02_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was meinst du zu Erhard?";
};

FUNC INT Info_Mod_Erntehelfer_02_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Erntehelfer_02_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Erntehelfer_02_Hi_15_00"); //Was meinst du zu Erhard?
	AI_Output(self, hero, "Info_Mod_Erntehelfer_02_Hi_08_01"); //Was gibt’s da zu meinen? Er ist mein Vater, so viel ist mal sicher ...
};

INSTANCE Info_Mod_Erntehelfer_02_Pickpocket (C_INFO)
{
	npc		= Mod_7639_OUT_Erntehelfer_REL;
	nr		= 1;
	condition	= Info_Mod_Erntehelfer_02_Pickpocket_Condition;
	information	= Info_Mod_Erntehelfer_02_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Erntehelfer_02_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Erntehelfer_02_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Erntehelfer_02_Pickpocket);

	Info_AddChoice	(Info_Mod_Erntehelfer_02_Pickpocket, DIALOG_BACK, Info_Mod_Erntehelfer_02_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Erntehelfer_02_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Erntehelfer_02_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Erntehelfer_02_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Erntehelfer_02_Pickpocket);
};

FUNC VOID Info_Mod_Erntehelfer_02_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Erntehelfer_02_Pickpocket);
};

INSTANCE Info_Mod_Erntehelfer_02_EXIT (C_INFO)
{
	npc		= Mod_7639_OUT_Erntehelfer_REL;
	nr		= 1;
	condition	= Info_Mod_Erntehelfer_02_EXIT_Condition;
	information	= Info_Mod_Erntehelfer_02_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Erntehelfer_02_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Erntehelfer_02_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};