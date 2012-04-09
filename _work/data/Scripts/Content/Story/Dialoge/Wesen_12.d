INSTANCE Info_Mod_Wesen_12_Hi (C_INFO)
{
	npc		= Monster_11036_Wesen_HALU;
	nr		= 1;
	condition	= Info_Mod_Wesen_12_Hi_Condition;
	information	= Info_Mod_Wesen_12_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wesen_12_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wesen_12_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Wesen_12_Hi_18_00"); //Hey ... HEY ... hehehe willste mal ... chchch ... willste mal 'nen ... hahahahaha ... 'nen guten Witz hören?
	AI_Output(self, hero, "Info_Mod_Wesen_12_Hi_18_01"); //Huhuhuhu ... das LEEEEBEN! ... HAHAHAHAHAHAHA ...

	AI_StopProcessInfos	(self);
};