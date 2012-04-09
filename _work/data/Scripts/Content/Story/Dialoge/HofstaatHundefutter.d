INSTANCE Info_Mod_HofstaatHundefutter_Hi (C_INFO)
{
	npc		= Mod_7334_HS_Typ_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatHundefutter_Hi_Condition;
	information	= Info_Mod_HofstaatHundefutter_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey!";
};

FUNC INT Info_Mod_HofstaatHundefutter_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatHundefutter_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatHundefutter_Hi_15_00"); //Hey!
	AI_Output(self, hero, "Info_Mod_HofstaatHundefutter_Hi_06_01"); //Aaalter. Was soll der Scheiﬂ?
	AI_Output(self, hero, "Info_Mod_HofstaatHundefutter_Hi_15_02"); //Was meinst du?
	AI_Output(self, hero, "Info_Mod_HofstaatHundefutter_Hi_06_03"); //Siehst du nicht, dass ich arbeite? Du neeeervst!
	AI_Output(self, hero, "Info_Mod_HofstaatHundefutter_Hi_15_04"); //Du hast ziemlich viel Freudenspender intus, oder?
	AI_Output(self, hero, "Info_Mod_HofstaatHundefutter_Hi_06_05"); //Fr ... Freu ... h‰? Aaaaaalter ... Endlich, der Boss!

	AI_StopProcessInfos	(self);

	Wld_InsertNpc	(Mod_7335_HS_Typ_REL, "REL_243");
};