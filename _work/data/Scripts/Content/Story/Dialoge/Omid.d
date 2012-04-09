INSTANCE Info_Mod_Omid_Urs (C_INFO)
{
	npc		= Mod_1172_STT_Omid_MT;
	nr		= 1;
	condition	= Info_Mod_Omid_Urs_Condition;
	information	= Info_Mod_Omid_Urs_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo Koch. Ich habe hier was Nettes für deine Küche.";
};

FUNC INT Info_Mod_Omid_Urs_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Urs_Hi))
	&& (Npc_HasItems(hero, ItMi_MagischePfanne) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Omid_Urs_Info()
{
	AI_Output(hero, self, "Info_Mod_Omid_Urs_15_00"); //Hallo Koch. Ich habe hier was Nettes für deine Küche. Diese lodernde Pfanne.
	AI_Output(self, hero, "Info_Mod_Omid_Urs_02_01"); //(überrascht) Hä, wie?
	AI_Output(hero, self, "Info_Mod_Omid_Urs_15_02"); //Hier, schau.

	B_GiveInvItems	(hero, self, ItMi_MagischePfanne, 1);

	AI_Output(self, hero, "Info_Mod_Omid_Urs_02_03"); //Die Pfanne ... heiß? Kann es wirklich sein ...?

	B_UseItem	(self, ItMi_MagischePfanne);

	AI_Output(self, hero, "Info_Mod_Omid_Urs_02_04"); //(verblüfft) Tatsächlich. Hätte nicht geglaubt, dass Urs das wirklich hinbekommt. Alle Achtung.
	AI_Output(self, hero, "Info_Mod_Omid_Urs_02_05"); //Das wird mir die Arbeit um einiges Erleichtern und den Gaumen der Erzbarone erfreuen. Hier, nimm, 500 Goldmünzen. Das ist sie mir Wert.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	B_GivePlayerXP	(200);

	B_LogEntry	(TOPIC_MOD_URS_HUND, "Omid hat seine Pfanne und ich 500 Münzen.");
};

INSTANCE Info_Mod_Omid_Pickpocket (C_INFO)
{
	npc		= Mod_1172_STT_Omid_MT;
	nr		= 1;
	condition	= Info_Mod_Omid_Pickpocket_Condition;
	information	= Info_Mod_Omid_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Omid_Pickpocket_Condition()
{
	C_Beklauen	(46, ItMi_Gold, 150);
};

FUNC VOID Info_Mod_Omid_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Omid_Pickpocket);

	Info_AddChoice	(Info_Mod_Omid_Pickpocket, DIALOG_BACK, Info_Mod_Omid_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Omid_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Omid_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Omid_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Omid_Pickpocket);
};

FUNC VOID Info_Mod_Omid_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Omid_Pickpocket);
};

INSTANCE Info_Mod_Omid_EXIT (C_INFO)
{
	npc		= Mod_1172_STT_Omid_MT;
	nr		= 1;
	condition	= Info_Mod_Omid_EXIT_Condition;
	information	= Info_Mod_Omid_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Omid_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Omid_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};