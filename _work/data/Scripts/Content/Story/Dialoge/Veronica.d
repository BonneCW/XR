INSTANCE Info_Mod_Veronica_Hi (C_INFO)
{
	npc		= Mod_7767_OUT_Veronica_EIS;
	nr		= 1;
	condition	= Info_Mod_Veronica_Hi_Condition;
	information	= Info_Mod_Veronica_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Veronica_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Veronica_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Veronica_Hi_16_00"); //(erschrocken) Was, wer da? (wütend) Was fällt dir ein mich beim Baden zu beobachten, du Schuft.
	AI_Output(hero, self, "Info_Mod_Veronica_Hi_15_01"); //Ich ...
	AI_Output(self, hero, "DEFAULT"); //

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Veronica_Pickpocket (C_INFO)
{
	npc		= Mod_7767_OUT_Veronica_EIS;
	nr		= 1;
	condition	= Info_Mod_Veronica_Pickpocket_Condition;
	information	= Info_Mod_Veronica_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60_Female;
};

FUNC INT Info_Mod_Veronica_Pickpocket_Condition()
{
	C_Beklauen	(53, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Veronica_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Veronica_Pickpocket);

	Info_AddChoice	(Info_Mod_Veronica_Pickpocket, DIALOG_BACK, Info_Mod_Veronica_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Veronica_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Veronica_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Veronica_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Veronica_Pickpocket);
};

FUNC VOID Info_Mod_Veronica_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Veronica_Pickpocket);
};

INSTANCE Info_Mod_Veronica_EXIT (C_INFO)
{
	npc		= Mod_7767_OUT_Veronica_EIS;
	nr		= 1;
	condition	= Info_Mod_Veronica_EXIT_Condition;
	information	= Info_Mod_Veronica_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Veronica_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Veronica_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};