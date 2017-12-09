INSTANCE Info_Mod_Echse_01_WeibchenFuetterung (C_INFO)
{
	npc		= Mod_12009_DRA_Echse_AW;
	nr		= 1;
	condition	= Info_Mod_Echse_01_WeibchenFuetterung_Condition;
	information	= Info_Mod_Echse_01_WeibchenFuetterung_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Echse_01_WeibchenFuetterung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albi_FokusEinsetzen))
	&& (Wld_GetDay() > Mod_Albi_VertrauensTag)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Echse_01_WeibchenFuetterung_Info()
{
	B_GiveInvItems	(self, hero, ItWr_EchsenQuest_01, 1);
};

INSTANCE Info_Mod_Echse_01_EXIT (C_INFO)
{
	npc		= Mod_12009_DRA_Echse_AW;
	nr		= 1;
	condition	= Info_Mod_Echse_01_EXIT_Condition;
	information	= Info_Mod_Echse_01_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Echse_01_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Echse_01_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};