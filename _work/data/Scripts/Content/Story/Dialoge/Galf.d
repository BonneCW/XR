INSTANCE Info_Mod_Galf_Hi (C_INFO)
{
	npc		= Mod_7235_NONE_Galf_NW;
	nr		= 1;
	condition	= Info_Mod_Galf_Hi_Condition;
	information	= Info_Mod_Galf_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey. Wer bist du?";
};

FUNC INT Info_Mod_Galf_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Galf_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Galf_Hi_15_00"); //Hey. Wer bist du?
	AI_Output(self, hero, "Info_Mod_Galf_Hi_09_01"); //Ahhhhhh! Ich bin Galf! Hau mich nicht!
	AI_Output(hero, self, "Info_Mod_Galf_Hi_15_02"); //Was hast du hier zu suchen?
	AI_Output(self, hero, "Info_Mod_Galf_Hi_09_03"); //Gaaarnichts! Ich will nur weg!
	AI_Output(hero, self, "Info_Mod_Galf_Hi_15_04"); //Du gehst nigendwohin bevor du mir nicht erklärt hast, was hier los ist!
	AI_Output(self, hero, "Info_Mod_Galf_Hi_09_05"); //Ich ... AAAAHHHH!

	AI_StopProcessInfos	(self);
};