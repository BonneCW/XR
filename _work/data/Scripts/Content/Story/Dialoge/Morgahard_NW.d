INSTANCE Info_Mod_Morgahard_NW_Hi (C_INFO)
{
	npc		= Mod_1928_BDT_Morgahard_NW;
	nr		= 1;
	condition	= Info_Mod_Morgahard_NW_Hi_Condition;
	information	= Info_Mod_Morgahard_NW_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Könntest du uns etwas organisieren?";
};

FUNC INT Info_Mod_Morgahard_NW_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Esteban_NW_MorgahardDarfWieder))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Morgahard_NW_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Morgahard_NW_Hi_15_00"); //Könntest du uns etwas organisieren?
	AI_Output(self, hero, "Info_Mod_Morgahard_NW_Hi_07_01"); //Ja, ich habe uns ein Lagerhaus im Hafen besorgt. Komm, ich kann es dir zeigen.

	B_StartOtherRoutine	(self, "GUIDETOLAGERHAUS");
	B_StartOtherRoutine	(Mod_1926_BDT_Esteban_NW, "TOT");

	Wld_InsertNpc	(Mod_1929_GRD_Gardist_NW, "HAFEN");
	Wld_InsertNpc	(Mod_1930_GRD_Gardist_NW, "HAFEN");
};

INSTANCE Info_Mod_Morgahard_NW_AtLagerhaus (C_INFO)
{
	npc		= Mod_1928_BDT_Morgahard_NW;
	nr		= 1;
	condition	= Info_Mod_Morgahard_NW_AtLagerhaus_Condition;
	information	= Info_Mod_Morgahard_NW_AtLagerhaus_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Morgahard_NW_AtLagerhaus_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morgahard_NW_Hi))
	&& (Npc_GetDistToWP(self, "NW_CITY_HABOUR_KASERN_01") < 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Morgahard_NW_AtLagerhaus_Info()
{
	AI_Output(self, hero, "Info_Mod_Morgahard_NW_AtLagerhaus_07_00"); //Whistler hat seine Leute gleich hierher geschickt.
	AI_Output(hero, self, "Info_Mod_Morgahard_NW_AtLagerhaus_15_01"); //Und was habe ich jetzt zu tun?
	AI_Output(self, hero, "Info_Mod_Morgahard_NW_AtLagerhaus_07_02"); //Frag einmal Whistler, er verwaltet das ganze.

	B_StartOtherRoutine	(self, "ATLAGERHAUS");
	B_StartOtherRoutine	(Mod_1927_STT_Whistler_NW, "STADT");
};

INSTANCE Info_Mod_Morgahard_NW_Pickpocket (C_INFO)
{
	npc		= Mod_1928_BDT_Morgahard_NW;
	nr		= 1;
	condition	= Info_Mod_Morgahard_NW_Pickpocket_Condition;
	information	= Info_Mod_Morgahard_NW_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Morgahard_NW_Pickpocket_Condition()
{
	C_Beklauen	(78, ItMi_Gold, 310);
};

FUNC VOID Info_Mod_Morgahard_NW_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Morgahard_NW_Pickpocket);

	Info_AddChoice	(Info_Mod_Morgahard_NW_Pickpocket, DIALOG_BACK, Info_Mod_Morgahard_NW_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Morgahard_NW_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Morgahard_NW_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Morgahard_NW_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Morgahard_NW_Pickpocket);
};

FUNC VOID Info_Mod_Morgahard_NW_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Morgahard_NW_Pickpocket);
};

INSTANCE Info_Mod_Morgahard_NW_EXIT (C_INFO)
{
	npc		= Mod_1928_BDT_Morgahard_NW;
	nr		= 1;
	condition	= Info_Mod_Morgahard_NW_EXIT_Condition;
	information	= Info_Mod_Morgahard_NW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Morgahard_NW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Morgahard_NW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};