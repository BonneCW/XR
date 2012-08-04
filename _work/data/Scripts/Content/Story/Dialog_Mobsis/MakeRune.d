// ****************************************************
// MAKERUNE_S1
// --------------
// Funktion wird durch Runentisch-Mobsi-Benutzung aufgerufen!
// benötigtes Item dafür: ItMi_RuneBlank
// *****************************************************
FUNC VOID MAKERUNE_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		B_SetAivar(self, AIV_INVINCIBLE, TRUE);
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_MAKERUNE;
		Ai_ProcessInfos (her);
	};
}; 

//*******************************************************
//	MakeRune Dialog abbrechen
//*******************************************************
INSTANCE PC_MakeRune_End (C_Info)
{
	npc				= PC_Hero;
	nr				= 999;
	condition		= PC_MakeRune_End_Condition;
	information		= PC_MakeRune_End_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_MakeRune_End_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_MAKERUNE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_MakeRune_End_Info()
{
	CreateInvItems (self, ItMi_RuneBlank,1);
	B_ENDPRODUCTIONDIALOG ();
};

//*******************************************************
// Runen- Erschaffung Dialoge
//---------------------------
//*******************************************************
INSTANCE PC_Circle_01 (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_Circle_01_Condition;
	information		= PC_Circle_01_Info;
	permanent		= TRUE;
	description		= "Runen Kreis 1 erschaffen"; 
};

FUNC INT PC_Circle_01_Condition ()
{
	if( (PLAYER_MOBSI_PRODUCTION	==	MOBSI_MAKERUNE)
	&& ((PLAYER_TALENT_RUNES[SPL_LIGHT] == TRUE)
	||  (PLAYER_TALENT_RUNES[SPL_LightHeal] == TRUE)
	||  (PLAYER_TALENT_RUNES[SPL_SummonWolf] == TRUE)
	||  (PLAYER_TALENT_RUNES[SPL_Firebolt] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Zap] == TRUE)
	||    (PLAYER_TALENT_RUNES[SPL_Icebolt] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_SuckEnergy] == TRUE) ) )
	{	
		return TRUE;
	};
};

FUNC VOID PC_Circle_01_Info()
{
	Info_ClearChoices (PC_Circle_01);
	
	Info_AddChoice 	  (PC_Circle_01,DIALOG_BACK,PC_Circle_01_BACK);
	if (PLAYER_TALENT_RUNES[SPL_LIGHT] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_01,NAME_SPL_LIGHT,PC_ItRu_Light_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_SuckEnergy] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_01,NAME_SPL_SuckEnergy,PC_ItRu_SuckEnergy_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_LightHeal] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_01,NAME_SPL_LightHeal,PC_ItRu_LightHeal_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_SummonWolf] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_01,NAME_SPL_SummonWolf,PC_ItRu_SumWolf_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Firebolt] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_01,NAME_SPL_Firebolt,PC_ItRu_Firebolt_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Zap] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_01,NAME_SPL_Zap,PC_ItRu_Zap_Info); 
	};
	if (PLAYER_TALENT_RUNES[SPL_Icebolt] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_01,NAME_SPL_Icebolt,PC_ItRu_Icebolt_Info);
	};
};
FUNC VOID PC_Circle_01_BACK()
{
	Info_ClearChoices (PC_Circle_01);
};
//*******************************************************
INSTANCE PC_Circle_02 (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_Circle_02_Condition;
	information		= PC_Circle_02_Info;
	permanent		= TRUE;
	description		= "Runen Kreis 2 erschaffen"; 
};
FUNC INT PC_Circle_02_Condition ()
{
	if ((PLAYER_MOBSI_PRODUCTION	==	MOBSI_MAKERUNE)
	&& ((PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Icelance] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_SummonEisgoblin] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_SummonGoblinKrieger] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_InstantFireball] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_InstantIceball] == TRUE)
	|| (Mod_HeroKannUDSwampsharkRune == TRUE)))
	{
		return TRUE;
	};
};
FUNC VOID PC_Circle_02_Info()
{
	Info_ClearChoices (PC_Circle_02);
	
	Info_AddChoice 	  (PC_Circle_02,DIALOG_BACK,PC_Circle_02_BACK);
	if (PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_02,NAME_SPL_SummonGoblinSkeleton,PC_ItRu_SumGobSkel_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_SummonGoblinKrieger] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_02,NAME_SPL_SummonGoblinKrieger,PC_ItRu_SumGobKrieger_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_SummonEisgoblin] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_02,NAME_SPL_SummonEisgoblin,PC_ItRu_SumGobEis_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_InstantFireball] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_02,NAME_SPL_InstantFireball,PC_ItRu_InstFireball_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_InstantIceball] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_02,NAME_SPL_InstantIceball,PC_ItRu_InstIceball_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_IceLance] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_02,NAME_SPL_IceLance,PC_ItRu_Icelance_Info);
	};
	if (Mod_HeroKannUDSwampsharkRune == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_02,NAME_SPL_SummonUDSwampshark,PC_ItRu_SummonUDSwampshark_Info);
	};
};
FUNC VOID PC_Circle_02_BACK()
{
	Info_ClearChoices (PC_Circle_02);
};
//*******************************************************
INSTANCE PC_Circle_03 (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_Circle_03_Condition;
	information		= PC_Circle_03_Info;
	permanent		= TRUE;
	description		= "Runen Kreis 3 erschaffen"; 
};
FUNC INT PC_Circle_03_Condition ()
{	
	if( (PLAYER_MOBSI_PRODUCTION	==	MOBSI_MAKERUNE)
	&& ((PLAYER_TALENT_RUNES[SPL_MediumHeal] == TRUE)
	||   (PLAYER_TALENT_RUNES[SPL_SummonSkeleton] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_SummonGuardian] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Firestorm] == TRUE)
	||   (PLAYER_TALENT_RUNES[SPL_ChargeZap] == TRUE)
	||   (PLAYER_TALENT_RUNES[SPL_IceCube] == TRUE)
	||	 (PLAYER_TALENT_RUNES[SPL_Geyser] == TRUE)
	||	 (PLAYER_TALENT_RUNES[SPL_Zerfleischen] == TRUE)
	||	 (PLAYER_TALENT_RUNES[SPL_Thunderstorm] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_EnergyBall] == TRUE)))
	{
		return TRUE;
	};
};
FUNC VOID PC_Circle_03_Info()
{
	Info_ClearChoices (PC_Circle_03);
	
	Info_AddChoice 	  (PC_Circle_03,DIALOG_BACK,PC_Circle_03_BACK);
	if (PLAYER_TALENT_RUNES[SPL_MediumHeal] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_03,NAME_SPL_MediumHeal,PC_ItRu_MediumHeal_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_SummonSkeleton] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_03,NAME_SPL_SummonSkeleton,PC_ItRu_SumSkel_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_SummonGuardian] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_03,NAME_SPL_SummonGuardian,PC_ItRu_SummonGuardian_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_EnergyBall] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_03,NAME_SPL_BeliarsRage,PC_ItRu_BeliarsRage_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Firestorm] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_03,NAME_SPL_Firestorm,PC_ItRu_Firestorm_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_IceCube] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_03,NAME_SPL_IceCube,PC_ItRu_IceCube_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_ChargeZap] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_03,NAME_SPL_ChargeZap,PC_ItRu_ThunderBall_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Geyser] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_03,NAME_SPL_Geyser,PC_ItRu_Geyser_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Zerfleischen] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_03,NAME_SPL_Zerfleischen,PC_ItRu_Zerfleischen_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Thunderstorm] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_03,NAME_SPL_Thunderstorm,PC_ItRu_thunderstorm_Info);
	};
};
	
FUNC VOID PC_Circle_03_BACK()
{
	Info_ClearChoices (PC_Circle_03);
};
//*******************************************************
INSTANCE PC_Circle_04 (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_Circle_04_Condition;
	information		= PC_Circle_04_Info;
	permanent		= TRUE;
	description		= "Runen Kreis 4 erschaffen"; 
};
FUNC INT PC_Circle_04_Condition ()
{	
	if( (PLAYER_MOBSI_PRODUCTION	==	MOBSI_MAKERUNE) 
	&& ( (PLAYER_TALENT_RUNES[SPL_DestroyUndead] == TRUE)
	||   (PLAYER_TALENT_RUNES[SPL_SummonGolem] == TRUE)
	||   (PLAYER_TALENT_RUNES[SPL_SummonFireGolem] == TRUE)
	||   (PLAYER_TALENT_RUNES[SPL_SummonIceGolem] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_ChargeFireball] == TRUE)
	|| 	 (PLAYER_TALENT_RUNES[SPL_LightningFlash] == TRUE)
	||   (PLAYER_TALENT_RUNES[SPL_Waterfist] == TRUE)
	||   (PLAYER_TALENT_RUNES[SPL_SummonZombie] == TRUE) ) )
	{
		return TRUE;
	};
};
FUNC VOID PC_Circle_04_Info()
{
	Info_ClearChoices (PC_Circle_04);
	
	Info_AddChoice 	  (PC_Circle_04,DIALOG_BACK,PC_Circle_04_BACK);
	
	if (PLAYER_TALENT_RUNES[SPL_SummonGolem] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_04,NAME_SPL_SummonGolem,PC_ItRu_SumGol_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_SummonFireGolem] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_04,NAME_SPL_SummonFireGolem,PC_ItRu_SumFireGol_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_SummonIceGolem] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_04,NAME_SPL_SummonIceGolem,PC_ItRu_SumIceGol_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_DestroyUndead] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_04,NAME_SPL_DestroyUndead,PC_ItRu_HarmUndead_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_SummonZombie] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_04,NAME_SPL_SummonZombie,PC_ItRu_SummonZombie_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_ChargeFireball] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_04,NAME_SPL_ChargeFireball,PC_ItRu_ChargeFireball_Info);
	};	
	if (PLAYER_TALENT_RUNES[SPL_LightningFlash] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_04,NAME_SPL_LightningFlash,PC_ItRu_LightningFlash_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Waterfist] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_04,NAME_SPL_Waterfist,PC_ItRu_Waterfist_Info);
	};
};
FUNC VOID PC_Circle_04_BACK()
{
	Info_ClearChoices (PC_Circle_04);
};
//*******************************************************
INSTANCE PC_Circle_05 (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_Circle_05_Condition;
	information		= PC_Circle_05_Info;
	permanent		= TRUE;
	description		= "Runen Kreis 5 erschaffen"; 
};
FUNC INT PC_Circle_05_Condition ()
{
	if( (PLAYER_MOBSI_PRODUCTION	==	MOBSI_MAKERUNE) 
	&& ( (PLAYER_TALENT_RUNES[SPL_Skull] == TRUE)
	||   (PLAYER_TALENT_RUNES[SPL_SummonDemon] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Pyrokinesis_g1] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_IceWave] == TRUE)
	||   (PLAYER_TALENT_RUNES[SPL_FullHeal] == TRUE)) )
	{
		return TRUE;
	};
};
FUNC VOID PC_Circle_05_Info()
{
	Info_ClearChoices (PC_Circle_05);
	
	Info_AddChoice 	  (PC_Circle_05,DIALOG_BACK,PC_Circle_05_BACK);
	
	if (PLAYER_TALENT_RUNES[SPL_Skull] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_05,NAME_SPL_Skull,PC_ItRu_Skull_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_SummonDemon] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_05,NAME_SPL_SummonDemon,PC_ItRu_SumDemon_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_FullHeal] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_05,NAME_SPL_FullHeal,PC_ItRu_FullHeal_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_05,NAME_SPL_Pyrokinesis,PC_ItRu_Pyrokinesis_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Pyrokinesis_g1] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_05,"Pyrokinese",PC_ItRu_Pyrokinesis_g1_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_IceWave] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_05,NAME_SPL_IceWave,PC_ItRu_IceWave_Info);
	};
};			
FUNC VOID PC_Circle_05_BACK()
{
	Info_ClearChoices (PC_Circle_05);
};

//*******************************************************
INSTANCE PC_Circle_06 (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_Circle_06_Condition;
	information		= PC_Circle_06_Info;
	permanent		= TRUE;
	description		= "Runen Kreis 6 erschaffen"; 
};
FUNC INT PC_Circle_06_Condition ()
{	
	if( (PLAYER_MOBSI_PRODUCTION	==	MOBSI_MAKERUNE) 
	&& ((PLAYER_TALENT_RUNES[SPL_BreathOfDeath] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Firerain] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Icerain] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Shrink] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_SummonDragon] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == TRUE)) )
	{
		return TRUE;
	};
};
FUNC VOID PC_Circle_06_Info()
{
	Info_ClearChoices (PC_Circle_06);
	
	Info_AddChoice 	  (PC_Circle_06,DIALOG_BACK,PC_Circle_06_BACK);
	if (PLAYER_TALENT_RUNES[SPL_BreathOfDeath] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_06,NAME_SPL_BreathOfDeath,PC_ItRu_BreathOfDeath_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_06,NAME_SPL_ArmyOfDarkness,PC_ItRu_ArmyOfDarkness_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_SummonDragon] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_06,NAME_SPL_SummonDragon,PC_ItRu_SumDragon_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_06,"Das Geheimnis der Bibliothek!",PC_SPL_MasterOfDisaster_Create);
	};
	if (PLAYER_TALENT_RUNES[SPL_Shrink] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_06,NAME_SPL_Shrink,PC_ItRu_Shrink_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Firerain] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_06,NAME_SPL_Firerain,PC_ItRu_Firerain_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Icerain] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_06,NAME_SPL_Icerain,PC_ItRu_Icerain_Info);
	};
};	
FUNC VOID PC_Circle_06_BACK()
{
	Info_ClearChoices (PC_Circle_06);
};

//*******************************************************
INSTANCE PC_Scrolls (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_Scrolls_Condition;
	information		= PC_Scrolls_Info;
	permanent		= TRUE;
	description		= "Spruchrolle herstellen"; 
};
FUNC INT PC_Scrolls_Condition ()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_MAKERUNE) 
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SCROLLS) == TRUE)
	&& ((PLAYER_TALENT_SCROLLS[SCROLL_SumWolf] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_Firebolt] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_Icebolt] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_SummonGuardian] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_SumSkel] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_SumGobSkel] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_SumGol] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_SummonZombie] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_SumDemon] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_InstantIceball] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_Icelance] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_Geyser] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_Icecube] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_Waterfist] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_Icewave] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_Icerain] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_ArmyOfDarkness] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_InstantFireball] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_Firestorm] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_ChargeFireball] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_Pyrokinesis] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_Firerain] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_Thunderstorm] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_Thunderball] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_LightningFlash] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_SuckEnergy] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_Zerfleischen] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_BeliarsRage] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_Skull] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_BreathOfDeath] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_LightHeal] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_MediumHeal] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_FullHeal] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_Shrink] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_Light] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_HarmUndead] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_Zap] == TRUE)
	|| (PLAYER_TALENT_SCROLLS[SCROLL_AuraFlammen] == TRUE))
	{
		return TRUE;
	};
};
FUNC VOID PC_Scrolls_Info()
{
	Info_ClearChoices (PC_Scrolls);
	
	Info_AddChoice 	  (PC_Scrolls,DIALOG_BACK,PC_Scrolls_BACK);

	if (PLAYER_TALENT_SCROLLS[SCROLL_SummonZombie] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Zombie beschwören", PC_ItSc_SummonZombie);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_Zerfleischen] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Zerfleischen", PC_ItSc_Zerfleischen);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_SumWolf] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Wolf rufen", PC_ItSc_SumWolf);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_Waterfist] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Wässerfaust", PC_ItSc_Waterfist);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_SummonGuardian] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Wächter erschaffen", PC_ItSc_SummonGuardian);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_Thunderstorm] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Unwetter", PC_ItSc_Thunderstorm);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_HarmUndead] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Untote vernichten", PC_ItSc_HarmUndead);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_BreathOfDeath] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Todeshauch", PC_ItSc_BreathOfDeath);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_SumSkel] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Skelett beschwören", PC_ItSc_SumSkel);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_FullHeal] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Schwere Wunden heilen", PC_ItSc_FullHeal);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_Skull] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Schrei der Toten", PC_ItSc_Skull);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_Shrink] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Monster schrumpfen", PC_ItSc_Shrink);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_MediumHeal] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Mittlere Wunden heilen", PC_ItSc_MediumHeal);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_Light] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Licht", PC_ItSc_Light);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_LightHeal] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Leichte Wunden heilen", PC_ItSc_LightHeal);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_Thunderball] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Kugelblitz", PC_ItSc_Thunderball);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_Firestorm] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Kleiner Feuersturm", PC_ItSc_Firestorm);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_Pyrokinesis] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Großer Feuersturm", PC_ItSc_Pyrokinesis);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_ChargeFireball] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Großer Feuerball", PC_ItSc_ChargeFireball);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_SumGol] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Golem erschaffen", PC_ItSc_SumGol);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_SumGobSkel] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Goblin - Skelett erschaffen", PC_ItSc_SumGobSkel);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_Geyser] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Geysir", PC_ItSc_Geyser);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_Firerain] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Feuerregen", PC_ItSc_Firerain);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_Firebolt] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Feuerpfeil", PC_ItSc_Firebolt);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_InstantFireball] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Feuerball", PC_ItSc_InstantFireball);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_SuckEnergy] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Energie stehlen", PC_ItSc_SuckEnergy);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_Icewave] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Eiswelle", PC_ItSc_Icewave);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_Icerain] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Eisregen", PC_ItSc_Icerain);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_Icebolt] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Eispfeil", PC_ItSc_Icebolt);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_Icelance] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Eislanze", PC_ItSc_Icelance);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_Icecube] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Eisblock", PC_ItSc_Icecube);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_InstantIceball] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Eisball", PC_ItSc_InstantIceball);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_SumDemon] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Dämon beschwören", PC_ItSc_SumDemon);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_LightningFlash] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Blitzschlag", PC_ItSc_LightningFlash);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_Zap] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Blitz", PC_ItSc_Zap);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_BeliarsRage] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Berliars Zorn", PC_ItSc_BeliarsRage);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_AuraFlammen] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Aura der Flammen", PC_ItSc_AuraFlammen);
	};
	if (PLAYER_TALENT_SCROLLS[SCROLL_ArmyOfDarkness] == TRUE)
	{
		Info_AddChoice 	  (PC_Scrolls, "Armee der Finsternis", PC_ItSc_ArmyOfDarkness);
	};
};

FUNC VOID PC_Scrolls_BACK()
{
	Info_ClearChoices (PC_Scrolls);
};

// Beliarzauber

FUNC INT Geht_SuckEnergy ()
{
	if (Npc_HasItems(hero, ItRu_SuckEnergy) >= 1)
	&& (Npc_HasItems(hero, ItPo_Blood) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_SuckEnergy] == TRUE)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_SuckEnergy ()
{
	Npc_RemoveInvItems  (hero, ItPo_Blood, 1);
};

FUNC INT Geht_Zerfleischen ()
{
	if (Npc_HasItems(hero, ItRu_Zerfleischen) >= 1)
	&& (Npc_HasItems(hero, ItMi_Pitch) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Zerfleischen] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItMi_Pitch) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Zerfleischen] == TRUE)
	&& (Geht_SuckEnergy())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_Zerfleischen ()
{
	Npc_RemoveInvItems  (hero, ItMi_Pitch, 1);

	if (Npc_HasItems(hero, ItRu_Zerfleischen) == 0)
	{
		if (Geht_SuckEnergy())
		{
			Mach_SuckEnergy ();
		};
	};
};

FUNC INT Geht_BeliarsRage ()
{
	if (Npc_HasItems(hero, ItRu_BeliarsRage) >= 1)
	&& (Npc_HasItems(hero, ItMi_Coal) >= 2)
	&& (Npc_HasItems(hero, ItMi_DarkPearl) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_BeliarsRage] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItMi_Coal) >= 2)
	&& (Npc_HasItems(hero, ItMi_DarkPearl) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_BeliarsRage] == TRUE)
	&& (Geht_SuckEnergy())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_BeliarsRage ()
{
	Npc_RemoveInvItems  (hero, ItMi_Coal, 2);
	Npc_RemoveInvItems  (hero, ItMi_DarkPearl, 1);

	if (Npc_HasItems(hero, ItRu_BeliarsRage) == 0)
	{
		if (Geht_SuckEnergy())
		{
			Mach_SuckEnergy ();
		};
	};
};

FUNC INT Geht_Skull ()
{
	if (Npc_HasItems(hero, ItRu_Skull) >= 1)
	&& (Npc_HasItems(hero, ItFoMuttonZombie) >= 3)
	&& (Npc_HasItems(hero, ItAt_SkeletonBone) >= 2)
	&& (Npc_HasItems(hero, ItPo_Blood) >= 2)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Skull] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItFoMuttonZombie) >= 3)
	&& (Npc_HasItems(hero, ItAt_SkeletonBone) >= 2)
	&& (Npc_HasItems(hero, ItPo_Blood) >= 2)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Skull] == TRUE)
	&& (Geht_Zerfleischen())
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItFoMuttonZombie) >= 3)
	&& (Npc_HasItems(hero, ItAt_SkeletonBone) >= 2)
	&& (Npc_HasItems(hero, ItPo_Blood) >= 2)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Skull] == TRUE)
	&& (Geht_BeliarsRage())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_Skull ()
{
	Npc_RemoveInvItems  (hero, ItFoMuttonZombie, 3);
	Npc_RemoveInvItems  (hero, ItAt_SkeletonBone, 2);
	Npc_RemoveInvItems  (hero, ItPo_Blood, 2);

	if (Npc_HasItems(hero, ItRu_Skull) == 0)
	{
		if (Geht_Zerfleischen())
		{
			Mach_Zerfleischen ();
		}
		else if (Geht_BeliarsRage())
		{
			Mach_BeliarsRage ();
		};
	};
};

FUNC INT Geht_BreathOfDeath ()
{
	if (Npc_HasItems(hero, ItRu_BreathOfDeath) >= 1)
	&& (Npc_HasItems(hero, ItMi_Coal) >= 1)
	&& (Npc_HasItems(hero, ItMi_DarkPearl) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_BreathOfDeath] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItMi_Coal) >= 1)
	&& (Npc_HasItems(hero, ItMi_DarkPearl) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_BreathOfDeath] == TRUE)
	&& (Geht_Skull())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_BreathOfDeath ()
{
	Npc_RemoveInvItems  (hero, ItMi_Coal, 1);
	Npc_RemoveInvItems  (hero, ItMi_DarkPearl, 1);

	if (Npc_HasItems(hero, ItRu_BreathOfDeath) == 0)
	{
		if (Geht_Skull())
		{
			Mach_Skull ();
		};
	};
};

// Beschwörungen

FUNC INT Geht_SumWolf ()
{
	if (Npc_HasItems(hero, ItRu_SumWolf) >= 1)
	&& (Npc_HasItems(hero, ItAt_WolfFur) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_SumWolf] == TRUE)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_SumWolf ()
{
	Npc_RemoveInvItems  (hero, ItAt_WolfFur, 1);
};

FUNC INT Geht_SumGobSkel ()
{
	if (Npc_HasItems(hero, ItRu_SumGobSkel) >= 1)
	&& (Npc_HasItems(hero, ItAt_GoblinBone) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_SumGobSkel] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItAt_GoblinBone) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_SumGobSkel] == TRUE)
	&& (Geht_SumWolf())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_SumGobSkel ()
{
	Npc_RemoveInvItems  (hero, ItAt_GoblinBone, 1);

	if (Npc_HasItems(hero, ItRu_SumGobSkel) == 0)
	{
		Mach_SumWolf ();
	};
};

FUNC INT Geht_SumSkel ()
{
	if (Npc_HasItems(hero, ItRu_SumSkel) >= 1)
	&& (Npc_HasItems(hero, ItAt_SkeletonBone) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_SumSkel] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItAt_SkeletonBone) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_SumSkel] == TRUE)
	&& (Geht_SumGobSkel())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_SumSkel ()
{
	Npc_RemoveInvItems  (hero, ItAt_SkeletonBone, 1);

	if (Npc_HasItems(hero, ItRu_SumSkel) == 0)
	{
		if (Geht_SumGobSkel())
		{
			Mach_SumGobSkel ();
		};
	};
};

FUNC INT Geht_SummonGuardian ()
{
	if (Npc_HasItems(hero, ItRu_SummonGuardian) >= 1)
	&& (Npc_HasItems(hero, ItMi_Rockcrystal) >= 1)
	&& (Npc_HasItems(hero, ItMi_OldCoin) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_SummonGuardian] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItMi_Rockcrystal) >= 1)
	&& (Npc_HasItems(hero, ItMi_OldCoin) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_SummonGuardian] == TRUE)
	&& (Geht_SumGobSkel())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_SummonGuardian ()
{
	Npc_RemoveInvItems  (hero, ItMi_Rockcrystal, 1);
	Npc_RemoveInvItems  (hero, ItMi_OldCoin, 1);

	if (Npc_HasItems(hero, ItRu_SummonGuardian) == 0)
	{
		if (Geht_SumGobSkel())
		{
			Mach_SumGobSkel ();
		};
	};
};

FUNC INT Geht_SummonZombie ()
{
	if (Npc_HasItems(hero, ItRu_SummonZombie) >= 1)
	&& (Npc_HasItems(hero, ItFoMuttonZombie) >= 1)
	&& (Npc_HasItems(hero, ItAt_SkeletonBone) >= 1)
	&& (Npc_HasItems(hero, ItPo_Blood) >= 2)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_SummonZombie] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItFoMuttonZombie) >= 1)
	&& (Npc_HasItems(hero, ItAt_SkeletonBone) >= 2)
	&& (Npc_HasItems(hero, ItPo_Blood) >= 2)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_SummonZombie] == TRUE)
	&& (Geht_SumSkel())
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItFoMuttonZombie) >= 1)
	&& (Npc_HasItems(hero, ItAt_SkeletonBone) >= 1)
	&& (Npc_HasItems(hero, ItPo_Blood) >= 2)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_SummonZombie] == TRUE)
	&& (Geht_SummonGuardian())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_SummonZombie ()
{
	Npc_RemoveInvItems  (hero, ItFoMuttonZombie, 1);
	Npc_RemoveInvItems  (hero, ItAt_SkeletonBone, 1);
	Npc_RemoveInvItems  (hero, ItPo_Blood, 2);

	if (Npc_HasItems(hero, ItRu_SummonZombie) == 0)
	{
		if (Geht_Sumskel())
		{
			Mach_SumSkel ();
		}
		else if (Geht_SummonGuardian())
		{
			Mach_SummonGuardian ();
		};
	};
};

FUNC INT Geht_SummonGolem ()
{
	if (Npc_HasItems(hero, ItRu_SumGol) >= 1)
	&& (Npc_HasItems(hero, ItAt_StoneGolemHeart) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_SumGol] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItAt_StoneGolemHeart) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_SumGol] == TRUE)
	&& (Geht_SumSkel())
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItAt_StoneGolemHeart) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_SumGol] == TRUE)
	&& (Geht_SummonGuardian())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_SummonGolem ()
{
	Npc_RemoveInvItems  (hero, ItAt_StoneGolemHeart, 1);

	if (Npc_HasItems(hero, ItRu_SumGol) == 0)
	{
		if (Geht_SumSkel())
		{
			Mach_SumSkel ();
		}
		else if (Geht_SummonGuardian())
		{
			Mach_SummonGuardian ();
		};
	};
};

FUNC INT Geht_SummonDemon ()
{
	if (Npc_HasItems(hero, ItRu_SumDemon) >= 1)
	&& (Npc_HasItems(hero, ItAt_DemonHeart) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_SumDemon] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItAt_DemonHeart) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_SumDemon] == TRUE)
	&& (Geht_SummonZombie())
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItAt_DemonHeart) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_SumDemon] == TRUE)
	&& (Geht_SummonGolem())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_SummonDemon ()
{
	Npc_RemoveInvItems  (hero, ItAt_DemonHeart, 1);

	if (Npc_HasItems(hero, ItRu_SumDemon) == 0)
	{
		if (Geht_SummonZombie())
		{
			Mach_SummonZombie ();
		}
		else if (Geht_SummonGolem())
		{
			Mach_SummonGolem ();
		};
	};
};

FUNC INT Geht_Armyofdarkness ()
{
	if (Npc_HasItems(hero, ItRu_Armyofdarkness) >= 1)
	&& (Npc_HasItems(hero, ItAt_DemonHeart) >= 1)
	&& (Npc_HasItems(hero, ItAt_SkeletonBone) >= 1)
	&& (Npc_HasItems(hero, ItAt_StoneGolemHeart) >= 1)
	&& (Npc_HasItems(hero, ItMi_DarkPearl) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_ArmyOfDarkness] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItAt_DemonHeart) >= 2)
	&& (Npc_HasItems(hero, ItAt_SkeletonBone) >= 2)
	&& (Npc_HasItems(hero, ItAt_StoneGolemHeart) >= 2)
	&& (Npc_HasItems(hero, ItMi_DarkPearl) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_ArmyOfDarkness] == TRUE)
	&& (Geht_SummonDemon())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_Armyofdarkness ()
{
	Npc_RemoveInvItems  (hero, ItAt_DemonHeart, 1);
	Npc_RemoveInvItems  (hero, ItAt_SkeletonBone, 1);
	Npc_RemoveInvItems  (hero, ItAt_StoneGolemHeart, 1);
	Npc_RemoveInvItems  (hero, ItMi_DarkPearl, 1);

	if (Npc_HasItems(hero, ItRu_Armyofdarkness) == 0)
	{
		if (Geht_SummonDemon())
		{
			Mach_SummonDemon ();
		};
	};
};

// Eiszauber

FUNC INT Geht_Icebolt ()
{
	if (Npc_HasItems(hero, ItRu_Icebolt) >= 1)
	&& (Npc_HasItems(hero, ItMi_Quartz) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Icebolt] == TRUE)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_Icebolt ()
{
	Npc_RemoveInvItems  (hero, ItMi_Quartz, 1);
};

FUNC INT Geht_InstantIceball ()
{
	if (Npc_HasItems(hero, ItRu_InstantIceball) >= 1)
	&& (Npc_HasItems(hero, ItMi_Pitch) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_InstantIceball] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItMi_Pitch) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_InstantIceball] == TRUE)
	&& (Geht_Icebolt())
	{
		return TRUE;
	}	
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_InstantIceball ()
{
	Npc_RemoveInvItems  (hero, ItMi_Pitch, 1);

	if (Npc_HasItems(hero, ItRu_InstantIceball) == 0)
	{
		Mach_Icebolt ();
	};
};

FUNC INT Geht_Icelance ()
{
	if (Npc_HasItems(hero, ItRu_Icelance) >= 1)
	&& (Npc_HasItems(hero, ItMi_Pitch) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Icelance] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItMi_Pitch) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Icelance] == TRUE)
	&& (Geht_Icebolt())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_Icelance ()
{
	Npc_RemoveInvItems  (hero, ItMi_Pitch, 1);

	if (Npc_HasItems(hero, ItRu_Icelance) == 0)
	{
		Mach_Icebolt ();
	};
};

FUNC INT Geht_Geyser ()
{
	if (Npc_HasItems(hero, ItRu_Geyser) >= 1)
	&& (Npc_HasItems(hero, ItMi_Aquamarine) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Geyser] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItMi_Aquamarine) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Geyser] == TRUE)
	&& (Geht_Icelance())
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItMi_Aquamarine) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Geyser] == TRUE)
	&& (Geht_InstantIceball())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_Geyser ()
{
	Npc_RemoveInvItems  (hero, ItMi_Aquamarine, 1);

	if (Npc_HasItems(hero, ItRu_Geyser) == 0)
	{
		if (Geht_Icelance())
		{
			Mach_Icelance ();
		}
		else if (Geht_InstantIceball())
		{
			Mach_InstantIceball ();
		};
	};
};

FUNC INT Geht_Icecube ()
{
	if (Npc_HasItems(hero, ItRu_Icecube) >= 1)
	&& (Npc_HasItems(hero, ItMi_Aquamarine) >= 1)
	&& (Npc_HasItems(hero, ItMi_Quartz) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Icecube] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItMi_Aquamarine) >= 1)
	&& (Npc_HasItems(hero, ItMi_Quartz) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Icecube] == TRUE)
	&& (Geht_Icelance())
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItMi_Aquamarine) >= 1)
	&& (Npc_HasItems(hero, ItMi_Quartz) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Icecube] == TRUE)
	&& (Geht_InstantIceball())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_Icecube ()
{
	Npc_RemoveInvItems  (hero, ItMi_Aquamarine, 1);
	Npc_RemoveInvItems  (hero, ItMi_Quartz, 1);

	if (Npc_HasItems(hero, ItRu_Icecube) == 0)
	{
		if (Geht_Icelance())
		{
			Mach_Icelance ();
		}
		else if (Geht_InstantIceball())
		{
			Mach_InstantIceball ();
		};
	};
};

FUNC INT Geht_Waterfist ()
{
	if (Npc_HasItems(hero, ItRu_Waterfist) >= 1)
	&& (Npc_HasItems(hero, ItMi_Aquamarine) >= 1)
	&& (Npc_HasItems(hero, ItMi_Rockcrystal) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Waterfist] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItMi_Aquamarine) >= 2)
	&& (Npc_HasItems(hero, ItMi_Rockcrystal) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Waterfist] == TRUE)
	&& (Geht_Geyser())
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItMi_Aquamarine) >= 2)
	&& (Npc_HasItems(hero, ItMi_Rockcrystal) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Waterfist] == TRUE)
	&& (Geht_Icecube())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_Waterfist ()
{
	Npc_RemoveInvItems  (hero, ItMi_Aquamarine, 1);
	Npc_RemoveInvItems  (hero, ItMi_Rockcrystal, 1);

	if (Npc_HasItems(hero, ItRu_Waterfist) == 0)
	{
		if (Geht_Geyser())
		{
			Mach_Geyser ();
		}
		else if (Geht_Icecube())
		{
			Mach_Icecube ();
		};
	};
};

FUNC INT Geht_Icewave ()
{
	if (Npc_HasItems(hero, ItRu_Icewave) >= 1)
	&& (Npc_HasItems(hero, ItMi_Aquamarine) >= 1)
	&& (Npc_HasItems(hero, ItMi_Quartz) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Icewave] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItMi_Aquamarine) >= 3)
	&& (Npc_HasItems(hero, ItMi_Quartz) >= 3)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Icewave] == TRUE)
	&& (Geht_Waterfist())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_Icewave ()
{
	Npc_RemoveInvItems  (hero, ItMi_Aquamarine, 1);
	Npc_RemoveInvItems  (hero, ItMi_Quartz, 1);

	if (Npc_HasItems(hero, ItRu_Icewave) == 0)
	{
		if (Geht_Waterfist())
		{
			Mach_Waterfist ();
		};
	};
};

FUNC INT Geht_Icerain ()
{
	if (Npc_HasItems(hero, ItRu_Icerain) >= 1)
	&& (Npc_HasItems(hero, ItMi_Pitch) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Icerain] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItMi_Pitch) >= 2)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Icerain] == TRUE)
	&& (Geht_Icewave())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_Icerain ()
{
	Npc_RemoveInvItems  (hero, ItMi_Pitch, 1);

	if (Npc_HasItems(hero, ItRu_Icerain) == 0)
	{
		if (Geht_Icewave())
		{
			Mach_Icewave ();
		};
	};
};

// Feuerzauber

FUNC INT Geht_Firebolt ()
{
	if (Npc_HasItems(hero, ItRu_Firebolt) >= 1)
	&& (Npc_HasItems(hero, ItMi_Sulfur) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Firebolt] == TRUE)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_Firebolt ()
{
	Npc_RemoveInvItems  (hero, ItMi_Sulfur, 1);
};

FUNC INT Geht_InstantFireball ()
{
	if (Npc_HasItems(hero, ItRu_InstantFireball) >= 1)
	&& (Npc_HasItems(hero, ItMi_Pitch) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_InstantFireball] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItMi_Pitch) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_InstantFireball] == TRUE)
	&& (Geht_Firebolt())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_InstantFireball ()
{
	Npc_RemoveInvItems  (hero, ItMi_Pitch, 1);

	if (Npc_HasItems(hero, ItRu_InstantFireball) == 0)
	{
		Mach_Firebolt ();
	};
};

FUNC INT Geht_Firestorm ()
{
	if (Npc_HasItems(hero, ItRu_Firestorm) >= 1)
	&& (Npc_HasItems(hero, ItMi_Pitch) >= 1)
	&& (Npc_HasItems(hero, ItMi_Sulfur) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Firestorm] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItMi_Pitch) >= 2)
	&& (Npc_HasItems(hero, ItMi_Sulfur) >= 2)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Firestorm] == TRUE)
	&& (Geht_InstantFireball())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_Firestorm ()
{
	Npc_RemoveInvItems  (hero, ItMi_Pitch, 1);
	Npc_RemoveInvItems  (hero, ItMi_Sulfur, 1);

	if (Npc_HasItems(hero, ItRu_Firestorm) == 0)
	{
		if (Geht_InstantFireball())
		{
			Mach_InstantFireball ();
		};
	};
};

FUNC INT Geht_ChargeFireball ()
{
	if (Npc_HasItems(hero, ItRu_ChargeFireball) >= 1)
	&& (Npc_HasItems(hero, ItMi_Pitch) >= 1)
	&& (Npc_HasItems(hero, ItMi_Sulfur) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_ChargeFireball] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItMi_Pitch) >= 3)
	&& (Npc_HasItems(hero, ItMi_Sulfur) >= 3)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_ChargeFireball] == TRUE)
	&& (Geht_Firestorm())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_ChargeFireball ()
{
	Npc_RemoveInvItems  (hero, ItMi_Pitch, 1);
	Npc_RemoveInvItems  (hero, ItMi_Sulfur, 1);

	if (Npc_HasItems(hero, ItRu_ChargeFireball) == 0)
	{
		if (Geht_Firestorm())
		{
			Mach_Firestorm ();
		};
	};
};

FUNC INT Geht_Pyrokinesis ()
{
	if (Npc_HasItems(hero, ItRu_Pyrokinesis) >= 1)
	&& (Npc_HasItems(hero, ItAt_WaranFiretongue) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Pyrokinesis] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItAt_WaranFiretongue) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Pyrokinesis] == TRUE)
	&& (Geht_ChargeFireball())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_Pyrokinesis ()
{
	Npc_RemoveInvItems  (hero, ItAt_WaranFiretongue, 1);

	if (Npc_HasItems(hero, ItRu_Pyrokinesis) == 0)
	{
		if (Geht_ChargeFireball())
		{
			Mach_ChargeFireball ();
		};
	};
};

FUNC INT Geht_Firerain ()
{
	if (Npc_HasItems(hero, ItRu_Firerain) >= 1)
	&& (Npc_HasItems(hero, ItAt_WaranFiretongue) >= 1)
	&& (Npc_HasItems(hero, ItMi_Pitch) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Firerain] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItAt_WaranFiretongue) >= 2)
	&& (Npc_HasItems(hero, ItMi_Pitch) >= 3)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Firerain] == TRUE)
	&& (Geht_Pyrokinesis())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_Firerain ()
{
	Npc_RemoveInvItems  (hero, ItAt_WaranFiretongue, 1);
	Npc_RemoveInvItems  (hero, ItMi_Pitch, 1);

	if (Npc_HasItems(hero, ItRu_Firerain) == 0)
	{
		if (Geht_Pyrokinesis())
		{
			Mach_Pyrokinesis ();
		};
	};
};

// Luftzauber

FUNC INT Geht_Zap ()
{
	if (Npc_HasItems(hero, ItRu_Zap) >= 1)
	&& (Npc_HasItems(hero, ItMi_Rockcrystal) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Zap] == TRUE)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_Zap ()
{
	Npc_RemoveInvItems  (hero, ItMi_Rockcrystal, 1);
};

FUNC INT Geht_Thunderstorm ()
{
	if (Npc_HasItems(hero, ItRu_Thunderstorm) >= 1)
	&& (Npc_HasItems(hero, ItMi_Quartz) >= 1)
	&& (Npc_HasItems(hero, ItAt_Wing) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Thunderstorm] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItMi_Quartz) >= 1)
	&& (Npc_HasItems(hero, ItAt_Wing) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Thunderstorm] == TRUE)
	&& (Geht_Zap())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_Thunderstorm ()
{
	Npc_RemoveInvItems  	(hero, ItMi_Quartz, 1);
	Npc_RemoveInvItems	(hero, ItAt_Wing, 1);

	if (Npc_HasItems(hero, ItRu_Thunderstorm) == 0)
	{
		Mach_Zap ();
	};
};

FUNC INT Geht_ChargeZap ()
{
	if (Npc_HasItems(hero, ItRu_Thunderball) >= 1)
	&& (Npc_HasItems(hero, ItMi_Sulfur) >= 1)
	&& (Npc_HasItems(hero, ItMi_Rockcrystal) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Thunderball] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItMi_Sulfur) >= 1)
	&& (Npc_HasItems(hero, ItMi_Rockcrystal) >= 2)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Thunderball] == TRUE)
	&& (Geht_Zap())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_ChargeZap ()
{
	Npc_RemoveInvItems  	(hero, ItMi_Sulfur, 1);
	Npc_RemoveInvItems	(hero, ItMi_Rockcrystal, 1);

	if (Npc_HasItems(hero, ItRu_Thunderball) == 0)
	{
		Mach_Zap ();
	};
};

FUNC INT Geht_LightningFlash ()
{
	if (Npc_HasItems(hero, ItRu_LightningFlash) >= 1)
	&& (Npc_HasItems(hero, ItMi_Rockcrystal) >= 1)
	&& (Npc_HasItems(hero, ItMi_Quartz) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_LightningFlash] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItMi_Rockcrystal) >= 1)
	&& (Npc_HasItems(hero, ItMi_Quartz) >= 2)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_LightningFlash] == TRUE)
	&& (Geht_Thunderstorm())
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItMi_Rockcrystal) >= 3)
	&& (Npc_HasItems(hero, ItMi_Quartz) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_LightningFlash] == TRUE)
	&& (Geht_ChargeZap())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_LightningFlash ()
{
	Npc_RemoveInvItems  (hero, ItMi_Rockcrystal, 1);
	Npc_RemoveInvItems  (hero, ItMi_Quartz, 1);

	if (Npc_HasItems(hero, ItRu_LightningFlash) == 0)
	{
		if (Geht_Thunderstorm())
		{
			Mach_Thunderstorm ();
		}
		else if (Geht_ChargeZap())
		{
			Mach_ChargeZap ();
		};
	};
};

// Sonstige Zauber

FUNC INT Geht_Light ()
{
	if (Npc_HasItems(hero, ItRu_Light) >= 1)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Light] == TRUE)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_Light ()
{
	Npc_RemoveInvItems  (hero, ItMi_Gold, 1);
};

FUNC INT Geht_LightHeal ()
{
	if (Npc_HasItems(hero, ItRu_LightHeal) >= 1)
	&& (Npc_HasItems(hero, ItPl_Health_Herb_01) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_LightHeal] == TRUE)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_LightHeal ()
{
	Npc_RemoveInvItems  (hero, ItPl_Health_Herb_01, 1);
};

FUNC INT Geht_MediumHeal ()
{
	if (Npc_HasItems(hero, ItRu_MediumHeal) >= 1)
	&& (Npc_HasItems(hero, ItPl_Health_Herb_02) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_MediumHeal] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItPl_Health_Herb_02) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_MediumHeal] == TRUE)
	&& (Geht_LightHeal())
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItPl_Health_Herb_02) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_MediumHeal] == TRUE)
	&& (Geht_Light())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_MediumHeal ()
{
	Npc_RemoveInvItems  (hero, ItPl_Health_Herb_02, 1);

	if (Npc_HasItems(hero, ItRu_MediumHeal) == 0)
	{
		if (Npc_HasItems(hero, ItRu_LightHeal) >= 1)
		{
			Mach_LightHeal ();
		}
		else if (Npc_HasItems(hero, ItRu_Light) >= 1)
		{
			Mach_Light ();
		};
	};
};

FUNC INT Geht_HarmUndead ()
{
	if (Npc_HasItems(hero, ItRu_HarmUndead) >= 1)
	&& (Npc_HasItems(hero, ItMi_HolyWater) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_HarmUndead] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItMi_HolyWater) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_HarmUndead] == TRUE)
	&& (Geht_MediumHeal())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_HarmUndead ()
{
	Npc_RemoveInvItems  (hero, ItMi_HolyWater, 1);

	if (Npc_HasItems(hero, ItRu_HarmUndead) == 0)
	{
		if (Geht_MediumHeal())
		{
			Mach_MediumHeal ();
		};
	};
};

FUNC INT Geht_FullHeal ()
{
	if (Npc_HasItems(hero, ItRu_FullHeal) >= 1)
	&& (Npc_HasItems(hero, ItPl_Health_Herb_03) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_FullHeal] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItPl_Health_Herb_03) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_FullHeal] == TRUE)
	&& (Geht_HarmUndead())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_FullHeal ()
{
	Npc_RemoveInvItems  (hero, ItPl_Health_Herb_03, 1);

	if (Npc_HasItems(hero, ItRu_FullHeal) == 0)
	{
		if (Geht_HarmUndead())
		{
			Mach_HarmUndead ();
		};
	};
};

FUNC INT Geht_Shrink ()
{
	if (Npc_HasItems(hero, ItRu_Shrink) >= 1)
	&& (Npc_HasItems(hero, ItAt_GoblinBone) >= 1)
	&& (Npc_HasItems(hero, ItAt_TrollTooth) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Shrink] == TRUE)
	{
		return TRUE;
	}
	else if (Npc_HasItems(hero, ItAt_GoblinBone) >= 1)
	&& (Npc_HasItems(hero, ItAt_TrollTooth) >= 1)
	&& (PLAYER_TALENT_SCROLLS[SCROLL_Shrink] == TRUE)
	&& (Geht_FullHeal())
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC VOID Mach_Shrink ()
{
	Npc_RemoveInvItems  (hero, ItAt_GoblinBone, 1);
	Npc_RemoveInvItems  (hero, ItAt_TrollTooth, 1);

	if (Npc_HasItems(hero, ItRu_Shrink) == 0)
	{
		if (Geht_FullHeal())
		{
			Mach_FullHeal ();
		};
	};
};

// Beliarzauber

FUNC VOID PC_ItSc_SuckEnergy ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_SuckEnergy())	
	{
		Mach_SuckEnergy ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_SuckEnergy, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_Zerfleischen ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_Zerfleischen())	
	{
		Mach_Zerfleischen ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_Zerfleischen, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_BeliarsRage ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_BeliarsRage())	
	{
		Mach_BeliarsRage ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_BeliarsRage, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_Skull ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_Skull())	
	{
		Mach_Skull ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_Skull, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_BreathOfDeath ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_BreathOfDeath())	
	{
		Mach_BreathOfDeath ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_BreathOfDeath, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

// Beschwörungen

FUNC VOID PC_ItSc_SumWolf ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_SumWolf())	
	{
		Mach_SumWolf ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_SumWolf, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_SumGobSkel ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_SumGobSkel())	
	{
		Mach_SumGobSkel ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_SumGobSkel, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_SumSkel ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_SumSkel())	
	{
		Mach_SumSkel ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_SumSkel, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_SummonGuardian ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_SummonGuardian())	
	{
		Mach_SummonGuardian ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_SummonGuardian, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_SummonZombie ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_SummonZombie())	
	{
		Mach_SummonZombie ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_SummonZombie, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_SumGol ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_SummonGolem())	
	{
		Mach_SummonGolem ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_SumGol, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_SumDemon ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_SummonDemon())	
	{
		Mach_SummonDemon ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_SumDemon, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_Armyofdarkness ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_Armyofdarkness())	
	{
		Mach_Armyofdarkness ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_Armyofdarkness, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

// Eiszauber

FUNC VOID PC_ItSc_Icebolt ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_Icebolt())	
	{
		Mach_Icebolt ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_Icebolt, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};	
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_InstantIceball ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_InstantIceball())	
	{
		Mach_InstantIceball ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_InstantIceball, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};	
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_Icelance ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_Icelance())	
	{
		Mach_Icelance ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_Icelance, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};	
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_Geyser ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_Geyser())	
	{
		Mach_Geyser ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_Geyser, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};	
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_Icecube ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_Icecube())	
	{
		Mach_Icecube ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_Icecube, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};	
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_Waterfist ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_Waterfist())	
	{
		Mach_Waterfist ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_Waterfist, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};	
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_Icewave ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_Icewave())	
	{
		Mach_Icewave ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_Icewave, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};	
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_Icerain ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_Icerain())	
	{
		Mach_Icerain ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_Icerain, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};	
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

// Feuerzauber

FUNC VOID PC_ItSc_Firebolt ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_Firebolt())
	{
		Mach_Firebolt ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_Firebolt, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};	
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_InstantFireball ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_InstantFireball())
	{
		Mach_InstantFireball ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_InstantFireball, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};	
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_Firestorm ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_Firestorm())
	{
		Mach_Firestorm ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_Firestorm, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};	
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_ChargeFireball ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_ChargeFireball())
	{
		Mach_ChargeFireball ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_ChargeFireball, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};	
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_Pyrokinesis ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_Pyrokinesis())
	{
		Mach_Pyrokinesis ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_Pyrokinesis, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};	
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_FireRain ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)
	&& (Geht_FireRain())
	{
		Mach_FireRain ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_FireRain, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};	
	
	CreateInvItems (self, ItMi_RuneBlank, 1);

	B_ENDPRODUCTIONDIALOG ();
};

// Luftzauber

FUNC VOID PC_ItSc_Zap ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)	
	&& (Geht_Zap())
	{
		Mach_Zap ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_Zap, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	
	CreateInvItems (self, ItMi_RuneBlank, 1);
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_Thunderstorm ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)	
	&& (Geht_Thunderstorm())
	{
		Mach_Thunderstorm ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_Thunderstorm, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	
	CreateInvItems (self, ItMi_RuneBlank, 1);
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_Thunderball ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)	
	&& (Geht_ChargeZap())
	{
		Mach_ChargeZap ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_Thunderball, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	
	CreateInvItems (self, ItMi_RuneBlank, 1);
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_LightningFlash ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)	
	&& (Geht_LightningFlash())
	{
		Mach_LightningFlash ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_LightningFlash, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	
	CreateInvItems (self, ItMi_RuneBlank, 1);
	
	B_ENDPRODUCTIONDIALOG ();
};

// Sonstige Zauber

FUNC VOID PC_ItSc_Light ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)	
	&& (Geht_Light())
	{
		Mach_Light ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_Light, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	
	CreateInvItems (self, ItMi_RuneBlank, 1);
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_LightHeal ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)	
	&& (Geht_LightHeal())
	{
		Mach_LightHeal ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_LightHeal, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	
	CreateInvItems (self, ItMi_RuneBlank, 1);
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_MediumHeal ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)	
	&& (Geht_MediumHeal())
	{
		Mach_MediumHeal ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_MediumHeal, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	
	CreateInvItems (self, ItMi_RuneBlank, 1);
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_HarmUndead ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)	
	&& (Geht_HarmUndead())
	{
		Mach_HarmUndead ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_HarmUndead, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	
	CreateInvItems (self, ItMi_RuneBlank, 1);
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_FullHeal ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)	
	&& (Geht_FullHeal())
	{
		Mach_FullHeal ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_FullHeal, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	
	CreateInvItems (self, ItMi_RuneBlank, 1);
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_Shrink ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)	
	&& (Geht_Shrink())
	{
		Mach_Shrink ();

		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);
		
		CreateInvItems 	    (hero, ItSc_Shrink, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	
	CreateInvItems (self, ItMi_RuneBlank, 1);
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItSc_AuraFlammen ()
{
	if (Npc_HasItems(hero, ItWr_Paper) >= 1)	
	&& (Npc_HasItems(hero, ItSc_Firerain) >= 1)
	&& (Npc_HasItems(hero, ItSc_Pyrokinesis) >= 1)
	&& (Npc_HasItems(hero, ItAt_DemonHeart) >= 1)
	&& (Npc_HasItems(hero, ItAt_FiregolemHeart) >= 1)
	&& (Npc_HasItems(hero, ItAt_WaranFiretongue) >= 1)
	&& (Npc_HasItems(hero, ItMi_Coal) >= 3)
	&& (Npc_HasItems(hero, ItMi_Pitch) >= 1)
	&& (Npc_HasItems(hero, ItMi_Sulfur) >= 2)
	{
		Npc_RemoveInvItems  (hero, ItWr_Paper, 1);

		Npc_RemoveInvItems  (hero, ItSc_Firerain, 1);
		Npc_RemoveInvItems  (hero, ItSc_Pyrokinesis, 1);
		Npc_RemoveInvItems  (hero, ItAt_DemonHeart, 1);
		Npc_RemoveInvItems  (hero, ItAt_FiregolemHeart, 1);
		Npc_RemoveInvItems  (hero, ItAt_WaranFiretongue, 1);
		Npc_RemoveInvItems  (hero, ItMi_Coal, 3);
		Npc_RemoveInvItems  (hero, ItMi_Pitch, 1);
		Npc_RemoveInvItems  (hero, ItMi_Sulfur, 2);
		
		CreateInvItems 	    (hero, ItSc_AuraFlammen, 1); 

		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	
	CreateInvItems (self, ItMi_RuneBlank, 1);
	
	B_ENDPRODUCTIONDIALOG ();
};

INSTANCE PC_Verbessern_Obelisk (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_Verbessern_Obelisk_Condition;
	information		= PC_Verbessern_Obelisk_Info;
	permanent		= TRUE;
	description		= "Rune mit Obelisk verschmelzen"; 
};

FUNC INT PC_Verbessern_Obelisk_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_MAKERUNE)
	&& (Npc_HasItems(hero, ItRu_TeleportObelisk) == 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Verbessern_Obelisk_Info()
{
	Info_ClearChoices (PC_Verbessern_Obelisk);
	
	Info_AddChoice 	  (PC_Verbessern_Obelisk,DIALOG_BACK,PC_Verbessern_Obelisk_BACK);

	if (Npc_HasItems(hero, ItRu_TeleportXardas) >= 1)
	&& (Mod_TeleportXardas == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zu Xardas", PC_Verbessern_Obelisk_Xardas);
	};
	if (Npc_HasItems(hero, ItRu_TeleportTaverne) >= 1)
	&& (Mod_TeleportTaverne == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zur Taverne", PC_Verbessern_Obelisk_Taverne);
	};
	if (Npc_HasItems(hero, ItRu_TeleportKlosterruine) >= 1)
	&& (Mod_TeleportKlosterruine == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zur Klosterruine", PC_Verbessern_Obelisk_Klosterruine);
	};
	if (Npc_HasItems(hero, ItRu_TeleportSeaport) >= 1)
	&& (Mod_TeleportSeaport == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zur Hafenstadt", PC_Verbessern_Obelisk_Seaport);
	};
	if (Npc_HasItems(hero, ItRu_TeleportBergfestung) >= 1)
	&& (Mod_TeleportBergfestung == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zur Bergfestung", PC_Verbessern_Obelisk_Bergfestung);
	};
	if (Npc_HasItems(hero, ItRu_TeleportBeliarfestung) >= 1)
	&& (Mod_TeleportBeliarfestung == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zur Beliarfestung", PC_Verbessern_Obelisk_Beliarfestung);
	};
	if (Npc_HasItems(hero, ItRu_TeleportWaldis) >= 1)
	&& (Mod_TeleportWaldis == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zum Waldläuferlager", PC_Verbessern_Obelisk_Waldis);
	};
	if (Npc_HasItems(hero, ItRu_TeleportPsicamp) >= 1)
	&& (Mod_TeleportPsicamp == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zum Sumpflager", PC_Verbessern_Obelisk_Psicamp);
	};
	if (Npc_HasItems(hero, ItRu_TeleportSonnenkreis) >= 1)
	&& (Mod_TeleportSonnenkreis == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zum Sonnenkreis", PC_Verbessern_Obelisk_Sonnenkreis);
	};
	if (Npc_HasItems(hero, ItRu_TeleportRELRaeuber) >= 1)
	&& (Mod_TeleportRELRaeuber == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zum Räuberlager", PC_Verbessern_Obelisk_RELRaeuber);
	};
	if (Npc_HasItems(hero, ItRu_TeleportRELPass) >= 1)
	&& (Mod_TeleportRELPass == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zum Pass in Relendel", PC_Verbessern_Obelisk_RELPass);
	};
	if (Npc_HasItems(hero, ItRu_TeleportPassNW) >= 1)
	&& (Mod_TeleportPassNW == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zum Pass in Khorinis", PC_Verbessern_Obelisk_PassNW);
	};
	if (Npc_HasItems(hero, ItRu_TeleportPassOW) >= 1)
	&& (Mod_TeleportPassOW == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zum Pass im Minental", PC_Verbessern_Obelisk_PassOW);
	};
	if (Npc_HasItems(hero, ItRu_TeleportNewcamp) >= 1)
	&& (Mod_TeleportNewcamp == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zum neuen Lager", PC_Verbessern_Obelisk_Newcamp);
	};
	if (Npc_HasItems(hero, ItRu_TeleportRELMoor) >= 1)
	&& (Mod_TeleportRELMoor == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zum Moor", PC_Verbessern_Obelisk_RELMoor);
	};
	if (Npc_HasItems(hero, ItRu_TeleportKhorata) >= 1)
	&& (Mod_TeleportKhorata == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zum Marktplatz von Khorata", PC_Verbessern_Obelisk_Khorata);
	};
	if (Npc_HasItems(hero, ItRu_TeleportMonastery) >= 1)
	&& (Mod_TeleportMonastery == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zum Kloster", PC_Verbessern_Obelisk_Monastery);
	};
	if (Npc_HasItems(hero, ItRu_TeleportRELHofstaat) >= 1)
	&& (Mod_TeleportRELHofstaat == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zum Hofstaat", PC_Verbessern_Obelisk_Hofstaat);
	};
	if (Npc_HasItems(hero, ItRu_TeleportRELSee) >= 1)
	&& (Mod_TeleportRELSee == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zum großen See", PC_Verbessern_Obelisk_RELSee);
	};
	if (Npc_HasItems(hero, ItRu_TeleportFarm) >= 1)
	&& (Mod_TeleportFarm == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zum Grossbauern", PC_Verbessern_Obelisk_Farm);
	};
	if (Npc_HasItems(hero, ItRu_TeleportGelato) >= 1)
	&& (Mod_TeleportGelato == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zum Dorf in Gelato", PC_Verbessern_Obelisk_Gelato);
	};
	if (Npc_HasItems(hero, ItRu_TeleportRELBauernhof) >= 1)
	&& (Mod_TeleportRELBauernhof == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zum Bauernhof", PC_Verbessern_Obelisk_RELBauernhof);
	};
	if (Npc_HasItems(hero, ItRu_TeleportBanditenlager) >= 1)
	&& (Mod_TeleportBanditenlager == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zum Banditenlager", PC_Verbessern_Obelisk_Banditenlager);
	};
	if (Npc_HasItems(hero, ItRu_TeleportOldcamp) >= 1)
	&& (Mod_TeleportOldcamp == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zum alten Lager", PC_Verbessern_Obelisk_Oldcamp);
	};
	if (Npc_HasItems(hero, ItRu_TeleportOWDemonTower) >= 1)
	&& (Mod_TeleportOWDemonTower == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport zum alten Dämonenturm", PC_Verbessern_Obelisk_OWDemonTower);
	};
	if (Npc_HasItems(hero, ItRu_TeleportPatBack) >= 1)
	&& (Mod_TeleportFromPatherion == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport von Patherion nach Khorinis", PC_Verbessern_Obelisk_FromPatherion);
	};
	if (Npc_HasItems(hero, ItRu_Teleport_Pat_01) >= 1)
	&& (Mod_TeleportPatherionKapelle == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport vom Kloster zur Kapelle", PC_Verbessern_Obelisk_PatherionKapelle);
	};
	if (Npc_HasItems(hero, ItRu_Teleport_Pat) >= 1)
	&& (Mod_TeleportToPatherion == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport von Khorinis nach Patherion", PC_Verbessern_Obelisk_ToPatherion);
	};
	if (Npc_HasItems(hero, ItRu_Teleport_Pat_02) >= 1)
	&& (Mod_TeleportPatherionKloster == FALSE)
	{
		Info_AddChoice 	  (PC_Verbessern_Obelisk, "Teleport von der Kapelle zum Kloster", PC_Verbessern_Obelisk_PatherionKloster);
	};
};

FUNC VOID PC_Verbessern_Obelisk_BACK()
{
	Info_ClearChoices (PC_Verbessern_Obelisk);
};

FUNC VOID PC_Verbessern_Obelisk_ToPatherion()
{
	Npc_RemoveInvItems	(hero, ItRu_Teleport_Pat, 1);

	Mod_TeleportToPatherion = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_FromPatherion()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportPatBack, 1);

	Mod_TeleportFromPatherion = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_Banditenlager()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportBanditenlager, 1);

	Mod_TeleportBanditenlager = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_Gelato()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportGelato, 1);

	Mod_TeleportGelato = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_PatherionKapelle()
{
	Npc_RemoveInvItems	(hero, ItRu_Teleport_Pat_01, 1);

	Mod_TeleportPatherionKapelle = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_PatherionKloster()
{
	Npc_RemoveInvItems	(hero, ItRu_Teleport_Pat_02, 1);

	Mod_TeleportPatherionKloster = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_OWDemonTower()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportOWDemonTower, 1);

	Mod_TeleportOWDemonTower = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_Oldcamp()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportOldcamp, 1);

	Mod_TeleportOldcamp = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_Waldis()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportWaldis, 1);

	Mod_TeleportWaldis = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_RELBauernhof()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportRELBauernhof, 1);

	Mod_TeleportRELBauernhof = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_RELPass()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportRELPass, 1);

	Mod_TeleportRELPass = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_RELRaeuber()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportRELRaeuber, 1);

	Mod_TeleportRELRaeuber = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_RELSee()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportRELSee, 1);

	Mod_TeleportRELSee = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_RELMoor()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportRELMoor, 1);

	Mod_TeleportRELMoor = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_Farm()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportFarm, 1);

	Mod_TeleportFarm = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_Monastery()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportMonastery, 1);

	Mod_TeleportMonastery = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_Hofstaat()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportRELHofstaat, 1);

	Mod_TeleportRELHofstaat = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_Khorata()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportKhorata, 1);

	Mod_TeleportKhorata = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_Newcamp()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportNewcamp, 1);

	Mod_TeleportNewcamp = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_PassOW()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportPassOW, 1);

	Mod_TeleportPassOW = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_PassNW()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportPassNW, 1);

	Mod_TeleportPassNW = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_Sonnenkreis()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportSonnenkreis, 1);

	Mod_TeleportSonnenkreis = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_Psicamp()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportPsicamp, 1);

	Mod_TeleportPsicamp = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_Bergfestung()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportBergfestung, 1);

	Mod_TeleportBergfestung = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_Beliarfestung()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportBeliarfestung, 1);

	Mod_TeleportBeliarfestung = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_Seaport()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportSeaport, 1);

	Mod_TeleportSeaport = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_Klosterruine()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportKlosterruine, 1);

	Mod_TeleportKlosterruine = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_Taverne()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportTaverne, 1);

	Mod_TeleportTaverne = TRUE;
};

FUNC VOID PC_Verbessern_Obelisk_Xardas()
{
	Npc_RemoveInvItems	(hero, ItRu_TeleportXardas, 1);

	Mod_TeleportXardas = TRUE;
};

INSTANCE PC_Verbessern_Robe (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_Verbessern_Robe_Condition;
	information		= PC_Verbessern_Robe_Info;
	permanent		= TRUE;
	description		= "Robe verbessern"; 
};

FUNC INT PC_Verbessern_Robe_Condition ()
{
	if( (PLAYER_MOBSI_PRODUCTION	==	MOBSI_MAKERUNE)
	&& (Mod_Almanach_Geheimnis_Gelesen == 1)
	&& ((Mod_Gilde == 8)
	|| (Mod_Gilde == 11)
	|| (Mod_Gilde == 14)))
	{	
		return TRUE;
	};
};

FUNC VOID PC_Verbessern_Robe_Info()
{
	Info_ClearChoices (PC_Verbessern_Robe);
	
	Info_AddChoice 	  (PC_Verbessern_Robe,DIALOG_BACK,PC_Verbessern_Robe_BACK);
	if (Mod_Gilde == 8)
	&& (Npc_HasItems(hero, ItAt_TigerFur) > 2)
	&& (Npc_HasItems(hero, ItAr_KDF_H) == 1)
	{
		Info_AddChoice 	  (PC_Verbessern_Robe,"Ordenspriesterrobe",PC_Verbessern_Robe_KDF);
	};
	if (Mod_Gilde == 14)
	&& (Npc_HasItems(hero, ItAt_LindwurmHaut) > 2)
	&& (Npc_HasItems(hero, ItAr_XARDAS) == 1)
	{
		Info_AddChoice 	  (PC_Verbessern_Robe,"Dämonenbeschwörerrobe",PC_Verbessern_Robe_DMB);
	};
	if (Mod_Gilde == 18)
	&& (Npc_HasItems(hero, ItAt_WaterorcFur) > 2)
	&& (Npc_HasItems(hero, ItAr_KDW_H) == 1)
	{
		Info_AddChoice 	  (PC_Verbessern_Robe,"Richterrobe",PC_Verbessern_Robe_KDW);
	};
};
FUNC VOID PC_Verbessern_Robe_BACK()
{
	Info_ClearChoices (PC_Verbessern_Robe);
};

//*******************************************************
INSTANCE PC_WM_Golem (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_WM_Golem_Condition;
	information		= PC_WM_Golem_Info;
	permanent		= TRUE;
	description		= "Golemrune erschaffen"; 
};
FUNC INT PC_WM_Golem_Condition ()
{	
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_MAKERUNE) 
	&& (Rune_Eisgolem == 1)
	&& (Npc_HasItems(hero, ItRu_SumGol) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID PC_WM_Golem_Info()
{
	Info_ClearChoices (PC_WM_Golem);
	
	Info_AddChoice	(PC_WM_Golem, DIALOG_BACK, PC_WM_Golem_BACK);

	if (Npc_HasItems(hero, ItAt_IceGolemHeart) >= 1)
	{
		Info_AddChoice 	  (PC_WM_Golem, "Eisgolem erschaffen", PC_WM_Golem_Create_Ice);
	};
	
};	
FUNC VOID PC_WM_Golem_BACK()
{
	Info_ClearChoices (PC_WM_Golem);
};

FUNC VOID PC_WM_Golem_Create_Ice()
{
	Npc_RemoveInvItems (hero, ItRu_SumGol, 1);
	Npc_RemoveInvItems (hero, ItAt_IceGolemHeart, 1);

	CreateInvItems 	   (hero, ItRu_SumIceGol,1); 

	Print (PRINT_RunESuccess);

	CreateInvItems (self, ItMi_RuneBlank,1);
	
	B_ENDPRODUCTIONDIALOG ();
};

//--------------- KREIS 1 ----------------------

FUNC VOID PC_Verbessern_Robe_DMB ()
{
	Info_ClearChoices	(PC_Verbessern_Robe);

	AI_UnequipArmor	(hero);
	CreateInvItems 	    (hero, ItAr_DMB_S,  1); 
	Npc_RemoveInvItems	(hero, ItAr_XARDAS, 1);
	Npc_RemoveInvItems	(hero, ItAt_Lindwurmhaut, 3);
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_Verbessern_Robe_KDF ()
{
	Info_ClearChoices	(PC_Verbessern_Robe);

	AI_UnequipArmor	(hero);
	CreateInvItems 	    (hero, ItAr_KDF_VeryHigh,  1); 
	Npc_RemoveInvItems	(hero, ItAr_KDF_H, 1);
	Npc_RemoveInvItems	(hero, ItAt_TigerFur, 3);
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_Verbessern_Robe_KDW ()
{
	Info_ClearChoices	(PC_Verbessern_Robe);

	AI_UnequipArmor	(hero);
	CreateInvItems 	    (hero, ItAr_KDW_M,  1); 
	Npc_RemoveInvItems	(hero, ItAr_KDW_H, 1);
	Npc_RemoveInvItems	(hero, ItAt_WaterorcFur, 3);
	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_Light_Info ()
{
	if (Npc_HasItems (hero, ItSc_Light) >= 1)
	&& (Npc_HasItems (hero, ItMi_Gold)  >= 1)
	
	{
		Npc_RemoveInvItems  (hero,ItSc_Light, 1);
		Npc_RemoveInvItems  (hero,ItMI_Gold, 1);
		
		CreateInvItems 	   (hero,ItRu_Light,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_SuckEnergy_Info ()
{
	if (Npc_HasItems (hero, ItSc_SuckEnergy) >= 1)
	&& (Npc_HasItems (hero, ItPo_Blood)   >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_SuckEnergy, 1);
		Npc_RemoveInvItems  (hero,ItPo_Blood, 1);
		
		CreateInvItems 	    (hero,ItRu_SuckEnergy,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_LightHeal_Info ()
{
	if (Npc_HasItems (hero, ItSc_LightHeal) >= 1)
	&& (Npc_HasItems (hero, ItPl_Health_Herb_01) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_LightHeal, 1);
		Npc_RemoveInvItems  (hero,ItPl_Health_Herb_01,1);
		
		
		CreateInvItems 	   (hero,ItRu_LightHeal,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};


//*******************************************************
FUNC VOID PC_ItRu_SumWolf_Info ()
{
	if (Npc_HasItems (hero, ItSc_SumWolf) >= 1)
	&& (Npc_HasItems (hero, ItAt_Wolffur) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_SumWolf, 1);
		Npc_RemoveInvItems  (hero,ItAt_Wolffur, 1);
		
		
		CreateInvItems 	    (hero,ItRu_SumWolf,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_SummonUDSwampshark_Info ()
{
	if (Npc_HasItems (hero, ItSc_SumUDSwampshark) >= 1)
	&& ((Npc_HasItems (hero, ItAt_UndeadSharkSkin) >= 1)
	|| (Npc_HasItems (hero, ItAt_UndeadSharkTeeth) >= 1))
	{
		Npc_RemoveInvItems  (hero,ItSc_SumUDSwampshark, 1);

		if (Npc_HasItems(hero, ItAt_UndeadSharkTeeth) > 0)
		{
			Npc_RemoveInvItems  (hero,ItAt_UndeadSharkTeeth, 1);
		}
		else
		{
			Npc_RemoveInvItems  (hero,ItAt_UndeadSharkSkin, 1);
		};
		
		
		CreateInvItems 	    (hero,ItRu_SumUDSwampshark,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_Firebolt_Info ()
{
	if (Npc_HasItems (hero, ItSc_Firebolt) >= 1)
	&& (Npc_HasItems (hero, ItMi_Sulfur)   >= 1)
	
	{
		Npc_RemoveInvItems  (hero,ItSc_Firebolt, 1);
		Npc_RemoveInvItems  (hero,ItMi_Sulfur, 1);
		
		CreateInvItems 	    (hero,ItRu_Firebolt,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItRu_Zap_Info ()
{
	if (Npc_HasItems (hero, ItSc_Zap) >= 1)
	&& (Npc_HasItems (hero, ItMi_Rockcrystal) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_Zap, 1);
		Npc_RemoveInvItems  (hero,ItMi_Rockcrystal,1);
	
		
		CreateInvItems 	   (hero,ItRu_Zap,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();		
};

FUNC VOID PC_ItRu_Icebolt_Info ()
{
	if (Npc_HasItems (hero, ItSc_Icebolt) >= 1)
	&& (Npc_HasItems (hero, ItMi_Quartz)  >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_Icebolt, 1);
		Npc_RemoveInvItems  (hero,ItMi_Quartz,1);

		
		CreateInvItems 	   (hero,ItRu_Icebolt,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();		
};

//---------------------- KREIS 2 --------------------------

FUNC VOID PC_ItRu_SumGobSkel_Info ()
{
	if (Npc_HasItems (hero, ItSc_SumGobSkel) >= 1)
	&& (Npc_HasItems (hero, ItAt_GoblinBone) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_SumGobSkel, 1);
		Npc_RemoveInvItems  (hero,ItAt_GoblinBone, 1);
		
		
		CreateInvItems 	    (hero,ItRu_SumGobSkel,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_SumGobKrieger_Info ()
{
	if (Npc_HasItems (hero, ItSc_SumGobKrieger) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_SumGobKrieger, 1);
		
		
		CreateInvItems 	    (hero,ItRu_SumGobKrieger,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_SumGobEis_Info ()
{
	if (Npc_HasItems (hero, ItSc_SumGobEis) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_SumGobEis, 1);
		
		
		CreateInvItems 	    (hero,ItRu_SumGobEis,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_InstFireball_Info ()
{
	if (Npc_HasItems (hero, ItSc_InstantFireball) >= 1)
	&& (Npc_HasItems (hero, ItMi_Pitch) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_InstantFireball, 1);
		Npc_RemoveInvItems  (hero,ItMi_Pitch,1);
		
		
		CreateInvItems 	   (hero,ItRu_InstantFireball,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();		
};

FUNC VOID PC_ItRu_InstIceball_Info ()
{
	if (Npc_HasItems (hero, ItSc_InstantIceball) >= 1)
	&& (Npc_HasItems (hero, ItMi_Pitch) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_InstantIceball, 1);
		Npc_RemoveInvItems  (hero,ItMi_Pitch,1);
		
		
		CreateInvItems 	   (hero,ItRu_InstantIceball,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();		
};

FUNC VOID PC_ItRu_Icelance_Info ()
{
	if (Npc_HasItems (hero, ItSc_Icelance) 	 >= 1)
	&& (Npc_HasItems (hero, ItMi_Quartz) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Icelance, 	  1 );
		Npc_RemoveInvItems  (hero,ItMi_Quartz,1	);
		
		CreateInvItems 	   (hero,ItRu_Icelance,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

//--------------------- KREIS 3 ----------------------------

FUNC VOID PC_ItRu_MediumHeal_Info ()
{
	if (Npc_HasItems (hero, ItSc_MediumHeal) >= 1)
	&& (Npc_HasItems (hero, ItPl_Health_Herb_02) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_MediumHeal, 1);
		Npc_RemoveInvItems  (hero,ItPl_Health_Herb_02,  1);
		
		CreateInvItems 	   (hero,ItRu_MediumHeal,1); 
		Print (PRINT_RuneSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItRu_SumSkel_Info ()
{
	if (Npc_HasItems (hero, ItSc_SumSkel) >= 1)
	&& (Npc_HasItems (hero, ItAt_SkeletonBone) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_SumSkel, 1);
		Npc_RemoveInvItems  (hero,ItAt_SkeletonBone,1	);
		
		CreateInvItems 	   (hero,ItRu_SumSkel,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItRu_SummonGuardian_Info ()
{
	if (Npc_HasItems (hero, ItSc_SummonGuardian) >= 1)
	&& (Npc_HasItems (hero, ItMi_OldCoin) >= 1)	
	&& (Npc_HasItems (hero, ItMi_Rockcrystal) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_SummonGuardian, 1);
		Npc_RemoveInvItems  (hero,ItMi_OldCoin, 1);
		Npc_RemoveInvItems  (hero,ItMi_Rockcrystal, 1);
		
		CreateInvItems 	   (hero,ItRu_SummonGuardian,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItRu_BeliarsRage_Info ()
{
	if (Npc_HasItems (hero, ItSc_BeliarsRage) >= 1)
	&& (Npc_HasItems (hero, ItMi_Coal) >= 2)
	&& (Npc_HasItems (hero, ItMi_DarkPearl) >= 1)		
	{
		Npc_RemoveInvItems  (hero,ItSc_BeliarsRage, 1);
		Npc_RemoveInvItems  (hero,ItMi_Coal,2);
		Npc_RemoveInvItems  (hero,ItMi_DarkPearl,1);
		
		CreateInvItems 	   (hero,ItRu_BeliarsRage,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItRu_Firestorm_Info ()
{
	if (Npc_HasItems (hero, ItSc_Firestorm) >= 1)
	&& (Npc_HasItems (hero, ItMi_Pitch) >= 1)
	&& (Npc_HasItems (hero, ItMi_Sulfur) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_Firestorm, 		1);
		Npc_RemoveInvItems  (hero,ItMi_Pitch, 			1);
		Npc_RemoveInvItems  (hero,ItMi_Sulfur, 			1);
	
		CreateInvItems 	   (hero,ItRu_Firestorm,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_IceCube_Info ()
{
	if (Npc_HasItems (hero, ItSc_IceCube) >= 1)
	&& (Npc_HasItems (hero, ItMi_Quartz) >= 1)
	&& (Npc_HasItems (hero, ItMi_Aquamarine) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_IceCube, 1);
		Npc_RemoveInvItems  (hero,ItMi_Quartz,1	);
		Npc_RemoveInvItems  (hero,ItMi_Aquamarine,1	);
		
		CreateInvItems 	   (hero,ItRu_IceCube,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_Thunderstorm_Info ()
{
	if (Npc_HasItems (hero, ItSc_Thunderstorm) 	 >= 1)
	&& (Npc_HasItems (hero, ItMi_Quartz) >= 1)	
	&& (Npc_HasItems (hero, ItAt_Wing) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Thunderstorm, 	  1 );
		Npc_RemoveInvItems  (hero,ItMi_Quartz,1	);
		Npc_RemoveInvItems  (hero,ItAt_Wing,1	);
		
		CreateInvItems 	   (hero,ItRu_Thunderstorm,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_Geyser_Info ()
{
	if (Npc_HasItems (hero, ItSc_Geyser) 	 >= 1)
	&& (Npc_HasItems (hero, ItMi_Aquamarine) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Geyser, 	  1 );
		Npc_RemoveInvItems  (hero,ItMi_Aquamarine,1	);
		
		CreateInvItems 	   (hero,ItRu_Geyser,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_Zerfleischen_Info ()
{
	if (Npc_HasItems (hero, ItSc_Zerfleischen) 	 >= 1)
	&& (Npc_HasItems (hero, ItMi_Pitch) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Zerfleischen, 	  1 );
		Npc_RemoveInvItems  (hero,ItMi_Pitch,1	);
		
		CreateInvItems 	   (hero,ItRu_Zerfleischen,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_ThunderBall_Info ()
{
	if (Npc_HasItems (hero, ItSc_ThunderBall) >= 1)
	&& (Npc_HasItems (hero, ItMi_Rockcrystal) >= 1)	
	&& (Npc_HasItems (hero, ItMi_Sulfur) 	  >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_ThunderBall, 1);
		Npc_RemoveInvItems  (hero,ItMi_Rockcrystal,	1);
		Npc_RemoveInvItems  (hero,ItMi_Sulfur,  	1);
		
		CreateInvItems 	   (hero,ItRu_ThunderBall,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};

//----------------------- KREIS 4 --------------------------

FUNC VOID PC_ItRu_SumGol_Info ()
{
	if (Npc_HasItems (hero, ItSc_SumGol) >= 1)
	&& (Npc_HasItems (hero, ItAt_StoneGolemHeart) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_SumGol, 1);
		Npc_RemoveInvItems  (hero,ItAt_StoneGolemHeart,1);
		
		
		CreateInvItems 	   (hero,ItRu_SumGol,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItRu_SumFireGol_Info ()
{
	if (Npc_HasItems (hero, ItSc_SumFireGol) >= 1)
	&& (Npc_HasItems (hero, ItAt_FireGolemHeart) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_SumFireGol, 1);
		Npc_RemoveInvItems  (hero,ItAt_FireGolemHeart,1);
		
		
		CreateInvItems 	   (hero,ItRu_SumFireGol,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItRu_SumIceGol_Info ()
{
	if (Npc_HasItems (hero, ItSc_SumIceGol) >= 1)
	&& (Npc_HasItems (hero, ItAt_IceGolemHeart) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_SumIceGol, 1);
		Npc_RemoveInvItems  (hero,ItAt_IceGolemHeart,1);
		
		
		CreateInvItems 	   (hero,ItRu_SumIceGol,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItRu_SummonZombie_Info ()
{
	if (Npc_HasItems (hero, ItSc_SummonZombie) >= 1)
	&& (Npc_HasItems (hero, ItFoMuttonZombie) >= 1)
	&& (Npc_HasItems (hero, ItAt_Menschenblut) >= 2)
	&& (Npc_HasItems (hero, ItAt_SkeletonBone) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_SummonZombie, 1);
		Npc_RemoveInvItems  (hero,ItFoMuttonZombie,1);
		Npc_RemoveInvItems  (hero,ItAt_Menschenblut,2);
		Npc_RemoveInvItems  (hero,ItAt_SkeletonBone,1);
		
		
		CreateInvItems 	   (hero,ItRu_SummonZombie,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItRu_HarmUndead_Info ()
{
	if (Npc_HasItems (hero, ItSc_HarmUndead) >= 1)
	&& (Npc_HasItems (hero, ItMi_HolyWater)  >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_HarmUndead, 1);
		Npc_RemoveInvItems  (hero,ItMi_HolyWater,  1);
		
		
		CreateInvItems 	   (hero,ItRu_HarmUndead,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItRu_ChargeFireball_Info ()
{
	if (Npc_HasItems (hero, ItSc_ChargeFireball) >= 1)
	&& (Npc_HasItems (hero, ItMi_Sulfur) >= 1)	
	&& (Npc_HasItems (hero, ItMi_Pitch) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_ChargeFireball, 1);
		Npc_RemoveInvItems  (hero,ItMi_Sulfur,1	);
		Npc_RemoveInvItems  (hero,ItMi_Pitch,1);
		
		CreateInvItem 	   (hero,ItRu_ChargeFireball); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_LightningFlash_Info ()
{
	if (Npc_HasItems (hero, ItSc_LightningFlash) >= 1)
	&& (Npc_HasItems (hero, ItMi_Rockcrystal) >= 1)	
	&& (Npc_HasItems (hero, ItMi_Quartz) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_LightningFlash, 1);
		Npc_RemoveInvItems  (hero,ItMi_Rockcrystal,    1);
		Npc_RemoveInvItems  (hero,ItMi_Quartz,1	);
		
		CreateInvItems 	   (hero,ItRu_LightningFlash,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItRu_Waterfist_Info ()
{
	if (Npc_HasItems (hero, ItSc_Waterfist) 	 >= 1)
	&& (Npc_HasItems (hero, ItMi_Aquamarine) >= 1)	
	&& (Npc_HasItems (hero, ItMi_Rockcrystal) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Waterfist, 	  1 );
		Npc_RemoveInvItems  (hero,ItMi_Aquamarine,1	);
		Npc_RemoveInvItems  (hero,ItMi_Rockcrystal,1	);
		
		CreateInvItems 	   (hero,ItRu_Waterfist,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

//---------------------- KREIS 5 -------------------

FUNC VOID PC_ItRu_SumDemon_Info ()
{
	if (Npc_HasItems (hero, ItSc_SumDemon) >= 1)
	&& (Npc_HasItems (hero, ItAt_DemonHeart) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_SumDemon, 1);
		Npc_RemoveInvItems  (hero,ItAt_DemonHeart,1);
		
		CreateInvItems 	   (hero,ItRu_SumDemon,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_FullHeal_Info ()
{
	if (Npc_HasItems (hero, ItSc_FullHeal) 		 >= 1)
	&& (Npc_HasItems (hero, ItPl_Health_Herb_03) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_FullHeal, 1);
		Npc_RemoveInvItems  (hero,ItPl_Health_Herb_03,1	);
		
		CreateInvItems 	   (hero,ItRu_FullHeal,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_Skull_Info ()
{
	if (Npc_HasItems (hero, ItSc_Skull) 		 >= 1)
	&& (Npc_HasItems (hero, ItFoMuttonZombie) >= 3)
	&& (Npc_HasItems (hero, ItAt_Menschenblut) >= 2)
	&& (Npc_HasItems (hero, ItAt_SkeletonBone) >= 2)
	{
		Npc_RemoveInvItems  (hero,ItSc_Skull, 1);
		Npc_RemoveInvItems  (hero,ItFoMuttonZombie,3);
		Npc_RemoveInvItems  (hero,ItAt_Menschenblut,2);
		Npc_RemoveInvItems  (hero,ItAt_SkeletonBone,2);
		
		CreateInvItems 	   (hero,ItRu_Skull,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_Pyrokinesis_Info ()
{
	if (Npc_HasItems (hero, ItSc_Pyrokinesis) >= 1)
	&& (Npc_HasItems (hero, ItMi_Sulfur) >= 1)
	&& (Npc_HasItems (hero, ItAt_WaranFiretongue) >= 1)		
	{
		Npc_RemoveInvItems  (hero,ItSc_Pyrokinesis, 1);
		Npc_RemoveInvItems  (hero,ItMi_Sulfur,1	);
		Npc_RemoveInvItems  (hero,ItAt_WaranFiretongue,1);
		
		CreateInvItems 	   (hero,ItRu_Pyrokinesis,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_Pyrokinesis_g1_Info ()
{
	if (Npc_HasItems (hero, ItMi_Sulfur) >= 2)
	&& (Npc_HasItems (hero, ItAt_WaranFiretongue) >= 2)		
	{
		Npc_RemoveInvItems  (hero,ItMi_Sulfur,2	);
		Npc_RemoveInvItems  (hero,ItAt_WaranFiretongue,2);
		
		CreateInvItems 	   (hero,ItRu_Pyrokinesis_g1,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_IceWave_Info ()
{
	if (Npc_HasItems (hero, ItSc_IceWave) 	 >= 1)
	&& (Npc_HasItems (hero, ItMi_Quartz) 	 >= 1)	
	&& (Npc_HasItems (hero, ItMi_Aquamarine) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_IceWave,   1);
		Npc_RemoveInvItems  (hero,ItMi_Quartz,    1);
		Npc_RemoveInvItems  (hero,ItMi_Aquamarine,1);
		
		CreateInvItems 	   (hero,ItRu_IceWave,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

//-------------------------- KREIS 6 ----------------------

FUNC VOID PC_ItRu_BreathOfDeath_Info ()
{
	if (Npc_HasItems (hero, ItSc_BreathOfDeath) >= 1)
	&& (Npc_HasItems (hero, ItMi_Coal) 			>= 1)
	&& (Npc_HasItems (hero, ItMi_DarkPearl) 	>= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_BreathOfDeath, 1);
		Npc_RemoveInvItems  (hero,ItMi_Coal,	 1);
		Npc_RemoveInvItems  (hero,ItMi_DarkPearl,1);
		
		CreateInvItems 	   (hero,ItRu_BreathOfDeath,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();			
};

FUNC VOID PC_ItRu_ArmyOfDarkness_Info ()
{
	if (Npc_HasItems (hero, ItSc_ArmyOfDarkness)		>= 1)
	&& (Npc_HasItems (hero, ItAt_SkeletonBone)			>= 1)	
	&& (Npc_HasItems (hero, ItMi_DarkPearl) 			>= 1)	
	&& (Npc_HasItems (hero, ItAt_StoneGolemHeart) 		>= 1)	
	&& (Npc_HasItems (hero, ItAt_DemonHeart) 			>= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_ArmyOfDarkness, 		1);
		Npc_RemoveInvItems  (hero,ItAt_SkeletonBone,		1);
		Npc_RemoveInvItems  (hero,ItMi_DarkPearl,			1);
		Npc_RemoveInvItems  (hero,ItAt_StoneGolemHeart,		1);
		Npc_RemoveInvItems  (hero,ItAt_DemonHeart,			1);
		
		CreateInvItems 	   (hero,ItRu_ArmyOfDarkness,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();	
}; 

FUNC VOID PC_ItRu_SumDragon_Info ()
{
	if (Npc_HasItems (hero, ItAt_DragonEgg_Mis) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItAt_DragonEgg_Mis,1);
		
		CreateInvItems 	   (hero,ItRu_SumDragon,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_Firerain_Info ()
{
	if (Npc_HasItems (hero, ItSc_Firerain)  >= 1)
	&& (Npc_HasItems (hero, ItMi_Pitch) 	>= 1)
	&& (Npc_HasItems (hero, ItMi_Sulfur) 	>= 1)		
	&& (Npc_HasItems (hero, ItAt_WaranFiretongue) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_Firerain, 1);
		Npc_RemoveInvItems  (hero,ItMi_Pitch,	 1);
		Npc_RemoveInvItems  (hero,ItAt_WaranFiretongue,	1);
		
		CreateInvItems 	   (hero,ItRu_Firerain,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();		
};

FUNC VOID PC_ItRu_Icerain_Info ()
{
	if (Npc_HasItems (hero, ItSc_Icerain)  >= 1)
	&& (Npc_HasItems (hero, ItMi_Pitch) 	>= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Icerain, 1);
		Npc_RemoveInvItems  (hero,ItMi_Pitch,	 1);
		
		CreateInvItems 	   (hero,ItRu_Icerain,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();		
};

FUNC VOID PC_ItRu_Shrink_Info ()
{
	if (Npc_HasItems (hero, ItSc_Shrink) 	 >= 1)
	&& (Npc_HasItems (hero, ItAt_GoblinBone) >= 1)	
	&& (Npc_HasItems (hero, ItAt_TrollTooth) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Shrink, 	  1 );
		Npc_RemoveInvItems  (hero,ItAt_GoblinBone,1	);
		Npc_RemoveInvItems  (hero,ItAt_TrollTooth,1	);
		
		CreateInvItems 	   (hero,ItRu_Shrink,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_SPL_MasterOfDisaster_Create()
{
	if 	(Npc_HasItems (hero, ItMi_HolyWater) 	>= 1)
	{
		Npc_RemoveInvItems (hero,ItMi_HolyWater  ,1);
		CreateInvItems 	   (hero,ItRu_MasterOfDisaster,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};