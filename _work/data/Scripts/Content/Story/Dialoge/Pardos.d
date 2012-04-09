INSTANCE Info_Mod_Pardos_Unheil (C_INFO)
{
	npc		= Mod_108_BAU_Pardos_NW;
	nr		= 1;
	condition	= Info_Mod_Pardos_Unheil_Condition;
	information	= Info_Mod_Pardos_Unheil_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo. du siehst mitgenommen aus.";
};

FUNC INT Info_Mod_Pardos_Unheil_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Unheil))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Pardos_Unheil_Info()
{
	AI_Output(hero, self, "Info_Mod_Pardos_Unheil_15_00"); //Hallo. du siehst mitgenommen aus.
	AI_Output(self, hero, "Info_Mod_Pardos_Unheil_03_01"); //(verstört) Groß, wie ein Haus, ein Flammemeer, Schreie, brennende Leiber. Mitgenommen?! Nur mein Leben.
	AI_Output(self, hero, "Info_Mod_Pardos_Unheil_03_02"); //Alles verbrannt zerstört, verwüstet, von Dämonenhand, was hereinbrach, wie aus dem Nichts ...

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Pardos_Pickpocket (C_INFO)
{
	npc		= Mod_108_BAU_Pardos_NW;
	nr		= 1;
	condition	= Info_Mod_Pardos_Pickpocket_Condition;
	information	= Info_Mod_Pardos_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_40;
};

FUNC INT Info_Mod_Pardos_Pickpocket_Condition()
{
	C_Beklauen	(33, ItMi_Gold, 30);
};

FUNC VOID Info_Mod_Pardos_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Pardos_Pickpocket);

	Info_AddChoice	(Info_Mod_Pardos_Pickpocket, DIALOG_BACK, Info_Mod_Pardos_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Pardos_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Pardos_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Pardos_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Pardos_Pickpocket);
};

FUNC VOID Info_Mod_Pardos_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Pardos_Pickpocket);
};

INSTANCE Info_Mod_Pardos_EXIT (C_INFO)
{
	npc		= Mod_108_BAU_Pardos_NW;
	nr		= 1;
	condition	= Info_Mod_Pardos_EXIT_Condition;
	information	= Info_Mod_Pardos_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Pardos_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Pardos_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};