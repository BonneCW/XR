INSTANCE Info_Mod_HSBuerger_02_Orakel (C_INFO)
{
	npc		= Mod_7597_HS_Hofstaatler_REL;
	nr		= 1;
	condition	= Info_Mod_HSBuerger_02_Orakel_Condition;
	information	= Info_Mod_HSBuerger_02_Orakel_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich bin auf der Suche nach dem Orakel.";
};

FUNC INT Info_Mod_HSBuerger_02_Orakel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatRaufbold_KoenigHilfe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HSBuerger_02_Orakel_Info()
{
	AI_Output(hero, self, "Info_Mod_HSBuerger_02_Orakel_15_00"); //Ich bin auf der Suche nach dem Orakel.
	AI_Output(self, hero, "Info_Mod_HSBuerger_02_Orakel_06_01"); //Orakel? Sowas gibt es hier nicht. Du solltest das königliche Orakel fragen, wo du eines findest, das ist ziemlich klug.
	AI_Output(hero, self, "Info_Mod_HSBuerger_02_Orakel_15_02"); //Und wo ist das königliche Orakel?
	AI_Output(self, hero, "Info_Mod_HSBuerger_02_Orakel_06_03"); //Da musst du einen Termin bei dem königlichen Arsch ausmachen.
};

INSTANCE Info_Mod_HSBuerger_02_Teleport (C_INFO)
{
	npc		= Mod_7597_HS_Hofstaatler_REL;
	nr		= 1;
	condition	= Info_Mod_HSBuerger_02_Teleport_Condition;
	information	= Info_Mod_HSBuerger_02_Teleport_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich suche einen kurzen Weg in den Sumpf, kennst du einen?";
};

FUNC INT Info_Mod_HSBuerger_02_Teleport_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatKoenig_Gemaelde))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HSBuerger_02_Teleport_Info()
{
	AI_Output(hero, self, "Info_Mod_HSBuerger_02_Teleport_15_00"); //Ich suche einen kurzen Weg in den Sumpf, kennst du einen?
	AI_Output(self, hero, "Info_Mod_HSBuerger_02_Teleport_06_01"); //Lass mich in Ruhe mit deinem Psycho-Scheiß!
};

INSTANCE Info_Mod_HSBuerger_02_Pickpocket (C_INFO)
{
	npc		= Mod_7597_HS_Hofstaatler_REL;
	nr		= 1;
	condition	= Info_Mod_HSBuerger_02_Pickpocket_Condition;
	information	= Info_Mod_HSBuerger_02_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_HSBuerger_02_Pickpocket_Condition()
{
	C_Beklauen	(13, ItMi_Gold, 40);
};

FUNC VOID Info_Mod_HSBuerger_02_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HSBuerger_02_Pickpocket);

	Info_AddChoice	(Info_Mod_HSBuerger_02_Pickpocket, DIALOG_BACK, Info_Mod_HSBuerger_02_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HSBuerger_02_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HSBuerger_02_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HSBuerger_02_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HSBuerger_02_Pickpocket);
};

FUNC VOID Info_Mod_HSBuerger_02_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_HSBuerger_02_Pickpocket);
};

INSTANCE Info_Mod_HSBuerger_02_EXIT (C_INFO)
{
	npc		= Mod_7597_HS_Hofstaatler_REL;
	nr		= 1;
	condition	= Info_Mod_HSBuerger_02_EXIT_Condition;
	information	= Info_Mod_HSBuerger_02_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HSBuerger_02_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HSBuerger_02_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};