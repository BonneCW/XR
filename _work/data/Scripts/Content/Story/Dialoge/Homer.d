INSTANCE Info_Mod_Homer_Hi (C_INFO)
{
	npc		= Mod_1104_BAU_Homer_MT;
	nr		= 1;
	condition	= Info_Mod_Homer_Hi_Condition;
	information	= Info_Mod_Homer_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo, noch immer mit dem Damm beschäftigt?";
};

FUNC INT Info_Mod_Homer_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Homer_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Homer_Hi_15_00"); //Hallo, noch immer mit dem Damm beschäftigt?
	AI_Output(self, hero, "Info_Mod_Homer_Hi_02_01"); //Ach, viel zu tun gibt es nicht mehr. Unserem neuen Schmied ist es gelungen den Damm durch Einsatz von magischem Erz zu verstärken.
	AI_Output(self, hero, "Info_Mod_Homer_Hi_02_02"); //Jetzt ist er gegen so ziemlich alles gefeit, widriges Wetter, wie auch garstige Lurker.
};

INSTANCE Info_Mod_Homer_Pickpocket (C_INFO)
{
	npc		= Mod_1104_BAU_Homer_MT;
	nr		= 1;
	condition	= Info_Mod_Homer_Pickpocket_Condition;
	information	= Info_Mod_Homer_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_40;
};

FUNC INT Info_Mod_Homer_Pickpocket_Condition()
{
	C_Beklauen	(40, ItMi_Gold, 80);
};

FUNC VOID Info_Mod_Homer_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Homer_Pickpocket);

	Info_AddChoice	(Info_Mod_Homer_Pickpocket, DIALOG_BACK, Info_Mod_Homer_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Homer_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Homer_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Homer_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Homer_Pickpocket);
};

FUNC VOID Info_Mod_Homer_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Homer_Pickpocket);
};

INSTANCE Info_Mod_Homer_EXIT (C_INFO)
{
	npc		= Mod_1104_BAU_Homer_MT;
	nr		= 1;
	condition	= Info_Mod_Homer_EXIT_Condition;
	information	= Info_Mod_Homer_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Homer_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Homer_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};