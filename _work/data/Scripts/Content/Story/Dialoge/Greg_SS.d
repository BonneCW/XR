INSTANCE Info_Mod_Greg_SS_Hi (C_INFO)
{
	npc		= Mod_1610_PIR_Greg_SS;
	nr		= 1;
	condition	= Info_Mod_Greg_SS_Hi_Condition;
	information	= Info_Mod_Greg_SS_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Greg_SS_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Greg_SS_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Greg_SS_Hi_01_00"); //(schreit) Eine orkische Kriegsgaleere! Jedermann auf seinen Posten!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Greg_SS_Entern (C_INFO)
{
	npc		= Mod_1610_PIR_Greg_SS;
	nr		= 1;
	condition	= Info_Mod_Greg_SS_Entern_Condition;
	information	= Info_Mod_Greg_SS_Entern_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Greg_SS_Entern_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_SS_Entern))
	&& (Npc_GetDistToWP(hero, "NEUERPUNKT") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Greg_SS_Entern_Info()
{
	AI_Output(self, hero, "Info_Mod_Greg_SS_Entern_01_00"); //(ruft) Entert das Orkschiff!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Greg_SS_EXIT (C_INFO)
{
	npc		= Mod_1610_PIR_Greg_SS;
	nr		= 1;
	condition	= Info_Mod_Greg_SS_EXIT_Condition;
	information	= Info_Mod_Greg_SS_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Greg_SS_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Greg_SS_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};