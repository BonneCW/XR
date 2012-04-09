INSTANCE Info_Mod_HFFrau_Heiraten_01 (C_INFO)
{
	npc		= Mod_7271_OUT_HFFrau_REL;
	nr		= 1;
	condition	= Info_Mod_HFFrau_Heiraten_01_Condition;
	information	= Info_Mod_HFFrau_Heiraten_01_Info;
	permanent	= 0;
	important	= 0;
	description	= "Willst du mich heiraten?";
};

FUNC INT Info_Mod_HFFrau_Heiraten_01_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatTuersteher_Hi))
	&& (Mod_HS_DarfZuKing == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HFFrau_Heiraten_01_Info()
{
	B_Say (hero, self, "$WANNAMARRY");

	AI_Output(self, hero, "Info_Mod_HFFrau_Heiraten_01_16_01"); //Nein.
};

INSTANCE Info_Mod_HFFrau_Heiraten_02 (C_INFO)
{
	npc		= Mod_7271_OUT_HFFrau_REL;
	nr		= 1;
	condition	= Info_Mod_HFFrau_Heiraten_02_Condition;
	information	= Info_Mod_HFFrau_Heiraten_02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du bist die Frau des Hundefutters?";
};

FUNC INT Info_Mod_HFFrau_Heiraten_02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HFFrau_Heiraten_01))
	&& (Npc_HasItems(hero, ItFo_Trunken) > 0)
	&& (Mod_Sekte_Verheiratet == 0)
	&& (Mod_HSBook == 1)
	&& (Mod_HS_DarfZuKing == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HFFrau_Heiraten_02_Info()
{
	AI_Output(self, hero, "Info_Mod_HFFrau_Heiraten_02_15_00"); //Du bist die Frau des Hundefutters?
	AI_Output(self, hero, "Info_Mod_HFFrau_Heiraten_02_16_01"); //Ja ...
	AI_Output(self, hero, "Info_Mod_HFFrau_Heiraten_02_16_02"); //... das heißt, ich war es.
	AI_Output(self, hero, "Info_Mod_HFFrau_Heiraten_02_15_03"); //Dein Verlust tut mir schrecklich Leid. Willst du ein bisschen Freudenspender zum Trost.
	AI_Output(self, hero, "Info_Mod_HFFrau_Heiraten_02_16_04"); //Ja ... gerne.

	B_GiveInvItems	(hero, self, ItFo_Trunken, 1);

	B_UseItem	(self, ItFo_Trunken);

	AI_Output(self, hero, "Info_Mod_HFFrau_Heiraten_02_15_05"); //Jetzt, da du Single bist, würdest du mich gerne heiraten?
	AI_Output(self, hero, "Info_Mod_HFFrau_Heiraten_02_16_06"); //Heiraten? Ja ... aber ich heirate nur noch jemanden der seinen eigenen Grund besitzt ... Tust du das?
};

INSTANCE Info_Mod_HFFrau_Heiraten_03 (C_INFO)
{
	npc		= Mod_7271_OUT_HFFrau_REL;
	nr		= 1;
	condition	= Info_Mod_HFFrau_Heiraten_03_Condition;
	information	= Info_Mod_HFFrau_Heiraten_03_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe ein Haus.";
};

FUNC INT Info_Mod_HFFrau_Heiraten_03_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HFFrau_Heiraten_02))
	&& (Mod_Sekte_Verheiratet == 0)
	&& (Mod_HSBook == 1)
	&& ((Mod_Sekte_WeiberheldHaus == 1)
	|| (Mod_Sekte_TraderHaus01 == 1)
	|| (Mod_Sekte_TraderHaus02 == 1))
	&& (Mod_HS_DarfZuKing == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HFFrau_Heiraten_03_Info()
{
	AI_Output(self, hero, "Info_Mod_HFFrau_Heiraten_03_15_00"); //Ich habe ein Haus.
	AI_Output(self, hero, "Info_Mod_HFFrau_Heiraten_03_16_01"); //Wunderbar, dann lass uns heiraten!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_7270_OUT_Weiberheld_REL, "HFFRAU");

	AI_Teleport	(Mod_7270_OUT_Weiberheld_REL, "REL_230");
};

INSTANCE Info_Mod_HFFrau_Pickpocket (C_INFO)
{
	npc		= Mod_7271_OUT_HFFrau_REL;
	nr		= 1;
	condition	= Info_Mod_HFFrau_Pickpocket_Condition;
	information	= Info_Mod_HFFrau_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_HFFrau_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_HFFrau_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HFFrau_Pickpocket);

	Info_AddChoice	(Info_Mod_HFFrau_Pickpocket, DIALOG_BACK, Info_Mod_HFFrau_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HFFrau_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HFFrau_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HFFrau_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HFFrau_Pickpocket);
};

FUNC VOID Info_Mod_HFFrau_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_HFFrau_Pickpocket);
};

INSTANCE Info_Mod_HFFrau_EXIT (C_INFO)
{
	npc		= Mod_7271_OUT_HFFrau_REL;
	nr		= 1;
	condition	= Info_Mod_HFFrau_EXIT_Condition;
	information	= Info_Mod_HFFrau_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HFFrau_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HFFrau_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};