INSTANCE Info_Mod_Jason_Aabid (C_INFO)
{
	npc		= Mod_1178_MIL_Jason_NW;
	nr		= 1;
	condition	= Info_Mod_Jason_Aabid_Condition;
	information	= Info_Mod_Jason_Aabid_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich komme von Aabid wegen ...";
};

FUNC INT Info_Mod_Jason_Aabid_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Aabid_Aufgabe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jason_Aabid_Info()
{
	AI_Output(hero, self, "Info_Mod_Jason_Aabid_15_00"); //Ich komme von Aabid wegen ...
	AI_Output(self, hero, "Info_Mod_Jason_Aabid_06_01"); //(wütend) Psssssssssst!
	AI_Output(hero, self, "Info_Mod_Jason_Aabid_15_02"); //(verwirrt) Was ...?
	AI_Output(self, hero, "Info_Mod_Jason_Aabid_06_03"); //(verärgert) Hier ist es und nun verschwinde!

	B_GiveInvItems	(self, hero, ItMi_HerbPaket, 1);

	AI_Output(hero, self, "Info_Mod_Jason_Aabid_15_04"); //Ähm ... ok.

	B_LogEntry	(TOPIC_MOD_ASS_AABID_PAKET, "Jason war ziemlich komisch drauf und gab mir ohne viele Worte sein Paket. Woran liegt's nur?");

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Jason_Pickpocket (C_INFO)
{
	npc		= Mod_1178_MIL_Jason_NW;
	nr		= 1;
	condition	= Info_Mod_Jason_Pickpocket_Condition;
	information	= Info_Mod_Jason_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Jason_Pickpocket_Condition()
{
	C_Beklauen	(65, ItMi_Gold, 200);
};

FUNC VOID Info_Mod_Jason_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Jason_Pickpocket);

	Info_AddChoice	(Info_Mod_Jason_Pickpocket, DIALOG_BACK, Info_Mod_Jason_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Jason_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Jason_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Jason_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Jason_Pickpocket);
};

FUNC VOID Info_Mod_Jason_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Jason_Pickpocket);
};

INSTANCE Info_Mod_Jason_EXIT (C_INFO)
{
	npc		= Mod_1178_MIL_Jason_NW;
	nr		= 1;
	condition	= Info_Mod_Jason_EXIT_Condition;
	information	= Info_Mod_Jason_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Jason_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Jason_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};