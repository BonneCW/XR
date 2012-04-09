INSTANCE Info_Mod_Isidro_Hi (C_INFO)
{
	npc		= Mod_1118_PSINOV_BaalIsidro_MT;
	nr		= 1;
	condition	= Info_Mod_Isidro_Hi_Condition;
	information	= Info_Mod_Isidro_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Es wird langsam Zeit zu gehen.";
};

FUNC INT Info_Mod_Isidro_Hi_Condition()
{
	if (Mod_SLD_Kagan == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Isidro_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Isidro_Hi_15_00"); //Es wird langsam Zeit zu gehen.
	AI_Output(self, hero, "Info_Mod_Isidro_Hi_03_01"); //(betrunken) Was? Wieso?

	B_StartOtherRoutine	(Mod_1117_PSINOV_BaalKagan_MT, "ISIDRO");

	Info_ClearChoices	(Info_Mod_Isidro_Hi);

	Info_AddChoice	(Info_Mod_Isidro_Hi, "Weil ich dir sonst die Fresse poliere.", Info_Mod_Isidro_Hi_B);
	Info_AddChoice	(Info_Mod_Isidro_Hi, "Weil ich es sage.", Info_Mod_Isidro_Hi_A);
};

FUNC VOID Info_Mod_Isidro_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Isidro_Hi_B_15_00"); //Weil ich dir sonst die Fresse poliere.
	AI_Output(self, hero, "Info_Mod_Isidro_Hi_B_03_01"); //Was? Ich habe aber keine Lust auf Stress. Ist gut. Ich komme mit.

	Info_ClearChoices	(Info_Mod_Isidro_Hi);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "KAGAN");
};

FUNC VOID Info_Mod_Isidro_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Isidro_Hi_A_15_00"); //Weil ich es sage.
	AI_Output(self, hero, "Info_Mod_Isidro_Hi_A_03_01"); //Ähhh, klar, machen wir einen Spaziergang.

	Info_ClearChoices	(Info_Mod_Isidro_Hi);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "KAGAN");
};

INSTANCE Info_Mod_Isidro_Pickpocket (C_INFO)
{
	npc		= Mod_1118_PSINOV_BaalIsidro_MT;
	nr		= 1;
	condition	= Info_Mod_Isidro_Pickpocket_Condition;
	information	= Info_Mod_Isidro_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_40;
};

FUNC INT Info_Mod_Isidro_Pickpocket_Condition()
{
	C_Beklauen	(33, ItMi_Gold, 530);
};

FUNC VOID Info_Mod_Isidro_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Isidro_Pickpocket);

	Info_AddChoice	(Info_Mod_Isidro_Pickpocket, DIALOG_BACK, Info_Mod_Isidro_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Isidro_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Isidro_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Isidro_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Isidro_Pickpocket);
};

FUNC VOID Info_Mod_Isidro_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Isidro_Pickpocket);
};

INSTANCE Info_Mod_Isidro_EXIT (C_INFO)
{
	npc		= Mod_1118_PSINOV_BaalIsidro_MT;
	nr		= 1;
	condition	= Info_Mod_Isidro_EXIT_Condition;
	information	= Info_Mod_Isidro_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Isidro_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Isidro_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};