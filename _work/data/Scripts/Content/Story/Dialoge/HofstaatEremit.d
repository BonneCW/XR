INSTANCE Info_Mod_HofstaatEremit_Hi (C_INFO)
{
	npc		= Mod_7286_HS_Eremit_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatEremit_Hi_Condition;
	information	= Info_Mod_HofstaatEremit_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du der Eremit?";
};

FUNC INT Info_Mod_HofstaatEremit_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatEremit_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_HofstaatEremit_Hi_15_00"); //Bist du der Eremit?
	AI_Output(self, hero, "Info_Mod_HofstaatEremit_Hi_08_01"); //Kommt drauf an.
	AI_Output(hero, self, "Info_Mod_HofstaatEremit_Hi_15_02"); //Auf was?
	AI_Output(self, hero, "Info_Mod_HofstaatEremit_Hi_08_03"); //Welchen Eremiten du meinst.
	AI_Output(hero, self, "Info_Mod_HofstaatEremit_Hi_15_04"); //(genervt) Den königliche natürlich.
	AI_Output(self, hero, "Info_Mod_HofstaatEremit_Hi_08_05"); //Ja, der bin ich.
	AI_Output(hero, self, "Info_Mod_HofstaatEremit_Hi_15_06"); //Der Magier schickt mich.
	AI_Output(self, hero, "Info_Mod_HofstaatEremit_Hi_08_07"); //Welcher?
	AI_Output(hero, self, "Info_Mod_HofstaatEremit_Hi_15_08"); //(genervt) Der königliche.
	AI_Output(self, hero, "Info_Mod_HofstaatEremit_Hi_08_09"); //Achso. Und was will er?
	AI_Output(hero, self, "Info_Mod_HofstaatEremit_Hi_15_10"); //Er hat was von einer Pilzlieferung gesagt.
	AI_Output(self, hero, "Info_Mod_HofstaatEremit_Hi_08_11"); //Welche Pilzlief ... (wird unterbrochen)
	AI_Output(hero, self, "Info_Mod_HofstaatEremit_Hi_15_12"); //Die königliche verdammt noch mal!
	AI_Output(self, hero, "Info_Mod_HofstaatEremit_Hi_08_13"); //Achso. Dann nimm hier dieses königliche Säckchen voller königlicher Pilzsporen und bring es dem Magier!

	B_GiveInvItems	(self, hero, ItMi_FreudenspenderSporen, 1);

	AI_Output(hero, self, "Info_Mod_HofstaatEremit_Hi_15_14"); //Welchem?
	AI_Output(self, hero, "Info_Mod_HofstaatEremit_Hi_08_15"); //Dem königlichen natürlich!

	B_LogEntry	(TOPIC_MOD_SEKTE_FREUDENSPENDER, "Der Eremit hat mir die Pilzsporen gegeben. Ich sollte sie zum Magier bringen.");
};

INSTANCE Info_Mod_HofstaatEremit_EXIT (C_INFO)
{
	npc		= Mod_7286_HS_Eremit_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatEremit_EXIT_Condition;
	information	= Info_Mod_HofstaatEremit_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HofstaatEremit_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatEremit_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};