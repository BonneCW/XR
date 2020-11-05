FUNC VOID Schleifstein_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		B_SetAivar(self, AIV_INVINCIBLE, TRUE);
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_Schleifstein;
		Ai_ProcessInfos (her);
	};
};

// Achilles Schwert

INSTANCE PC_Herd_Sharp_ItMw_1H_Eminem_AchillesSchwert_01 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Eminem_AchillesSchwert_01_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Eminem_AchillesSchwert_01_Info;
	permanent	= 1;
	important	= 0;
	description	= "Achilles Schwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Eminem_AchillesSchwert_01_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Eminem_AchillesSchwert_01)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Eminem_AchillesSchwert_01_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Eminem_AchillesSchwert_01, 1);

	CreateInvItems	(hero, ItMw_1H_Eminem_AchillesSchwert_01_Geschaerft, 1);
};

// Alte Machete

INSTANCE PC_Herd_Sharp_ItMW_Addon_Hacker_1h_02 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMW_Addon_Hacker_1h_02_Condition;
	information	= PC_Herd_Sharp_ItMW_Addon_Hacker_1h_02_Info;
	permanent	= 1;
	important	= 0;
	description	= "Alte Machete schärfen";
};

FUNC INT PC_Herd_Sharp_ItMW_Addon_Hacker_1h_02_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMW_Addon_Hacker_1h_02)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMW_Addon_Hacker_1h_02_Info()
{
	Npc_RemoveInvItems	(hero, ItMW_Addon_Hacker_1h_02, 1);

	CreateInvItems	(hero, ItMW_Addon_Hacker_1h_02_Geschaerft, 1);
};

// Alte Riesenmachete

INSTANCE PC_Herd_Sharp_ItMW_Addon_Hacker_2h_02 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMW_Addon_Hacker_2h_02_Condition;
	information	= PC_Herd_Sharp_ItMW_Addon_Hacker_2h_02_Info;
	permanent	= 1;
	important	= 0;
	description	= "Alte Riesenmachete schärfen";
};

FUNC INT PC_Herd_Sharp_ItMW_Addon_Hacker_2h_02_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMW_Addon_Hacker_2h_02)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMW_Addon_Hacker_2h_02_Info()
{
	Npc_RemoveInvItems	(hero, ItMW_Addon_Hacker_2h_02, 1);

	CreateInvItems	(hero, ItMW_Addon_Hacker_2h_02_Geschaerft, 1);
};

// Assassinenkralle

INSTANCE PC_Herd_Sharp_ItMW_Assassinenkralle (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMW_Assassinenkralle_Condition;
	information	= PC_Herd_Sharp_ItMW_Assassinenkralle_Info;
	permanent	= 1;
	important	= 0;
	description	= "Assassinenkralle schärfen";
};

FUNC INT PC_Herd_Sharp_ItMW_Assassinenkralle_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMW_Assassinenkralle)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMW_Assassinenkralle_Info()
{
	Npc_RemoveInvItems	(hero, ItMW_Assassinenkralle, 1);

	CreateInvItems	(hero, ItMW_Assassinenkralle_Geschaerft, 1);
};

// Assassinenschwert

INSTANCE PC_Herd_Sharp_ItMW_Assassinenschwert (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMW_Assassinenschwert_Condition;
	information	= PC_Herd_Sharp_ItMW_Assassinenschwert_Info;
	permanent	= 1;
	important	= 0;
	description	= "Assassinenschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMW_Assassinenschwert_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMW_Assassinenschwert)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMW_Assassinenschwert_Info()
{
	Npc_RemoveInvItems	(hero, ItMW_Assassinenschwert, 1);

	CreateInvItems	(hero, ItMW_Assassinenschwert_Geschaerft, 1);
};

// Athos

INSTANCE PC_Herd_Sharp_ItMw_1H_Neok_Athos_01 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Neok_Athos_01_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Neok_Athos_01_Info;
	permanent	= 1;
	important	= 0;
	description	= "Athos schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Neok_Athos_01_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Neok_Athos_01)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Neok_Athos_01_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Neok_Athos_01, 1);

	CreateInvItems	(hero, ItMw_1H_Neok_Athos_01_Geschaerft, 1);
};

// Avaquar

INSTANCE PC_Herd_Sharp_ItMw_Avaquar (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Avaquar_Condition;
	information	= PC_Herd_Sharp_ItMw_Avaquar_Info;
	permanent	= 1;
	important	= 0;
	description	= "Avaquar schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Avaquar_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Avaquar)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Avaquar_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Avaquar, 1);

	CreateInvItems	(hero, ItMw_Avaquar_Geschaerft, 1);
};

// Banditenschwert

INSTANCE PC_Herd_Sharp_ItMw_Banditenschwert (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Banditenschwert_Condition;
	information	= PC_Herd_Sharp_ItMw_Banditenschwert_Info;
	permanent	= 1;
	important	= 0;
	description	= "Banditenschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Banditenschwert_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Banditenschwert)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Banditenschwert_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Banditenschwert, 1);

	CreateInvItems	(hero, ItMw_Banditenschwert_Geschaerft, 1);
};

// Barbarenstreitaxt

INSTANCE PC_Herd_Sharp_ItMw_Barbarenstreitaxt (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Barbarenstreitaxt_Condition;
	information	= PC_Herd_Sharp_ItMw_Barbarenstreitaxt_Info;
	permanent	= 1;
	important	= 0;
	description	= "Barbarenstreitaxt schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Barbarenstreitaxt_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Barbarenstreitaxt)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Barbarenstreitaxt_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Barbarenstreitaxt, 1);

	CreateInvItems	(hero, ItMw_Barbarenstreitaxt_Geschaerft, 1);
};

// Bartaxt

INSTANCE PC_Herd_Sharp_ItMw_Bartaxt (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Bartaxt_Condition;
	information	= PC_Herd_Sharp_ItMw_Bartaxt_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bartaxt schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Bartaxt_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Bartaxt)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Bartaxt_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Bartaxt, 1);

	CreateInvItems	(hero, ItMw_Bartaxt_Geschaerft, 1);
};

// Beil

INSTANCE PC_Herd_Sharp_ItMw_1h_Vlk_Axe (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1h_Vlk_Axe_Condition;
	information	= PC_Herd_Sharp_ItMw_1h_Vlk_Axe_Info;
	permanent	= 1;
	important	= 0;
	description	= "Beil schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1h_Vlk_Axe_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1h_Vlk_Axe)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1h_Vlk_Axe_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1h_Vlk_Axe, 1);

	CreateInvItems	(hero, ItMw_1h_Vlk_Axe_Geschaerft, 1);
};

// Berserkeraxt

INSTANCE PC_Herd_Sharp_ItMw_Berserkeraxt (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Berserkeraxt_Condition;
	information	= PC_Herd_Sharp_ItMw_Berserkeraxt_Info;
	permanent	= 1;
	important	= 0;
	description	= "Berserkeraxt schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Berserkeraxt_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Berserkeraxt)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Berserkeraxt_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Berserkeraxt, 1);

	CreateInvItems	(hero, ItMw_Berserkeraxt_Geschaerft, 1);
};

// Betty

INSTANCE PC_Herd_Sharp_ItMw_Addon_Betty (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Addon_Betty_Condition;
	information	= PC_Herd_Sharp_ItMw_Addon_Betty_Info;
	permanent	= 1;
	important	= 0;
	description	= "Betty schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Addon_Betty_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Addon_Betty)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Addon_Betty_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Addon_Betty, 1);

	CreateInvItems	(hero, ItMw_Addon_Betty_Geschaerft, 1);
};

// Bluternter

INSTANCE PC_Herd_Sharp_ItMw_2H_Axe_Old_02 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2H_Axe_Old_02_Condition;
	information	= PC_Herd_Sharp_ItMw_2H_Axe_Old_02_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bluternter schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2H_Axe_Old_02_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2H_Axe_Old_02)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2H_Axe_Old_02_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2H_Axe_Old_02, 1);

	CreateInvItems	(hero, ItMw_2H_Axe_Old_02_Geschaerft, 1);
};

// Dämonenjägerschwert

INSTANCE PC_Herd_Sharp_ItMw_Daemonenjaegerschwert (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Daemonenjaegerschwert_Condition;
	information	= PC_Herd_Sharp_ItMw_Daemonenjaegerschwert_Info;
	permanent	= 1;
	important	= 0;
	description	= "Dämonenjägerschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Daemonenjaegerschwert_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Daemonenjaegerschwert)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Daemonenjaegerschwert_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Daemonenjaegerschwert, 1);

	CreateInvItems	(hero, ItMw_Daemonenjaegerschwert_Geschaerft, 1);
};

// Degen

INSTANCE PC_Herd_Sharp_ItMw_1h_Vlk_Sword (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1h_Vlk_Sword_Condition;
	information	= PC_Herd_Sharp_ItMw_1h_Vlk_Sword_Info;
	permanent	= 1;
	important	= 0;
	description	= "Degen schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1h_Vlk_Sword_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1h_Vlk_Sword)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1h_Vlk_Sword_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1h_Vlk_Sword, 1);

	CreateInvItems	(hero, ItMw_1h_Vlk_Sword_Geschaerft, 1);
};

// Degen der Banditen

INSTANCE PC_Herd_Sharp_ItMw_Addon_BanditTrader (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Addon_BanditTrader_Condition;
	information	= PC_Herd_Sharp_ItMw_Addon_BanditTrader_Info;
	permanent	= 1;
	important	= 0;
	description	= "Degen der Banditen schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Addon_BanditTrader_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Addon_BanditTrader)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Addon_BanditTrader_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Addon_BanditTrader, 1);

	CreateInvItems	(hero, ItMw_Addon_BanditTrader_Geschaerft, 1);
};

// Dolch

INSTANCE PC_Herd_Sharp_ItMw_1h_Vlk_Dagger (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1h_Vlk_Dagger_Condition;
	information	= PC_Herd_Sharp_ItMw_1h_Vlk_Dagger_Info;
	permanent	= 1;
	important	= 0;
	description	= "Dolch schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1h_Vlk_Dagger_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1h_Vlk_Dagger)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1h_Vlk_Dagger_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1h_Vlk_Dagger, 1);

	CreateInvItems	(hero, ItMw_1h_Vlk_Dagger_Geschaerft, 1);
};

// Doppelaxt

INSTANCE PC_Herd_Sharp_ItMw_Doppelaxt (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Doppelaxt_Condition;
	information	= PC_Herd_Sharp_ItMw_Doppelaxt_Info;
	permanent	= 1;
	important	= 0;
	description	= "Doppelaxt schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Doppelaxt_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Doppelaxt)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Doppelaxt_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Doppelaxt, 1);

	CreateInvItems	(hero, ItMw_Doppelaxt_Geschaerft, 1);
};

// Drachenaxt

INSTANCE PC_Herd_Sharp_ItMW_Drachenaxt (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMW_Drachenaxt_Condition;
	information	= PC_Herd_Sharp_ItMW_Drachenaxt_Info;
	permanent	= 1;
	important	= 0;
	description	= "Drachenaxt schärfen";
};

FUNC INT PC_Herd_Sharp_ItMW_Drachenaxt_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMW_Drachenaxt)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMW_Drachenaxt_Info()
{
	Npc_RemoveInvItems	(hero, ItMW_Drachenaxt, 1);

	CreateInvItems	(hero, ItMW_Drachenaxt_Geschaerft, 1);
};

// Drachenschneide

INSTANCE PC_Herd_Sharp_ItMw_Drachenschneide (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Drachenschneide_Condition;
	information	= PC_Herd_Sharp_ItMw_Drachenschneide_Info;
	permanent	= 1;
	important	= 0;
	description	= "Drachenschneide schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Drachenschneide_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Drachenschneide)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Drachenschneide_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Drachenschneide, 1);

	CreateInvItems	(hero, ItMw_Drachenschneide_Geschaerft, 1);
};

// Edles Bastardschwert

INSTANCE PC_Herd_Sharp_ItMw_Schwert5 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schwert5_Condition;
	information	= PC_Herd_Sharp_ItMw_Schwert5_Info;
	permanent	= 1;
	important	= 0;
	description	= "Edles Bastardschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schwert5_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schwert5)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schwert5_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schwert5, 1);

	CreateInvItems	(hero, ItMw_Schwert5_Geschaerft, 1);
};

// Edles Kurzschwert

INSTANCE PC_Herd_Sharp_ItMw_ShortSword5 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_ShortSword5_Condition;
	information	= PC_Herd_Sharp_ItMw_ShortSword5_Info;
	permanent	= 1;
	important	= 0;
	description	= "Edles Kurzschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_ShortSword5_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_ShortSword5)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_ShortSword5_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_ShortSword5, 1);

	CreateInvItems	(hero, ItMw_ShortSword5_Geschaerft, 1);
};

// Schwert

INSTANCE PC_Herd_Sharp_ItMw_1H_Common_01 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Common_01_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Common_01_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Common_01_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Common_01)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Common_01_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Common_01, 1);

	CreateInvItems	(hero, ItMw_1H_Common_01_Geschaerft, 1);
};

// Schwert (Bonus)

INSTANCE PC_Herd_Sharp_ItMw_1H_Common_01_Bonus (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Common_01_Bonus_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Common_01_Bonus_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Common_01_Bonus_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Common_01_Bonus)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Common_01_Bonus_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Common_01_Bonus, 1);

	CreateInvItems	(hero, ItMw_1H_Common_01_Bonus_Geschaerft, 1);
};

// Schwert (Stark)

INSTANCE PC_Herd_Sharp_ItMw_1H_Common_01_Stark (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Common_01_Stark_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Common_01_Stark_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Common_01_Stark_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Common_01_Stark)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Common_01_Stark_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Common_01_Stark, 1);

	CreateInvItems	(hero, ItMw_1H_Common_01_Stark_Geschaerft, 1);
};

// Schwert (Meisterschmied)

INSTANCE PC_Herd_Sharp_ItMw_1H_Common_01_Meisterschmied (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Common_01_Meisterschmied_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Common_01_Meisterschmied_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Common_01_Meisterschmied_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Common_01_Meisterschmied)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Common_01_Meisterschmied_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Common_01_Meisterschmied, 1);

	CreateInvItems	(hero, ItMw_1H_Common_01_Meisterschmied_Geschaerft, 1);
};

// Schwert (StarkBonus)

INSTANCE PC_Herd_Sharp_ItMw_1H_Common_01_StarkBonus (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Common_01_StarkBonus_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Common_01_StarkBonus_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Common_01_StarkBonus_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Common_01_StarkBonus)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Common_01_StarkBonus_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Common_01_StarkBonus, 1);

	CreateInvItems	(hero, ItMw_1H_Common_01_StarkBonus_Geschaerft, 1);
};

// Schwert (StarkMeisterschmied)

INSTANCE PC_Herd_Sharp_ItMw_1H_Common_01_StarkMeisterschmied (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Common_01_StarkMeisterschmied_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Common_01_StarkMeisterschmied_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Common_01_StarkMeisterschmied_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Common_01_StarkMeisterschmied)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Common_01_StarkMeisterschmied_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Common_01_StarkMeisterschmied, 1);

	CreateInvItems	(hero, ItMw_1H_Common_01_StarkMeisterschmied_Geschaerft, 1);
};

// Schwert (BonusMeisterschmied)

INSTANCE PC_Herd_Sharp_ItMw_1H_Common_01_BonusMeisterschmied (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Common_01_BonusMeisterschmied_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Common_01_BonusMeisterschmied_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Common_01_BonusMeisterschmied_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Common_01_BonusMeisterschmied)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Common_01_BonusMeisterschmied_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Common_01_BonusMeisterschmied, 1);

	CreateInvItems	(hero, ItMw_1H_Common_01_BonusMeisterschmied_Geschaerft, 1);
};

// Schwert (StarkBonusMeisterschmied)

INSTANCE PC_Herd_Sharp_ItMw_1H_Common_01_StarkBonusMeisterschmied (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Common_01_StarkBonusMeisterschmied_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Common_01_StarkBonusMeisterschmied_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Common_01_StarkBonusMeisterschmied_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Common_01_StarkBonusMeisterschmied)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Common_01_StarkBonusMeisterschmied_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Common_01_StarkBonusMeisterschmied, 1);

	CreateInvItems	(hero, ItMw_1H_Common_01_StarkBonusMeisterschmied_Geschaerft, 1);
};

// Edles Langschwert

INSTANCE PC_Herd_Sharp_ItMw_Schwert4 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schwert4_Condition;
	information	= PC_Herd_Sharp_ItMw_Schwert4_Info;
	permanent	= 1;
	important	= 0;
	description	= "Edles Langschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schwert4_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schwert4)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schwert4_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schwert4, 1);

	CreateInvItems	(hero, ItMw_Schwert4_Geschaerft, 1);
};

// Edles Langschwert (Bonus)

INSTANCE PC_Herd_Sharp_ItMw_Schwert4_Bonus (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schwert4_Bonus_Condition;
	information	= PC_Herd_Sharp_ItMw_Schwert4_Bonus_Info;
	permanent	= 1;
	important	= 0;
	description	= "Edles Langschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schwert4_Bonus_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schwert4_Bonus)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schwert4_Bonus_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schwert4_Bonus, 1);

	CreateInvItems	(hero, ItMw_Schwert4_Bonus_Geschaerft, 1);
};

// Edles Langschwert (Stark)

INSTANCE PC_Herd_Sharp_ItMw_Schwert4_Stark (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schwert4_Stark_Condition;
	information	= PC_Herd_Sharp_ItMw_Schwert4_Stark_Info;
	permanent	= 1;
	important	= 0;
	description	= "Edles Langschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schwert4_Stark_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schwert4_Stark)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schwert4_Stark_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schwert4_Stark, 1);

	CreateInvItems	(hero, ItMw_Schwert4_Stark_Geschaerft, 1);
};

// Edles Langschwert (Meisterschmied)

INSTANCE PC_Herd_Sharp_ItMw_Schwert4_Meisterschmied (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schwert4_Meisterschmied_Condition;
	information	= PC_Herd_Sharp_ItMw_Schwert4_Meisterschmied_Info;
	permanent	= 1;
	important	= 0;
	description	= "Edles Langschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schwert4_Meisterschmied_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schwert4_Meisterschmied)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schwert4_Meisterschmied_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schwert4_Meisterschmied, 1);

	CreateInvItems	(hero, ItMw_Schwert4_Meisterschmied_Geschaerft, 1);
};

// Edles Langschwert (StarkBonus)

INSTANCE PC_Herd_Sharp_ItMw_Schwert4_StarkBonus (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schwert4_StarkBonus_Condition;
	information	= PC_Herd_Sharp_ItMw_Schwert4_StarkBonus_Info;
	permanent	= 1;
	important	= 0;
	description	= "Edles Langschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schwert4_StarkBonus_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schwert4_StarkBonus)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schwert4_StarkBonus_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schwert4_StarkBonus, 1);

	CreateInvItems	(hero, ItMw_Schwert4_StarkBonus_Geschaerft, 1);
};

// Edles Langschwert (StarkMeisterschmied)

INSTANCE PC_Herd_Sharp_ItMw_Schwert4_StarkMeisterschmied (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schwert4_StarkMeisterschmied_Condition;
	information	= PC_Herd_Sharp_ItMw_Schwert4_StarkMeisterschmied_Info;
	permanent	= 1;
	important	= 0;
	description	= "Edles Langschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schwert4_StarkMeisterschmied_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schwert4_StarkMeisterschmied)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schwert4_StarkMeisterschmied_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schwert4_StarkMeisterschmied, 1);

	CreateInvItems	(hero, ItMw_Schwert4_StarkMeisterschmied_Geschaerft, 1);
};

// Edles Langschwert (BonusMeisterschmied)

INSTANCE PC_Herd_Sharp_ItMw_Schwert4_BonusMeisterschmied (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schwert4_BonusMeisterschmied_Condition;
	information	= PC_Herd_Sharp_ItMw_Schwert4_BonusMeisterschmied_Info;
	permanent	= 1;
	important	= 0;
	description	= "Edles Langschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schwert4_BonusMeisterschmied_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schwert4_BonusMeisterschmied)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schwert4_BonusMeisterschmied_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schwert4_BonusMeisterschmied, 1);

	CreateInvItems	(hero, ItMw_Schwert4_BonusMeisterschmied_Geschaerft, 1);
};

// Edles Langschwert (BonusMeisterschmied)

INSTANCE PC_Herd_Sharp_ItMw_Schwert4_StarkBonusMeisterschmied (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schwert4_StarkBonusMeisterschmied_Condition;
	information	= PC_Herd_Sharp_ItMw_Schwert4_StarkBonusMeisterschmied_Info;
	permanent	= 1;
	important	= 0;
	description	= "Edles Langschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schwert4_StarkBonusMeisterschmied_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schwert4_StarkBonusMeisterschmied)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schwert4_StarkBonusMeisterschmied_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schwert4_StarkBonusMeisterschmied, 1);

	CreateInvItems	(hero, ItMw_Schwert4_StarkBonusMeisterschmied_Geschaerft, 1);
};

// Edles Schwert

INSTANCE PC_Herd_Sharp_ItMw_Schwert1 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schwert1_Condition;
	information	= PC_Herd_Sharp_ItMw_Schwert1_Info;
	permanent	= 1;
	important	= 0;
	description	= "Edles Schwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schwert1_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schwert1)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schwert1_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schwert1, 1);

	CreateInvItems	(hero, ItMw_Schwert1_Geschaerft, 1);
};

// Edles Schwert (Bonus)

INSTANCE PC_Herd_Sharp_ItMw_Schwert1_Bonus (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schwert1_Bonus_Condition;
	information	= PC_Herd_Sharp_ItMw_Schwert1_Bonus_Info;
	permanent	= 1;
	important	= 0;
	description	= "Edles Schwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schwert1_Bonus_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schwert1_Bonus)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schwert1_Bonus_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schwert1_Bonus, 1);

	CreateInvItems	(hero, ItMw_Schwert1_Bonus_Geschaerft, 1);
};

// Edles Schwert (Stark)

INSTANCE PC_Herd_Sharp_ItMw_Schwert1_Stark (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schwert1_Stark_Condition;
	information	= PC_Herd_Sharp_ItMw_Schwert1_Stark_Info;
	permanent	= 1;
	important	= 0;
	description	= "Edles Schwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schwert1_Stark_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schwert1_Stark)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schwert1_Stark_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schwert1_Stark, 1);

	CreateInvItems	(hero, ItMw_Schwert1_Stark_Geschaerft, 1);
};

// Edles Schwert (Meisterschmied)

INSTANCE PC_Herd_Sharp_ItMw_Schwert1_Meisterschmied (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schwert1_Meisterschmied_Condition;
	information	= PC_Herd_Sharp_ItMw_Schwert1_Meisterschmied_Info;
	permanent	= 1;
	important	= 0;
	description	= "Edles Schwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schwert1_Meisterschmied_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schwert1_Meisterschmied)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schwert1_Meisterschmied_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schwert1_Meisterschmied, 1);

	CreateInvItems	(hero, ItMw_Schwert1_Meisterschmied_Geschaerft, 1);
};

// Edles Schwert (StarkBonus)

INSTANCE PC_Herd_Sharp_ItMw_Schwert1_StarkBonus (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schwert1_StarkBonus_Condition;
	information	= PC_Herd_Sharp_ItMw_Schwert1_StarkBonus_Info;
	permanent	= 1;
	important	= 0;
	description	= "Edles Schwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schwert1_StarkBonus_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schwert1_StarkBonus)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schwert1_StarkBonus_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schwert1_StarkBonus, 1);

	CreateInvItems	(hero, ItMw_Schwert1_StarkBonus_Geschaerft, 1);
};

// Edles Schwert (StarkMeisterschmied)

INSTANCE PC_Herd_Sharp_ItMw_Schwert1_StarkMeisterschmied (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schwert1_StarkMeisterschmied_Condition;
	information	= PC_Herd_Sharp_ItMw_Schwert1_StarkMeisterschmied_Info;
	permanent	= 1;
	important	= 0;
	description	= "Edles Schwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schwert1_StarkMeisterschmied_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schwert1_StarkMeisterschmied)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schwert1_StarkMeisterschmied_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schwert1_StarkMeisterschmied, 1);

	CreateInvItems	(hero, ItMw_Schwert1_StarkMeisterschmied_Geschaerft, 1);
};

// Edles Schwert (BonusMeisterschmied)

INSTANCE PC_Herd_Sharp_ItMw_Schwert1_BonusMeisterschmied (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schwert1_BonusMeisterschmied_Condition;
	information	= PC_Herd_Sharp_ItMw_Schwert1_BonusMeisterschmied_Info;
	permanent	= 1;
	important	= 0;
	description	= "Edles Schwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schwert1_BonusMeisterschmied_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schwert1_BonusMeisterschmied)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schwert1_BonusMeisterschmied_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schwert1_BonusMeisterschmied, 1);

	CreateInvItems	(hero, ItMw_Schwert1_BonusMeisterschmied_Geschaerft, 1);
};

// Edles Schwert (StarkBonusMeisterschmied)

INSTANCE PC_Herd_Sharp_ItMw_Schwert1_StarkBonusMeisterschmied (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schwert1_StarkBonusMeisterschmied_Condition;
	information	= PC_Herd_Sharp_ItMw_Schwert1_StarkBonusMeisterschmied_Info;
	permanent	= 1;
	important	= 0;
	description	= "Edles Schwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schwert1_StarkBonusMeisterschmied_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schwert1_StarkBonusMeisterschmied)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schwert1_StarkBonusMeisterschmied_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schwert1_StarkBonusMeisterschmied, 1);

	CreateInvItems	(hero, ItMw_Schwert1_StarkBonusMeisterschmied_Geschaerft, 1);
};

// Eisenklinge

INSTANCE PC_Herd_Sharp_ItMw_1H_Eminem_Eisenklinge_02 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Eminem_Eisenklinge_02_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Eminem_Eisenklinge_02_Info;
	permanent	= 1;
	important	= 0;
	description	= "Eisenklinge schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Eminem_Eisenklinge_02_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Eminem_Eisenklinge_02)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Eminem_Eisenklinge_02_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Eminem_Eisenklinge_02, 1);

	CreateInvItems	(hero, ItMw_1H_Eminem_Eisenklinge_02_Geschaerft, 1);
};

// Eisenklinge

INSTANCE PC_Herd_Sharp_ItMw_1H_Eminem_Eisenklinge_01 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Eminem_Eisenklinge_01_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Eminem_Eisenklinge_01_Info;
	permanent	= 1;
	important	= 0;
	description	= "Eisenklinge schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Eminem_Eisenklinge_01_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Eminem_Eisenklinge_01)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Eminem_Eisenklinge_01_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Eminem_Eisenklinge_01, 1);

	CreateInvItems	(hero, ItMw_1H_Eminem_Eisenklinge_01_Geschaerft, 1);
};

// Eisschwert

INSTANCE PC_Herd_Sharp_ITMW_ICESWORD (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ITMW_ICESWORD_Condition;
	information	= PC_Herd_Sharp_ITMW_ICESWORD_Info;
	permanent	= 1;
	important	= 0;
	description	= "Eisschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ITMW_ICESWORD_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ITMW_ICESWORD)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ITMW_ICESWORD_Info()
{
	Npc_RemoveInvItems	(hero, ITMW_ICESWORD, 1);

	CreateInvItems	(hero, ITMW_ICESWORD_Geschaerft, 1);
};

// El Bastardo

INSTANCE PC_Herd_Sharp_ItMw_ElBastardo (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_ElBastardo_Condition;
	information	= PC_Herd_Sharp_ItMw_ElBastardo_Info;
	permanent	= 1;
	important	= 0;
	description	= "El Bastardo schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_ElBastardo_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_ElBastardo)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_ElBastardo_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_ElBastardo, 1);

	CreateInvItems	(hero, ItMw_ElBastardo_Geschaerft, 1);
};

// El Bastardo (Bonus)

INSTANCE PC_Herd_Sharp_ItMw_ElBastardo_Bonus (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_ElBastardo_Bonus_Condition;
	information	= PC_Herd_Sharp_ItMw_ElBastardo_Bonus_Info;
	permanent	= 1;
	important	= 0;
	description	= "El Bastardo schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_ElBastardo_Bonus_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_ElBastardo_Bonus)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_ElBastardo_Bonus_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_ElBastardo_Bonus, 1);

	CreateInvItems	(hero, ItMw_ElBastardo_Bonus_Geschaerft, 1);
};

// El Bastardo (Meisterschmied)

INSTANCE PC_Herd_Sharp_ItMw_ElBastardo_Meisterschmied (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_ElBastardo_Meisterschmied_Condition;
	information	= PC_Herd_Sharp_ItMw_ElBastardo_Meisterschmied_Info;
	permanent	= 1;
	important	= 0;
	description	= "El Bastardo schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_ElBastardo_Meisterschmied_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_ElBastardo_Meisterschmied)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_ElBastardo_Meisterschmied_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_ElBastardo_Meisterschmied, 1);

	CreateInvItems	(hero, ItMw_ElBastardo_Meisterschmied_Geschaerft, 1);
};

// El Bastardo (BonusMeisterschmied)

INSTANCE PC_Herd_Sharp_ItMw_ElBastardo_BonusMeisterschmied (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_ElBastardo_BonusMeisterschmied_Condition;
	information	= PC_Herd_Sharp_ItMw_ElBastardo_BonusMeisterschmied_Info;
	permanent	= 1;
	important	= 0;
	description	= "El Bastardo schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_ElBastardo_BonusMeisterschmied_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_ElBastardo_BonusMeisterschmied)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_ElBastardo_BonusMeisterschmied_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_ElBastardo_BonusMeisterschmied, 1);

	CreateInvItems	(hero, ItMw_ElBastardo_BonusMeisterschmied_Geschaerft, 1);
};

// El Bastardo (StarkBonusMeisterschmied)

INSTANCE PC_Herd_Sharp_ItMw_ElBastardo_StarkBonusMeisterschmied (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_ElBastardo_StarkBonusMeisterschmied_Condition;
	information	= PC_Herd_Sharp_ItMw_ElBastardo_StarkBonusMeisterschmied_Info;
	permanent	= 1;
	important	= 0;
	description	= "El Bastardo schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_ElBastardo_StarkBonusMeisterschmied_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_ElBastardo_StarkBonusMeisterschmied)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_ElBastardo_StarkBonusMeisterschmied_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_ElBastardo_StarkBonusMeisterschmied, 1);

	CreateInvItems	(hero, ItMw_ElBastardo_StarkBonusMeisterschmied_Geschaerft, 1);
};

// El Bastardo (StarkBonus)

INSTANCE PC_Herd_Sharp_ItMw_ElBastardo_StarkBonus (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_ElBastardo_StarkBonus_Condition;
	information	= PC_Herd_Sharp_ItMw_ElBastardo_StarkBonus_Info;
	permanent	= 1;
	important	= 0;
	description	= "El Bastardo schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_ElBastardo_StarkBonus_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_ElBastardo_StarkBonus)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_ElBastardo_StarkBonus_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_ElBastardo_StarkBonus, 1);

	CreateInvItems	(hero, ItMw_ElBastardo_StarkBonus_Geschaerft, 1);
};

// El Bastardo (StarkMeisterschmied)

INSTANCE PC_Herd_Sharp_ItMw_ElBastardo_StarkMeisterschmied (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_ElBastardo_StarkMeisterschmied_Condition;
	information	= PC_Herd_Sharp_ItMw_ElBastardo_StarkMeisterschmied_Info;
	permanent	= 1;
	important	= 0;
	description	= "El Bastardo schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_ElBastardo_StarkMeisterschmied_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_ElBastardo_StarkMeisterschmied)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_ElBastardo_StarkMeisterschmied_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_ElBastardo_StarkMeisterschmied, 1);

	CreateInvItems	(hero, ItMw_ElBastardo_StarkMeisterschmied_Geschaerft, 1);
};

// El Bastardo (Stark)

INSTANCE PC_Herd_Sharp_ItMw_ElBastardo_Stark (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_ElBastardo_Stark_Condition;
	information	= PC_Herd_Sharp_ItMw_ElBastardo_Stark_Info;
	permanent	= 1;
	important	= 0;
	description	= "El Bastardo schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_ElBastardo_Stark_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_ElBastardo_Stark)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_ElBastardo_Stark_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_ElBastardo_Stark, 1);

	CreateInvItems	(hero, ItMw_ElBastardo_Stark_Geschaerft, 1);
};

// Enteraxt

INSTANCE PC_Herd_Sharp_ItMw_Addon_PIR1hAxe (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Addon_PIR1hAxe_Condition;
	information	= PC_Herd_Sharp_ItMw_Addon_PIR1hAxe_Info;
	permanent	= 1;
	important	= 0;
	description	= "Enteraxt schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Addon_PIR1hAxe_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Addon_PIR1hAxe)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Addon_PIR1hAxe_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Addon_PIR1hAxe, 1);

	CreateInvItems	(hero, ItMw_Addon_PIR1hAxe_Geschaerft, 1);
};

// Entermesser

INSTANCE PC_Herd_Sharp_ItMw_Addon_PIR1hSword (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Addon_PIR1hSword_Condition;
	information	= PC_Herd_Sharp_ItMw_Addon_PIR1hSword_Info;
	permanent	= 1;
	important	= 0;
	description	= "Entermesser schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Addon_PIR1hSword_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Addon_PIR1hSword)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Addon_PIR1hSword_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Addon_PIR1hSword, 1);

	CreateInvItems	(hero, ItMw_Addon_PIR1hSword_Geschaerft, 1);
};

// Enterschwert

INSTANCE PC_Herd_Sharp_ItMw_Addon_PIR2hSword (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Addon_PIR2hSword_Condition;
	information	= PC_Herd_Sharp_ItMw_Addon_PIR2hSword_Info;
	permanent	= 1;
	important	= 0;
	description	= "Enterschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Addon_PIR2hSword_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Addon_PIR2hSword)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Addon_PIR2hSword_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Addon_PIR2hSword, 1);

	CreateInvItems	(hero, ItMw_Addon_PIR2hSword_Geschaerft, 1);
};

// Erz-Langschwert

INSTANCE PC_Herd_Sharp_ItMw_1H_Special_01 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Special_01_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Special_01_Info;
	permanent	= 1;
	important	= 0;
	description	= "Erz-Langschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Special_01_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Special_01)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Special_01_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_01, 1);

	CreateInvItems	(hero, ItMw_1H_Special_01_Geschaerft, 1);
};

// Erz-Bastardschwert

INSTANCE PC_Herd_Sharp_ItMw_1H_Special_02 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Special_02_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Special_02_Info;
	permanent	= 1;
	important	= 0;
	description	= "Erz-Bastardschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Special_02_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Special_02)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Special_02_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_02, 1);

	CreateInvItems	(hero, ItMw_1H_Special_02_Geschaerft, 1);
};

// Erz-Zweihaender

INSTANCE PC_Herd_Sharp_ItMw_2H_Special_01 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2H_Special_01_Condition;
	information	= PC_Herd_Sharp_ItMw_2H_Special_01_Info;
	permanent	= 1;
	important	= 0;
	description	= "Erz-Zweihänder schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2H_Special_01_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2H_Special_01)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2H_Special_01_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2H_Special_01, 1);

	CreateInvItems	(hero, ItMw_2H_Special_01_Geschaerft, 1);
};

// Schwerer Erz-Zweihaender

INSTANCE PC_Herd_Sharp_ItMw_2H_Special_02 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2H_Special_02_Condition;
	information	= PC_Herd_Sharp_ItMw_2H_Special_02_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schwerer Erz-Zweihänder schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2H_Special_02_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2H_Special_02)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2H_Special_02_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2H_Special_02, 1);

	CreateInvItems	(hero, ItMw_2H_Special_02_Geschaerft, 1);
};

// Erz-Drachentöter

INSTANCE PC_Herd_Sharp_ItMw_1H_Special_04 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Special_04_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Special_04_Info;
	permanent	= 1;
	important	= 0;
	description	= "Erz-Drachentöter schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Special_04_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Special_04)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Special_04_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_04, 1);

	CreateInvItems	(hero, ItMw_1H_Special_04_Geschaerft, 1);
};

// Erz-Drachentöter des Versengens

INSTANCE PC_Herd_Sharp_ItMw_1H_Special_04_Feuer (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Special_04_Feuer_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Special_04_Feuer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Erz-Drachentöter des Versengens schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Special_04_Feuer_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Special_04_Feuer)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Special_04_Feuer_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_04_Feuer, 1);

	CreateInvItems	(hero, ItMw_1H_Special_04_Feuer_Geschaerft, 1);
};

// Erz-Drachentöter des Wasserhiebes

INSTANCE PC_Herd_Sharp_ItMw_1H_Special_04_Wasser (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Special_04_Wasser_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Special_04_Wasser_Info;
	permanent	= 1;
	important	= 0;
	description	= "Erz-Drachentöter des Wasserhiebes schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Special_04_Wasser_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Special_04_Wasser)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Special_04_Wasser_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_04_Wasser, 1);

	CreateInvItems	(hero, ItMw_1H_Special_04_Wasser_Geschaerft, 1);
};

// Erz-Drachenstecher

INSTANCE PC_Herd_Sharp_ItMw_1H_Special_04_Dex (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Special_04_Dex_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Special_04_Dex_Info;
	permanent	= 1;
	important	= 0;
	description	= "Erz-Drachenstecher schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Special_04_Dex_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Special_04_Dex)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Special_04_Dex_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_04_Dex, 1);

	CreateInvItems	(hero, ItMw_1H_Special_04_Dex_Geschaerft, 1);
};

// Erz-Drachenstecher des Versengens

INSTANCE PC_Herd_Sharp_ItMw_1H_Special_04_Dex_Feuer (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Special_04_Dex_Feuer_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Special_04_Dex_Feuer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Erz-Drachenstecher des Versengens schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Special_04_Dex_Feuer_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Special_04_Dex_Feuer)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Special_04_Dex_Feuer_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_04_Dex_Feuer, 1);

	CreateInvItems	(hero, ItMw_1H_Special_04_Dex_Feuer_Geschaerft, 1);
};

// Erz-Drachenstecher des Wasserhiebes

INSTANCE PC_Herd_Sharp_ItMw_1H_Special_04_Dex_Wasser (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Special_04_Dex_Wasser_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Special_04_Dex_Wasser_Info;
	permanent	= 1;
	important	= 0;
	description	= "Erz-Drachenstecher des Wasserhiebes schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Special_04_Dex_Wasser_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Special_04_Dex_Wasser)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Special_04_Dex_Wasser_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_04_Dex_Wasser, 1);

	CreateInvItems	(hero, ItMw_1H_Special_04_Dex_Wasser_Geschaerft, 1);
};

// Erz-Schlachtklinge

INSTANCE PC_Herd_Sharp_ItMw_1H_Special_03 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Special_03_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Special_03_Info;
	permanent	= 1;
	important	= 0;
	description	= "Erz-Schlachtklinge schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Special_03_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Special_03)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Special_03_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_03, 1);

	CreateInvItems	(hero, ItMw_1H_Special_03_Geschaerft, 1);
};

// Erz-Schlachtklinge des Versengens

INSTANCE PC_Herd_Sharp_ItMw_1H_Special_03_Feuer (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Special_03_Feuer_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Special_03_Feuer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Erz-Schlachtklinge des Versengens schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Special_03_Feuer_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Special_03_Feuer)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Special_03_Feuer_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_03_Feuer, 1);

	CreateInvItems	(hero, ItMw_1H_Special_03_Feuer_Geschaerft, 1);
};

// Erz-Schlachtklinge des Wasserhiebes

INSTANCE PC_Herd_Sharp_ItMw_1H_Special_03_Wasser (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Special_03_Wasser_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Special_03_Wasser_Info;
	permanent	= 1;
	important	= 0;
	description	= "Erz-Schlachtklinge des Wasserhiebes schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Special_03_Wasser_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Special_03_Wasser)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Special_03_Wasser_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_03_Wasser, 1);

	CreateInvItems	(hero, ItMw_1H_Special_03_Wasser_Geschaerft, 1);
};

// Erz-Schlachtstecher

INSTANCE PC_Herd_Sharp_ItMw_1H_Special_03_Dex (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Special_03_Dex_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Special_03_Dex_Info;
	permanent	= 1;
	important	= 0;
	description	= "Erz-Schlachtstecher schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Special_03_Dex_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Special_03_Dex)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Special_03_Dex_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_03_Dex, 1);

	CreateInvItems	(hero, ItMw_1H_Special_03_Dex_Geschaerft, 1);
};

// Erz-Schlachtstecher des Versengens

INSTANCE PC_Herd_Sharp_ItMw_1H_Special_03_Dex_Feuer (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Special_03_Dex_Feuer_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Special_03_Dex_Feuer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Erz-Schlachtstecher des Versengens schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Special_03_Dex_Feuer_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Special_03_Dex_Feuer)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Special_03_Dex_Feuer_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_03_Dex_Feuer, 1);

	CreateInvItems	(hero, ItMw_1H_Special_03_Dex_Feuer_Geschaerft, 1);
};

// Erz-Schlachtstecher des Wasserhiebes

INSTANCE PC_Herd_Sharp_ItMw_1H_Special_03_Dex_Wasser (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Special_03_Dex_Wasser_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Special_03_Dex_Wasser_Info;
	permanent	= 1;
	important	= 0;
	description	= "Erz-Schlachtstecher des Wasserhiebes schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Special_03_Dex_Wasser_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Special_03_Dex_Wasser)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Special_03_Dex_Wasser_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_03_Dex_Wasser, 1);

	CreateInvItems	(hero, ItMw_1H_Special_03_Dex_Wasser_Geschaerft, 1);
};

// Feuerschwert

INSTANCE PC_Herd_Sharp_ITMW_Feuerschwert (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ITMW_Feuerschwert_Condition;
	information	= PC_Herd_Sharp_ITMW_Feuerschwert_Info;
	permanent	= 1;
	important	= 0;
	description	= "Feuerschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ITMW_Feuerschwert_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ITMW_Feuerschwert)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ITMW_Feuerschwert_Info()
{
	Npc_RemoveInvItems	(hero, ITMW_Feuerschwert, 1);

	CreateInvItems	(hero, ITMW_Feuerschwert_Geschaerft, 1);
};

// Folteraxt

INSTANCE PC_Herd_Sharp_ItMw_Folteraxt (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Folteraxt_Condition;
	information	= PC_Herd_Sharp_ItMw_Folteraxt_Info;
	permanent	= 1;
	important	= 0;
	description	= "Folteraxt schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Folteraxt_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Folteraxt)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Folteraxt_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Folteraxt, 1);

	CreateInvItems	(hero, ItMw_Folteraxt_Geschaerft, 1);
};

// Gardeschwert

INSTANCE PC_Herd_Sharp_ItMw_1H_Sword_03 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Sword_03_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Sword_03_Info;
	permanent	= 1;
	important	= 0;
	description	= "Gardeschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Sword_03_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Sword_03)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Sword_03_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Sword_03, 1);

	CreateInvItems	(hero, ItMw_1H_Sword_03_Geschaerft, 1);
};

// Gardistenhand

INSTANCE PC_Herd_Sharp_ItMw_1H_Sword_Broad_04 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Sword_Broad_04_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Sword_Broad_04_Info;
	permanent	= 1;
	important	= 0;
	description	= "Gardistenhand schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Sword_Broad_04_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Sword_Broad_04)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Sword_Broad_04_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Sword_Broad_04, 1);

	CreateInvItems	(hero, ItMw_1H_Sword_Broad_04_Geschaerft, 1);
};

// Gladius

INSTANCE PC_Herd_Sharp_ItMw_Gladius (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Gladius_Condition;
	information	= PC_Herd_Sharp_ItMw_Gladius_Info;
	permanent	= 1;
	important	= 0;
	description	= "Gladius schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Gladius_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Gladius)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Gladius_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Gladius, 1);

	CreateInvItems	(hero, ItMw_Gladius_Geschaerft, 1);
};

// Grobe Kriegsaxt

INSTANCE PC_Herd_Sharp_ItMw_2h_Sld_Axe (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2h_Sld_Axe_Condition;
	information	= PC_Herd_Sharp_ItMw_2h_Sld_Axe_Info;
	permanent	= 1;
	important	= 0;
	description	= "Grobe Kriegsaxt schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2h_Sld_Axe_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2h_Sld_Axe)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2h_Sld_Axe_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2h_Sld_Axe, 1);

	CreateInvItems	(hero, ItMw_2h_Sld_Axe_Geschaerft, 1);
};

// Grober Zweihänder

INSTANCE PC_Herd_Sharp_ItMw_2h_Sld_Sword (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2h_Sld_Sword_Condition;
	information	= PC_Herd_Sharp_ItMw_2h_Sld_Sword_Info;
	permanent	= 1;
	important	= 0;
	description	= "Grober Zweihänder schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2h_Sld_Sword_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2h_Sld_Sword)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2h_Sld_Sword_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2h_Sld_Sword, 1);

	CreateInvItems	(hero, ItMw_2h_Sld_Sword_Geschaerft, 1);
};

// Grobes Bastardschwert

INSTANCE PC_Herd_Sharp_ItMw_Schwert3 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schwert3_Condition;
	information	= PC_Herd_Sharp_ItMw_Schwert3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Grobes Bastardschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schwert3_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schwert3)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schwert3_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schwert3, 1);

	CreateInvItems	(hero, ItMw_Schwert3_Geschaerft, 1);
};

// Grobes Breitschwert

INSTANCE PC_Herd_Sharp_ItMw_1h_Mil_Sword (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1h_Mil_Sword_Condition;
	information	= PC_Herd_Sharp_ItMw_1h_Mil_Sword_Info;
	permanent	= 1;
	important	= 0;
	description	= "Grobes Breitschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1h_Mil_Sword_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1h_Mil_Sword)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1h_Mil_Sword_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1h_Mil_Sword, 1);

	CreateInvItems	(hero, ItMw_1h_Mil_Sword_Geschaerft, 1);
};

// Grobes Kriegsbeil

INSTANCE PC_Herd_Sharp_ItMw_1h_Sld_Axe (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1h_Sld_Axe_Condition;
	information	= PC_Herd_Sharp_ItMw_1h_Sld_Axe_Info;
	permanent	= 1;
	important	= 0;
	description	= "Grobes Kriegsbeil schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1h_Sld_Axe_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1h_Sld_Axe)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1h_Sld_Axe_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1h_Sld_Axe, 1);

	CreateInvItems	(hero, ItMw_1h_Sld_Axe_Geschaerft, 1);
};

// Grobes Kurzschwert

INSTANCE PC_Herd_Sharp_ItMw_ShortSword2 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_ShortSword2_Condition;
	information	= PC_Herd_Sharp_ItMw_ShortSword2_Info;
	permanent	= 1;
	important	= 0;
	description	= "Grobes Kurzschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_ShortSword2_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_ShortSword2)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_ShortSword2_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_ShortSword2, 1);

	CreateInvItems	(hero, ItMw_ShortSword2_Geschaerft, 1);
};

// Grobes Langschwert

INSTANCE PC_Herd_Sharp_ItMw_Schwert (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schwert_Condition;
	information	= PC_Herd_Sharp_ItMw_Schwert_Info;
	permanent	= 1;
	important	= 0;
	description	= "Grobes Langschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schwert_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schwert)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schwert_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schwert, 1);

	CreateInvItems	(hero, ItMw_Schwert_Geschaerft, 1);
};

// Grobes Schwert

INSTANCE PC_Herd_Sharp_ItMw_1h_Sld_Sword (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1h_Sld_Sword_Condition;
	information	= PC_Herd_Sharp_ItMw_1h_Sld_Sword_Info;
	permanent	= 1;
	important	= 0;
	description	= "Grobes Schwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1h_Sld_Sword_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1h_Sld_Sword)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1h_Sld_Sword_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1h_Sld_Sword, 1);

	CreateInvItems	(hero, ItMw_1h_Sld_Sword_Geschaerft, 1);
};

// Guter Dolch

INSTANCE PC_Herd_Sharp_ItMw_FrancisDagger_Mis (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_FrancisDagger_Mis_Condition;
	information	= PC_Herd_Sharp_ItMw_FrancisDagger_Mis_Info;
	permanent	= 1;
	important	= 0;
	description	= "Guten Dolch schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_FrancisDagger_Mis_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_FrancisDagger_Mis)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_FrancisDagger_Mis_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_FrancisDagger_Mis, 1);

	CreateInvItems	(hero, ItMw_FrancisDagger_Mis_Geschaerft, 1);
};

// Hellebarde

INSTANCE PC_Herd_Sharp_ItMw_Hellebarde (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Hellebarde_Condition;
	information	= PC_Herd_Sharp_ItMw_Hellebarde_Info;
	permanent	= 1;
	important	= 0;
	description	= "Hellebarde schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Hellebarde_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Hellebarde)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Hellebarde_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Hellebarde, 1);

	CreateInvItems	(hero, ItMw_Hellebarde_Geschaerft, 1);
};

// Holzfälleraxt

INSTANCE PC_Herd_Sharp_ItMw_2h_Bau_Axe (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2h_Bau_Axe_Condition;
	information	= PC_Herd_Sharp_ItMw_2h_Bau_Axe_Info;
	permanent	= 1;
	important	= 0;
	description	= "Holzfälleraxt schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2h_Bau_Axe_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2h_Bau_Axe)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2h_Bau_Axe_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2h_Bau_Axe, 1);

	CreateInvItems	(hero, ItMw_2h_Bau_Axe_Geschaerft, 1);
};

// Gesegnete Erzklinge

INSTANCE PC_Herd_Sharp_ItMw_1H_Blessed_01 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Blessed_01_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Blessed_01_Info;
	permanent	= 1;
	important	= 0;
	description	= "Rohe Erzklinge schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Blessed_01_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Blessed_01)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Blessed_01_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Blessed_01, 1);

	CreateInvItems	(hero, ItMw_1H_Blessed_01_Geschaerft, 1);
};

// Gesegnete Erzklinge

INSTANCE PC_Herd_Sharp_ItMw_1H_Blessed_02 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Blessed_02_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Blessed_02_Info;
	permanent	= 1;
	important	= 0;
	description	= "Gesegnete Erzklinge schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Blessed_02_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Blessed_02)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Blessed_02_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Blessed_02, 1);

	CreateInvItems	(hero, ItMw_1H_Blessed_02_Geschaerft, 1);
};

// Innos Zorn

INSTANCE PC_Herd_Sharp_ItMw_1H_Blessed_03 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Blessed_03_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Blessed_03_Info;
	permanent	= 1;
	important	= 0;
	description	= "Innos' Zorn schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Blessed_03_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Blessed_03)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Blessed_03_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Blessed_03, 1);

	CreateInvItems	(hero, ItMw_1H_Blessed_03_Geschaerft, 1);
};

// Heiliger Vollstrecker

INSTANCE PC_Herd_Sharp_ItMw_2H_Blessed_03 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2H_Blessed_03_Condition;
	information	= PC_Herd_Sharp_ItMw_2H_Blessed_03_Info;
	permanent	= 1;
	important	= 0;
	description	= "Heiliger Vollstrecker schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2H_Blessed_03_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2H_Blessed_03)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2H_Blessed_03_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2H_Blessed_03, 1);

	CreateInvItems	(hero, ItMw_2H_Blessed_03_Geschaerft, 1);
};

// Ordensschwert

INSTANCE PC_Herd_Sharp_ItMw_2H_Blessed_02 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2H_Blessed_02_Condition;
	information	= PC_Herd_Sharp_ItMw_2H_Blessed_02_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ordensschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2H_Blessed_02_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2H_Blessed_02)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2H_Blessed_02_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2H_Blessed_02, 1);

	CreateInvItems	(hero, ItMw_2H_Blessed_02_Geschaerft, 1);
};

// Rohe Erzklinge

INSTANCE PC_Herd_Sharp_ItMw_2H_Blessed_01 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2H_Blessed_01_Condition;
	information	= PC_Herd_Sharp_ItMw_2H_Blessed_01_Info;
	permanent	= 1;
	important	= 0;
	description	= "Rohe Erzklinge schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2H_Blessed_01_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2H_Blessed_01)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2H_Blessed_01_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2H_Blessed_01, 1);

	CreateInvItems	(hero, ItMw_2H_Blessed_01_Geschaerft, 1);
};

// Katana

INSTANCE PC_Herd_Sharp_ItMw_Katana (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Katana_Condition;
	information	= PC_Herd_Sharp_ItMw_Katana_Info;
	permanent	= 1;
	important	= 0;
	description	= "Katana schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Katana_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Katana)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Katana_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Katana, 1);

	CreateInvItems	(hero, ItMw_Katana_Geschaerft, 1);
};

// Kilgorin

INSTANCE PC_Herd_Sharp_ItMw_Kilgorin (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Kilgorin_Condition;
	information	= PC_Herd_Sharp_ItMw_Kilgorin_Info;
	permanent	= 1;
	important	= 0;
	description	= "Kilgorin schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Kilgorin_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Kilgorin)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Kilgorin_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Kilgorin, 1);

	CreateInvItems	(hero, ItMw_Kilgorin_Geschaerft, 1);
};

// Klauenschwert

INSTANCE PC_Herd_Sharp_ItMw_Klauenschwert (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Klauenschwert_Condition;
	information	= PC_Herd_Sharp_ItMw_Klauenschwert_Info;
	permanent	= 1;
	important	= 0;
	description	= "Klauenschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Klauenschwert_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Klauenschwert)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Klauenschwert_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Klauenschwert, 1);

	CreateInvItems	(hero, ItMw_Klauenschwert_Geschaerft, 1);
};

// Kleine Sense

INSTANCE PC_Herd_Sharp_ItMw_Sense (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Sense_Condition;
	information	= PC_Herd_Sharp_ItMw_Sense_Info;
	permanent	= 1;
	important	= 0;
	description	= "Kleine Sense schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Sense_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Sense)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Sense_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Sense, 1);

	CreateInvItems	(hero, ItMw_Sense_Geschaerft, 1);
};

// Klingendolch

INSTANCE PC_Herd_Sharp_ItMw_Klingendolch (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Klingendolch_Condition;
	information	= PC_Herd_Sharp_ItMw_Klingendolch_Info;
	permanent	= 1;
	important	= 0;
	description	= "Klingendolch schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Klingendolch_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Klingendolch)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Klingendolch_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Klingendolch, 1);

	CreateInvItems	(hero, ItMw_Klingendolch_Geschaerft, 1);
};

// Krummschwert

INSTANCE PC_Herd_Sharp_ItMw_Krummschwert (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Krummschwert_Condition;
	information	= PC_Herd_Sharp_ItMw_Krummschwert_Info;
	permanent	= 1;
	important	= 0;
	description	= "Krummschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Krummschwert_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Krummschwert)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Krummschwert_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Krummschwert, 1);

	CreateInvItems	(hero, ItMw_Krummschwert_Geschaerft, 1);
};

// Krush Agash

INSTANCE PC_Herd_Sharp_ItMw_2H_OrcAxe_03 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2H_OrcAxe_03_Condition;
	information	= PC_Herd_Sharp_ItMw_2H_OrcAxe_03_Info;
	permanent	= 1;
	important	= 0;
	description	= "Krush Agash schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2H_OrcAxe_03_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2H_OrcAxe_03)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2H_OrcAxe_03_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2H_OrcAxe_03, 1);

	CreateInvItems	(hero, ItMw_2H_OrcAxe_03_Geschaerft, 1);
};

// Krush BrokDar

INSTANCE PC_Herd_Sharp_ItMw_2H_OrcAxe_04 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2H_OrcAxe_04_Condition;
	information	= PC_Herd_Sharp_ItMw_2H_OrcAxe_04_Info;
	permanent	= 1;
	important	= 0;
	description	= "Krush BrokDar schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2H_OrcAxe_04_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2H_OrcAxe_04)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2H_OrcAxe_04_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2H_OrcAxe_04, 1);

	CreateInvItems	(hero, ItMw_2H_OrcAxe_04_Geschaerft, 1);
};

// Krush Pach

INSTANCE PC_Herd_Sharp_ItMw_2H_OrcAxe_01 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2H_OrcAxe_01_Condition;
	information	= PC_Herd_Sharp_ItMw_2H_OrcAxe_01_Info;
	permanent	= 1;
	important	= 0;
	description	= "Krush Pach schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2H_OrcAxe_01_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2H_OrcAxe_01)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2H_OrcAxe_01_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2H_OrcAxe_01, 1);

	CreateInvItems	(hero, ItMw_2H_OrcAxe_01_Geschaerft, 1);
};

// Krush UrRok

INSTANCE PC_Herd_Sharp_ItMw_2H_OrcAxe_02 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2H_OrcAxe_02_Condition;
	information	= PC_Herd_Sharp_ItMw_2H_OrcAxe_02_Info;
	permanent	= 1;
	important	= 0;
	description	= "Krush UrRok schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2H_OrcAxe_02_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2H_OrcAxe_02)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2H_OrcAxe_02_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2H_OrcAxe_02, 1);

	CreateInvItems	(hero, ItMw_2H_OrcAxe_02_Geschaerft, 1);
};

// Krush Varrok

INSTANCE PC_Herd_Sharp_ItMw_2H_OrcSword_01 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2H_OrcSword_01_Condition;
	information	= PC_Herd_Sharp_ItMw_2H_OrcSword_01_Info;
	permanent	= 1;
	important	= 0;
	description	= "Krush Varrok schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2H_OrcSword_01_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2H_OrcSword_01)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2H_OrcSword_01_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2H_OrcSword_01, 1);

	CreateInvItems	(hero, ItMw_2H_OrcSword_01_Geschaerft, 1);
};

// Kurzschwert

INSTANCE PC_Herd_Sharp_ItMw_Kurzschwert (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Kurzschwert_Condition;
	information	= PC_Herd_Sharp_ItMw_Kurzschwert_Info;
	permanent	= 1;
	important	= 0;
	description	= "Kurzschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Kurzschwert_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Kurzschwert)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Kurzschwert_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Kurzschwert, 1);

	CreateInvItems	(hero, ItMw_Kurzschwert_Geschaerft, 1);
};

// Kurzschwert

INSTANCE PC_Herd_Sharp_ItMw_ShortSword3 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_ShortSword3_Condition;
	information	= PC_Herd_Sharp_ItMw_ShortSword3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Kurzschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_ShortSword3_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_ShortSword3)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_ShortSword3_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_ShortSword3, 1);

	CreateInvItems	(hero, ItMw_ShortSword3_Geschaerft, 1);
};

// Kurzschwert der Miliz

INSTANCE PC_Herd_Sharp_ItMw_ShortSword1 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_ShortSword1_Condition;
	information	= PC_Herd_Sharp_ItMw_ShortSword1_Info;
	permanent	= 1;
	important	= 0;
	description	= "Kurzschwert der Miliz schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_ShortSword1_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_ShortSword1)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_ShortSword1_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_ShortSword1, 1);

	CreateInvItems	(hero, ItMw_ShortSword1_Geschaerft, 1);
};

// Langschwert

INSTANCE PC_Herd_Sharp_ItMw_Schwert2 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schwert2_Condition;
	information	= PC_Herd_Sharp_ItMw_Schwert2_Info;
	permanent	= 1;
	important	= 0;
	description	= "Langschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schwert2_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schwert2)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schwert2_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schwert2, 1);

	CreateInvItems	(hero, ItMw_Schwert2_Geschaerft, 1);
};

// Leichter Zweihänder

INSTANCE PC_Herd_Sharp_ItMw_Zweihaender1 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Zweihaender1_Condition;
	information	= PC_Herd_Sharp_ItMw_Zweihaender1_Info;
	permanent	= 1;
	important	= 0;
	description	= "Leichten Zweihänder schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Zweihaender1_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Zweihaender1)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Zweihaender1_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Zweihaender1, 1);

	CreateInvItems	(hero, ItMw_Zweihaender1_Geschaerft, 1);
};

// Leichter Zweihänder

INSTANCE PC_Herd_Sharp_ItMw_2H_Sword_Light_01 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2H_Sword_Light_01_Condition;
	information	= PC_Herd_Sharp_ItMw_2H_Sword_Light_01_Info;
	permanent	= 1;
	important	= 0;
	description	= "Leichten Zweihänder schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2H_Sword_Light_01_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2H_Sword_Light_01)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2H_Sword_Light_01_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2H_Sword_Light_01, 1);

	CreateInvItems	(hero, ItMw_2H_Sword_Light_01_Geschaerft, 1);
};

// Leichte Streitaxt

INSTANCE PC_Herd_Sharp_ItMw_Streitaxt1 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Streitaxt1_Condition;
	information	= PC_Herd_Sharp_ItMw_Streitaxt1_Info;
	permanent	= 1;
	important	= 0;
	description	= "Leichte Streitaxt schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Streitaxt1_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Streitaxt1)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Streitaxt1_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Streitaxt1, 1);

	CreateInvItems	(hero, ItMw_Streitaxt1_Geschaerft, 1);
};

// Light

INSTANCE PC_Herd_Sharp_ItMw_Light (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Light_Condition;
	information	= PC_Herd_Sharp_ItMw_Light_Info;
	permanent	= 1;
	important	= 0;
	description	= "Light schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Light_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Light)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Light_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Light, 1);

	CreateInvItems	(hero, ItMw_Light_Geschaerft, 1);
};

// Machete

INSTANCE PC_Herd_Sharp_ItMW_Addon_Hacker_1h_01 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMW_Addon_Hacker_1h_01_Condition;
	information	= PC_Herd_Sharp_ItMW_Addon_Hacker_1h_01_Info;
	permanent	= 1;
	important	= 0;
	description	= "Machete schärfen";
};

FUNC INT PC_Herd_Sharp_ItMW_Addon_Hacker_1h_01_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMW_Addon_Hacker_1h_01)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMW_Addon_Hacker_1h_01_Info()
{
	Npc_RemoveInvItems	(hero, ItMW_Addon_Hacker_1h_01, 1);

	CreateInvItems	(hero, ItMW_Addon_Hacker_1h_01_Geschaerft, 1);
};

// Meisterdegen

INSTANCE PC_Herd_Sharp_ItMw_Meisterdegen (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Meisterdegen_Condition;
	information	= PC_Herd_Sharp_ItMw_Meisterdegen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Meisterdegen schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Meisterdegen_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Meisterdegen)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Meisterdegen_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Meisterdegen, 1);

	CreateInvItems	(hero, ItMw_Meisterdegen_Geschaerft, 1);
};

// Opferschwert

INSTANCE PC_Herd_Sharp_ItMw_Opferschwert (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Opferschwert_Condition;
	information	= PC_Herd_Sharp_ItMw_Opferschwert_Info;
	permanent	= 1;
	important	= 0;
	description	= "Opferschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Opferschwert_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Opferschwert)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Opferschwert_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Opferschwert, 1);

	CreateInvItems	(hero, ItMw_Opferschwert_Geschaerft, 1);
};

// Orkisches Kriegsschwert

INSTANCE PC_Herd_Sharp_ItMw_2H_OrcSword_02 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2H_OrcSword_02_Condition;
	information	= PC_Herd_Sharp_ItMw_2H_OrcSword_02_Info;
	permanent	= 1;
	important	= 0;
	description	= "Orkisches Kriegsschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2H_OrcSword_02_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2H_OrcSword_02)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2H_OrcSword_02_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2H_OrcSword_02, 1);

	CreateInvItems	(hero, ItMw_2H_OrcSword_02_Geschaerft, 1);
};

// Orkpickser

INSTANCE PC_Herd_Sharp_ItMw_Orkpickser (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Orkpickser_Condition;
	information	= PC_Herd_Sharp_ItMw_Orkpickser_Info;
	permanent	= 1;
	important	= 0;
	description	= "Orkpickser schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Orkpickser_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Orkpickser)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Orkpickser_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Orkpickser, 1);

	CreateInvItems	(hero, ItMw_Orkpickser_Geschaerft, 1);
};

// Orkpickser des Versengens

INSTANCE PC_Herd_Sharp_ItMw_Orkpickser_Feuer (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Orkpickser_Feuer_Condition;
	information	= PC_Herd_Sharp_ItMw_Orkpickser_Feuer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Orkpickser des Versengens schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Orkpickser_Feuer_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Orkpickser_Feuer)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Orkpickser_Feuer_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Orkpickser_Feuer, 1);

	CreateInvItems	(hero, ItMw_Orkpickser_Feuer_Geschaerft, 1);
};

// Orkpickser des Wasserhiebes

INSTANCE PC_Herd_Sharp_ItMw_Orkpickser_Wasser (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Orkpickser_Wasser_Condition;
	information	= PC_Herd_Sharp_ItMw_Orkpickser_Wasser_Info;
	permanent	= 1;
	important	= 0;
	description	= "Orkpickser des Wasserhiebes schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Orkpickser_Wasser_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Orkpickser_Wasser)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Orkpickser_Wasser_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Orkpickser_Wasser, 1);

	CreateInvItems	(hero, ItMw_Orkpickser_Wasser_Geschaerft, 1);
};

// Orkschlächter

INSTANCE PC_Herd_Sharp_ItMw_Orkschlaechter (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Orkschlaechter_Condition;
	information	= PC_Herd_Sharp_ItMw_Orkschlaechter_Info;
	permanent	= 1;
	important	= 0;
	description	= "Orkschlächter schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Orkschlaechter_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Orkschlaechter)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Orkschlaechter_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Orkschlaechter, 1);

	CreateInvItems	(hero, ItMw_Orkschlaechter_Geschaerft, 1);
};

// Orkschlächter des Versengens

INSTANCE PC_Herd_Sharp_ItMw_Orkschlaechter_Feuer (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Orkschlaechter_Feuer_Condition;
	information	= PC_Herd_Sharp_ItMw_Orkschlaechter_Feuer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Orkschlächter des Versengens schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Orkschlaechter_Feuer_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Orkschlaechter_Feuer)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Orkschlaechter_Feuer_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Orkschlaechter_Feuer, 1);

	CreateInvItems	(hero, ItMw_Orkschlaechter_Feuer_Geschaerft, 1);
};

// Orkschlächter des Wasserhiebes

INSTANCE PC_Herd_Sharp_ItMw_Orkschlaechter_Wasser (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Orkschlaechter_Wasser_Condition;
	information	= PC_Herd_Sharp_ItMw_Orkschlaechter_Wasser_Info;
	permanent	= 1;
	important	= 0;
	description	= "Orkschlächter des Wasserhiebes schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Orkschlaechter_Wasser_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Orkschlaechter_Wasser)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Orkschlaechter_Wasser_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Orkschlaechter_Wasser, 1);

	CreateInvItems	(hero, ItMw_Orkschlaechter_Wasser_Geschaerft, 1);
};

// Paladinschwert

INSTANCE PC_Herd_Sharp_ItMw_1h_Pal_Sword (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1h_Pal_Sword_Condition;
	information	= PC_Herd_Sharp_ItMw_1h_Pal_Sword_Info;
	permanent	= 1;
	important	= 0;
	description	= "Paladinschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1h_Pal_Sword_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1h_Pal_Sword)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1h_Pal_Sword_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1h_Pal_Sword, 1);

	CreateInvItems	(hero, ItMw_1h_Pal_Sword_Geschaerft, 1);
};

// Paladinschwert

INSTANCE PC_Herd_Sharp_ItMw_Paladinschwert (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Paladinschwert_Condition;
	information	= PC_Herd_Sharp_ItMw_Paladinschwert_Info;
	permanent	= 1;
	important	= 0;
	description	= "Paladinschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Paladinschwert_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Paladinschwert)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Paladinschwert_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Paladinschwert, 1);

	CreateInvItems	(hero, ItMw_Paladinschwert_Geschaerft, 1);
};

// Paladin Zweihänder

INSTANCE PC_Herd_Sharp_ItMw_2h_Pal_Sword (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2h_Pal_Sword_Condition;
	information	= PC_Herd_Sharp_ItMw_2h_Pal_Sword_Info;
	permanent	= 1;
	important	= 0;
	description	= "Paladin Zweihänder schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2h_Pal_Sword_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2h_Pal_Sword)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2h_Pal_Sword_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2h_Pal_Sword, 1);

	CreateInvItems	(hero, ItMw_2h_Pal_Sword_Geschaerft, 1);
};

// Piratensäbel

INSTANCE PC_Herd_Sharp_ItMw_Piratensaebel (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Piratensaebel_Condition;
	information	= PC_Herd_Sharp_ItMw_Piratensaebel_Info;
	permanent	= 1;
	important	= 0;
	description	= "Piratensäbel schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Piratensaebel_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Piratensaebel)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Piratensaebel_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Piratensaebel, 1);

	CreateInvItems	(hero, ItMw_Piratensaebel_Geschaerft, 1);
};

// Plankenbrecher

INSTANCE PC_Herd_Sharp_ItMw_Addon_PIR2hAxe (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Addon_PIR2hAxe_Condition;
	information	= PC_Herd_Sharp_ItMw_Addon_PIR2hAxe_Info;
	permanent	= 1;
	important	= 0;
	description	= "Plankenbrecher schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Addon_PIR2hAxe_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Addon_PIR2hAxe)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Addon_PIR2hAxe_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Addon_PIR2hAxe, 1);

	CreateInvItems	(hero, ItMw_Addon_PIR2hAxe_Geschaerft, 1);
};

// Rapier
INSTANCE PC_Herd_Sharp_ItMw_Rapier (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Rapier_Condition;
	information	= PC_Herd_Sharp_ItMw_Rapier_Info;
	permanent	= 1;
	important	= 0;
	description	= "Rapier schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Rapier_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Rapier)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Rapier_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Rapier, 1);

	CreateInvItems	(hero, ItMw_Rapier_Geschaerft, 1);
};

// Richtstab

INSTANCE PC_Herd_Sharp_ItMw_Richtstab (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Richtstab_Condition;
	information	= PC_Herd_Sharp_ItMw_Richtstab_Info;
	permanent	= 1;
	important	= 0;
	description	= "Richtstab schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Richtstab_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Richtstab)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Richtstab_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Richtstab, 1);

	CreateInvItems	(hero, ItMw_Richtstab_Geschaerft, 1);
};

// Riesenmachete

INSTANCE PC_Herd_Sharp_ItMW_Addon_Hacker_2h_01 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMW_Addon_Hacker_2h_01_Condition;
	information	= PC_Herd_Sharp_ItMW_Addon_Hacker_2h_01_Info;
	permanent	= 1;
	important	= 0;
	description	= "Riesenmachete schärfen";
};

FUNC INT PC_Herd_Sharp_ItMW_Addon_Hacker_2h_01_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMW_Addon_Hacker_2h_01)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMW_Addon_Hacker_2h_01_Info()
{
	Npc_RemoveInvItems	(hero, ItMW_Addon_Hacker_2h_01, 1);

	CreateInvItems	(hero, ItMW_Addon_Hacker_2h_01_Geschaerft, 1);
};

// Rostige Axt

INSTANCE PC_Herd_Sharp_ItMw_1h_Misc_Axe (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1h_Misc_Axe_Condition;
	information	= PC_Herd_Sharp_ItMw_1h_Misc_Axe_Info;
	permanent	= 1;
	important	= 0;
	description	= "Rostige Axt schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1h_Misc_Axe_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1h_Misc_Axe)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1h_Misc_Axe_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1h_Misc_Axe, 1);

	CreateInvItems	(hero, ItMw_1h_Misc_Axe_Geschaerft, 1);
};

// Rostiger Zweihänder

INSTANCE PC_Herd_Sharp_ItMw_2H_Sword_M_01 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2H_Sword_M_01_Condition;
	information	= PC_Herd_Sharp_ItMw_2H_Sword_M_01_Info;
	permanent	= 1;
	important	= 0;
	description	= "Rostiger Zweihänder schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2H_Sword_M_01_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2H_Sword_M_01)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2H_Sword_M_01_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2H_Sword_M_01, 1);

	CreateInvItems	(hero, ItMw_2H_Sword_M_01_Geschaerft, 1);
};

// Rostiges Schwert

INSTANCE PC_Herd_Sharp_ItMw_1h_MISC_Sword (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1h_MISC_Sword_Condition;
	information	= PC_Herd_Sharp_ItMw_1h_MISC_Sword_Info;
	permanent	= 1;
	important	= 0;
	description	= "Rostiges Schwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1h_MISC_Sword_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1h_MISC_Sword)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1h_MISC_Sword_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1h_MISC_Sword, 1);

	CreateInvItems	(hero, ItMw_1h_MISC_Sword_Geschaerft, 1);
};

// Rubinklinge

INSTANCE PC_Herd_Sharp_ItMw_Rubinklinge (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Rubinklinge_Condition;
	information	= PC_Herd_Sharp_ItMw_Rubinklinge_Info;
	permanent	= 1;
	important	= 0;
	description	= "Rubinklinge schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Rubinklinge_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Rubinklinge)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Rubinklinge_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Rubinklinge, 1);

	CreateInvItems	(hero, ItMw_Rubinklinge_Geschaerft, 1);
};

// Rubinklinge (Bonus)

INSTANCE PC_Herd_Sharp_ItMw_Rubinklinge_Bonus (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Rubinklinge_Bonus_Condition;
	information	= PC_Herd_Sharp_ItMw_Rubinklinge_Bonus_Info;
	permanent	= 1;
	important	= 0;
	description	= "Rubinklinge schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Rubinklinge_Bonus_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Rubinklinge_Bonus)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Rubinklinge_Bonus_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Rubinklinge_Bonus, 1);

	CreateInvItems	(hero, ItMw_Rubinklinge_Bonus_Geschaerft, 1);
};

// Rubinklinge (Meisterschmied)

INSTANCE PC_Herd_Sharp_ItMw_Rubinklinge_Meisterschmied (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Rubinklinge_Meisterschmied_Condition;
	information	= PC_Herd_Sharp_ItMw_Rubinklinge_Meisterschmied_Info;
	permanent	= 1;
	important	= 0;
	description	= "Rubinklinge schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Rubinklinge_Meisterschmied_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Rubinklinge_Meisterschmied)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Rubinklinge_Meisterschmied_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Rubinklinge_Meisterschmied, 1);

	CreateInvItems	(hero, ItMw_Rubinklinge_Meisterschmied_Geschaerft, 1);
};

// Rubinklinge (BonusMeisterschmied)

INSTANCE PC_Herd_Sharp_ItMw_Rubinklinge_BonusMeisterschmied (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Rubinklinge_BonusMeisterschmied_Condition;
	information	= PC_Herd_Sharp_ItMw_Rubinklinge_BonusMeisterschmied_Info;
	permanent	= 1;
	important	= 0;
	description	= "Rubinklinge schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Rubinklinge_BonusMeisterschmied_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Rubinklinge_BonusMeisterschmied)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Rubinklinge_BonusMeisterschmied_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Rubinklinge_BonusMeisterschmied, 1);

	CreateInvItems	(hero, ItMw_Rubinklinge_BonusMeisterschmied_Geschaerft, 1);
};

// Rubinklinge (StarkBonusMeisterschmied)

INSTANCE PC_Herd_Sharp_ItMw_Rubinklinge_StarkBonusMeisterschmied (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Rubinklinge_StarkBonusMeisterschmied_Condition;
	information	= PC_Herd_Sharp_ItMw_Rubinklinge_StarkBonusMeisterschmied_Info;
	permanent	= 1;
	important	= 0;
	description	= "Rubinklinge schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Rubinklinge_StarkBonusMeisterschmied_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Rubinklinge_StarkBonusMeisterschmied)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Rubinklinge_StarkBonusMeisterschmied_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Rubinklinge_StarkBonusMeisterschmied, 1);

	CreateInvItems	(hero, ItMw_Rubinklinge_StarkBonusMeisterschmied_Geschaerft, 1);
};

// Rubinklinge (StarkBonus)

INSTANCE PC_Herd_Sharp_ItMw_Rubinklinge_StarkBonus (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Rubinklinge_StarkBonus_Condition;
	information	= PC_Herd_Sharp_ItMw_Rubinklinge_StarkBonus_Info;
	permanent	= 1;
	important	= 0;
	description	= "Rubinklinge schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Rubinklinge_StarkBonus_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Rubinklinge_StarkBonus)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Rubinklinge_StarkBonus_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Rubinklinge_StarkBonus, 1);

	CreateInvItems	(hero, ItMw_Rubinklinge_StarkBonus_Geschaerft, 1);
};

// Rubinklinge (StarkMeisterschmied)

INSTANCE PC_Herd_Sharp_ItMw_Rubinklinge_StarkMeisterschmied (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Rubinklinge_StarkMeisterschmied_Condition;
	information	= PC_Herd_Sharp_ItMw_Rubinklinge_StarkMeisterschmied_Info;
	permanent	= 1;
	important	= 0;
	description	= "Rubinklinge schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Rubinklinge_StarkMeisterschmied_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Rubinklinge_StarkMeisterschmied)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Rubinklinge_StarkMeisterschmied_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Rubinklinge_StarkMeisterschmied, 1);

	CreateInvItems	(hero, ItMw_Rubinklinge_StarkMeisterschmied_Geschaerft, 1);
};

// Rubinklinge (Stark)

INSTANCE PC_Herd_Sharp_ItMw_Rubinklinge_Stark (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Rubinklinge_Stark_Condition;
	information	= PC_Herd_Sharp_ItMw_Rubinklinge_Stark_Info;
	permanent	= 1;
	important	= 0;
	description	= "Rubinklinge schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Rubinklinge_Stark_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Rubinklinge_Stark)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Rubinklinge_Stark_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Rubinklinge_Stark, 1);

	CreateInvItems	(hero, ItMw_Rubinklinge_Stark_Geschaerft, 1);
};

// Runen - Macht

INSTANCE PC_Herd_Sharp_ItMw_Zweihaender3 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Zweihaender3_Condition;
	information	= PC_Herd_Sharp_ItMw_Zweihaender3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Runen - Macht schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Zweihaender3_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Zweihaender3)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Zweihaender3_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Zweihaender3, 1);

	CreateInvItems	(hero, ItMw_Zweihaender3_Geschaerft, 1);
};

// Runenschwert

INSTANCE PC_Herd_Sharp_ItMw_Runenschwert (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Runenschwert_Condition;
	information	= PC_Herd_Sharp_ItMw_Runenschwert_Info;
	permanent	= 1;
	important	= 0;
	description	= "Runenschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Runenschwert_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Runenschwert)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Runenschwert_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Runenschwert, 1);

	CreateInvItems	(hero, ItMw_Runenschwert_Geschaerft, 1);
};

// Schädelbrecher

INSTANCE PC_Herd_Sharp_ItMW_Schaedelbrecher (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMW_Schaedelbrecher_Condition;
	information	= PC_Herd_Sharp_ItMW_Schaedelbrecher_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schädelbrecher schärfen";
};

FUNC INT PC_Herd_Sharp_ItMW_Schaedelbrecher_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMW_Schaedelbrecher)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMW_Schaedelbrecher_Info()
{
	Npc_RemoveInvItems	(hero, ItMW_Schaedelbrecher, 1);

	CreateInvItems	(hero, ItMW_Schaedelbrecher_Geschaerft, 1);
};

// Schiffsaxt

INSTANCE PC_Herd_Sharp_ItMw_Schiffsaxt (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schiffsaxt_Condition;
	information	= PC_Herd_Sharp_ItMw_Schiffsaxt_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schiffsaxt schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schiffsaxt_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schiffsaxt)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schiffsaxt_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schiffsaxt, 1);

	CreateInvItems	(hero, ItMw_Schiffsaxt_Geschaerft, 1);
};

// Schlachtaxt

INSTANCE PC_Herd_Sharp_ItMw_Schlachtaxt (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schlachtaxt_Condition;
	information	= PC_Herd_Sharp_ItMw_Schlachtaxt_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schlachtaxt schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schlachtaxt_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schlachtaxt)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schlachtaxt_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schlachtaxt, 1);

	CreateInvItems	(hero, ItMw_Schlachtaxt_Geschaerft, 1);
};

// Schmetteraxt

INSTANCE PC_Herd_Sharp_ItMw_Schmetteraxt (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schmetteraxt_Condition;
	information	= PC_Herd_Sharp_ItMw_Schmetteraxt_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schmetteraxt schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schmetteraxt_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schmetteraxt)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schmetteraxt_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schmetteraxt, 1);

	CreateInvItems	(hero, ItMw_Schmetteraxt_Geschaerft, 1);
};

// Schürhaken

INSTANCE PC_Herd_Sharp_ItMw_1H_Mace_L_01 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Mace_L_01_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Mace_L_01_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schürhaken schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Mace_L_01_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Mace_L_01)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Mace_L_01_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Mace_L_01, 1);

	CreateInvItems	(hero, ItMw_1H_Mace_L_01_Geschaerft, 1);
};

// Schütterschwert

INSTANCE PC_Herd_Sharp_ItMw_Schuetterschwert (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schuetterschwert_Condition;
	information	= PC_Herd_Sharp_ItMw_Schuetterschwert_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schütterschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schuetterschwert_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schuetterschwert)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schuetterschwert_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schuetterschwert, 1);

	CreateInvItems	(hero, ItMw_Schuetterschwert_Geschaerft, 1);
};

// Schwere Erz-Schlachtklinge

INSTANCE PC_Herd_Sharp_ItMw_2H_Special_03 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2H_Special_03_Condition;
	information	= PC_Herd_Sharp_ItMw_2H_Special_03_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schwere Erz-Schlachtklinge schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2H_Special_03_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2H_Special_03)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2H_Special_03_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2H_Special_03, 1);

	CreateInvItems	(hero, ItMw_2H_Special_03_Geschaerft, 1);
};

// Schwere Erz-Schlachtklinge des Versengens

INSTANCE PC_Herd_Sharp_ItMw_2H_Special_03_Feuer (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2H_Special_03_Feuer_Condition;
	information	= PC_Herd_Sharp_ItMw_2H_Special_03_Feuer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schwere Erz-Schlachtklinge des Versengens schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2H_Special_03_Feuer_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2H_Special_03_Feuer)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2H_Special_03_Feuer_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2H_Special_03_Feuer, 1);

	CreateInvItems	(hero, ItMw_2H_Special_03_Feuer_Geschaerft, 1);
};

// Schwere Erz-Schlachtklinge des Wasserhiebes

INSTANCE PC_Herd_Sharp_ItMw_2H_Special_03_Wasser (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2H_Special_03_Wasser_Condition;
	information	= PC_Herd_Sharp_ItMw_2H_Special_03_Wasser_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schwere Erz-Schlachtklinge des Wasserhiebes schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2H_Special_03_Wasser_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2H_Special_03_Wasser)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2H_Special_03_Wasser_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2H_Special_03_Wasser, 1);

	CreateInvItems	(hero, ItMw_2H_Special_03_Wasser_Geschaerft, 1);
};

// Schwerer Erz-Drachentöter

INSTANCE PC_Herd_Sharp_ItMw_2H_Special_04 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2H_Special_04_Condition;
	information	= PC_Herd_Sharp_ItMw_2H_Special_04_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schwerer Erz-Drachentöter schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2H_Special_04_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2H_Special_04)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2H_Special_04_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2H_Special_04, 1);

	CreateInvItems	(hero, ItMw_2H_Special_04_Geschaerft, 1);
};

// Schwerer Erz-Drachentöter des Versengens

INSTANCE PC_Herd_Sharp_ItMw_2H_Special_04_Feuer (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2H_Special_04_Feuer_Condition;
	information	= PC_Herd_Sharp_ItMw_2H_Special_04_Feuer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schwerer Erz-Drachentöter des Versengens schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2H_Special_04_Feuer_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2H_Special_04_Feuer)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2H_Special_04_Feuer_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2H_Special_04_Feuer, 1);

	CreateInvItems	(hero, ItMw_2H_Special_04_Feuer_Geschaerft, 1);
};

// Schwerer Erz-Drachentöter des Wasserhiebes

INSTANCE PC_Herd_Sharp_ItMw_2H_Special_04_Wasser (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2H_Special_04_Wasser_Condition;
	information	= PC_Herd_Sharp_ItMw_2H_Special_04_Wasser_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schwerer Erz-Drachentöter des Wasserhiebes schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2H_Special_04_Wasser_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2H_Special_04_Wasser)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2H_Special_04_Wasser_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2H_Special_04_Wasser, 1);

	CreateInvItems	(hero, ItMw_2H_Special_04_Wasser_Geschaerft, 1);
};

// Schwerer Zweihänder

INSTANCE PC_Herd_Sharp_ItMw_Zweihaender4 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Zweihaender4_Condition;
	information	= PC_Herd_Sharp_ItMw_Zweihaender4_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schweren Zweihänder schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Zweihaender4_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Zweihaender4)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Zweihaender4_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Zweihaender4, 1);

	CreateInvItems	(hero, ItMw_Zweihaender4_Geschaerft, 1);
};

// Schweres Ritterschwert

INSTANCE PC_Herd_Sharp_ItMw_Schwert_03 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schwert_03_Condition;
	information	= PC_Herd_Sharp_ItMw_Schwert_03_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schweres Ritterschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schwert_03_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schwert_03)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schwert_03_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schwert_03, 1);

	CreateInvItems	(hero, ItMw_Schwert_03_Geschaerft, 1);
};

// Schwert 02

INSTANCE PC_Herd_Sharp_ItMw_Schwert_02 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schwert_02_Condition;
	information	= PC_Herd_Sharp_ItMw_Schwert_02_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schwert 02 schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schwert_02_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Schwert_02)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schwert_02_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Schwert_02, 1);

	CreateInvItems	(hero, ItMw_Schwert_02_Geschaerft, 1);
};

// Schwert der Miliz

INSTANCE PC_Herd_Sharp_ItMw_Milizschwert (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Milizschwert_Condition;
	information	= PC_Herd_Sharp_ItMw_Milizschwert_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schwert der Miliz schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Milizschwert_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Milizschwert)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Milizschwert_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Milizschwert, 1);

	CreateInvItems	(hero, ItMw_Milizschwert_Geschaerft, 1);
};

// Schwert Neu

INSTANCE PC_Herd_Sharp_ItMw_Schwert_Neu (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Schwert_Neu_Condition;
	information	= PC_Herd_Sharp_ItMw_Schwert_Neu_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schwert Neu schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Schwert_Neu_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1h_quantarie_Schwert_01)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Schwert_Neu_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1h_quantarie_Schwert_01, 1);

	CreateInvItems	(hero, ItMw_1h_quantarie_Schwert_01_Geschaerft, 1);
};

// Sense

INSTANCE PC_Herd_Sharp_ItMW_Sense_01 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMW_Sense_01_Condition;
	information	= PC_Herd_Sharp_ItMW_Sense_01_Info;
	permanent	= 1;
	important	= 0;
	description	= "Sense schärfen";
};

FUNC INT PC_Herd_Sharp_ItMW_Sense_01_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMW_Sense_01)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMW_Sense_01_Info()
{
	Npc_RemoveInvItems	(hero, ItMW_Sense_01, 1);

	CreateInvItems	(hero, ItMW_Sense_01_Geschaerft, 1);
};

// Sense

INSTANCE PC_Herd_Sharp_ItMW_Sense_02 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMW_Sense_02_Condition;
	information	= PC_Herd_Sharp_ItMW_Sense_02_Info;
	permanent	= 1;
	important	= 0;
	description	= "Sense schärfen";
};

FUNC INT PC_Herd_Sharp_ItMW_Sense_02_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMW_Sense_02)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMW_Sense_02_Info()
{
	Npc_RemoveInvItems	(hero, ItMW_Sense_02, 1);

	CreateInvItems	(hero, ItMW_Sense_02_Geschaerft, 1);
};

// Sense

INSTANCE PC_Herd_Sharp_ItMW_Sense_03 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMW_Sense_03_Condition;
	information	= PC_Herd_Sharp_ItMW_Sense_03_Info;
	permanent	= 1;
	important	= 0;
	description	= "Sense schärfen";
};

FUNC INT PC_Herd_Sharp_ItMW_Sense_03_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMW_Sense_03)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMW_Sense_03_Info()
{
	Npc_RemoveInvItems	(hero, ItMW_Sense_03, 1);

	CreateInvItems	(hero, ItMW_Sense_03_Geschaerft, 1);
};

// Sichel

INSTANCE PC_Herd_Sharp_ItMw_1h_Bau_Axe (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1h_Bau_Axe_Condition;
	information	= PC_Herd_Sharp_ItMw_1h_Bau_Axe_Info;
	permanent	= 1;
	important	= 0;
	description	= "Sichel schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1h_Bau_Axe_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1h_Bau_Axe)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1h_Bau_Axe_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1h_Bau_Axe, 1);

	CreateInvItems	(hero, ItMw_1h_Bau_Axe_Geschaerft, 1);
};

// Siegbringer

INSTANCE PC_Herd_Sharp_ItMw_1H_Sword_Long_04 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Sword_Long_04_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Sword_Long_04_Info;
	permanent	= 1;
	important	= 0;
	description	= "Siegbringer schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Sword_Long_04_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Sword_Long_04)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Sword_Long_04_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Sword_Long_04, 1);

	CreateInvItems	(hero, ItMw_1H_Sword_Long_04_Geschaerft, 1);
};

// Streitaxt

INSTANCE PC_Herd_Sharp_ItMw_Streitaxt2 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Streitaxt2_Condition;
	information	= PC_Herd_Sharp_ItMw_Streitaxt2_Info;
	permanent	= 1;
	important	= 0;
	description	= "Streitaxt schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Streitaxt2_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Streitaxt2)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Streitaxt2_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Streitaxt2, 1);

	CreateInvItems	(hero, ItMw_Streitaxt2_Geschaerft, 1);
};

// Sturmbringer

INSTANCE PC_Herd_Sharp_ItMw_Sturmbringer (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Sturmbringer_Condition;
	information	= PC_Herd_Sharp_ItMw_Sturmbringer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Sturmbringer schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Sturmbringer_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Sturmbringer)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Sturmbringer_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Sturmbringer, 1);

	CreateInvItems	(hero, ItMw_Sturmbringer_Geschaerft, 1);
};

// Taifun

INSTANCE PC_Herd_Sharp_ItMW_Addon_Stab05 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMW_Addon_Stab05_Condition;
	information	= PC_Herd_Sharp_ItMW_Addon_Stab05_Info;
	permanent	= 1;
	important	= 0;
	description	= "Taifun schärfen";
};

FUNC INT PC_Herd_Sharp_ItMW_Addon_Stab05_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMW_Addon_Stab05)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMW_Addon_Stab05_Info()
{
	Npc_RemoveInvItems	(hero, ItMW_Addon_Stab05, 1);

	CreateInvItems	(hero, ItMW_Addon_Stab05_Geschaerft, 1);
};

// Templerklinge

INSTANCE PC_Herd_Sharp_ItMw_2H_Sword_Light_02 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2H_Sword_Light_02_Condition;
	information	= PC_Herd_Sharp_ItMw_2H_Sword_Light_02_Info;
	permanent	= 1;
	important	= 0;
	description	= "Templerklinge schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2H_Sword_Light_02_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2H_Sword_Light_02)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2H_Sword_Light_02_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2H_Sword_Light_02, 1);

	CreateInvItems	(hero, ItMw_2H_Sword_Light_02_Geschaerft, 1);
};

// Todbringer

INSTANCE PC_Herd_Sharp_ItMw_1H_Sword_Long_05 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Sword_Long_05_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Sword_Long_05_Info;
	permanent	= 1;
	important	= 0;
	description	= "Todbringer schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Sword_Long_05_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Sword_Long_05)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Sword_Long_05_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Sword_Long_05, 1);

	CreateInvItems	(hero, ItMw_1H_Sword_Long_05_Geschaerft, 1);
};

// Trümmeraxt

INSTANCE PC_Herd_Sharp_ItMw_Truemmeraxt (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Truemmeraxt_Condition;
	information	= PC_Herd_Sharp_ItMw_Truemmeraxt_Info;
	permanent	= 1;
	important	= 0;
	description	= "Trümmeraxt schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Truemmeraxt_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Truemmeraxt)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Truemmeraxt_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Truemmeraxt, 1);

	CreateInvItems	(hero, ItMw_Truemmeraxt_Geschaerft, 1);
};

// Vergoldetes Schwert

INSTANCE PC_Herd_Sharp_ItMw_2H_Eminem_Goldschwert_01 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_2H_Eminem_Goldschwert_01_Condition;
	information	= PC_Herd_Sharp_ItMw_2H_Eminem_Goldschwert_01_Info;
	permanent	= 1;
	important	= 0;
	description	= "Vergoldetes Schwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_2H_Eminem_Goldschwert_01_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_2H_Eminem_Goldschwert_01)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_2H_Eminem_Goldschwert_01_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_2H_Eminem_Goldschwert_01, 1);

	CreateInvItems	(hero, ItMw_2H_Eminem_Goldschwert_01_Geschaerft, 1);
};

// Vollstrecker

INSTANCE PC_Herd_Sharp_ItMw_1H_Sword_Bastard_03 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Sword_Bastard_03_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Sword_Bastard_03_Info;
	permanent	= 1;
	important	= 0;
	description	= "Vollstrecker schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Sword_Bastard_03_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Sword_Bastard_03)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Sword_Bastard_03_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Sword_Bastard_03, 1);

	CreateInvItems	(hero, ItMw_1H_Sword_Bastard_03_Geschaerft, 1);
};

// Wolfsklinge

INSTANCE PC_Herd_Sharp_ItMw_1H_Sword_L_03 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Sword_L_03_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Sword_L_03_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wolfsklinge schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Sword_L_03_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Sword_L_03)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Sword_L_03_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Sword_L_03, 1);

	CreateInvItems	(hero, ItMw_1H_Sword_L_03_Geschaerft, 1);
};

// Wolfsmesser

INSTANCE PC_Herd_Sharp_ItMW_Addon_Knife01 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMW_Addon_Knife01_Condition;
	information	= PC_Herd_Sharp_ItMW_Addon_Knife01_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wolfsmesser schärfen";
};

FUNC INT PC_Herd_Sharp_ItMW_Addon_Knife01_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMW_Addon_Knife01)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMW_Addon_Knife01_Info()
{
	Npc_RemoveInvItems	(hero, ItMW_Addon_Knife01, 1);

	CreateInvItems	(hero, ItMW_Addon_Knife01_Geschaerft, 1);
};

// Wolfszahn

INSTANCE PC_Herd_Sharp_ItMw_ShortSword4 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_ShortSword4_Condition;
	information	= PC_Herd_Sharp_ItMw_ShortSword4_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wolfszahn schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_ShortSword4_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_ShortSword4)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_ShortSword4_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_ShortSword4, 1);

	CreateInvItems	(hero, ItMw_ShortSword4_Geschaerft, 1);
};

// Xeres' Schwert

INSTANCE PC_Herd_Sharp_Xeres_Schwert (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_Xeres_Schwert_Condition;
	information	= PC_Herd_Sharp_Xeres_Schwert_Info;
	permanent	= 1;
	important	= 0;
	description	= "Xeres' Schwert schärfen";
};

FUNC INT PC_Herd_Sharp_Xeres_Schwert_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, Xeres_Schwert)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_Xeres_Schwert_Info()
{
	Npc_RemoveInvItems	(hero, Xeres_Schwert, 1);

	CreateInvItems	(hero, Xeres_Schwert_Geschaerft, 1);
};

// Zeusschwert

INSTANCE PC_Herd_Sharp_ItMw_1H_Neok_Zeusschwert_01 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_1H_Neok_Zeusschwert_01_Condition;
	information	= PC_Herd_Sharp_ItMw_1H_Neok_Zeusschwert_01_Info;
	permanent	= 1;
	important	= 0;
	description	= "Zeusschwert schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_1H_Neok_Zeusschwert_01_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_1H_Neok_Zeusschwert_01)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_1H_Neok_Zeusschwert_01_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_1H_Neok_Zeusschwert_01, 1);

	CreateInvItems	(hero, ItMw_1H_Neok_Zeusschwert_01_Geschaerft, 1);
};

// Zweihänder

INSTANCE PC_Herd_Sharp_ItMw_Zweihaender2 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Zweihaender2_Condition;
	information	= PC_Herd_Sharp_ItMw_Zweihaender2_Info;
	permanent	= 1;
	important	= 0;
	description	= "Zweihänder schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Zweihaender2_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Zweihaender2)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Zweihaender2_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Zweihaender2, 1);

	CreateInvItems	(hero, ItMw_Zweihaender2_Geschaerft, 1);
};

// Zweiklinge

INSTANCE PC_Herd_Sharp_ItMw_Zweiklinge (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Zweiklinge_Condition;
	information	= PC_Herd_Sharp_ItMw_Zweiklinge_Info;
	permanent	= 1;
	important	= 0;
	description	= "Zweiklinge schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Zweiklinge_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Zweiklinge)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Zweiklinge_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Zweiklinge, 1);

	CreateInvItems	(hero, ItMw_Zweiklinge_Geschaerft, 1);
};

// Hüterklinge 1H

INSTANCE PC_Herd_Sharp_ItMw_Hueterklinge_1H (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Hueterklinge_1H_Condition;
	information	= PC_Herd_Sharp_ItMw_Hueterklinge_1H_Info;
	permanent	= 1;
	important	= 0;
	description	= "Hüterklinge schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Hueterklinge_1H_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Hueterklinge_1H)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Hueterklinge_1H_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Hueterklinge_1H, 1);

	CreateInvItems	(hero, ItMw_Hueterklinge_1H_Geschaerft, 1);
};

// Hüterklinge 2H

INSTANCE PC_Herd_Sharp_ItMw_Hueterklinge_2H (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_Hueterklinge_2H_Condition;
	information	= PC_Herd_Sharp_ItMw_Hueterklinge_2H_Info;
	permanent	= 1;
	important	= 0;
	description	= "Hüterklinge schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_Hueterklinge_2H_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_Hueterklinge_2H)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_Hueterklinge_2H_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_Hueterklinge_2H, 1);

	CreateInvItems	(hero, ItMw_Hueterklinge_2H_Geschaerft, 1);
};

// Alte Hüterklinge 1H

INSTANCE PC_Herd_Sharp_ItMw_AlteHueterklinge_1H (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_AlteHueterklinge_1H_Condition;
	information	= PC_Herd_Sharp_ItMw_AlteHueterklinge_1H_Info;
	permanent	= 1;
	important	= 0;
	description	= "Alte Hüterklinge schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_AlteHueterklinge_1H_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_AlteHueterklinge_1H)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_AlteHueterklinge_1H_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_AlteHueterklinge_1H, 1);

	CreateInvItems	(hero, ItMw_AlteHueterklinge_1H_Geschaerft, 1);
};

// Alte Hüterklinge 2H

INSTANCE PC_Herd_Sharp_ItMw_AlteHueterklinge_2H (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_AlteHueterklinge_2H_Condition;
	information	= PC_Herd_Sharp_ItMw_AlteHueterklinge_2H_Info;
	permanent	= 1;
	important	= 0;
	description	= "Alte Hüterklinge schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_AlteHueterklinge_2H_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_AlteHueterklinge_2H)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_AlteHueterklinge_2H_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_AlteHueterklinge_2H, 1);

	CreateInvItems	(hero, ItMw_AlteHueterklinge_2H_Geschaerft, 1);
};

// Falsche Hüterklinge 1H

INSTANCE PC_Herd_Sharp_ItMw_FalscheHueterklinge_1H (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_FalscheHueterklinge_1H_Condition;
	information	= PC_Herd_Sharp_ItMw_FalscheHueterklinge_1H_Info;
	permanent	= 1;
	important	= 0;
	description	= "Falsche Hüterklinge schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_FalscheHueterklinge_1H_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_FalscheHueterklinge_1H)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_FalscheHueterklinge_1H_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_FalscheHueterklinge_1H, 1);

	CreateInvItems	(hero, ItMw_FalscheHueterklinge_1H_Geschaerft, 1);
};

// Hüterklinge 2H

INSTANCE PC_Herd_Sharp_ItMw_FalscheHueterklinge_2H (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Herd_Sharp_ItMw_FalscheHueterklinge_2H_Condition;
	information	= PC_Herd_Sharp_ItMw_FalscheHueterklinge_2H_Info;
	permanent	= 1;
	important	= 0;
	description	= "Falsche Hüterklinge schärfen";
};

FUNC INT PC_Herd_Sharp_ItMw_FalscheHueterklinge_2H_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_HasItems(hero, ItMw_FalscheHueterklinge_2H)	>=	1)
	{
		return 1;
	};
};

FUNC VOID PC_Herd_Sharp_ItMw_FalscheHueterklinge_2H_Info()
{
	Npc_RemoveInvItems	(hero, ItMw_FalscheHueterklinge_2H, 1);

	CreateInvItems	(hero, ItMw_FalscheHueterklinge_2H_Geschaerft, 1);
};

INSTANCE PC_Schleifstein_EXIT (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Schleifstein_EXIT_Condition;
	information	= PC_Schleifstein_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT PC_Schleifstein_EXIT_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Schleifstein)
	&& (Schleifen	==	FALSE)
	{
		return 1;
	};
};

FUNC VOID PC_Schleifstein_EXIT_Info()
{
	B_ENDPRODUCTIONDIALOG();
};