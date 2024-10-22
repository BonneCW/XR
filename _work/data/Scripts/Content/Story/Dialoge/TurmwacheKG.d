INSTANCE Info_Mod_TurmwacheKG_Trollholz (C_INFO)
{
	npc		= Mod_1023_KGD_Turmwache_MT;
	nr		= 1;
	condition	= Info_Mod_TurmwacheKG_Trollholz_Condition;
	information	= Info_Mod_TurmwacheKG_Trollholz_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du zufällig noch ein Keilerfell übrig?";
};

FUNC INT Info_Mod_TurmwacheKG_Trollholz_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cathran_Trollholz))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Cathran_Trollholz2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_TurmwacheKG_Trollholz_Info()
{
	AI_Output(hero, self, "Info_Mod_TurmwacheKG_Trollholz_15_00"); //Hast du zufällig noch ein Keilerfell übrig?
	AI_Output(self, hero, "Info_Mod_TurmwacheKG_Trollholz_03_01"); //Ja, ist allerdings schon ziemlich ausgefranst.
	AI_Output(self, hero, "Info_Mod_TurmwacheKG_Trollholz_03_02"); //Hier du kannst es haben, Wolfsfelle halten sowieso besser warm.

	B_GiveInvItems	(self, hero, ItAt_Addon_KeilerFur, 1);

	B_LogEntry	(TOPIC_MOD_KG_TROLLHOLZ, "Ich hab das Keilerfell. Auf zu Cathran.");
};

INSTANCE Info_Mod_TurmwacheKG_EXIT (C_INFO)
{
	npc		= Mod_1023_KGD_Turmwache_MT;
	nr		= 1;
	condition	= Info_Mod_TurmwacheKG_EXIT_Condition;
	information	= Info_Mod_TurmwacheKG_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_TurmwacheKG_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_TurmwacheKG_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};