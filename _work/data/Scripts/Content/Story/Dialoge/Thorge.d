INSTANCE Info_Mod_Thorge_KommMit (C_INFO)
{
	npc		= Mod_1957_VMG_Thorge_MT;
	nr		= 1;
	condition	= Info_Mod_Thorge_KommMit_Condition;
	information	= Info_Mod_Thorge_KommMit_Info;
	permanent	= 0;
	important	= 0;
	description	= "Komm mit.";
};

FUNC INT Info_Mod_Thorge_KommMit_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Turendil_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Genn_Matronen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorge_KommMit_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorge_KommMit_15_00"); //Komm mit.
	AI_Output(self, hero, "Info_Mod_Thorge_KommMit_13_01"); //In Ordnung.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOWPLAYER");
};

INSTANCE Info_Mod_Thorge_Pickpocket (C_INFO)
{
	npc		= Mod_1957_VMG_Thorge_MT;
	nr		= 1;
	condition	= Info_Mod_Thorge_Pickpocket_Condition;
	information	= Info_Mod_Thorge_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Thorge_Pickpocket_Condition()
{
	C_Beklauen	(58, ItMi_Gold, 180);
};

FUNC VOID Info_Mod_Thorge_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Thorge_Pickpocket);

	Info_AddChoice	(Info_Mod_Thorge_Pickpocket, DIALOG_BACK, Info_Mod_Thorge_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Thorge_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Thorge_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Thorge_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Thorge_Pickpocket);
};

FUNC VOID Info_Mod_Thorge_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Thorge_Pickpocket);
};

INSTANCE Info_Mod_Thorge_EXIT (C_INFO)
{
	npc		= Mod_1957_VMG_Thorge_MT;
	nr		= 1;
	condition	= Info_Mod_Thorge_EXIT_Condition;
	information	= Info_Mod_Thorge_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Thorge_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Thorge_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};