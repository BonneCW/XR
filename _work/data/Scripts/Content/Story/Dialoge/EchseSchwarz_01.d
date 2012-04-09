INSTANCE Info_Mod_EchseSchwarz_01_Sumpfhaizahn (C_INFO)
{
	npc		= Mod_12001_DRA_Wache_AW;
	nr		= 1;
	condition	= Info_Mod_EchseSchwarz_01_Sumpfhaizahn_Condition;
	information	= Info_Mod_EchseSchwarz_01_Sumpfhaizahn_Info;
	permanent	= 0;
	important	= 0;
	description	= "(Sumpfhaizahn geben)";
};

FUNC INT Info_Mod_EchseSchwarz_01_Sumpfhaizahn_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albi_Kap4Stab))
	&& (Npc_HasItems(hero, ItAt_SharkTeeth) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_EchseSchwarz_01_Sumpfhaizahn_Info()
{
	B_GiveInvItems	(hero, self, ItAt_SharkTeeth, 1);

	Mod_ECHSI_SumpfhaiZaehne += 1;

	if (Mod_ECHSI_SumpfhaiZaehne == 5)
	{
		B_LogEntry	(TOPIC_MOD_ECHSEN_SCHLACHT, "Jede schwarze Echse hat nun einen Sumpfhaizahn bekommen.");
	};
};

INSTANCE Info_Mod_EchseSchwarz_01_EXIT (C_INFO)
{
	npc		= Mod_12001_DRA_Wache_AW;
	nr		= 1;
	condition	= Info_Mod_EchseSchwarz_01_EXIT_Condition;
	information	= Info_Mod_EchseSchwarz_01_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_EchseSchwarz_01_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_EchseSchwarz_01_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};