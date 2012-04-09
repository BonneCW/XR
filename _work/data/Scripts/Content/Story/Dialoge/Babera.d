INSTANCE Info_Mod_Babera_Unheil (C_INFO)
{
	npc		= Mod_102_BAU_Babera_NW;
	nr		= 1;
	condition	= Info_Mod_Babera_Unheil_Condition;
	information	= Info_Mod_Babera_Unheil_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo schönes Kind.";
};

FUNC INT Info_Mod_Babera_Unheil_Condition()
{
	if (Mod_WM_Boeden == 14)
	|| (Mod_WM_Boeden == 13)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Babera_Unheil_Info()
{
	AI_Output(hero, self, "Info_Mod_Babera_Unheil_15_00"); //Hallo schönes Kind.
	AI_Output(self, hero, "Info_Mod_Babera_Unheil_16_01"); //Süßholzraspeln ist bei mir nicht. Schon gar nicht im Moment.
	AI_Output(self, hero, "Info_Mod_Babera_Unheil_16_02"); //Ahh, diese verdammten Rückenschmerzen sind viel schlimmer geworden. Ich könnte die Wände hochlaufen ...

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Babera hat starke Rückenschmerzen seit einiger Zeit.");

	Mod_HinweiseDerBauernZuHexen += 1;
};

INSTANCE Info_Mod_Babera_Pickpocket (C_INFO)
{
	npc		= Mod_102_BAU_Babera_NW;
	nr		= 1;
	condition	= Info_Mod_Babera_Pickpocket_Condition;
	information	= Info_Mod_Babera_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20_Female;
};

FUNC INT Info_Mod_Babera_Pickpocket_Condition()
{
	C_Beklauen	(16, ItMi_Gold, 20);
};

FUNC VOID Info_Mod_Babera_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Babera_Pickpocket);

	Info_AddChoice	(Info_Mod_Babera_Pickpocket, DIALOG_BACK, Info_Mod_Babera_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Babera_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Babera_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Babera_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Babera_Pickpocket);
};

FUNC VOID Info_Mod_Babera_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Babera_Pickpocket);
};

INSTANCE Info_Mod_Babera_EXIT (C_INFO)
{
	npc		= Mod_102_BAU_Babera_NW;
	nr		= 1;
	condition	= Info_Mod_Babera_EXIT_Condition;
	information	= Info_Mod_Babera_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Babera_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Babera_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};