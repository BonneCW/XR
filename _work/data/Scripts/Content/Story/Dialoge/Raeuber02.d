INSTANCE Info_Mod_Raeuber02_Hi (C_INFO)
{
	npc		= Mod_7511_OUT_Raeuber_REL;
	nr		= 1;
	condition	= Info_Mod_Raeuber02_Hi_Condition;
	information	= Info_Mod_Raeuber02_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie geht's?";
};

FUNC INT Info_Mod_Raeuber02_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Raeuber02_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Raeuber02_Hi_15_00"); //Wie geht's?
	AI_Output(self, hero, "Info_Mod_Raeuber02_Hi_06_01"); //Verpiss dich bloß.
};

INSTANCE Info_Mod_Raeuber02_Frauenkleider (C_INFO)
{
	npc		= Mod_7511_OUT_Raeuber_REL;
	nr		= 1;
	condition	= Info_Mod_Raeuber02_Frauenkleider_Condition;
	information	= Info_Mod_Raeuber02_Frauenkleider_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du schon Melvins Kleider gesehen?";
};

FUNC INT Info_Mod_Raeuber02_Frauenkleider_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raeuber02_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Melvin_Frauenkleider))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raeuber02_Frauenkleider_Info()
{
	AI_Output(hero, self, "Info_Mod_Raeuber02_Frauenkleider_15_00"); //Hast du schon Melvins ...
	AI_Output(self, hero, "Info_Mod_Raeuber02_Frauenkleider_06_01"); //... neue Kleidung bemerkt, Witzbold? Hab ich etwa so schlechte Augen wie Hans?
	AI_Output(hero, self, "Info_Mod_Raeuber02_Frauenkleider_15_02"); //Was meinst du dazu?
	AI_Output(self, hero, "Info_Mod_Raeuber02_Frauenkleider_06_03"); //Das werd ich ihm gleich mal persönlich sagen.

	AI_StandUp	(self);

	AI_GotoNpc	(self, Mod_7505_BDT_Melvin_REL);

	AI_TurnToNpc	(self, Mod_7505_BDT_Melvin_REL);

	AI_Output(self, hero, "Info_Mod_Raeuber02_Frauenkleider_06_04"); //Du bist eine Schande für alle Räuber!

	Mod_REL_Frauenkleider02 = 1;

	if (Mod_REL_Frauenkleider01 == 1)
	&& (Mod_REL_Frauenkleider02 == 1)
	&& (Mod_REL_Frauenkleider03 == 1)
	{
		B_LogEntry	(TOPIC_MOD_KHORATA_FRAUENKLEIDER, "Nun sollte Melvin weichgeklopft sein.");
	};

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Raeuber02_Bierhexen (C_INFO)
{
	npc		= Mod_7511_OUT_Raeuber_REL;
	nr		= 1;
	condition	= Info_Mod_Raeuber02_Bierhexen_Condition;
	information	= Info_Mod_Raeuber02_Bierhexen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Raeuber02_Bierhexen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raeuber01_Bierhexen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raeuber02_Bierhexen_Info()
{
	AI_Output(self, hero, "Info_Mod_Raeuber02_Bierhexen_06_00"); //Bist du dumm?

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Raeuber02_Pickpocket (C_INFO)
{
	npc		= Mod_7511_OUT_Raeuber_REL;
	nr		= 1;
	condition	= Info_Mod_Raeuber02_Pickpocket_Condition;
	information	= Info_Mod_Raeuber02_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Raeuber02_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Raeuber02_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Raeuber02_Pickpocket);

	Info_AddChoice	(Info_Mod_Raeuber02_Pickpocket, DIALOG_BACK, Info_Mod_Raeuber02_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Raeuber02_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Raeuber02_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Raeuber02_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Raeuber02_Pickpocket);
};

FUNC VOID Info_Mod_Raeuber02_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Raeuber02_Pickpocket);
};

INSTANCE Info_Mod_Raeuber02_EXIT (C_INFO)
{
	npc		= Mod_7511_OUT_Raeuber_REL;
	nr		= 1;
	condition	= Info_Mod_Raeuber02_EXIT_Condition;
	information	= Info_Mod_Raeuber02_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Raeuber02_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Raeuber02_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};