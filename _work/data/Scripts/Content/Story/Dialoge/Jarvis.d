INSTANCE Info_Mod_Jarvis_Hi (C_INFO)
{
	npc		= Mod_787_SLD_Jarvis_MT;
	nr		= 1;
	condition	= Info_Mod_Jarvis_Hi_Condition;
	information	= Info_Mod_Jarvis_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jarvis_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Jarvis_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Jarvis_Hi_04_00"); //Du kommst mir irgendwie bekannt vor, aber ich bin mir nicht sicher. Du solltest auf jeden Fall bescheid wissen, dass du nun den inneren Teil des Lagers betrittst. Mach nicht zu viele Dummheiten, sonst ...
	AI_Output(hero, self, "Info_Mod_Jarvis_Hi_15_01"); //Schmeißt du mich eigenhändig wieder raus?
	AI_Output(self, hero, "Info_Mod_Jarvis_Hi_04_02"); //Nein, sonst kann es passieren, dass dich ein Orkjäger aus Sylvios Gruppe einen Kopf kürzer macht. Ist also zu deinem eigenen Besten.
};

INSTANCE Info_Mod_Jarvis_Pickpocket (C_INFO)
{
	npc		= Mod_787_SLD_Jarvis_MT;
	nr		= 1;
	condition	= Info_Mod_Jarvis_Pickpocket_Condition;
	information	= Info_Mod_Jarvis_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Jarvis_Pickpocket_Condition()
{
	C_Beklauen	(99, ItMi_Gold, 220);
};

FUNC VOID Info_Mod_Jarvis_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Jarvis_Pickpocket);

	Info_AddChoice	(Info_Mod_Jarvis_Pickpocket, DIALOG_BACK, Info_Mod_Jarvis_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Jarvis_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Jarvis_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Jarvis_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Jarvis_Pickpocket);
};

FUNC VOID Info_Mod_Jarvis_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Jarvis_Pickpocket);
};

INSTANCE Info_Mod_Jarvis_EXIT (C_INFO)
{
	npc		= Mod_787_SLD_Jarvis_MT;
	nr		= 1;
	condition	= Info_Mod_Jarvis_EXIT_Condition;
	information	= Info_Mod_Jarvis_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Jarvis_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Jarvis_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};