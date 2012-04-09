INSTANCE Info_Mod_Schoeppe_02_Hi (C_INFO)
{
	npc		= Mod_7373_OUT_Schoeppe_REL;
	nr		= 1;
	condition	= Info_Mod_Schoeppe_02_Hi_Condition;
	information	= Info_Mod_Schoeppe_02_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie geht's?";
};

FUNC INT Info_Mod_Schoeppe_02_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Schoeppe_02_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Schoeppe_02_Hi_15_00"); //Wie geht's?
	AI_Output(self, hero, "Info_Mod_Schoeppe_02_Hi_06_01"); //Ein bisschen langweilig ist es gerade. Würde gern mal wieder jemanden foltern.
	AI_Output(self, hero, "Info_Mod_Schoeppe_02_Hi_06_02"); //Die haben doch alle was ausgefressen, und nur mit der Folter bekommt man es aus ihnen heraus!
};

INSTANCE Info_Mod_Schoeppe_02_Pickpocket (C_INFO)
{
	npc		= Mod_7373_OUT_Schoeppe_REL;
	nr		= 1;
	condition	= Info_Mod_Schoeppe_02_Pickpocket_Condition;
	information	= Info_Mod_Schoeppe_02_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Schoeppe_02_Pickpocket_Condition()
{
	C_Beklauen	(76, ItMi_Gold, 350);
};

FUNC VOID Info_Mod_Schoeppe_02_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Schoeppe_02_Pickpocket);

	Info_AddChoice	(Info_Mod_Schoeppe_02_Pickpocket, DIALOG_BACK, Info_Mod_Schoeppe_02_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Schoeppe_02_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Schoeppe_02_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Schoeppe_02_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Schoeppe_02_Pickpocket);
};

FUNC VOID Info_Mod_Schoeppe_02_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Schoeppe_02_Pickpocket);
};

INSTANCE Info_Mod_Schoeppe_02_EXIT (C_INFO)
{
	npc		= Mod_7373_OUT_Schoeppe_REL;
	nr		= 1;
	condition	= Info_Mod_Schoeppe_02_EXIT_Condition;
	information	= Info_Mod_Schoeppe_02_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Schoeppe_02_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Schoeppe_02_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};