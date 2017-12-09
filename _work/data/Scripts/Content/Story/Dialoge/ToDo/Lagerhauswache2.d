INSTANCE Info_Mod_Lagerhauswache2_Fresssack (C_INFO)
{
	npc		= Mod_7710_OUT_Lagerhauswache_REL;
	nr		= 1;
	condition	= Info_Mod_Lagerhauswache2_Fresssack_Condition;
	information	= Info_Mod_Lagerhauswache2_Fresssack_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lagerhauswache2_Fresssack_Condition()
{
	if (Npc_HasItems(hero, ItMi_Fresssack) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lagerhauswache2_Fresssack_Info()
{
	AI_Output(self, hero, "Info_Mod_Lagerhauswache2_Fresssack_12_00"); //He, reinbringen sollst du die Sachen, nicht hinaus. Blödes Arbeiterpack.

	Npc_RemoveInvItems	(hero, ItMi_Fresssack, 1);

	Wld_InsertItem	(ItMi_Fresssack, "FP_ITEM_JIM_DROGEN");
};

INSTANCE Info_Mod_Lagerhauswache2_Schichtende (C_INFO)
{
	npc		= Mod_7710_OUT_Lagerhauswache_REL;
	nr		= 1;
	condition	= Info_Mod_Lagerhauswache2_Schichtende_Condition;
	information	= Info_Mod_Lagerhauswache2_Schichtende_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lagerhauswache2_Schichtende_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ramirez_REL_Lagerhaus))
	&& (Wld_IsTime(17,00,19,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lagerhauswache2_Schichtende_Info()
{
	AI_Output(self, hero, "Info_Mod_Lagerhauswache2_Schichtende_12_00"); //(ruft zum anderen) He. In paar Minuten ist endlich Feierabend. Ich sauf heut mindestens 10 Humpen weg.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Lagerhauswache2_Schichtende2 (C_INFO)
{
	npc		= Mod_7710_OUT_Lagerhauswache_REL;
	nr		= 1;
	condition	= Info_Mod_Lagerhauswache2_Schichtende2_Condition;
	information	= Info_Mod_Lagerhauswache2_Schichtende2_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Lagerhauswache2_Schichtende2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ramirez_REL_Lagerhaus))
	&& (!C_BodyStateContains(hero, BS_MOBINTERACT))
	&& (Npc_GetDistToWP(self, "REL_CITY_144") < 750)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Wld_IsTime(19,00,06,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lagerhauswache2_Schichtende2_Info()
{
	AI_Output(self, hero, "Info_Mod_Lagerhauswache2_Schichtende2_12_00"); //Los, alles raus. Morgen dürft ihr weiterschuften.

	Npc_SetRefuseTalk (self, 30);

	AI_StopProcessInfos	(self);

	AI_GotoWP	(hero, "REL_CITY_394");
};

INSTANCE Info_Mod_Lagerhauswache2_EXIT (C_INFO)
{
	npc		= Mod_7710_OUT_Lagerhauswache_REL;
	nr		= 1;
	condition	= Info_Mod_Lagerhauswache2_EXIT_Condition;
	information	= Info_Mod_Lagerhauswache2_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Lagerhauswache2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lagerhauswache2_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};