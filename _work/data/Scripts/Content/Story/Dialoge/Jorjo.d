INSTANCE Info_Mod_Jorjo_Hi (C_INFO)
{
	npc		= GardeBeliars_1990_Jorjo;
	nr		= 1;
	condition	= Info_Mod_Jorjo_Hi_Condition;
	information	= Info_Mod_Jorjo_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jorjo_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Jorjo_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Jorjo_Hi_14_00"); //(ungläubig) Wie kommst du hierher? Drach hätte dich eigentlich töten sollen!
	AI_Output(hero, self, "Info_Mod_Jorjo_Hi_15_01"); //Das haben schon viele gesagt.
	AI_Output(self, hero, "Info_Mod_Jorjo_Hi_14_02"); //(seufzt) Dann werde ich mich um dich kümmern müssen.

	CreateInvItems	(self, ItWr_AxtAlmanach_02, 1);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};