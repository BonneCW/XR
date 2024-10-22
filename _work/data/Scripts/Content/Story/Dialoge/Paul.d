INSTANCE Info_Mod_Paul_Hi (C_INFO)
{
	npc		= Mod_7672_OUT_Paul_REL;
	nr		= 1;
	condition	= Info_Mod_Paul_Hi_Condition;
	information	= Info_Mod_Paul_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo Paul ...";
};

FUNC INT Info_Mod_Paul_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Paul_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Paul_Hi_15_00"); //Hallo Paul ...
	AI_Output(self, hero, "Info_Mod_Paul_Hi_01_01"); //...
	AI_Output(hero, self, "Info_Mod_Paul_Hi_15_02"); //Hmm ...
	AI_Output(self, hero, "Info_Mod_Paul_Hi_01_01"); //...
	AI_Output(hero, self, "Info_Mod_Paul_Hi_15_03"); //... wohl nicht sehr gesprächig heute.
};

INSTANCE Info_Mod_Paul_EXIT (C_INFO)
{
	npc		= Mod_7672_OUT_Paul_REL;
	nr		= 1;
	condition	= Info_Mod_Paul_EXIT_Condition;
	information	= Info_Mod_Paul_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Paul_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Paul_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};