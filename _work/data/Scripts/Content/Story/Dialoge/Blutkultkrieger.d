INSTANCE Info_Mod_Blutkultkrieger_Hi (C_INFO)
{
	npc		= Mod_4092_BlutkultKrieger_NW;
	nr		= 1;
	condition	= Info_Mod_Blutkultkrieger_Hi_Condition;
	information	= Info_Mod_Blutkultkrieger_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Blutkultkrieger_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Blutkultkrieger_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Blutkultkrieger_Hi_13_00"); //Was willst du hier, Kleiner?
	AI_Output(hero, self, "Info_Mod_Blutkultkrieger_Hi_15_01"); //Ich bin hier, um dir und deinen Freunden den Schädel zu spalten.
	AI_Output(self, hero, "Info_Mod_Blutkultkrieger_Hi_13_02"); //(lacht) Hahahahaha. Du meinst, du hättest gegen uns eine Chance? Da liegst du falsch, Kleiner! STIRB!

	AI_StopProcessInfos	(self);

	Mod_4092_BlutkultMagier_NW.guild = GIL_STRF;
	Npc_SetTrueGuild (Mod_4092_BlutkultMagier_NW, GIL_STRF);

	Mod_4093_BlutkultMagier_NW.guild = GIL_STRF;
	Npc_SetTrueGuild (Mod_4093_BlutkultMagier_NW, GIL_STRF);

	Mod_4094_BlutkultMagier_NW.guild = GIL_STRF;
	Npc_SetTrueGuild (Mod_4094_BlutkultMagier_NW, GIL_STRF);

	Mod_4095_BlutkultMagier_NW.guild = GIL_STRF;
	Npc_SetTrueGuild (Mod_4095_BlutkultMagier_NW, GIL_STRF);

	Mod_4096_BlutkultMagier_NW.guild = GIL_STRF;
	Npc_SetTrueGuild (Mod_4096_BlutkultMagier_NW, GIL_STRF);

	Mod_4097_BlutkultMagier_NW.guild = GIL_STRF;
	Npc_SetTrueGuild (Mod_4097_BlutkultMagier_NW, GIL_STRF);
};