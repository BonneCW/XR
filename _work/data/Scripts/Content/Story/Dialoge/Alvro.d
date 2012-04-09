INSTANCE Info_Mod_Alvro_Hi (C_INFO)
{
	npc		= Mod_185_NONE_Alvro_NW;
	nr		= 1;
	condition	= Info_Mod_Alvro_Hi_Condition;
	information	= Info_Mod_Alvro_Hi_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Alvro_Hi_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Kardif_Melasse))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alvro_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Alvro_Hi_02_00"); //Verschwinde!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Alvro_Melasse (C_INFO)
{
	npc		= Mod_185_NONE_Alvro_NW;
	nr		= 1;
	condition	= Info_Mod_Alvro_Melasse_Condition;
	information	= Info_Mod_Alvro_Melasse_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab gehört du hast Melasse.";
};

FUNC INT Info_Mod_Alvro_Melasse_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Melasse))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alvro_Melasse_Info()
{
	AI_Output(hero, self, "Info_Mod_Alvro_Melasse_15_00"); //Ich hab' gehört, du hast Melasse.
	AI_Output(self, hero, "Info_Mod_Alvro_Melasse_02_01"); //Das geht dich nichts an!
	AI_Output(hero, self, "Info_Mod_Alvro_Melasse_15_02"); //Ich bin Pirat und brauch das Zeug.
	AI_Output(self, hero, "Info_Mod_Alvro_Melasse_02_03"); //(überrascht) Du bist Pirat?
	AI_Output(hero, self, "Info_Mod_Alvro_Melasse_15_04"); //Allerdings, also rück jetzt die Melasse raus.
	AI_Output(self, hero, "Info_MOd_Alvro_Melasse_02_05"); //I-Ich k-kann nicht.

	CreateInvItems	(self, ItFo_Melasse, 15);
	CreateInvItems	(self, Mod_BillsRumRezept, 1);

	B_LogEntry	(TOPIC_MOD_SAMUEL_RUM, "Alvro will mir die Melasse nicht freiwillig geben und greift mich stattdessen an. Er lässt mir keine Wahl ...");

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};

INSTANCE Info_Mod_Alvro_Pickpocket (C_INFO)
{
	npc		= Mod_185_NONE_Alvro_NW;
	nr		= 1;
	condition	= Info_Mod_Alvro_Pickpocket_Condition;
	information	= Info_Mod_Alvro_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Alvro_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 150);
};

FUNC VOID Info_Mod_Alvro_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Alvro_Pickpocket);

	Info_AddChoice	(Info_Mod_Alvro_Pickpocket, DIALOG_BACK, Info_Mod_Alvro_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Alvro_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Alvro_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Alvro_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Alvro_Pickpocket);
};

FUNC VOID Info_Mod_Alvro_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Alvro_Pickpocket);
};

INSTANCE Info_Mod_Alvro_EXIT (C_INFO)
{
	npc		= Mod_185_NONE_Alvro_NW;
	nr		= 1;
	condition	= Info_Mod_Alvro_EXIT_Condition;
	information	= Info_Mod_Alvro_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Alvro_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alvro_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};