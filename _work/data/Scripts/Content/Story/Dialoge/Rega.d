INSTANCE Info_Mod_Rega_Unheil (C_INFO)
{
	npc		= Mod_104_BAU_Rega_NW;
	nr		= 1;
	condition	= Info_Mod_Rega_Unheil_Condition;
	information	= Info_Mod_Rega_Unheil_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo schönes Kind.";
};

FUNC INT Info_Mod_Rega_Unheil_Condition()
{
	if (Mod_WM_Boeden == 14)
	|| (Mod_WM_Boeden == 13)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rega_Unheil_Info()
{
	AI_Output(hero, self, "Info_Mod_Rega_Unheil_15_00"); //Hallo schönes Kind.
	AI_Output(self, hero, "Info_Mod_Rega_Unheil_17_01"); //Hallo Wanderer? Was verschlägt euch an diesen finsteren Tagen hierhin?
	AI_Output(hero, self, "Info_Mod_Rega_Unheil_15_02"); //Och, ich wollte mich nur etwas umsehen und fragen, ob etwas Ungewohntes in den letzten Tagen und Wochen hier passiert ist.
	AI_Output(self, hero, "Info_Mod_Rega_Unheil_17_03"); //Ach, es ist einfach schrecklich. Dem Hof ist es dieses Jahr mehr als schlecht ergangen. Und jetzt noch diese Untoten auf dem Friedhof.
	AI_Output(self, hero, "Info_Mod_Rega_Unheil_17_04"); //Nimm es dann anderen nicht übel, wenn sie etwas unfreundlich erscheinen sollten. Aber diese Tage ist es sehr schwer.
};

INSTANCE Info_Mod_Rega_Pickpocket (C_INFO)
{
	npc		= Mod_104_BAU_Rega_NW;
	nr		= 1;
	condition	= Info_Mod_Rega_Pickpocket_Condition;
	information	= Info_Mod_Rega_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_40_Female;
};

FUNC INT Info_Mod_Rega_Pickpocket_Condition()
{
	C_Beklauen	(26, ItMi_Gold, 30);
};

FUNC VOID Info_Mod_Rega_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Rega_Pickpocket);

	Info_AddChoice	(Info_Mod_Rega_Pickpocket, DIALOG_BACK, Info_Mod_Rega_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Rega_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Rega_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Rega_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Rega_Pickpocket);
};

FUNC VOID Info_Mod_Rega_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Rega_Pickpocket);
};

INSTANCE Info_Mod_Rega_EXIT (C_INFO)
{
	npc		= Mod_104_BAU_Rega_NW;
	nr		= 1;
	condition	= Info_Mod_Rega_EXIT_Condition;
	information	= Info_Mod_Rega_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Rega_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Rega_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};