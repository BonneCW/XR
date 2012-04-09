INSTANCE Info_Mod_Neron_Hi (C_INFO)
{
	npc		= Mod_1260_RIT_Neron_NW;
	nr		= 1;
	condition	= Info_Mod_Neron_Hi_Condition;
	information	= Info_Mod_Neron_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist denn hier los?";
};

FUNC INT Info_Mod_Neron_Hi_Condition()
{
	if (FI_Story == 11)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Andre_RLMord))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Neron_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Neron_Hi_15_00"); //Was ist denn hier los?
	AI_Output(self, hero, "Info_Mod_Neron_Hi_04_01"); //Ach du bist's. Lord Andre sucht dich schon überall, melde dich am besten gleich bei ihm.

	Info_Mod_Andre_RLMord.description = "Neron schickt mich.";
};

INSTANCE Info_Mod_Neron_Pickpocket (C_INFO)
{
	npc		= Mod_1260_RIT_Neron_NW;
	nr		= 1;
	condition	= Info_Mod_Neron_Pickpocket_Condition;
	information	= Info_Mod_Neron_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Neron_Pickpocket_Condition()
{
	C_Beklauen	(94, ItMi_Gold, 500);
};

FUNC VOID Info_Mod_Neron_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Neron_Pickpocket);

	Info_AddChoice	(Info_Mod_Neron_Pickpocket, DIALOG_BACK, Info_Mod_Neron_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Neron_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Neron_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Neron_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Neron_Pickpocket);
};

FUNC VOID Info_Mod_Neron_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Neron_Pickpocket);
};

INSTANCE Info_Mod_Neron_EXIT (C_INFO)
{
	npc		= Mod_1260_RIT_Neron_NW;
	nr		= 1;
	condition	= Info_Mod_Neron_EXIT_Condition;
	information	= Info_Mod_Neron_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Neron_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Neron_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};