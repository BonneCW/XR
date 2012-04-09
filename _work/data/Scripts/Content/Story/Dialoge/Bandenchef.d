INSTANCE Info_Mod_Bandenchef_Hi (C_INFO)
{
	npc		= Mod_1891_NONE_Bandenchef_NW;
	nr		= 1;
	condition	= Info_Mod_Bandenchef_Hi_Condition;
	information	= Info_Mod_Bandenchef_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier bist du also.";
};

FUNC INT Info_Mod_Bandenchef_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bandenchef_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Bandenchef_Hi_15_00"); //Hier bist du also.
	AI_Output(self, hero, "Info_Mod_Bandenchef_Hi_07_01"); //Was willst du? Brauchst du besondere Ware?
	AI_Output(hero, self, "Info_Mod_Bandenchef_Hi_15_02"); //Ja, deinen Ring bitte.
	AI_Output(self, hero, "Info_Mod_Bandenchef_Hi_07_03"); //Was? Wer bist du?
	AI_Output(hero, self, "Info_Mod_Bandenchef_Hi_15_04"); //Ich bin Attila's Vertretung!
	AI_Output(self, hero, "Info_Mod_Bandenchef_Hi_07_05"); //Arrrr, verdammt, du mieser Hund. Du bist dran!

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};

INSTANCE Info_Mod_Bandenchef_EXIT (C_INFO)
{
	npc		= Mod_1891_NONE_Bandenchef_NW;
	nr		= 1;
	condition	= Info_Mod_Bandenchef_EXIT_Condition;
	information	= Info_Mod_Bandenchef_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bandenchef_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bandenchef_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};