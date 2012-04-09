INSTANCE Info_Mod_Berta_Hi (C_INFO)
{
	npc		= Mod_7724_OUT_Berta_REL;
	nr		= 1;
	condition	= Info_Mod_Berta_Hi_Condition;
	information	= Info_Mod_Berta_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie ist das Befinden?";
};

FUNC INT Info_Mod_Berta_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hedwig_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Berta_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Berta_Hi_15_00"); //Wie ist das Befinden?
	AI_Output(self, hero, "Info_Mod_Berta_Hi_16_01"); //(betrunken) Das Bier läss auf sich wartn.
};

INSTANCE Info_Mod_Berta_Pickpocket (C_INFO)
{
	npc		= Mod_7724_OUT_Berta_REL;
	nr		= 1;
	condition	= Info_Mod_Berta_Pickpocket_Condition;
	information	= Info_Mod_Berta_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_40_Female;
};

FUNC INT Info_Mod_Berta_Pickpocket_Condition()
{
	C_Beklauen	(37, ItMi_Gold, 50);
};

FUNC VOID Info_Mod_Berta_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Berta_Pickpocket);

	Info_AddChoice	(Info_Mod_Berta_Pickpocket, DIALOG_BACK, Info_Mod_Berta_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Berta_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Berta_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Berta_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Berta_Pickpocket);
};

FUNC VOID Info_Mod_Berta_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Berta_Pickpocket);
};

INSTANCE Info_Mod_Berta_EXIT (C_INFO)
{
	npc		= Mod_7724_OUT_Berta_REL;
	nr		= 1;
	condition	= Info_Mod_Berta_EXIT_Condition;
	information	= Info_Mod_Berta_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Berta_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Berta_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};