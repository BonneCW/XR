var int SchreinBeschmutzt;
var int SCHREINENTWEIHEN;

var int PrayDay;
var string concatDonation;

var int Shrine_STR_Bonus;
var int Shrine_DEX_Bonus;
var int Shrine_MANA_Bonus;
var int ShrineIsObsessed;

var int ShrineIsObsessed_NW_TROLLAREA_PATH_37;
var int ShrineIsObsessed_NW_FARM1_CONNECT_XARDAS;
var int ShrineIsObsessed_NW_TROLLAREA_PATH_66;
var int ShrineIsObsessed_NW_TROLLAREA_PATH_04;
var int ShrineIsObsessed_SAGITTA;
var int ShrineIsObsessed_NW_BIGMILL_MALAKSVERSTECK_02;
var int ShrineIsObsessed_NW_FARM3_BIGWOOD_02;
var int ShrineIsObsessed_NW_SHRINE_01;

var int ShrineWeihe_01;
var int ShrineWeihe_02;
var int ShrineWeihe_03;
var int ShrineWeihe_04;
var int ShrineWeihe_05;
var int ShrineWeihe_06;
var int ShrineWeihe_07;
var int ShrineWeihe_08;
var int ShrineWeihe_09;
var int ShrineWeihe_10;
var int ShrineWeihe_11;
var int ShrineWeihe_12;
var int ShrineWeihe_13;

FUNC INT C_IsShrineReadyForWeihe() {
	if (Npc_GetDistToWP(hero, "NW_FARM1_CONNECT_XARDAS") < 2000)
	&& (ShrineWeihe_01 == FALSE) {
		return TRUE;
	} else if (Npc_GetDistToWP(hero, "WP_NW_SHRINE_01") < 2000)
	&& (ShrineWeihe_02 == FALSE) {
		return TRUE;
	} else if (Npc_GetDistToWP(hero, "NW_FOREST_PATH_80_1_MOVEMENT16") < 2000)
	&& (ShrineWeihe_03 == FALSE) {
		return TRUE;
	} else if (Npc_GetDistToWP(hero, "WP_NW_SHRINE_02") < 2000)
	&& (ShrineWeihe_04 == FALSE) {
		return TRUE;
	} else if (Npc_GetDistToWP(hero, "NW_TAVERNE_TROLLAREA_11_A") < 2000)
	&& (ShrineWeihe_05 == FALSE) {
		return TRUE;
	} else if (Npc_GetDistToWP(hero, "WP_NW_SHRINE_03") < 2000)
	&& (ShrineWeihe_06 == FALSE) {
		return TRUE;
	} else if (Npc_GetDistToWP(hero, "NW_BIGMILL_MALAKSVERSTECK_02") < 2000)
	&& (ShrineWeihe_07 == FALSE) {
		return TRUE;
	} else if (Npc_GetDistToWP(hero, "NW_MONASTERY_CHAPELL_02") < 2000)
	&& (ShrineWeihe_08 == FALSE) {
		return TRUE;
	} else if (Npc_GetDistToWP(hero, "NW_SHRINE_01") < 2000)
	&& (ShrineWeihe_09 == FALSE) {
		return TRUE;
	} else if (Npc_GetDistToWP(hero, "NW_TROLLAREA_PATH_04") < 2000)
	&& (ShrineWeihe_10 == FALSE) {
		return TRUE;
	} else if (Npc_GetDistToWP(hero, "NW_TROLLAREA_PATH_66_MONSTER") < 2000)
	&& (ShrineWeihe_11 == FALSE) {
		return TRUE;
	} else if (Npc_GetDistToWP(hero, "NW_TROLLAREA_PATH_37") < 2000)
	&& (ShrineWeihe_12 == FALSE) {
		return TRUE;
	} else if (Npc_GetDistToWP(hero, "REL_129") < 2000)
	&& (ShrineWeihe_13 == FALSE) {
		return TRUE;
	};
	return FALSE;
};

FUNC VOID B_UsedShrineForWeihe() {
	if (Npc_GetDistToWP(hero, "NW_FARM1_CONNECT_XARDAS") < 2000)
	&& (ShrineWeihe_01 == FALSE) {
		ShrineWeihe_01 = TRUE;
	} else if (Npc_GetDistToWP(hero, "WP_NW_SHRINE_01") < 2000)
	&& (ShrineWeihe_02 == FALSE) {
		ShrineWeihe_02 = TRUE;
	} else if (Npc_GetDistToWP(hero, "NW_FOREST_PATH_80_1_MOVEMENT16") < 2000)
	&& (ShrineWeihe_03 == FALSE) {
		ShrineWeihe_03 = TRUE;
	} else if (Npc_GetDistToWP(hero, "WP_NW_SHRINE_02") < 2000)
	&& (ShrineWeihe_04 == FALSE) {
		ShrineWeihe_04 = TRUE;
	} else if (Npc_GetDistToWP(hero, "NW_TAVERNE_TROLLAREA_11_A") < 2000)
	&& (ShrineWeihe_05 == FALSE) {
		ShrineWeihe_05 = TRUE;
	} else if (Npc_GetDistToWP(hero, "WP_NW_SHRINE_03") < 2000)
	&& (ShrineWeihe_06 == FALSE) {
		ShrineWeihe_06 = TRUE;
	} else if (Npc_GetDistToWP(hero, "NW_BIGMILL_MALAKSVERSTECK_02") < 2000)
	&& (ShrineWeihe_07 == FALSE) {
		ShrineWeihe_07 = TRUE;
	} else if (Npc_GetDistToWP(hero, "NW_MONASTERY_CHAPELL_02") < 2000)
	&& (ShrineWeihe_08 == FALSE) {
		ShrineWeihe_08 = TRUE;
	} else if (Npc_GetDistToWP(hero, "NW_SHRINE_01") < 2000)
	&& (ShrineWeihe_09 == FALSE) {
		ShrineWeihe_09 = TRUE;
	} else if (Npc_GetDistToWP(hero, "NW_TROLLAREA_PATH_04") < 2000)
	&& (ShrineWeihe_10 == FALSE) {
		ShrineWeihe_10 = TRUE;
	} else if (Npc_GetDistToWP(hero, "NW_TROLLAREA_PATH_66_MONSTER") < 2000)
	&& (ShrineWeihe_11 == FALSE) {
		ShrineWeihe_11 = TRUE;
	} else if (Npc_GetDistToWP(hero, "NW_TROLLAREA_PATH_37") < 2000)
	&& (ShrineWeihe_12 == FALSE) {
		ShrineWeihe_12 = TRUE;
	} else if (Npc_GetDistToWP(hero, "REL_129") < 2000)
	&& (ShrineWeihe_13 == FALSE) {
		ShrineWeihe_13 = TRUE;
	};
};

FUNC VOID C_IsShrineObsessed (var C_NPC slf)
{
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(hero))
	{
		ShrineIsObsessed = TRUE;

		if ((Npc_GetDistToWP(hero,"NW_TROLLAREA_PATH_37") < 2000)
		&& (ShrineIsObsessed_NW_TROLLAREA_PATH_37 == TRUE))
		{
			
		}
		else if ((Npc_GetDistToWP(hero,"NW_FARM1_CONNECT_XARDAS")<2000)
		&& (ShrineIsObsessed_NW_FARM1_CONNECT_XARDAS == TRUE))
		{
			
		}
		else if ((Npc_GetDistToWP(hero,"NW_TROLLAREA_PATH_66")<2000)
		&& (ShrineIsObsessed_NW_TROLLAREA_PATH_66 == TRUE))
		{
			
		}
		else if ((Npc_GetDistToWP(hero,"NW_TROLLAREA_PATH_04")<2000) 
		&& (ShrineIsObsessed_NW_TROLLAREA_PATH_04 == TRUE))
		{
			
		}
		else if ((Npc_GetDistToWP(hero,"SAGITTA")<2000) 
		&& (ShrineIsObsessed_SAGITTA == TRUE))
		{
			
		}
		else if ((Npc_GetDistToWP(hero,"NW_BIGMILL_MALAKSVERSTECK_02")<2000) 
		&& (ShrineIsObsessed_NW_BIGMILL_MALAKSVERSTECK_02 == TRUE))
		{
			
		}
		else if ((Npc_GetDistToWP(hero,"NW_FARM3_BIGWOOD_02")<2000) 
		&& (ShrineIsObsessed_NW_FARM3_BIGWOOD_02 == TRUE))
		{
			
		}
		else if ((Npc_GetDistToWP(hero,"NW_SHRINE_01")<2000) 
		&& (ShrineIsObsessed_NW_SHRINE_01 == TRUE))
		{
			
		}
		else
		{
			ShrineIsObsessed = FALSE;
		};	
	};
}; 


var int SpecialBless; //RAUS

// ****************************************************
// PrayShrine_S1
// --------------
// Funktion wird durch Shrine-Benutzung aufgerufen!
// *****************************************************
FUNC VOID PrayShrine_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		AI_Output(hero, hero, "Info_Mod_Hero_Altar_Innos_15_00"); //Innos!

		C_IsShrineObsessed (self);

		if (ShrineIsObsessed == TRUE)
		{
			Wld_PlayEffect("DEMENTOR_FX",  hero, hero, 0, 0, 0, FALSE );
		};

		B_SetAivar(self, AIV_INVINCIBLE, TRUE);
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_PrayShrine;
		Ai_ProcessInfos (her);
	};
};

//*******************************************************
//	PrayShrine Dialog abbrechen
//*******************************************************
INSTANCE PC_PrayShrine_End (C_Info)
{
	npc				= PC_Hero;
	nr				= 999;
	condition		= PC_PrayShrine_End_Condition;
	information		= PC_PrayShrine_End_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_PrayShrine_End_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYSHRINE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PrayShrine_End_Info()
{
	B_ENDPRODUCTIONDIALOG ();
}; 

INSTANCE PC_PrayShrine_Klosterwein (C_Info)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PrayShrine_Klosterwein_Condition;
	information		= PC_PrayShrine_Klosterwein_Info;
	permanent		= TRUE;
	description		= "Klosterwein herstellen"; 
};

FUNC INT PC_PrayShrine_Klosterwein_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYSHRINE)
	&& (ShrineIsObsessed == FALSE)
	&& (Npc_HasItems(hero, ItFo_Wine) >= 5)
	&& (Npc_HasItems(hero, ItPo_HealBesessenheit) >= 1)
	&& ((Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch2))
	|| ((Npc_KnowsInfo(hero, Info_Mod_Ulthar_Daemonisch))
	&& (hero.guild == GIL_VLK)))
	{	
		return TRUE;
	};
};

FUNC VOID PC_PrayShrine_Klosterwein_Info()
{
	Npc_RemoveInvItems	(hero, ItFo_Wine, 5);
	Npc_RemoveInvItems	(hero, ItPo_HealBesessenheit, 1);

	CreateInvItems	(hero, ItFo_KWine, 5);
}; 
//*******************************************************
//	Beten
//*******************************************************
INSTANCE PC_PrayShrine_Pray (C_Info)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PrayShrine_Pray_Condition;
	information		= PC_PrayShrine_Pray_Info;
	permanent		= TRUE;
	description		= "Beten"; 
};

FUNC INT PC_PrayShrine_Pray_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYSHRINE)
	&& (ShrineIsObsessed == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PrayShrine_Pray_Info()
{
	Info_ClearChoices (PC_PrayShrine_Pray);
	Info_AddChoice (PC_PrayShrine_Pray,Dialog_Back,PC_PrayShrine_Pray_Back);
	Info_AddChoice (PC_PrayShrine_Pray,"Ich will beten und spende 0 Goldstücke.",PC_PrayShrine_Pray_NoPay);
			
	if (Npc_HasItems (hero,ItMi_Gold) >=10)
	{
		Info_AddChoice (PC_PrayShrine_Pray,"Ich will beten und spende 10 Goldstücke.",PC_PrayShrine_Pray_SmallPay);
	};
	if (Npc_HasItems (hero,ItMi_Gold) >=50)
	{
		Info_AddChoice (PC_PrayShrine_Pray,"Ich will beten und spende 50 Goldstücke.",PC_PrayShrine_Pray_MediumPay);
	};
	if (Npc_HasItems (hero,ItMi_Gold) >=100)
	{
		Info_AddChoice (PC_PrayShrine_Pray,"Ich will beten und spende 100 Goldstücke.",PC_PrayShrine_Pray_BigPay);
	};
}; 

FUNC VOID PC_PrayShrine_Pray_Back ()
{
	Info_ClearChoices (PC_PrayShrine_Pray);
};

INSTANCE PC_PrayShrine_Heilung (C_Info)
{
	npc				= PC_Hero;
	nr				= 3;
	condition		= PC_PrayShrine_Heilung_Condition;
	information		= PC_PrayShrine_Heilung_Info;
	permanent		= TRUE;
	description		= "Komplette Heilung"; 
};

FUNC INT PC_PrayShrine_Heilung_Condition ()
{
	HealPrice = 0;

	if (hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		HealPrice += 200;
	};

	if (GGPf_Sumpfgolem_Time > 0)
	{
		HealPrice += 100;
	};

	if (GGPi_Orkschamane_Time > 0)
	{
		HealPrice += 100;
	};

	if (GGPf_Echsenmensch_Time > 0)
	{
		HealPrice += 100;
	};

	if (GGPi_OrkkriegerArmbrust_Time > 0)
	{
		HealPrice += 100;
	};

	if (GGPi_Fliegenpilz_Time > 0)
	{
		HealPrice += 100;
	};

	if (GGPf_Echsenschwert_Time > 0)
	{
		HealPrice += 100;
	};

	if (GGPf_Assassinenschwert_Time > 0)
	{
		HealPrice += 100;
	};

	if (GGPi_Schamanenaxt_Time > 0)
	{
		HealPrice += 100;
	};

	if (GTB_Blutfliege_Time > 0)
	{
		HealPrice += 100;
	};

	if (GTS_Sumpfgasdrohne_Time > 0)
	{
		HealPrice += 100;
	};

	if (GTM_Minecrawler_Time > 0)
	{
		HealPrice += 100;
	};

	if (GTM_MinecrawlerWarrior_Time > 0)
	{
		HealPrice += 100;
	};

	if (GTSu_Sumpfhai_Time > 0)
	{
		HealPrice += 100;
	};

	if (GTS_Echsenschwert_Time > 0)
	{
		HealPrice += 100;
	};

	if (GTB_Assassinenschwert_Time > 0)
	{
		HealPrice += 100;
	};

	if (GTM_Schamanenaxt_Time > 0)
	{
		HealPrice += 100;
	};

	if (GGD_Sumpfgasdrohne_Time > 0)
	{
		HealPrice += 100;
	};

	if (GGD_Sumpfgolem_Time > 0)
	{
		HealPrice += 100;
	};

	if (GGD_Sumpfdrache_Time > 0)
	{
		HealPrice += 100;
	};

	if (GGD_Giftkrater_Time > 0)
	{
		HealPrice += 100;
	};

	if (BissDerFaeulnis_Time > 0)
	{
		HealPrice += 200;
	};

	if (HauchDerPestilenz_Time > 0)
	{
		HealPrice += 200;
	};

	PC_PrayShrine_Heilung.description = ConcatStrings("Komplette Heilung (", IntToString(HealPrice));
	PC_PrayShrine_Heilung.description = ConcatStrings(PC_PrayShrine_Heilung.description, " Gold)");

	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYSHRINE)
	&& (ShrineIsObsessed == FALSE)
	&& ((hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	|| (GGPf_Sumpfgolem_Time > 0)
	|| (GGPi_Orkschamane_Time > 0)
	|| (GGPf_Echsenmensch_Time > 0)
	|| (GGPi_OrkkriegerArmbrust_Time > 0)
	|| (GGPi_Fliegenpilz_Time > 0)
	|| (GGPf_Echsenschwert_Time > 0)
	|| (GGPf_Assassinenschwert_Time > 0)
	|| (GGPi_Schamanenaxt_Time > 0)
	|| (GTB_Blutfliege_Time > 0)
	|| (GTS_Sumpfgasdrohne_Time > 0)
	|| (GTM_Minecrawler_Time > 0)
	|| (GTM_MinecrawlerWarrior_Time > 0)
	|| (GTSu_Sumpfhai_Time > 0)
	|| (GTS_Echsenschwert_Time > 0)
	|| (GTB_Assassinenschwert_Time > 0)
	|| (GTM_Schamanenaxt_Time > 0)
	|| (GGD_Sumpfgasdrohne_Time > 0)
	|| (GGD_Sumpfgolem_Time > 0)
	|| (GGD_Sumpfdrache_Time > 0)
	|| (GGD_Giftkrater_Time > 0)
	|| (BissDerFaeulnis_Time > 0)
	|| (HauchDerPestilenz_Time > 0))
	{	
		return TRUE;
	};
};

FUNC VOID PC_PrayShrine_Heilung_Info()
{
	if (Npc_HasItems(hero, ItMi_Gold) >= HealPrice)
	{
		hero.attribute [ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

		/*GGPf_Sumpfgolem_Time = 0;
		GGPi_Orkschamane_Time = 0;
		GGPf_Echsenmensch_Time = 0;
		GGPi_OrkkriegerArmbrust_Time = 0;
		GGPi_Fliegenpilz_Time = 0;
		GGPf_Echsenschwert_Time = 0;
		GGPf_Assassinenschwert_Time = 0;
		GGPi_Schamanenaxt_Time = 0;
		GTB_Blutfliege_Time = 0;
		GTS_Sumpfgasdrohne_Time = 0;
		GTM_Minecrawler_Time = 0;
		GTM_MinecrawlerWarrior_Time = 0;
		GTSu_Sumpfhai_Time = 0;
		GTS_Echsenschwert_Time = 0;
		GTB_Assassinenschwert_Time = 0;
		GTM_Schamanenaxt_Time = 0;
		GGD_Sumpfgasdrohne_Time = 0;
		GGD_Sumpfgolem_Time = 0;
		GGD_Sumpfdrache_Time = 0;
		GGD_Giftkrater_Time = 0;

		if (BissDerFaeulnis_Stufe == 1)
		{
			// Alte Sachen wieder drauf addieren

			hero.attribute[ATR_HITPOINTS_MAX] += BissDerFaeulnis_Stufe01_HP;
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			hero.attribute[ATR_MANA_MAX] += BissDerFaeulnis_Stufe01_MANA;
			hero.attribute[ATR_MANA] += BissDerFaeulnis_Stufe01_MANA;
			hero.attribute[ATR_STRENGTH] += BissDerFaeulnis_Stufe01_STR;
			hero.attribute[ATR_DEXTERITY] += BissDerFaeulnis_Stufe01_DEX;
		};

		if (BissDerFaeulnis_Stufe == 2)
		{
			// Alte Sachen wieder drauf addieren

			hero.attribute[ATR_HITPOINTS_MAX] += BissDerFaeulnis_Stufe02_HP;
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			hero.attribute[ATR_MANA_MAX] += BissDerFaeulnis_Stufe02_MANA;
			hero.attribute[ATR_MANA] += BissDerFaeulnis_Stufe02_MANA;
			hero.attribute[ATR_STRENGTH] += BissDerFaeulnis_Stufe02_STR;
			hero.attribute[ATR_DEXTERITY] += BissDerFaeulnis_Stufe02_DEX;
		};

		if (BissDerFaeulnis_Stufe == 3)
		{
			// Alte Sachen wieder drauf addieren

			hero.attribute[ATR_HITPOINTS_MAX] += BissDerFaeulnis_Stufe03_HP;
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			hero.attribute[ATR_MANA_MAX] += BissDerFaeulnis_Stufe03_MANA;
			hero.attribute[ATR_STRENGTH] += BissDerFaeulnis_Stufe03_STR;
			hero.attribute[ATR_DEXTERITY] += BissDerFaeulnis_Stufe03_DEX;
		};

		if (HauchDerPestilenz_Stufe == 1)
		{
			// Alte Sachen wieder drauf addieren

			hero.attribute[ATR_HITPOINTS_MAX] += HauchDerPestilenz_Stufe01_HP;
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			hero.attribute[ATR_MANA_MAX] += HauchDerPestilenz_Stufe01_MANA;
			hero.attribute[ATR_MANA] += HauchDerPestilenz_Stufe01_MANA;
			hero.attribute[ATR_STRENGTH] += HauchDerPestilenz_Stufe01_STR;
			hero.attribute[ATR_DEXTERITY] += HauchDerPestilenz_Stufe01_DEX;
		};

		if (HauchDerPestilenz_Stufe == 2)
		{
			// Alte Sachen wieder drauf addieren

			hero.attribute[ATR_HITPOINTS_MAX] += HauchDerPestilenz_Stufe02_HP;
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			hero.attribute[ATR_MANA_MAX] += HauchDerPestilenz_Stufe02_MANA;
			hero.attribute[ATR_MANA] += HauchDerPestilenz_Stufe02_MANA;
			hero.attribute[ATR_STRENGTH] += HauchDerPestilenz_Stufe02_STR;
			hero.attribute[ATR_DEXTERITY] += HauchDerPestilenz_Stufe02_DEX;
		};

		if (HauchDerPestilenz_Stufe == 3)
		{
			// Alte Sachen wieder drauf addieren

			hero.attribute[ATR_HITPOINTS_MAX] += HauchDerPestilenz_Stufe03_HP;
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			hero.attribute[ATR_MANA_MAX] += HauchDerPestilenz_Stufe03_MANA;
			hero.attribute[ATR_STRENGTH] += HauchDerPestilenz_Stufe03_STR;
			hero.attribute[ATR_DEXTERITY] += HauchDerPestilenz_Stufe03_DEX;
		};

		BissDerFaeulnis_Stufe = 0;
		BissDerFaeulnis_Time = 0;
		HauchDerPestilenz_Stufe = 0;
		HauchDerPestilenz_Time = 0;*/

		B_HealGift	(-1, 5000);

		Npc_RemoveInvItems	(hero, ItMi_Gold, HealPrice);

		hero.aivar[AIV_Damage] = hero.attribute[ATR_HITPOINTS];

		Wld_PlayEffect	("spellFX_HealShrine", hero, hero, 0, 0, 0, FALSE);

		PrintScreen (PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);
	}
	else
	{
		Print	(PRINT_NotEnoughGold);
	};
}; 

INSTANCE PC_PrayShrine_Reg (C_Info)
{
	npc				= PC_Hero;
	nr				= 3;
	condition		= PC_PrayShrine_Reg_Condition;
	information		= PC_PrayShrine_Reg_Info;
	permanent		= TRUE;
	description		= "Regeneration erlangen"; 
};

FUNC INT PC_PrayShrine_Reg_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYSHRINE)
	&& (HP_Perk == FALSE)
	&& (ShrineIsObsessed == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PrayShrine_Reg_Info()
{
	Info_ClearChoices (PC_PrayShrine_Reg);
	Info_AddChoice (PC_PrayShrine_Reg,Dialog_Back,PC_PrayShrine_Reg_Back);
			
	if (HP_Perk == FALSE)
	{
		if (Mod_Schwierigkeit == 4)
		{
			Info_AddChoice (PC_PrayShrine_Reg,"Lebensregeneration (7000 Gold)",PC_PrayShrine_Reg_HP);
		}
		else
		{
			Info_AddChoice (PC_PrayShrine_Reg,"Lebensregeneration (20 LP und 5000 Gold)",PC_PrayShrine_Reg_HP);
		};
	};
}; 

FUNC VOID PC_PrayShrine_Reg_Back ()
{
	Info_ClearChoices (PC_PrayShrine_Reg);
};

FUNC VOID PC_PrayShrine_Reg_HP ()
{
	if (hero.lp >= 20)
	&& (Mod_Schwierigkeit != 4)
	{
		if (Npc_HasItems(hero, ItMi_Gold) >= 5000)
		{
			hero.lp -= 20;

			HP_Perk = TRUE;

			Npc_RemoveInvItems	(hero, ItMi_Gold, 5000);
		}
		else
		{
			PrintScreen	(PRINT_NotEnoughGold, -1,-1, FONT_ScreenSmall ,2);
		};
	}
	else if (Mod_Schwierigkeit == 4)
	{
		if (Npc_HasItems(hero, ItMi_Gold) >= 7000)
		{
			HP_Perk = TRUE;

			Npc_RemoveInvItems	(hero, ItMi_Gold, 7000);
		}
		else
		{
			PrintScreen	(PRINT_NotEnoughGold, -1,-1, FONT_ScreenSmall ,2);
		};
	}
	else
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall ,2);
	};
};

FUNC VOID B_MardukGebet() {
	if (Npc_KnowsInfo(hero, Info_Mod_Marduk_Nachtschicht)) {
		if (!Mod_Marduk_Gebetet) {
			if (Wld_GetDay() - 1 > Mod_Marduk_BetTag) {
				Mod_Marduk_BetReihe = 0;
			} else if (Wld_GetDay() == Mod_Marduk_BetTag) {
				// Hier passiert nichts, sonst kann man einfach 7x an einem Tag beten
			} else {
				Mod_Marduk_BetReihe += 1;
			};

			Mod_Marduk_BetTag = Wld_GetDay();

			if (Mod_Marduk_BetReihe == 7) {
				B_BlessAttribute (hero, ATR_MANA_MAX, 2);

				Mod_Marduk_Gebetet = TRUE;

				B_LogEntry	(TOPIC_MOD_MARDUK_NACHTSCHICHT, "Ich habe eine Woche lang jeden Tag gebetet. Das sollte meinen Glauben bewiesen haben.");
			};
		};
	};
};

//****************
//	0 Gold
//****************

FUNC VOID PC_PrayShrine_Pray_NoPay ()
{
	var int zufall; zufall = Hlp_Random(100);

	// ----- Heute Schon gebetet? -----	
	if (PrayDay == Wld_GetDay())		
	{
		PrintScreen	(Print_BlessNone, -1, -1, FONT_SCREEN, 2);
	}
	else if (zufall < 5) //heute noch nicht gebetet
	{
		B_BlessAttribute (hero, ATR_HITPOINTS_MAX, 1);
	}
	else
	{
		PrintScreen	(Print_BlessNone, -1, -1, FONT_SCREEN, 2);
	};

	B_MardukGebet();

	B_Göttergefallen(1, 1);
	
	PrayDay = Wld_GetDay ();
	Info_ClearChoices (PC_PrayShrine_Pray);
};

//****************
//	10 Gold
//****************
func VOID PC_PrayShrine_Pray_SmallPay ()
{
	Npc_RemoveInvItems  (hero,ItMi_Gold, 10);
	
	if (PrayDay == Wld_GetDay())		
	{
		PrintScreen	(Print_BlessNone, -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		B_BlessAttribute (hero, ATR_HITPOINTS_MAX, 1);
	};

	B_MardukGebet();

	Mod_CountSpende += 10;

	B_Göttergefallen(1, 1);
	
	PrayDay = Wld_GetDay ();
	Info_ClearChoices (PC_PrayShrine_Pray);
};

//****************
//	50 Gold
//****************
FUNC VOID PC_PrayShrine_Pray_MediumPay ()
{
	Npc_RemoveInvItems  (hero, ItMi_Gold, 50);
	
	// ----- Heute Schon gebetet? -----	
	if (PrayDay == Wld_GetDay())		
	{
		PrintScreen	(Print_BlessNone, -1, -1, FONT_SCREEN, 2);
	}
	else//heute noch nicht gebetet
	{
		B_BlessAttribute (hero, ATR_HITPOINTS_MAX, 2);
	};

	B_MardukGebet();

	Mod_CountSpende += 50;

	B_Göttergefallen(1, 2);
	
	PrayDay = Wld_GetDay ();
	Info_ClearChoices (PC_PrayShrine_Pray);
};

//****************
//	100 Gold
//****************
func VOID PC_PrayShrine_Pray_BigPay ()
{
	var int zufall;	zufall = r_max(99);
	
	Npc_RemoveInvItems  (hero, ItMi_Gold, 100);
	
	// ----- Heute Schon gebetet? -----	
	if (PrayDay == Wld_GetDay())		
	{
		PrintScreen	(Print_BlessNone, -1, -1, FONT_SCREEN, 2);
	}
	else//heute noch nicht gebetet
	{
		if (Shrine_STR_Bonus < 10)
		&& (zufall < 50)
		{
			B_BlessAttribute (hero, ATR_STRENGTH, 1);
			Shrine_STR_Bonus += 1;
		}
		else if (Shrine_DEX_Bonus < 10)
		&& (zufall >= 50)
		{
			B_BlessAttribute (hero, ATR_DEXTERITY, 1);
			Shrine_DEX_Bonus += 1;
		}
		/*else if (Shrine_MANA_Bonus < 20)
		{
			B_BlessAttribute (hero, ATR_MANA_MAX, 1);
			Shrine_MANA_Bonus += 1;
		}*/
		else
		{
			B_BlessAttribute (hero, ATR_HITPOINTS_MAX, 3);
		};
	};

	B_MardukGebet();

	Mod_CountSpende += 100;

	B_Göttergefallen(1, 3);
	
	PrayDay = Wld_GetDay ();
	Info_ClearChoices (PC_PrayShrine_Pray);
};

INSTANCE PC_PrayShrine_Chemo (C_Info)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PrayShrine_Chemo_Condition;
	information		= PC_PrayShrine_Chemo_Info;
	permanent		= TRUE;
	description		= "Chemische Keule weihen"; 
};

FUNC INT PC_PrayShrine_Chemo_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYSHRINE)
	&& (Npc_HasItems (hero,ItMw_Chemo_Unloaded) >= 1)
	&& (ShrineIsObsessed == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PrayShrine_Chemo_Info()
{
	Npc_RemoveInvItems  (hero,ItMw_Chemo_Unloaded, 1);
	CreateInvItems 		(hero,ItMw_Chemo, 1);
	Wld_PlayEffect("spellFX_PalHeal_ORIGIN",  hero, hero, 0, 0, 0, FALSE );
	Snd_Play ("MFX_Heal_Cast" );
	B_GivePlayerXP (400);
}; 

//*******************************************************
//	SchwertWeihe
//*******************************************************
INSTANCE PC_PrayShrine_BlessSword (C_Info)
{
	npc			= PC_Hero;
	nr			= 2;
	condition		= PC_PrayShrine_BlessSword_Condition;
	information		= PC_PrayShrine_BlessSword_Info;
	permanent		= 0;
	description		= Bless_Sword; 
};

FUNC INT PC_PrayShrine_BlessSword_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYSHRINE)
	&& (Npc_GetDistToWP (hero, "FEUERSCHREIN") <= 5000)
	&& ((Npc_HasItems (hero,ItMw_1H_Blessed_01) >= 1)
	|| (Npc_HasItems (hero,ItMw_2H_Blessed_01) >= 1))
	&& (Npc_HasItems(hero, ItMi_OrnamentEffekt_BIGFARM_Addon) == 4)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PrayShrine_BlessSword_Info()
{
	B_ENDPRODUCTIONDIALOG();
	Wld_PlayEffect("spellFX_RedTeleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");

	Npc_RemoveInvItems  (hero, ItMi_OrnamentEffekt_BIGFARM_Addon, 4);
			
	if (Npc_HasItems (hero,ItMw_2H_Blessed_01) >= 1)		//2H-Waffe
	{	
		Npc_RemoveInvItems  (hero,ItMw_2H_Blessed_01, 1);
		CreateInvItems 		(hero,ItMw_2H_Blessed_02, 1);
		Wld_PlayEffect("spellFX_PalHeal_ORIGIN",  hero, hero, 0, 0, 0, FALSE );
		Snd_Play ("MFX_Heal_Cast" );
		B_GivePlayerXP (XP_SwordBlessed);

		B_Göttergefallen(1, 5);
	}
	else	//1H-Waffe
	{
		Npc_RemoveInvItems  (hero,ItMw_1H_Blessed_01, 1);
		CreateInvItems 		(hero,ItMw_1H_Blessed_02, 1);
		Wld_PlayEffect("spellFX_PalHeal_ORIGIN",  hero, hero, 0, 0, 0, FALSE );
		Snd_Play ("MFX_Heal_Cast" );
		B_GivePlayerXP (XP_SwordBlessed);

		B_Göttergefallen(1, 5);
	};

	B_LogEntry	(TOPIC_MOD_MILIZ_INNOSKLINGE, "Das Schwert wurde geweiht.");

	AI_Teleport	(hero, "HALLE1_ANKUNFT");
	
	Spine_UnlockAchievement(SPINE_ACHIEVEMENT_28);
}; 

INSTANCE PC_PrayShrine_BlessSword_01 (C_Info)
{
	npc			= PC_Hero;
	nr			= 2;
	condition		= PC_PrayShrine_BlessSword_01_Condition;
	information		= PC_PrayShrine_BlessSword_01_Info;
	permanent		= 0;
	description		= Bless_Sword; 
};

FUNC INT PC_PrayShrine_BlessSword_01_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYSHRINE)
	&& ((Npc_HasItems (hero,ItMw_1H_Blessed_02) >= 1)
	|| (Npc_HasItems (hero,ItMw_2H_Blessed_02) >= 1))
	&& (Npc_KnowsInfo(hero, Info_Mod_Harad_AndreVermaechtnis6))
	&& (Npc_HasItems(hero, ItSc_Light) >= 1)
	&& (Wld_IsTime(11,00,13,00))
	&& (C_IsShrineReadyForWeihe())
	{	
		return TRUE;
	};
};

FUNC VOID PC_PrayShrine_BlessSword_01_Info()
{
	AI_Output(hero, self, "PC_PrayShrine_BlessSword_01_15_00"); //Wir werden seinen Ruhm ernten
	AI_Output(hero, self, "PC_PrayShrine_BlessSword_01_15_01"); //Innos steht bei mir und meinen Brüdern

	B_ENDPRODUCTIONDIALOG();
	Wld_PlayEffect("spellFX_RedTeleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");

	Npc_RemoveInvItems  (hero, ItSc_Light, 1);
	
	B_UsedShrineForWeihe();
}; 

INSTANCE PC_PrayShrine_BlessSword_02 (C_Info)
{
	npc			= PC_Hero;
	nr			= 2;
	condition		= PC_PrayShrine_BlessSword_02_Condition;
	information		= PC_PrayShrine_BlessSword_02_Info;
	permanent		= 0;
	description		= Bless_Sword; 
};

FUNC INT PC_PrayShrine_BlessSword_02_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYSHRINE)
	&& ((Npc_HasItems (hero,ItMw_1H_Blessed_02) >= 1)
	|| (Npc_HasItems (hero,ItMw_2H_Blessed_02) >= 1))
	&& (Npc_KnowsInfo(hero, PC_PrayShrine_BlessSword_01))
	&& (Npc_HasItems(hero, ItSc_InstantFireball) >= 1)
	&& (Wld_IsTime(11,00,13,00))
	&& (C_IsShrineReadyForWeihe())
	{	
		return TRUE;
	};
};

FUNC VOID PC_PrayShrine_BlessSword_02_Info()
{
	AI_Output(hero, self, "PC_PrayShrine_BlessSword_02_15_00"); //Ich werde alle auf meinem Weg wie Schafe schlachten
	AI_Output(hero, self, "PC_PrayShrine_BlessSword_02_15_01"); //denn er ist das Feuer in meinem Herz

	B_ENDPRODUCTIONDIALOG();
	Wld_PlayEffect("spellFX_RedTeleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");

	Npc_RemoveInvItems  (hero, ItSc_InstantFireball, 1);
	
	B_UsedShrineForWeihe();
}; 

INSTANCE PC_PrayShrine_BlessSword_03 (C_Info)
{
	npc			= PC_Hero;
	nr			= 2;
	condition		= PC_PrayShrine_BlessSword_03_Condition;
	information		= PC_PrayShrine_BlessSword_03_Info;
	permanent		= 0;
	description		= Bless_Sword; 
};

FUNC INT PC_PrayShrine_BlessSword_03_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYSHRINE)
	&& ((Npc_HasItems (hero,ItMw_1H_Blessed_02) >= 1)
	|| (Npc_HasItems (hero,ItMw_2H_Blessed_02) >= 1))
	&& (Npc_KnowsInfo(hero, PC_PrayShrine_BlessSword_02))
	&& (Npc_HasItems(hero, ItSc_Firestorm) >= 1)
	&& (Wld_IsTime(11,00,13,00))
	&& (C_IsShrineReadyForWeihe())
	{	
		return TRUE;
	};
};

FUNC VOID PC_PrayShrine_BlessSword_03_Info()
{
	AI_Output(hero, self, "PC_PrayShrine_BlessSword_03_15_00"); //Meine Klinge ist nur ihm geweiht
	AI_Output(hero, self, "PC_PrayShrine_BlessSword_03_15_01"); //an diesem Tag wird sein Name erklingen

	B_ENDPRODUCTIONDIALOG();
	Wld_PlayEffect("spellFX_RedTeleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");

	Npc_RemoveInvItems  (hero, ItSc_Firestorm, 1);
	
	B_UsedShrineForWeihe();
}; 

INSTANCE PC_PrayShrine_BlessSword_04 (C_Info)
{
	npc			= PC_Hero;
	nr			= 2;
	condition		= PC_PrayShrine_BlessSword_04_Condition;
	information		= PC_PrayShrine_BlessSword_04_Info;
	permanent		= 0;
	description		= Bless_Sword; 
};

FUNC INT PC_PrayShrine_BlessSword_04_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYSHRINE)
	&& ((Npc_HasItems (hero,ItMw_1H_Blessed_02) >= 1)
	|| (Npc_HasItems (hero,ItMw_2H_Blessed_02) >= 1))
	&& (Npc_KnowsInfo(hero, PC_PrayShrine_BlessSword_03))
	&& (Npc_HasItems(hero, ItSc_SumGol) >= 1)
	&& (Wld_IsTime(11,00,13,00))
	&& (C_IsShrineReadyForWeihe())
	{	
		return TRUE;
	};
};

FUNC VOID PC_PrayShrine_BlessSword_04_Info()
{
	AI_Output(hero, self, "PC_PrayShrine_BlessSword_04_15_00"); //Jeder der sich in meinen Weg stellt
	AI_Output(hero, self, "PC_PrayShrine_BlessSword_04_15_01"); //wird durch meine Hand sterben

	B_ENDPRODUCTIONDIALOG();
	Wld_PlayEffect("spellFX_RedTeleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");

	Npc_RemoveInvItems  (hero, ItSc_SumGol, 1);
	
	B_UsedShrineForWeihe();
}; 

INSTANCE PC_PrayShrine_BlessSword_05 (C_Info)
{
	npc			= PC_Hero;
	nr			= 2;
	condition		= PC_PrayShrine_BlessSword_05_Condition;
	information		= PC_PrayShrine_BlessSword_05_Info;
	permanent		= 0;
	description		= Bless_Sword; 
};

FUNC INT PC_PrayShrine_BlessSword_05_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYSHRINE)
	&& ((Npc_HasItems (hero,ItMw_1H_Blessed_02) >= 1)
	|| (Npc_HasItems (hero,ItMw_2H_Blessed_02) >= 1))
	&& (Npc_KnowsInfo(hero, PC_PrayShrine_BlessSword_04))
	&& (Npc_HasItems(hero, ItSc_Firerain) >= 1)
	&& (Wld_IsTime(11,00,13,00))
	&& (C_IsShrineReadyForWeihe())
	{	
		return TRUE;
	};
};

FUNC VOID PC_PrayShrine_BlessSword_05_Info()
{
	AI_Output(hero, self, "PC_PrayShrine_BlessSword_05_15_00"); //denn ich bin ein Krieger Innos
	AI_Output(hero, self, "PC_PrayShrine_BlessSword_05_15_01"); //Vollstrecker seines Willens

	B_ENDPRODUCTIONDIALOG();
	Wld_PlayEffect("spellFX_RedTeleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");

	Npc_RemoveInvItems  (hero, ItSc_Firerain, 1);
			
	if (Npc_HasItems (hero,ItMw_2H_Blessed_02) >= 1)		//2H-Waffe
	{	
		Npc_RemoveInvItems  (hero,ItMw_2H_Blessed_02, 1);
		CreateInvItems 		(hero,ItMw_2H_Blessed_03, 1);
		Wld_PlayEffect("spellFX_PalHeal_ORIGIN",  hero, hero, 0, 0, 0, FALSE );
		Snd_Play ("MFX_Heal_Cast" );
		B_GivePlayerXP (5000);

		B_Göttergefallen(1, 5);
	}
	else	//1H-Waffe
	{
		Npc_RemoveInvItems  (hero,ItMw_1H_Blessed_02, 1);
		CreateInvItems 		(hero,ItMw_1H_Blessed_03, 1);
		Wld_PlayEffect("spellFX_PalHeal_ORIGIN",  hero, hero, 0, 0, 0, FALSE );
		Snd_Play ("MFX_Heal_Cast" );
		B_GivePlayerXP (5000);

		B_Göttergefallen(1, 5);
	};
	
	B_UsedShrineForWeihe();

	B_LogEntry	(TOPIC_MOD_MILIZ_INNOSKLINGE, "Es ist geschafft. Und das Schwert ist tatsächlich noch mächtiger geworden.");
}; 