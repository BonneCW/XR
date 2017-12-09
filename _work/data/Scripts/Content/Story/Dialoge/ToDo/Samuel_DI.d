INSTANCE Info_Mod_Samuel_DI_Brunhild (C_INFO)
{
	npc		= Mod_1548_PIR_Samuel_DI;
	nr		= 1;
	condition	= Info_Mod_Samuel_DI_Brunhild_Condition;
	information	= Info_Mod_Samuel_DI_Brunhild_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du willst mich sprechen.";
};

FUNC INT Info_Mod_Samuel_DI_Brunhild_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_DI_Brunhild2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_DI_Brunhild_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_DI_Brunhild_15_00"); //Du willst mich sprechen.
	AI_Output(self, hero, "Info_Mod_Samuel_DI_Brunhild_14_01"); //So ist es. Du hast doch diese Frau angebracht.
	AI_Output(hero, self, "Info_Mod_Samuel_DI_Brunhild_15_02"); //Ja, und?
	AI_Output(self, hero, "Info_Mod_Samuel_DI_Brunhild_14_03"); //Also, kochen kann sie besser als ich. Aber sie hat dir nicht die Wahrheit erzählt.
	AI_Output(hero, self, "Info_Mod_Samuel_DI_Brunhild_15_04"); //Woher willst du das wissen?
	AI_Output(self, hero, "Info_Mod_Samuel_DI_Brunhild_14_05"); //Hat sie mir selbst gestanden. Sie ist in der Küche.
};

INSTANCE Info_Mod_Samuel_DI_EXIT (C_INFO)
{
	npc		= Mod_1548_PIR_Samuel_DI;
	nr		= 1;
	condition	= Info_Mod_Samuel_DI_EXIT_Condition;
	information	= Info_Mod_Samuel_DI_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Samuel_DI_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Samuel_DI_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};