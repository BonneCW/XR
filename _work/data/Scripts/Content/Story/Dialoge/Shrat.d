INSTANCE Info_Mod_Shrat_Hi (C_INFO)
{
	npc		= Mod_1119_PSINOV_Shrat_MT;
	nr		= 1;
	condition	= Info_Mod_Shrat_Hi_Condition;
	information	= Info_Mod_Shrat_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Shrat_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Shrat_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Shrat_Hi_02_00"); //Stör nicht meine Ruhe!
};

INSTANCE Info_Mod_Shrat_Woher (C_INFO)
{
	npc		= Mod_1119_PSINOV_Shrat_MT;
	nr		= 1;
	condition	= Info_Mod_Shrat_Woher_Condition;
	information	= Info_Mod_Shrat_Woher_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wieso bist du alleine in einer Hütte mitten im Sumpf?";
};

FUNC INT Info_Mod_Shrat_Woher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Shrat_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Shrat_Woher_Info()
{
	AI_Output(hero, self, "Info_Mod_Shrat_Woher_15_00"); //Wieso bist du alleine in einer Hütte mitten im Sumpf?
	AI_Output(self, hero, "Info_Mod_Shrat_Woher_02_01"); //Weil ich meine Ruhe haben will. Nie hab ich meine Ruhe gehabt.
	AI_Output(self, hero, "Info_Mod_Shrat_Woher_02_02"); //Erst musste ich auf Onars Hof den ganzen Tag schuften, bis ich mit einem seiner Schafe abgehauen bin.
	AI_Output(self, hero, "Info_Mod_Shrat_Woher_02_03"); //Als sie mich in die Kolonie geworfen haben, habe ich gedacht, dass das Sumpflager ganz gemütlich ist.
	AI_Output(self, hero, "Info_Mod_Shrat_Woher_02_04"); //Aber dort durfte ich den ganzen Tag Sumpfkraut stampfen und das war nicht das, was ich wollte.
	AI_Output(self, hero, "Info_Mod_Shrat_Woher_02_05"); //Dann bin abgehauen und hab mir hier eine kleine Hütte gebaut und endlich hab ich meine Ruhe.
};

INSTANCE Info_Mod_Shrat_Pickpocket (C_INFO)
{
	npc		= Mod_1119_PSINOV_Shrat_MT;
	nr		= 1;
	condition	= Info_Mod_Shrat_Pickpocket_Condition;
	information	= Info_Mod_Shrat_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Shrat_Pickpocket_Condition()
{
	C_Beklauen	(53, ItMi_Gold, 30);
};

FUNC VOID Info_Mod_Shrat_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Shrat_Pickpocket);

	Info_AddChoice	(Info_Mod_Shrat_Pickpocket, DIALOG_BACK, Info_Mod_Shrat_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Shrat_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Shrat_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Shrat_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Shrat_Pickpocket);
};

FUNC VOID Info_Mod_Shrat_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Shrat_Pickpocket);
};

INSTANCE Info_Mod_Shrat_EXIT (C_INFO)
{
	npc		= Mod_1119_PSINOV_Shrat_MT;
	nr		= 1;
	condition	= Info_Mod_Shrat_EXIT_Condition;
	information	= Info_Mod_Shrat_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Shrat_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Shrat_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};