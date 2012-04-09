INSTANCE Info_Mod_Unbekannter_LetsFight (C_INFO)
{
	npc		= Mod_1872_NONE_Unbekannt_MT;
	nr		= 1;
	condition	= Info_Mod_Unbekannter_LetsFight_Condition;
	information	= Info_Mod_Unbekannter_LetsFight_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Unbekannter_LetsFight_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Scatty_WannaFightUB_AK))
	&& (Mod_Unbekannter_Fight == 0)
	&& (Mod_GorKarantoSchwach == 3)
	&& (Npc_GetDistToWP(self, self.wp) < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Unbekannter_LetsFight_Info()
{
	AI_Output(self, hero, "Info_Mod_Unbekannter_LetsFight_05_00"); //Dich mach ich fertig.

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_NONE, 0);

	Mod_Unbekannter_Fight = 1;

	self.flags = 0;
};

INSTANCE Info_Mod_Unbekannter_LetsFight_2 (C_INFO)
{
	npc		= Mod_1872_NONE_Unbekannt_MT;
	nr		= 1;
	condition	= Info_Mod_Unbekannter_LetsFight_2_Condition;
	information	= Info_Mod_Unbekannter_LetsFight_2_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Unbekannter_LetsFight_2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Scatty_WannaFightUB_AK_2))
	&& (Mod_Unbekannter_Fight == 0)
	&& (Mod_GorKarantoSchwach == 8)
	&& (Npc_GetDistToWP(self, self.wp) < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Unbekannter_LetsFight_2_Info()
{
	AI_Output(self, hero, "Info_Mod_Unbekannter_LetsFight_2_05_00"); //Du schon wieder? Denkst du, du hast jetzt eine Chance?

	AI_StopProcessInfos	(self);

	B_SetAttributesToChapter (self, 2);

	self.aivar[AIV_Schwierigkeitsgrad] = 0;

	B_SetSchwierigkeit();

	Mod_Unbekannter_Fight = 1;

	B_Attack	(self, hero, AR_NONE, 0);

	self.flags = 0;
};

INSTANCE Info_Mod_Unbekannter_EXIT (C_INFO)
{
	npc		= Mod_1872_NONE_Unbekannt_MT;
	nr		= 1;
	condition	= Info_Mod_Unbekannter_EXIT_Condition;
	information	= Info_Mod_Unbekannter_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Unbekannter_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Unbekannter_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};