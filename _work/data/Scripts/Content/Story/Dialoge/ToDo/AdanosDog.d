INSTANCE Info_Mod_AdanosDog_Hi (C_INFO)
{
	npc		= AdanosDog;
	nr		= 1;
	condition	= Info_Mod_AdanosDog_Hi_Condition;
	information	= Info_Mod_AdanosDog_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ähh, ich glaube nicht, dass du derjenige bist, mit dem ich sprechen will.";
};

FUNC INT Info_Mod_AdanosDog_Hi_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_AdanosDog_Kristall))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_AdanosDog_Hi_Info()
{
	B_Say	(hero, self, "$GODLYBOTE01");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");

	AI_Teleport	(self, "TOT");
};

INSTANCE Info_Mod_AdanosDog_Kristall (C_INFO)
{
	npc		= AdanosDog;
	nr		= 1;
	condition	= Info_Mod_AdanosDog_Kristall_Condition;
	information	= Info_Mod_AdanosDog_Kristall_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ähh, bist du zufällig ein göttlicher Bote?";
};

FUNC INT Info_Mod_AdanosDog_Kristall_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_04))
	&& (Npc_HasItems(hero, ItMi_AbsorbKristall) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_AdanosDog_Kristall_Info()
{
	B_Say	(hero, self, "$GODLYBOTE02");

	B_Say_Dog_Wau();

	AI_Output(hero, self, "Info_Mod_AdanosDog_Kristall_15_02"); //Öhhm, könntest du dann zufällig dem Kristall unseres Herrn Adanos neue Kraft schenken?

	B_Say_Dog_Wuff();

	Npc_RemoveInvItems	(hero, ItMi_AbsorbKristall, 1);
	CreateInvItems	(hero, ItMi_AbsorbKristall2, 1);

	AI_Output(hero, self, "Info_Mod_AdanosDog_Kristall_15_03"); //Hab vielen Dank.

	B_GivePlayerXP	(2000);
};

INSTANCE Info_Mod_AdanosDog_Ende (C_INFO)
{
	npc		= AdanosDog;
	nr		= 1;
	condition	= Info_Mod_AdanosDog_Ende_Condition;
	information	= Info_Mod_AdanosDog_Ende_Info;
	permanent	= 0;
	important	= 0;
	description	= "Das war alles, was ich wollte.";
};

FUNC INT Info_Mod_AdanosDog_Ende_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_AdanosDog_Kristall))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_AdanosDog_Ende_Info()
{
	AI_Output(hero, self, "Info_Mod_AdanosDog_Ende_15_00"); //Das war alles, was ich wollte.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");

	AI_Teleport	(self, "TOT");
};

INSTANCE Info_Mod_AdanosDog_Futter (C_INFO)
{
	npc		= AdanosDog;
	nr		= 1;
	condition	= Info_Mod_AdanosDog_Futter_Condition;
	information	= Info_Mod_AdanosDog_Futter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Willst du ein Stück Fleisch?";
};

FUNC INT Info_Mod_AdanosDog_Futter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_AdanosDog_Kristall))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_AdanosDog_Futter_Info()
{
	AI_Output(hero, self, "Info_Mod_AdanosDog_Futter_15_00"); //Willst du ein Stück Fleisch?
	
	Info_ClearChoices	(Info_Mod_AdanosDog_Futter);

	if (Npc_HasItems(hero, ItFoMuttonZombie) > 0)
	{
		Info_AddChoice	(Info_Mod_AdanosDog_Futter, "Zombiefleisch geben", Info_Mod_AdanosDog_Futter_MuttonZombie);
	};
	if (Npc_HasItems(hero, ItFo_PfefferBacon) > 0)
	{
		Info_AddChoice	(Info_Mod_AdanosDog_Futter, "gepfefferten Schinken geben", Info_Mod_AdanosDog_Futter_PfefferBacon);
	};
	if (Npc_HasItems(hero, ItFo_Mutton) > 0)
	{
		Info_AddChoice	(Info_Mod_AdanosDog_Futter, "Gebratenes Fleisch geben", Info_Mod_AdanosDog_Futter_Mutton);
	};
	if (Npc_HasItems(hero, ItFo_Mutton) > 0)
	{
		Info_AddChoice	(Info_Mod_AdanosDog_Futter, "Rohes Fleisch geben", Info_Mod_AdanosDog_Futter_MuttonRaw);
	};
	if (Npc_HasItems(hero, ItFo_Schafswurst) > 0)
	{
		Info_AddChoice	(Info_Mod_AdanosDog_Futter, "Schafswurst geben", Info_Mod_AdanosDog_Futter_Schafswurst);
	};
};

FUNC VOID Info_Mod_AdanosDog_Futter_MuttonZombie()
{
	B_GiveInvItems	(hero, self, ItFoMuttonZombie, 1);

	B_KillNpc	(hero);
	
	Info_ClearChoices	(Info_Mod_AdanosDog_Futter);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");

	AI_Teleport	(self, "TOT");
};

FUNC VOID Info_Mod_AdanosDog_Futter_MuttonRaw()
{
	B_GiveInvItems	(hero, self, ItFo_MuttonRaw, 1);

	B_GivePlayerXP	(150);

	hero.attribute[ATR_MANA_MAX] += 2;
	hero.attribute[ATR_MANA] += 2;

	PrintScreen	("Mana + 2", -1, -1, FONT_SCREEN, 2);
	
	Info_ClearChoices	(Info_Mod_AdanosDog_Futter);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");

	AI_Teleport	(self, "TOT");
};

FUNC VOID Info_Mod_AdanosDog_Futter_Mutton()
{
	B_GiveInvItems	(hero, self, ItFo_Mutton, 1);

	B_GivePlayerXP	(150);

	hero.attribute[ATR_MANA_MAX] += 2;
	hero.attribute[ATR_MANA] += 2;

	PrintScreen	("Mana + 2", -1, -1, FONT_SCREEN, 2);
	
	Info_ClearChoices	(Info_Mod_AdanosDog_Futter);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");

	AI_Teleport	(self, "TOT");
};

FUNC VOID Info_Mod_AdanosDog_Futter_Schafswurst()
{
	B_GiveInvItems	(hero, self, ItFo_Schafswurst, 1);

	B_GivePlayerXP	(200);

	hero.attribute[ATR_MANA_MAX] += 3;
	hero.attribute[ATR_MANA] += 3;

	PrintScreen	("Mana + 3", -1, -1, FONT_SCREEN, 2);
	
	Info_ClearChoices	(Info_Mod_AdanosDog_Futter);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");

	AI_Teleport	(self, "TOT");
};

FUNC VOID Info_Mod_AdanosDog_Futter_PfefferBacon()
{
	B_GiveInvItems	(hero, self, ItFo_PfefferBacon, 1);

	B_GivePlayerXP	(150);

	hero.attribute[ATR_MANA_MAX] += 2;
	hero.attribute[ATR_MANA] += 2;

	PrintScreen	("Mana + 2", -1, -1, FONT_SCREEN, 2);
	
	Info_ClearChoices	(Info_Mod_AdanosDog_Futter);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");

	AI_Teleport	(self, "TOT");
};