INSTANCE Info_Mod_Hecta_Hi (C_INFO)
{
	npc		= Mod_1972_GRD_Hecta_MT;
	nr		= 1;
	condition	= Info_Mod_Hecta_Hi_Condition;
	information	= Info_Mod_Hecta_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hecta_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hecta_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Hecta_Hi_03_00"); //Na, wen haben wir denn da.
	AI_Output(hero, self, "Info_Mod_Hecta_Hi_15_01"); //Ich ...
	AI_Output(self, hero, "Info_Mod_Hecta_Hi_03_02"); //Ach, egal. Kommst wohl gerade aus dem Neuen Lager, was?

	Info_ClearChoices	(Info_Mod_Hecta_Hi);

	Info_AddChoice	(Info_Mod_Hecta_Hi, "Nun ... nein, eigentlich nicht.", Info_Mod_Hecta_Hi_B);
	Info_AddChoice	(Info_Mod_Hecta_Hi, "Stimmt.", Info_Mod_Hecta_Hi_A);
};

FUNC VOID Info_Mod_Hecta_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Hecta_Hi_B_15_00"); //Nun ... nein, eigentlich nicht.
	AI_Output(self, hero, "Info_Mod_Hecta_Hi_B_03_01"); //Im Namen des Alten Lagers gibst mir jetzt dein ganzes Gold und Wertsachen.
	AI_Output(hero, self, "Info_Mod_Hecta_Hi_B_15_02"); //Das hättest du wohl gerne, was?
	AI_Output(self, hero, "Info_Mod_Hecta_Hi_B_03_03"); //Da hattest deine Chance.

	Info_ClearChoices	(Info_Mod_Hecta_Hi);
};

FUNC VOID Info_Mod_Hecta_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Hecta_Hi_A_15_00"); //Stimmt.
	AI_Output(self, hero, "Info_Mod_Hecta_Hi_A_03_01"); //Dann tut es mir echt leid für dich. Und nun stirb.

	Info_ClearChoices	(Info_Mod_Hecta_Hi);
};

INSTANCE Info_Mod_Hecta_EXIT (C_INFO)
{
	npc		= Mod_1972_GRD_Hecta_MT;
	nr		= 1;
	condition	= Info_Mod_Hecta_EXIT_Condition;
	information	= Info_Mod_Hecta_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hecta_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hecta_EXIT_Info()
{
	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
	B_Attack	(Mod_1973_GRD_Achil_MT, hero, AR_Kill, 0);
};