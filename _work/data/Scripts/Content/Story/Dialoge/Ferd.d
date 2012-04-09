INSTANCE Info_Mod_Ferd_Hi (C_INFO)
{
	npc		= Mod_7520_JG_Ferd_JL;
	nr		= 1;
	condition	= Info_Mod_Ferd_Hi_Condition;
	information	= Info_Mod_Ferd_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du bist einer der Jäger, die das Lager hier mit Fleisch und Fellen versorgen?";
};

FUNC INT Info_Mod_Ferd_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ferd_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Ferd_Hi_15_00"); //Du bist einer der Jäger, die das Lager hier mit Fleisch und Fellen versorgen?
	AI_Output(self, hero, "Info_Mod_Ferd_Hi_06_01"); //Jo, aber ich kann im Moment nich jagen.
	AI_Output(hero, self, "Info_Mod_Ferd_Hi_15_02"); //Warum?
	AI_Output(self, hero, "Info_Mod_Ferd_Hi_06_03"); //Letzthin hat mich 'ne Wildsau mit ihren Hauern erwischt. Nu hab ich 'ne tiefe Wunde am Bein.
	AI_Output(hero, self, "Info_Mod_Ferd_Hi_15_04"); //Aber du überlebst?
	AI_Output(self, hero, "Info_Mod_Ferd_Hi_06_05"); //Klar. Wulfgar kümmert sich um mich.
	AI_Output(hero, self, "Info_Mod_Ferd_Hi_15_06"); //Dann mal gute Besserung.
};

INSTANCE Info_Mod_Ferd_Pickpocket (C_INFO)
{
	npc		= Mod_7520_JG_Ferd_JL;
	nr		= 1;
	condition	= Info_Mod_Ferd_Pickpocket_Condition;
	information	= Info_Mod_Ferd_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Ferd_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 130);
};

FUNC VOID Info_Mod_Ferd_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Ferd_Pickpocket);

	Info_AddChoice	(Info_Mod_Ferd_Pickpocket, DIALOG_BACK, Info_Mod_Ferd_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Ferd_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Ferd_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Ferd_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Ferd_Pickpocket);
};

FUNC VOID Info_Mod_Ferd_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Ferd_Pickpocket);
};

INSTANCE Info_Mod_Ferd_EXIT (C_INFO)
{
	npc		= Mod_7520_JG_Ferd_JL;
	nr		= 1;
	condition	= Info_Mod_Ferd_EXIT_Condition;
	information	= Info_Mod_Ferd_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ferd_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ferd_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};