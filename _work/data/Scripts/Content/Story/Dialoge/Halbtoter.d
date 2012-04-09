INSTANCE Info_Mod_Halbtoter_Hi (C_INFO)
{
	npc		= Mod_7681_ASS_Halbtoter_NW;
	nr		= 1;
	condition	= Info_Mod_Halbtoter_Hi_Condition;
	information	= Info_Mod_Halbtoter_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Halbtoter_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Halbtoter_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Halbtoter_Hi_13_00"); //Ohh, nein,… du schon wieder.
	AI_Output(self, hero, "Info_Mod_Halbtoter_Hi_13_01"); //Nachdem du alle anderen umgebracht hast, bist du nun gekommen, um mir den Rest zu bringen.
	AI_Output(self, hero, "Info_Mod_Halbtoter_Hi_13_02"); //(verklingend) Du grässliches Metallmonster.

	AI_StopProcessInfos	(self);
};