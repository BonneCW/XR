INSTANCE Info_Mod_Skelett_Hi (C_INFO)
{
	npc		= Mod_1552_SKE_Skelett_DI;
	nr		= 1;
	condition	= Info_Mod_Skelett_Hi_Condition;
	information	= Info_Mod_Skelett_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Skelett_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Skelett_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Skelett_Hi_04_00"); //Was? Ein Fremder? Du willst unsern Schatz!! Verschwinde!
	AI_Output(hero, self, "Info_Mod_Skelett_Hi_15_01"); //Wie ... Was ... Wieso bist du nicht ...
	AI_Output(self, hero, "Info_Mod_Skelett_Hi_04_02"); //... tot? (lacht) Ich bin tot. Genauso tot, wie du es bald sein wirst!!

	AI_StopProcessInfos	(self);

	Npc_SetTarget (self, hero);

	AI_StartState	(self, ZS_MM_Attack, 0, "");

	self.flags = 0;
};