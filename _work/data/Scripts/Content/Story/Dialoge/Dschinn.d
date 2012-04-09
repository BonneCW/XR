FUNC VOID B_DschinnBesetzteMine ()
{
	AI_Output(self, hero, "Info_Mod_Dschinn_MineBesetzt_10_00"); //Diese Mine ist bereits besetzt.
};

INSTANCE Info_Mod_Dschinn_FM_Hi (C_INFO)
{
	npc		= Dschinn_11012_FM;
	nr		= 1;
	condition	= Info_Mod_Dschinn_FM_Hi_Condition;
	information	= Info_Mod_Dschinn_FM_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dschinn_FM_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Dschinn_FM_Hi_Info()
{
	B_DschinnBesetzteMine();

	Mod_NL_Dschinn_FM = 2;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Dschinn_OM_Hi (C_INFO)
{
	npc		= Dschinn_11013_OM;
	nr		= 1;
	condition	= Info_Mod_Dschinn_OM_Hi_Condition;
	information	= Info_Mod_Dschinn_OM_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dschinn_OM_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Dschinn_OM_Hi_Info()
{
	B_DschinnBesetzteMine();

	Mod_NL_Dschinn_OM = 2;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Dschinn_VM_Hi (C_INFO)
{
	npc		= Dschinn_11014_VM;
	nr		= 1;
	condition	= Info_Mod_Dschinn_VM_Hi_Condition;
	information	= Info_Mod_Dschinn_VM_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dschinn_VM_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Dschinn_VM_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Dschinn_VM_Hi_10_00"); //Eine verlassene Erzmine. Das wird meinen Meister überaus freuen.

	Mod_NL_Dschinn_VM = 2;

	AI_StopProcessInfos	(self);
};