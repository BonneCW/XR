INSTANCE Info_Mod_JungeEchse_01_ZettelZeigen (C_INFO)
{
	npc		= Mod_12012_DRA_Echse_AW;
	nr		= 1;
	condition	= Info_Mod_JungeEchse_01_ZettelZeigen_Condition;
	information	= Info_Mod_JungeEchse_01_ZettelZeigen_Info;
	permanent	= 0;
	important	= 0;
	description	= "(Zettel zeigen)";
};

FUNC INT Info_Mod_JungeEchse_01_ZettelZeigen_Condition()
{
	if (Mod_EchsenQuest_03 > 0)
	&& (Mod_EchsenQuest_03 < 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_JungeEchse_01_ZettelZeigen_Info()
{
	B_UseFakescroll ();

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOWWSS");

	self.aivar[AIV_Partymember] = TRUE;

	Mod_EchsenQuest_03 += 1;

	if (Mod_EchsenQuest_03 == 5)
	{
		Mod_EchsenQuest_03 = 6;

		B_LogEntry	(TOPIC_MOD_ECHSEN_SUMPFHAIFINDEN, "Die vier Echsen habe ich eingesammelt, jetzt auf in den Sumpf und nach einem weißen Sumphai suchen.");

		Wld_InsertNpc	(Swampshark_Weiss, "ADW_SHARK_09");
	};
};

INSTANCE Info_Mod_JungeEchse_01_EXIT (C_INFO)
{
	npc		= Mod_12012_DRA_Echse_AW;
	nr		= 1;
	condition	= Info_Mod_JungeEchse_01_EXIT_Condition;
	information	= Info_Mod_JungeEchse_01_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_JungeEchse_01_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_JungeEchse_01_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};