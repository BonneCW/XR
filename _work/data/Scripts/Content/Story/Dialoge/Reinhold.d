INSTANCE Info_Mod_Reinhold_Hi (C_INFO)
{
	npc		= GardeBeliars_1992_Reinhold;
	nr		= 1;
	condition	= Info_Mod_Reinhold_Hi_Condition;
	information	= Info_Mod_Reinhold_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Reinhold_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Reinhold_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Reinhold_Hi_14_00"); //Das gibt es nicht. Wie konntest du es so weit schaffen? Du hättest schon längst tot sein müssen!
	AI_Output(hero, self, "Info_Mod_Reinhold_Hi_15_01"); //Es kamen schon viele von deiner Sorte, und ich habe sie alle hinweggefegt!
	AI_Output(self, hero, "Info_Mod_Reinhold_Hi_14_02"); //Dann wird das ein angemessenes Duell!

	CreateInvItems	(self, ItWr_AxtAlmanach_04, 1);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};