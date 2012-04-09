//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////				B_ScHasBeliarsWeapon			//////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
func int C_SCHasBeliarsRune()
{
	if (Npc_HasItems (hero, ItRu_BeliarsRage) 		== TRUE)
	|| (Npc_HasItems (hero, ItRu_SuckEnergy) 		== TRUE)
	|| (Npc_HasItems (hero, ItRu_GreenTentacle) 	== TRUE)
	|| (Npc_HasItems (hero, ItRu_Swarm) 			== TRUE)
	|| (Npc_HasItems (hero, ItRu_Skull) 			== TRUE)
	|| (Npc_HasItems (hero, ItRu_SummonZombie) 		== TRUE)
	|| (Npc_HasItems (hero, ItRu_SummonGuardian) 	== TRUE)
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};

func int C_ScHasUluMulu ()
{	
	if (Npc_HasItems (hero, UluMulu )) 
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasDreiGoetterStab ()
{	
	if (Npc_HasItems (hero, DreiGoetterStab)) 
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasDeliriumWaffe ()
{	
	if (Npc_HasItems (hero, ItMw_1h_Vlk_Dagger))
	|| (Npc_HasItems (hero, ItMw_Klingendolch))
	|| (Npc_HasItems (hero, ItMw_Klingendolch_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_1h_Vlk_Dagger_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Avaquar))
	|| (Npc_HasItems (hero, ItMw_Avaquar_Geschaerft))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasFeuerstab ()
{	
	if (Npc_HasItems (hero, ItRwUdOrcstaff)) 
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasAdanosStab ()
{	
	if (Npc_HasItems (hero, ItMw_Adanos_Stab_Magieteil)) 
	|| (Npc_HasItems(hero, ItMw_Adanos_Stab_Kampfteil))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasHolyHammer ()
{	
	if (Npc_HasItems (hero, Holy_Hammer_MIS )) 
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasMagie()
{
	if (Npc_HasItems (hero, ItRu_Thunderstorm))
	|| (Npc_HasItems (hero, ItRu_Whirlwind))
	|| (Npc_HasItems (hero, ItRu_Geyser))
	|| (Npc_HasItems (hero, ItRu_Waterfist))
	|| (Npc_HasItems (hero, ItRu_Icelance))
	|| (Npc_HasItems (hero, ItRu_BeliarsRage))
	|| (Npc_HasItems (hero, ItRu_SuckEnergy))
	|| (Npc_HasItems (hero, ItRu_GreenTentacle))
	|| (Npc_HasItems (hero, ItRu_Swarm))
	|| (Npc_HasItems (hero, ItRu_Skull))
	|| (Npc_HasItems (hero, ItRu_SummonZombie))
	|| (Npc_HasItems (hero, ItRu_SummonGuardian))
	|| (Npc_HasItems (hero, ItSc_Geyser))
	|| (Npc_HasItems (hero, ItSc_Icelance))
	|| (Npc_HasItems (hero, ItSc_Waterfist))
	|| (Npc_HasItems (hero, ItSc_Thunderstorm))
	|| (Npc_HasItems (hero, ItSc_Whirlwind))
	|| (Npc_HasItems (hero, ItRu_PalLight))
	|| (Npc_HasItems (hero, ItRu_PalLightHeal))
	|| (Npc_HasItems (hero, ItRu_PalMediumHeal))
	|| (Npc_HasItems (hero, ItRu_PalFullHeal))
	|| (Npc_HasItems (hero, ItRu_PalHolyBolt))
	|| (Npc_HasItems (hero, ItRu_PalRepelEvil))
	|| (Npc_HasItems (hero, ItRu_PalDestroyEvil))
	|| (Npc_HasItems (hero, ItRu_PalTeleportSecret))
	|| (Npc_HasItems (hero, ItRu_TeleportSeaport))
	|| (Npc_HasItems (hero, ItRu_TeleportMonastery))
	|| (Npc_HasItems (hero, ItRu_TeleportFarm))
	|| (Npc_HasItems (hero, ItRu_TeleportXardas))
	|| (Npc_HasItems (hero, ItRu_TeleportPassNW))
	|| (Npc_HasItems (hero, ItRu_TeleportPassOW))
	|| (Npc_HasItems (hero, ItRu_TeleportOC))
	|| (Npc_HasItems (hero, ItRu_TeleportOWDemonTower))
	|| (Npc_HasItems (hero, ItRu_TeleportTaverne))
	|| (Npc_HasItems (hero, ItRu_Teleport_3))
	|| (Npc_HasItems (hero, ItRu_Light))
	|| (Npc_HasItems (hero, ItRu_FireBolt))
	|| (Npc_HasItems (hero, ItRu_Zap))
	|| (Npc_HasItems (hero, ItRu_LightHeal))
	|| (Npc_HasItems (hero, ItRu_SumGobSkel))
	|| (Npc_HasItems (hero, ItRu_InstantFireball))
	|| (Npc_HasItems (hero, ItRu_Icebolt))
	|| (Npc_HasItems (hero, ItRu_SumWolf))
	|| (Npc_HasItems (hero, ItRu_Windfist))
	|| (Npc_HasItems (hero, ItRu_Sleep))
	|| (Npc_HasItems (hero, ItRu_MediumHeal))
	|| (Npc_HasItems (hero, ItRu_LightningFlash))
	|| (Npc_HasItems (hero, ItRu_ChargeFireball))
	|| (Npc_HasItems (hero, ItRu_SumSkel))
	|| (Npc_HasItems (hero, ItRu_Fear))
	|| (Npc_HasItems (hero, ItRu_IceCube))
	|| (Npc_HasItems (hero, ItRu_ThunderBall))
	|| (Npc_HasItems (hero, ItRu_SumGol))
	|| (Npc_HasItems (hero, ItRu_HarmUndead))
	|| (Npc_HasItems (hero, ItRu_Pyrokinesis))
	|| (Npc_HasItems (hero, ItRu_Firestorm))
	|| (Npc_HasItems (hero, ItRu_IceWave))
	|| (Npc_HasItems (hero, ItRu_SumDemon))
	|| (Npc_HasItems (hero, ItRu_FullHeal))
	|| (Npc_HasItems (hero, ItRu_Firerain))
	|| (Npc_HasItems (hero, ItRu_BreathOfDeath))
	|| (Npc_HasItems (hero, ItRu_MassDeath))
	|| (Npc_HasItems (hero, ItRu_MasterOfDisaster))
	|| (Npc_HasItems (hero, ItRu_ArmyOfDarkness))
	|| (Npc_HasItems (hero, ItRu_Shrink))
	|| (Npc_HasItems (hero, ItSc_PalLight))
	|| (Npc_HasItems (hero, ItSc_PalLightHeal))
	|| (Npc_HasItems (hero, ItSc_PalHolyBolt))
	|| (Npc_HasItems (hero, ItSc_PalMediumHeal))
	|| (Npc_HasItems (hero, ItSc_PalRepelEvil))
	|| (Npc_HasItems (hero, ItSc_PalFullHeal))
	|| (Npc_HasItems (hero, ItSc_PalDestroyEvil))
	|| (Npc_HasItems (hero, ItSc_Light))
	|| (Npc_HasItems (hero, ItSc_Firebolt))
	|| (Npc_HasItems (hero, ItSc_Icebolt))
	|| (Npc_HasItems (hero, ItSc_LightHeal))
	|| (Npc_HasItems (hero, ItSc_SumGobSkel))
	|| (Npc_HasItems (hero, ItSc_InstantFireball))
	|| (Npc_HasItems (hero, ItSc_Zap))
	|| (Npc_HasItems (hero, ItSc_SumWolf))
	|| (Npc_HasItems (hero, ItSc_Windfist))
	|| (Npc_HasItems (hero, ItSc_Sleep))
	|| (Npc_HasItems (hero, ItSc_Charm))
	|| (Npc_HasItems (hero, ItSc_MediumHeal))
	|| (Npc_HasItems (hero, ItSc_LightningFlash))
	|| (Npc_HasItems (hero, ItSc_ChargeFireball))
	|| (Npc_HasItems (hero, ItSc_SumSkel))
	|| (Npc_HasItems (hero, ItSc_Fear))
	|| (Npc_HasItems (hero, ItSc_IceCube))
	|| (Npc_HasItems (hero, ItSc_ThunderBall))
	|| (Npc_HasItems (hero, ItSc_SumGol))
	|| (Npc_HasItems (hero, ItSc_HarmUndead))
	|| (Npc_HasItems (hero, ItSc_Pyrokinesis))
	|| (Npc_HasItems (hero, ItSc_Firestorm))
	|| (Npc_HasItems (hero, ItSc_IceWave))
	|| (Npc_HasItems (hero, ItSc_SumDemon))
	|| (Npc_HasItems (hero, ItSc_FullHeal))
	|| (Npc_HasItems (hero, ItSc_Firerain))
	|| (Npc_HasItems (hero, ItSc_BreathOfDeath))
	|| (Npc_HasItems (hero, ItSc_MassDeath))
	|| (Npc_HasItems (hero, ItSc_ArmyOfDarkness))
	|| (Npc_HasItems (hero, ItSc_Shrink))
	|| (Npc_HasItems (hero, ItSc_TrfMeatbug))
	|| (Npc_HasItems (hero, ItSc_TrfHarpie))
	|| (Npc_HasItems (hero, ItSc_TrfShadowbeast))
	|| (Npc_HasItems (hero, ItSc_TrfSnapper))
	|| (Npc_HasItems (hero, ItSc_TrfWarg))
	|| (Npc_HasItems (hero, ItSc_TrfBlackTroll))
	|| (Npc_HasItems (hero, ItSc_TrfGolem))
	|| (Npc_HasItems (hero, ItSc_TrfBloodfly))
	|| (Npc_HasItems (hero, ItSc_TrfBloodhound))
	|| (Npc_HasItems (hero, ItSc_TrfKeiler))
	|| (Npc_HasItems (hero, ItSc_TrfSheep))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasFernkampfwaffe()
{
	if (Npc_HasItems (hero, ItRw_Addon_MagicBow))
	|| (Npc_HasItems (hero, ItRw_Addon_FireBow))
	|| (Npc_HasItems (hero, ItRw_Addon_MagicCrossbow))
	|| (Npc_HasItems (hero, ItRw_Mil_Crossbow))
	|| (Npc_HasItems (hero, ItRw_Sld_Bow))
	|| (Npc_HasItems (hero, ItRw_Bow_L_01))
	|| (Npc_HasItems (hero, ItRw_Bow_L_02))
	|| (Npc_HasItems (hero, ItRw_Bow_L_03))
	|| (Npc_HasItems (hero, ItRw_Bow_L_04))
	|| (Npc_HasItems (hero, ItRw_Bow_M_01))
	|| (Npc_HasItems (hero, ItRw_Bow_M_02))
	|| (Npc_HasItems (hero, ItRw_Bow_M_03))
	|| (Npc_HasItems (hero, ItRw_Bow_M_04))
	|| (Npc_HasItems (hero, ItRw_Bow_H_01))
	|| (Npc_HasItems (hero, ItRw_Bow_H_02))
	|| (Npc_HasItems (hero, ItRw_Bow_H_03))
	|| (Npc_HasItems (hero, ItRw_Bow_H_04))
	|| (Npc_HasItems (hero, ItRw_Crossbow_L_01))
	|| (Npc_HasItems (hero, ItRw_Crossbow_L_02))
	|| (Npc_HasItems (hero, ItRw_Crossbow_M_01))
	|| (Npc_HasItems (hero, ItRw_Crossbow_M_02))
	|| (Npc_HasItems (hero, ItRw_Crossbow_H_01))
	|| (Npc_HasItems (hero, ItRw_Crossbow_H_02))
	|| (Npc_HasItems (hero, ItRw_Bow_L_03_MIS))
	|| (Npc_HasItems (hero, ItRw_DragomirsArmbrust_MIS))
	|| (Npc_HasItems (hero, ItRw_SengrathsArmbrust_MIS))
	|| (Npc_HasItems (hero, ItRw_Bow_War_02))
	|| (Npc_HasItems (hero, ItRw_Bow_War_03))
	|| (Npc_HasItems (hero, ItRw_Bow_War_04))
	|| (Npc_HasItems (hero, ItRw_Bow_War_05))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasBogen()
{
	if (Npc_HasItems (hero, ItRw_Addon_MagicBow))
	|| (Npc_HasItems (hero, ItRw_Addon_FireBow))
	|| (Npc_HasItems (hero, ItRw_Sld_Bow))
	|| (Npc_HasItems (hero, ItRw_Bow_L_01))
	|| (Npc_HasItems (hero, ItRw_Bow_L_02))
	|| (Npc_HasItems (hero, ItRw_Bow_L_03))
	|| (Npc_HasItems (hero, ItRw_Bow_L_04))
	|| (Npc_HasItems (hero, ItRw_Bow_M_01))
	|| (Npc_HasItems (hero, ItRw_Bow_M_02))
	|| (Npc_HasItems (hero, ItRw_Bow_M_03))
	|| (Npc_HasItems (hero, ItRw_Bow_M_04))
	|| (Npc_HasItems (hero, ItRw_Bow_H_01))
	|| (Npc_HasItems (hero, ItRw_Bow_H_02))
	|| (Npc_HasItems (hero, ItRw_Bow_H_03))
	|| (Npc_HasItems (hero, ItRw_Bow_H_04))
	|| (Npc_HasItems (hero, ItRw_Bow_L_03_MIS))
	|| (Npc_HasItems (hero, ItRw_Bow_War_02))
	|| (Npc_HasItems (hero, ItRw_Bow_War_03))
	|| (Npc_HasItems (hero, ItRw_Bow_War_04))
	|| (Npc_HasItems (hero, ItRw_Bow_War_05))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasArmbrust()
{
	if (Npc_HasItems (hero, ItRw_Addon_MagicCrossbow))
	|| (Npc_HasItems (hero, ItRw_Mil_Crossbow))
	|| (Npc_HasItems (hero, ItRw_Crossbow_L_01))
	|| (Npc_HasItems (hero, ItRw_Crossbow_L_02))
	|| (Npc_HasItems (hero, ItRw_Crossbow_M_01))
	|| (Npc_HasItems (hero, ItRw_Crossbow_M_02))
	|| (Npc_HasItems (hero, ItRw_Crossbow_H_01))
	|| (Npc_HasItems (hero, ItRw_Crossbow_H_02))
	|| (Npc_HasItems (hero, ItRw_DragomirsArmbrust_MIS))
	|| (Npc_HasItems (hero, ItRw_SengrathsArmbrust_MIS))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasNahkampfwaffe()
{
	if (Npc_HasItems (hero, ItMw_BeliarWeapon_Raven )) //Joly: Ravens Waffe
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_01 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_02 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_03 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_04 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_05 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_06 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_07 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_08 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_09 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_10 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_11 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_12 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_13 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_14 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_15 )) 
	|| (Npc_HasItems(hero, Delirium_Dolch))
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_16 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_17 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_18 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_19 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_20 )) 

	//------------------------------------------------

	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_01 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_02 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_03 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_04 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_05 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_06 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_07 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_08 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_09 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_10 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_11 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_12 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_13 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_14 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_15 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_16 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_17 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_18 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_19 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_20 )) 
	|| (Npc_HasItems (hero, ItMW_Addon_Knife01))
	|| (Npc_HasItems (hero, ItMW_Addon_Stab01))
	|| (Npc_HasItems (hero, ItMW_Addon_Stab02))
	|| (Npc_HasItems (hero, ItMW_Addon_Stab03))
	|| (Npc_HasItems (hero, ItMW_Addon_Stab04))
	|| (Npc_HasItems (hero, ItMW_Addon_Stab05))
	|| (Npc_HasItems (hero, ItMW_Addon_Hacker_1h_01))
	|| (Npc_HasItems (hero, ItMW_Addon_Hacker_1h_02))
	|| (Npc_HasItems (hero, ItMW_Addon_Hacker_2h_01))
	|| (Npc_HasItems (hero, ItMW_Addon_Hacker_2h_02))
	|| (Npc_HasItems (hero, ItMW_Addon_Keule_1h_01))
	|| (Npc_HasItems (hero, ItMW_Addon_Keule_2h_01))
	|| (Npc_HasItems (hero, ItMw_FrancisDagger_Mis))
	|| (Npc_HasItems (hero, ItMw_RangerStaff_Addon))
	|| (Npc_HasItems (hero, ItMw_Addon_PIR2hAxe))
	|| (Npc_HasItems (hero, ItMw_Addon_PIR2hSword))
	|| (Npc_HasItems (hero, ItMw_Addon_PIR1hAxe))
	|| (Npc_HasItems (hero, ItMw_Addon_PIR1hSword))
	|| (Npc_HasItems (hero, ItMw_Addon_BanditTrader))
	|| (Npc_HasItems (hero, ItMw_Addon_Betty))
	|| (Npc_HasItems (hero, Scars_Schwert))
	|| (Npc_HasItems (hero, Lees_Axt))
	|| (Npc_HasItems (hero, Thorus_Schwert))
	|| (Npc_HasItems (hero, Artos_Schwert))
	|| (Npc_HasItems (hero, Rabenrecht))
	|| (Npc_HasItems (hero, Prankenhieb))
	|| (Npc_HasItems (hero, Whistlers_Schwert))
	|| (Npc_HasItems (hero, Stab_des_Lichts))
	|| (Npc_HasItems (hero, Kaloms_Schwert))
	|| (Npc_HasItems (hero, Streitschlichter))
	|| (Npc_HasItems (hero, Roter_Wind))
	|| (Npc_HasItems (hero, Namibs_Keule))
	|| (Npc_HasItems (hero, Oruns_Keule))
	|| (Npc_HasItems (hero, Fortunos_Keule))
	|| (Npc_HasItems (hero, Oriks_Axt))
	|| (Npc_HasItems (hero, Torlofs_Axt))
	|| (Npc_HasItems (hero, Cords_Spalter))
	|| (Npc_HasItems (hero, Gorns_Rache))
	|| (Npc_HasItems (hero, Lares_Axt))
	|| (Npc_HasItems (hero, Silas_Axt))
	|| (Npc_HasItems (hero, Heerscherstab))
	|| (Npc_HasItems (hero, UluMulu))
	|| (Npc_HasItems (hero, Uriziel_1H))
	|| (Npc_HasItems (hero, Uriziel_2H))
	|| (Npc_HasItems (hero, ItMw_1h_Vlk_Dagger))
	|| (Npc_HasItems (hero, ItMw_1H_Mace_L_01))
	|| (Npc_HasItems (hero, ItMw_1h_Bau_Axe))
	|| (Npc_HasItems (hero, ItMw_1h_Vlk_Mace))
	|| (Npc_HasItems (hero, ItMw_1H_Mace_L_03))
	|| (Npc_HasItems (hero, ItMw_1h_Bau_Mace))
	|| (Npc_HasItems (hero, ItMw_1h_Vlk_Axe))
	|| (Npc_HasItems (hero, ItMw_1H_Mace_L_04))
	|| (Npc_HasItems (hero, ItMw_ShortSword1))
	|| (Npc_HasItems (hero, ItMw_Nagelknueppel))
	|| (Npc_HasItems (hero, ItMw_1H_Sword_L_03))
	|| (Npc_HasItems (hero, ItMw_ShortSword2))
	|| (Npc_HasItems (hero, ItMw_Sense))
	|| (Npc_HasItems (hero, ItMw_1h_Vlk_Sword))
	|| (Npc_HasItems (hero, ItMw_1h_Nov_Mace))
	|| (Npc_HasItems (hero, ItMw_2h_Bau_Axe))
	|| (Npc_HasItems (hero, ItMw_2H_Axe_L_01))
	|| (Npc_HasItems (hero, ItMw_1h_MISC_Sword))
	|| (Npc_HasItems (hero, ItMw_1h_Misc_Axe))
	|| (Npc_HasItems (hero, ItMw_2H_Sword_M_01))
	|| (Npc_HasItems (hero, ItMw_1h_Mil_Sword))
	|| (Npc_HasItems (hero, ItMw_1h_Sld_Axe))
	|| (Npc_HasItems (hero, ItMw_1h_Sld_Sword))
	|| (Npc_HasItems (hero, ItMw_2h_Sld_Axe))
	|| (Npc_HasItems (hero, ItMw_2h_Sld_Sword))
	|| (Npc_HasItems (hero, ItMw_1h_Pal_Sword))
	|| (Npc_HasItems (hero, ItMw_2h_Pal_Sword))
	|| (Npc_HasItems (hero, ItMw_2H_OrcAxe_01))
	|| (Npc_HasItems (hero, ItMw_2H_OrcAxe_02))
	|| (Npc_HasItems (hero, ItMw_2H_OrcAxe_03))
	|| (Npc_HasItems (hero, ItMw_2H_OrcAxe_04))
	|| (Npc_HasItems (hero, ItMw_2H_OrcSword_01))
	|| (Npc_HasItems (hero, ItMw_2H_OrcSword_02))
	|| (Npc_HasItems (hero, ItMw_ShortSword3))
	|| (Npc_HasItems (hero, ItMw_Nagelkeule))
	|| (Npc_HasItems (hero, ItMw_ShortSword4))
	|| (Npc_HasItems (hero, ItMw_Kriegskeule))
	|| (Npc_HasItems (hero, ItMw_Richtstab))
	|| (Npc_HasItems (hero, ItMw_ShortSword5))
	|| (Npc_HasItems (hero, ItMw_Kriegshammer1))
	|| (Npc_HasItems (hero, ItMw_Hellebarde))
	|| (Npc_HasItems (hero, ItMw_Nagelkeule2))
	|| (Npc_HasItems (hero, ItMw_Schiffsaxt))
	|| (Npc_HasItems (hero, ItMw_Piratensaebel))
	|| (Npc_HasItems (hero, ItMw_Schwert))
	|| (Npc_HasItems (hero, ItMw_1H_Common_01))
	|| (Npc_HasItems (hero, ItMw_Stabkeule))
	|| (Npc_HasItems (hero, ItMw_Zweihaender1))
	|| (Npc_HasItems (hero, ItMw_Steinbrecher))
	|| (Npc_HasItems (hero, ItMw_Spicker))
	|| (Npc_HasItems (hero, ItMw_Streitaxt1))
	|| (Npc_HasItems (hero, ItMw_Schwert1))
	|| (Npc_HasItems (hero, ItMw_Schwert2))
	|| (Npc_HasItems (hero, ItMw_Doppelaxt))
	|| (Npc_HasItems (hero, ItMw_Avaquar))
	|| (Npc_HasItems (hero, ItMw_Avaquar_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Bartaxt))
	|| (Npc_HasItems (hero, ItMw_Morgenstern))
	|| (Npc_HasItems (hero, ItMw_Schwert3))
	|| (Npc_HasItems (hero, ItMw_Schwert4))
	|| (Npc_HasItems (hero, ItMw_1H_Special_01))
	|| (Npc_HasItems (hero, ItMw_2H_Special_01))
	|| (Npc_HasItems (hero, ItMw_Rapier))
	|| (Npc_HasItems (hero, ItMw_Rubinklinge))
	|| (Npc_HasItems (hero, ItMw_Streitkolben))
	|| (Npc_HasItems (hero, ItMw_Zweihaender2))
	|| (Npc_HasItems (hero, ItMw_Runenschwert))
	|| (Npc_HasItems (hero, ItMw_Rabenschnabel))
	|| (Npc_HasItems (hero, ItMw_Schwert5))
	|| (Npc_HasItems (hero, ItMw_Inquisitor))
	|| (Npc_HasItems (hero, ItMw_Streitaxt2))
	|| (Npc_HasItems (hero, ItMw_Zweihaender3))
	|| (Npc_HasItems (hero, ItMw_1H_Special_02))
	|| (Npc_HasItems (hero, ItMw_2H_Special_02))
	|| (Npc_HasItems (hero, ItMw_ElBastardo))
	|| (Npc_HasItems (hero, ItMw_Kriegshammer2))
	|| (Npc_HasItems (hero, ItMw_Meisterdegen))
	|| (Npc_HasItems (hero, ItMw_Folteraxt))
	|| (Npc_HasItems (hero, ItMw_Orkschlaechter))
	|| (Npc_HasItems (hero, ItMw_Zweihaender4))
	|| (Npc_HasItems (hero, ItMw_Schlachtaxt))
	|| (Npc_HasItems (hero, ItMw_Krummschwert))
	|| (Npc_HasItems (hero, ItMw_Barbarenstreitaxt))
	|| (Npc_HasItems (hero, ItMw_Sturmbringer))
	|| (Npc_HasItems (hero, ItMw_1H_Special_03))
	|| (Npc_HasItems (hero, ItMw_2H_Special_03))
	|| (Npc_HasItems (hero, ItMw_Berserkeraxt))
	|| (Npc_HasItems (hero, ItMw_Drachenschneide))
	|| (Npc_HasItems (hero, ItMw_1H_Special_04))
	|| (Npc_HasItems (hero, ItMw_2H_Special_04))
	|| (Npc_HasItems (hero, ItMw_1H_Blessed_01))
	|| (Npc_HasItems (hero, ItMw_1H_Blessed_02))
	|| (Npc_HasItems (hero, ItMw_1H_Blessed_03))
	|| (Npc_HasItems (hero, ItMw_2H_Blessed_01))
	|| (Npc_HasItems (hero, ItMw_2H_Blessed_02))
	|| (Npc_HasItems (hero, ItMw_2H_Blessed_03))
	|| (Npc_HasItems (hero, ItMw_2h_Rod))
	|| (Npc_HasItems (hero, ItMw_AlriksSword_Mis))
	|| (Npc_HasItems (hero, Holy_Hammer_MIS))
	|| (Npc_HasItems (hero, ItMw_MalethsGehstock_MIS))
	|| (Npc_HasItems (hero, ItMW_1H_FerrosSword_Mis))
	|| (Npc_HasItems (hero, ItMw_Adanos_Stab_Magieteil))
	|| (Npc_HasItems (hero, ItMw_Adanos_Stab_Kampfteil))
	|| (Npc_HasItems (hero, ItMw_Schaedelbrecher))
	|| (Npc_HasItems (hero, ItMw_Drachenaxt))
	|| (Npc_HasItems (hero, ItMw_Schwert_02))
	|| (Npc_HasItems (hero, Xeres_Schwert))
	|| (Npc_HasItems (hero, ItMw2hOrcMace01))
	|| (Npc_HasItems (hero, ItMW_Schuetterschwert))
	|| (Npc_HasItems (hero, ItMw_1H_Mace_02))
	|| (Npc_HasItems (hero, ItMw_1H_Sword_03))
	|| (Npc_HasItems (hero, ItMw_1H_Sword_Long_04))
	|| (Npc_HasItems (hero, ItMw_1H_Sword_Long_05))
	|| (Npc_HasItems (hero, ItMw_1H_Sword_Broad_04))
	|| (Npc_HasItems (hero, ItMw_1H_Sword_Bastard_03))
	|| (Npc_HasItems (hero, ItMw_2H_Axe_Old_02))
	|| (Npc_HasItems (hero, ItMw_2H_Sword_Light_02))
	|| (Npc_HasItems (hero, ItMw_Kilgorin))
	|| (Npc_HasItems (hero, ItMw_1H_Eminem_Eisenklinge_01))
	|| (Npc_HasItems (hero, ItMw_1H_Eminem_AchillesSchwert_01))
	|| (Npc_HasItems (hero, ItMw_Gladius))
	|| (Npc_HasItems (hero, ItMw_Kurzschwert))
	|| (Npc_HasItems (hero, ItMw_Klingendolch))
	|| (Npc_HasItems (hero, ItMw_Klauenschwert))
	|| (Npc_HasItems (hero, ItMw_Feuerschwert))
	|| (Npc_HasItems (hero, ITMW_ICESWORD))
	|| (Npc_HasItems (hero, ItMW_Sense_01))
	|| (Npc_HasItems (hero, ItMW_Sense_02))
	|| (Npc_HasItems (hero, ItMW_Sense_03))
	|| (Npc_HasItems (hero, ItMw_2H_Eminem_Goldschwert_01))
	|| (Npc_HasItems (hero, ItMw_Schmetteraxt))
	|| (Npc_HasItems (hero, ItMw_Truemmeraxt))
	|| (Npc_HasItems (hero, ItMw_1H_Eminem_Eisenklinge_02))
	|| (Npc_HasItems (hero, Goetterschwert))
	{
		return TRUE;
	};
	return FALSE; 
};

func int C_ScHasEinhand()
{
	if (Npc_HasItems (hero, ItMw_BeliarWeapon_Raven )) //Joly: Ravens Waffe
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_01 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_02 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_03 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_04 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_05 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_06 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_07 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_08 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_09 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_10 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_11 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_12 )) 
	|| (Npc_HasItems(hero, Delirium_Dolch))
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_13 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_14 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_15 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_16 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_17 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_18 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_19 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_20 )) 

	//------------------------------------------------
	|| (Npc_HasItems (hero, ItMW_Addon_Knife01))
	|| (Npc_HasItems (hero, ItMW_Addon_Hacker_1h_01))
	|| (Npc_HasItems (hero, ItMW_Addon_Hacker_1h_02))
	|| (Npc_HasItems (hero, ItMW_Addon_Keule_1h_01))
	|| (Npc_HasItems (hero, ItMw_FrancisDagger_Mis))
	|| (Npc_HasItems (hero, ItMw_Addon_PIR1hAxe))
	|| (Npc_HasItems (hero, ItMw_Addon_PIR1hSword))
	|| (Npc_HasItems (hero, ItMw_Addon_BanditTrader))
	|| (Npc_HasItems (hero, ItMw_Addon_Betty))
	|| (Npc_HasItems (hero, Scars_Schwert))
	|| (Npc_HasItems (hero, Lees_Axt))
	|| (Npc_HasItems (hero, Artos_Schwert))
	|| (Npc_HasItems (hero, Rabenrecht))
	|| (Npc_HasItems (hero, Prankenhieb))
	|| (Npc_HasItems (hero, Whistlers_Schwert))
	|| (Npc_HasItems (hero, Kaloms_Schwert))
	|| (Npc_HasItems (hero, Streitschlichter))
	|| (Npc_HasItems (hero, Namibs_Keule))
	|| (Npc_HasItems (hero, Oruns_Keule))
	|| (Npc_HasItems (hero, Fortunos_Keule))
	|| (Npc_HasItems (hero, Oriks_Axt))
	|| (Npc_HasItems (hero, Cords_Spalter))
	|| (Npc_HasItems (hero, Lares_Axt))
	|| (Npc_HasItems (hero, Silas_Axt))
	|| (Npc_HasItems (hero, ItMw_1h_Vlk_Dagger))
	|| (Npc_HasItems (hero, ItMw_1H_Mace_L_01))
	|| (Npc_HasItems (hero, ItMw_1h_Bau_Axe))
	|| (Npc_HasItems (hero, ItMw_1h_Vlk_Mace))
	|| (Npc_HasItems (hero, ItMw_1H_Mace_L_03))
	|| (Npc_HasItems (hero, ItMw_1h_Bau_Mace))
	|| (Npc_HasItems (hero, ItMw_1h_Vlk_Axe))
	|| (Npc_HasItems (hero, ItMw_1H_Mace_L_04))
	|| (Npc_HasItems (hero, ItMw_ShortSword1))
	|| (Npc_HasItems (hero, ItMw_Nagelknueppel))
	|| (Npc_HasItems (hero, ItMw_1H_Sword_L_03))
	|| (Npc_HasItems (hero, ItMw_ShortSword2))
	|| (Npc_HasItems (hero, ItMw_Sense))
	|| (Npc_HasItems (hero, ItMw_1h_Vlk_Sword))
	|| (Npc_HasItems (hero, ItMw_1h_Nov_Mace))
	|| (Npc_HasItems (hero, ItMw_1h_MISC_Sword))
	|| (Npc_HasItems (hero, ItMw_1h_Misc_Axe))
	|| (Npc_HasItems (hero, ItMw_1h_Mil_Sword))
	|| (Npc_HasItems (hero, ItMw_1h_Sld_Axe))
	|| (Npc_HasItems (hero, ItMw_1h_Sld_Sword))
	|| (Npc_HasItems (hero, ItMw_1h_Pal_Sword))
	|| (Npc_HasItems (hero, ItMw_ShortSword3))
	|| (Npc_HasItems (hero, ItMw_Nagelkeule))
	|| (Npc_HasItems (hero, ItMw_ShortSword4))
	|| (Npc_HasItems (hero, ItMw_Kriegskeule))
	|| (Npc_HasItems (hero, ItMw_ShortSword5))
	|| (Npc_HasItems (hero, ItMw_Kriegshammer1))
	|| (Npc_HasItems (hero, ItMw_Nagelkeule2))
	|| (Npc_HasItems (hero, ItMw_Piratensaebel))
	|| (Npc_HasItems (hero, ItMw_Schwert))
	|| (Npc_HasItems (hero, ItMw_1H_Common_01))
	|| (Npc_HasItems (hero, ItMw_Steinbrecher))
	|| (Npc_HasItems (hero, ItMw_Spicker))
	|| (Npc_HasItems (hero, ItMw_Schwert1))
	|| (Npc_HasItems (hero, ItMw_Schwert2))
	|| (Npc_HasItems (hero, ItMw_Morgenstern))
	|| (Npc_HasItems (hero, ItMw_Schwert3))
	|| (Npc_HasItems (hero, ItMw_Schwert4))
	|| (Npc_HasItems (hero, ItMw_1H_Special_01))
	|| (Npc_HasItems (hero, ItMw_Rapier))
	|| (Npc_HasItems (hero, ItMw_Rubinklinge))
	|| (Npc_HasItems (hero, ItMw_Streitkolben))
	|| (Npc_HasItems (hero, ItMw_Runenschwert))
	|| (Npc_HasItems (hero, ItMw_Rabenschnabel))
	|| (Npc_HasItems (hero, ItMw_Schwert5))
	|| (Npc_HasItems (hero, ItMw_Inquisitor))
	|| (Npc_HasItems (hero, ItMw_1H_Special_02))
	|| (Npc_HasItems (hero, ItMw_ElBastardo))
	|| (Npc_HasItems (hero, ItMw_Meisterdegen))
	|| (Npc_HasItems (hero, ItMw_Folteraxt))
	|| (Npc_HasItems (hero, ItMw_Orkschlaechter))
	|| (Npc_HasItems (hero, ItMw_1H_Special_03))
	|| (Npc_HasItems (hero, ItMw_1H_Special_04))
	|| (Npc_HasItems (hero, ItMw_1H_Blessed_01))
	|| (Npc_HasItems (hero, ItMw_1H_Blessed_02))
	|| (Npc_HasItems (hero, ItMw_1H_Blessed_03))
	|| (Npc_HasItems (hero, ItMw_AlriksSword_Mis))
	|| (Npc_HasItems (hero, Holy_Hammer_MIS))
	|| (Npc_HasItems (hero, ItMw_MalethsGehstock_MIS))
	|| (Npc_HasItems (hero, ItMW_1H_FerrosSword_Mis))
	|| (Npc_HasItems (hero, ItMw_Schwert_02))
	|| (Npc_HasItems (hero, ItMW_Schuetterschwert))
	|| (Npc_HasItems (hero, Uriziel_1H))
	|| (Npc_HasItems (hero, ItMw_1H_Mace_02))
	|| (Npc_HasItems (hero, ItMw_1H_Sword_03))
	|| (Npc_HasItems (hero, ItMw_1H_Sword_Long_04))
	|| (Npc_HasItems (hero, ItMw_1H_Sword_Long_05))
	|| (Npc_HasItems (hero, ItMw_1H_Sword_Broad_04))
	|| (Npc_HasItems (hero, ItMw_1H_Sword_Bastard_03))
	|| (Npc_HasItems (hero, ItMw_Kilgorin))
	|| (Npc_HasItems (hero, ItMw_1H_Eminem_Eisenklinge_01))
	|| (Npc_HasItems (hero, ItMw_1H_Eminem_AchillesSchwert_01))
	|| (Npc_HasItems (hero, ItMw_Gladius))
	|| (Npc_HasItems (hero, ItMw_Kurzschwert))
	|| (Npc_HasItems (hero, ItMw_Klingendolch))
	|| (Npc_HasItems (hero, ItMw_Klauenschwert))
	|| (Npc_HasItems (hero, ItMw_Avaquar))
	|| (Npc_HasItems (hero, ItMW_Avaquar_Geschaerft))
	|| (Npc_HasItems (hero, ItMW_Addon_Knife01_Geschaerft))
	|| (Npc_HasItems (hero, ItMW_Addon_Hacker_1h_01_Geschaerft))
	|| (Npc_HasItems (hero, ItMW_Addon_Hacker_1h_02_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_FrancisDagger_Mis_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Addon_PIR1hAxe_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Addon_PIR1hSword_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Addon_BanditTrader_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Addon_Betty_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_1h_Vlk_Dagger_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_1h_Vlk_Axe_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_ShortSword1_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_1H_Sword_L_03_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_ShortSword2_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Sense_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_1h_Vlk_Sword_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_1h_MISC_Sword_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_1h_Misc_Axe_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_1h_Mil_Sword_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_1h_Sld_Axe_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_1h_Sld_Sword_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_1h_Pal_Sword_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_ShortSword3_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_ShortSword4_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_ShortSword5_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Piratensaebel_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Schwert_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Schwert1_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Schwert2_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Schwert3_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Schwert4_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Rapier_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Rubinklinge_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Runenschwert_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Schwert5_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_ElBastardo_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Meisterdegen_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Folteraxt_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Orkschlaechter_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Schwert_02_Geschaerft))
	|| (Npc_HasItems (hero, ItMW_Schuetterschwert_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_1H_Sword_03_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_1H_Sword_Long_04_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_1H_Sword_Long_05_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_1H_Sword_Broad_04_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_1H_Sword_Bastard_03_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Kilgorin_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_1H_Eminem_Eisenklinge_01_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_1H_Eminem_AchillesSchwert_01_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Gladius_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Kurzschwert_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Klingendolch_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Klauenschwert_Geschaerft))
	{
		return TRUE;
	};
	return FALSE; 
};

func int C_ScHasZweihand()
{
	if (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_01 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_02 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_03 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_04 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_05 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_06 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_07 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_08 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_09 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_10 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_11 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_12 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_13 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_14 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_15 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_16 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_17 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_18 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_19 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_20 )) 
	|| (Npc_HasItems (hero, ItMW_Addon_Stab01))
	|| (Npc_HasItems (hero, ItMW_Addon_Stab02))
	|| (Npc_HasItems (hero, ItMW_Addon_Stab03))
	|| (Npc_HasItems (hero, ItMW_Addon_Stab04))
	|| (Npc_HasItems (hero, ItMW_Addon_Stab05))
	|| (Npc_HasItems (hero, ItMW_Addon_Hacker_2h_01))
	|| (Npc_HasItems (hero, ItMW_Addon_Hacker_2h_02))
	|| (Npc_HasItems (hero, ItMW_Addon_Keule_2h_01))
	|| (Npc_HasItems (hero, ItMw_RangerStaff_Addon))
	|| (Npc_HasItems (hero, ItMw_Addon_PIR2hAxe))
	|| (Npc_HasItems (hero, ItMw_Addon_PIR2hSword))
	|| (Npc_HasItems (hero, Thorus_Schwert))
	|| (Npc_HasItems (hero, Stab_des_Lichts))
	|| (Npc_HasItems (hero, Roter_Wind))
	|| (Npc_HasItems (hero, Torlofs_Axt))
	|| (Npc_HasItems (hero, Gorns_Rache))
	|| (Npc_HasItems (hero, Heerscherstab))
	|| (Npc_HasItems (hero, UluMulu))
	|| (Npc_HasItems (hero, Uriziel_2h))
	|| (Npc_HasItems (hero, ItMw_2h_Bau_Axe))
	|| (Npc_HasItems (hero, ItMw_2H_Axe_L_01))
	|| (Npc_HasItems (hero, ItMw_2H_Sword_M_01))
	|| (Npc_HasItems (hero, ItMw_2h_Sld_Axe))
	|| (Npc_HasItems (hero, ItMw_2h_Sld_Sword))
	|| (Npc_HasItems (hero, ItMw_2h_Pal_Sword))
	|| (Npc_HasItems (hero, ItMw_2H_OrcAxe_01))
	|| (Npc_HasItems (hero, ItMw_2H_OrcAxe_02))
	|| (Npc_HasItems (hero, ItMw_2H_OrcAxe_03))
	|| (Npc_HasItems (hero, ItMw_2H_OrcAxe_04))
	|| (Npc_HasItems (hero, ItMw_2H_OrcSword_01))
	|| (Npc_HasItems (hero, ItMw_2H_OrcSword_02))
	|| (Npc_HasItems (hero, ItMw_Richtstab))
	|| (Npc_HasItems (hero, ItMw_Kriegshammer1))
	|| (Npc_HasItems (hero, ItMw_Hellebarde))
	|| (Npc_HasItems (hero, ItMw_Schiffsaxt))
	|| (Npc_HasItems (hero, ItMw_Stabkeule))
	|| (Npc_HasItems (hero, ItMw_Zweihaender1))
	|| (Npc_HasItems (hero, ItMw_Doppelaxt))
	|| (Npc_HasItems (hero, ItMw_Bartaxt))
	|| (Npc_HasItems (hero, ItMw_2H_Special_01))
	|| (Npc_HasItems (hero, ItMw_Zweihaender2))
	|| (Npc_HasItems (hero, ItMw_Streitaxt2))
	|| (Npc_HasItems (hero, ItMw_Zweihaender3))
	|| (Npc_HasItems (hero, ItMw_2H_Special_02))
	|| (Npc_HasItems (hero, ItMw_ElBastardo))
	|| (Npc_HasItems (hero, ItMw_Kriegshammer2))
	|| (Npc_HasItems (hero, ItMw_Folteraxt))
	|| (Npc_HasItems (hero, ItMw_Zweihaender4))
	|| (Npc_HasItems (hero, ItMw_Schlachtaxt))
	|| (Npc_HasItems (hero, ItMw_Krummschwert))
	|| (Npc_HasItems (hero, ItMw_Barbarenstreitaxt))
	|| (Npc_HasItems (hero, ItMw_2H_Special_03))
	|| (Npc_HasItems (hero, ItMw_Berserkeraxt))
	|| (Npc_HasItems (hero, ItMw_Drachenschneide))
	|| (Npc_HasItems (hero, ItMw_2H_Special_04))
	|| (Npc_HasItems (hero, ItMw_2H_Blessed_01))
	|| (Npc_HasItems (hero, ItMw_2H_Blessed_02))
	|| (Npc_HasItems (hero, ItMw_2H_Blessed_03))
	|| (Npc_HasItems (hero, ItMw_2h_Rod))
	|| (Npc_HasItems (hero, ItMw_Drachenaxt))
	|| (Npc_HasItems (hero, ItMw_Schaedelbrecher))
	|| (Npc_HasItems (hero, ItMw_Adanos_Stab_Magieteil))
	|| (Npc_HasItems (hero, ItMw_Adanos_Stab_Kampfteil))
	|| (Npc_HasItems (hero, Xeres_Schwert))
	|| (Npc_HasItems (hero, ItMw2hOrcMace01))
	|| (Npc_HasItems (hero, ItMw_2H_Axe_Old_02))
	|| (Npc_HasItems (hero, ItMw_2H_Sword_Light_02))
	|| (Npc_HasItems (hero, ItMw_Feuerschwert))
	|| (Npc_HasItems (hero, ITMW_ICESWORD))
	|| (Npc_HasItems (hero, ItMW_Sense_01))
	|| (Npc_HasItems (hero, ItMW_Sense_02))
	|| (Npc_HasItems (hero, ItMW_Sense_03))
	|| (Npc_HasItems (hero, ItMw_2H_Eminem_Goldschwert_01))
	|| (Npc_HasItems (hero, ItMw_Schmetteraxt))
	|| (Npc_HasItems (hero, ItMw_Truemmeraxt))
	|| (Npc_HasItems (hero, ItMw_1H_Eminem_Eisenklinge_02))
	|| (Npc_HasItems (hero, Goetterschwert))
	|| (Npc_HasItems (hero, ItMW_Addon_Hacker_2h_01_Geschaerft))
	|| (Npc_HasItems (hero, ItMW_Addon_Hacker_2h_02_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Addon_PIR2hAxe_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Addon_PIR2hSword_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_2h_Bau_Axe_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_2H_Sword_M_01_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_2h_Sld_Axe_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_2h_Sld_Sword_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_2h_Pal_Sword_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_2H_OrcAxe_01_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_2H_OrcAxe_02_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_2H_OrcAxe_03_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_2H_OrcAxe_04_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_2H_OrcSword_01_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_2H_OrcSword_02_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Richtstab_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Hellebarde_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Schiffsaxt_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Zweihaender1_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Doppelaxt_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Bartaxt_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Zweihaender2_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Streitaxt2_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Zweihaender3_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_ElBastardo_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Folteraxt_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Zweihaender4_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Schlachtaxt_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Krummschwert_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Barbarenstreitaxt_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Berserkeraxt_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Drachenschneide_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Drachenaxt_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Schaedelbrecher_Geschaerft))
	|| (Npc_HasItems (hero, Xeres_Schwert_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_2H_Axe_Old_02_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_2H_Sword_Light_02_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Feuerschwert_Geschaerft))
	|| (Npc_HasItems (hero, ITMW_ICESWORD_Geschaerft))
	|| (Npc_HasItems (hero, ItMW_Sense_01_Geschaerft))
	|| (Npc_HasItems (hero, ItMW_Sense_02_Geschaerft))
	|| (Npc_HasItems (hero, ItMW_Sense_03_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_2H_Eminem_Goldschwert_01_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Schmetteraxt_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_Truemmeraxt_Geschaerft))
	|| (Npc_HasItems (hero, ItMw_1H_Eminem_Eisenklinge_02_Geschaerft))
	{
		return TRUE;
	};
	return FALSE; 
};	

func int C_ScHasBeliarsWeapon ()
{	
	if (Npc_HasItems (hero, ItMw_BeliarWeapon_Raven )) //Joly: Ravens Waffe
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_01 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_02 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_03 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_04 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_05 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_06 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_07 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_08 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_09 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_10 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_11 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_12 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_13 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_14 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_15 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_16 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_17 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_18 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_19 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_1H_20 )) 

	//------------------------------------------------

	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_01 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_02 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_03 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_04 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_05 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_06 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_07 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_08 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_09 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_10 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_11 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_12 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_13 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_14 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_15 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_16 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_17 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_18 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_19 )) 
	|| (Npc_HasItems (hero, ItMw_BeliarWeapon_2H_20 )) 

	//------------------------------------------------
	|| (C_ScHasBeliarsRune())
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};	

func int C_ScHasGeisterschwert ()
{	
	if (Npc_HasItems (hero, ItMw_Geisterschwert))
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};

func int C_IsItemUluMulu(var C_ITEM Weap)
{	
	if (Hlp_IsItem(Weap, UluMulu) == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_IsItemDreiGoetterStab(var C_ITEM Weap)
{	
	if (Hlp_IsItem(Weap, DreiGoetterStab) == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_IsItemDeliriumWaffe(var C_ITEM Weap)
{	
	if (Hlp_IsItem(Weap, ItMw_1h_Vlk_Dagger) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Klingendolch) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Klingendolch_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Vlk_Dagger_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Avaquar) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Avaquar_Geschaerft) == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_IsItemFeuerstab(var C_ITEM Weap)
{	
	if (Hlp_IsItem(Weap, ItRwUdOrcstaff) == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_IsItemAdanosStab(var C_ITEM Weap)
{	
	if (Hlp_IsItem(Weap, ItMw_Adanos_Stab_Magieteil) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Adanos_Stab_Kampfteil) == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_IsItemHolyHammer(var C_ITEM Weap)
{	
	if (Hlp_IsItem(Weap, Holy_Hammer_MIS) == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};
// *********************
// C_IsItemBeliarsWeapon
// *********************
func int C_IsItemMagie(var C_ITEM Weap)
{
	if (Hlp_IsItem(Weap, ItRu_Thunderstorm) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Whirlwind) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Geyser) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Waterfist) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Icelance) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_BeliarsRage) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_SuckEnergy) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_GreenTentacle) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Swarm) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Skull) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_SummonZombie) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_SummonGuardian) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Geyser) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Icelance) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Waterfist) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Thunderstorm) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Whirlwind) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_PalLight) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_PalLightHeal) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_PalMediumHeal) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_PalFullHeal) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_PalHolyBolt) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_PalRepelEvil) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_PalDestroyEvil) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_PalTeleportSecret) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_TeleportSeaport) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_TeleportMonastery) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_TeleportFarm) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_TeleportXardas) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_TeleportPassNW) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_TeleportPassOW) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_TeleportOC) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_TeleportOWDemonTower) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_TeleportTaverne) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Teleport_3) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Light) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_FireBolt) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Zap) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_LightHeal) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_SumGobSkel) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_InstantFireball) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Icebolt) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_SumWolf) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Windfist) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Sleep) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_MediumHeal) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_LightningFlash) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_ChargeFireball) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_SumSkel) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Fear) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_IceCube) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_ThunderBall) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_SumGol) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_HarmUndead) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Pyrokinesis) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Firestorm) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_IceWave) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_SumDemon) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_FullHeal) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Firerain) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_BreathOfDeath) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_MassDeath) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_MasterOfDisaster) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_ArmyOfDarkness) == TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Shrink) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_PalLight) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_PalLightHeal) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_PalHolyBolt) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_PalMediumHeal) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_PalRepelEvil) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_PalFullHeal) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_PalDestroyEvil) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Light) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Firebolt) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Icebolt) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_LightHeal) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_SumGobSkel) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_InstantFireball) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Zap) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_SumWolf) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Windfist) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Sleep) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Charm) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_MediumHeal) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_LightningFlash) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_ChargeFireball) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_SumSkel) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Fear) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_IceCube) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_ThunderBall) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_SumGol) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_HarmUndead) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Pyrokinesis) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Firestorm) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_IceWave) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_SumDemon) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_FullHeal) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Firerain) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_BreathOfDeath) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_MassDeath) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_ArmyOfDarkness) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Shrink) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_TrfMeatbug) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_TrfHarpie) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_TrfShadowbeast) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_TrfSnapper) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_TrfWarg) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_TrfBlackTroll) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_TrfGolem) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_TrfBloodfly) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_TrfBloodhound) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_TrfKeiler) == TRUE)
	|| (Hlp_IsItem(Weap, ItSc_TrfSheep) == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_IsItemFernkampfwaffe(var C_ITEM Weap)
{
	if (Hlp_IsItem(Weap, ItRw_Addon_MagicBow) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Addon_FireBow) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Addon_MagicCrossbow) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Mil_Crossbow) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Sld_Bow) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_L_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_L_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_L_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_L_04) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_M_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_M_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_M_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_M_04) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_H_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_H_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_H_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_H_04) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Crossbow_L_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Crossbow_L_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Crossbow_M_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Crossbow_M_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Crossbow_H_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Crossbow_H_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_L_03_MIS) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_DragomirsArmbrust_MIS) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_SengrathsArmbrust_MIS) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_War_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_War_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_War_04) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_War_05) == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_IsItemBogen(var C_ITEM Weap)
{
	if (Hlp_IsItem(Weap, ItRw_Addon_MagicBow) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Addon_FireBow) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Sld_Bow) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_L_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_L_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_L_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_L_04) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_M_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_M_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_M_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_M_04) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_H_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_H_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_H_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_H_04) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_L_03_MIS) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_War_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_War_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_War_04) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Bow_War_05) == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_IsItemArmbrust(var C_ITEM Weap)
{
	if (Hlp_IsItem(Weap, ItRw_Addon_MagicCrossbow) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Mil_Crossbow) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Crossbow_L_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Crossbow_L_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Crossbow_M_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Crossbow_M_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Crossbow_H_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_Crossbow_H_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_DragomirsArmbrust_MIS) == TRUE)
	|| (Hlp_IsItem(Weap, ItRw_SengrathsArmbrust_MIS) == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_IsItemNahkampfwaffe(var C_ITEM Weap)
{
	
	if (Hlp_IsItem(Weap, ItMw_BeliarWeapon_Raven ) == TRUE) //Joly: Ravens Waffe
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_01 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_02 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_03 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_04 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_05 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_06 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_07 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_08 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_09 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_10 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_11 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_12 ) == TRUE) 
	|| (Hlp_IsItem(Weap, Delirium_Dolch) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_13 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_14 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_15 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_16 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_17 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_18 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_19 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_20 ) == TRUE) 

	//------------------------------------------------

	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_01 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_02 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_03 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_04 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_05 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_06 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_07 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_08 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_09 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_10 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_11 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_12 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_13 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_14 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_15 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_16 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_17 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_18 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_19 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_20 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMW_Addon_Knife01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Stab01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Stab02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Stab03) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Stab04) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Stab05) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Hacker_1h_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Hacker_1h_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Hacker_2h_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Hacker_2h_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Keule_1h_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Keule_2h_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_FrancisDagger_Mis) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_RangerStaff_Addon) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Addon_PIR2hAxe) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Addon_PIR2hSword) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Addon_PIR1hAxe) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Addon_PIR1hSword) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Addon_BanditTrader) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Addon_Betty) == TRUE)
	|| (Hlp_IsItem(Weap, Scars_Schwert) == TRUE)
	|| (Hlp_IsItem(Weap, Lees_Axt) == TRUE)
	|| (Hlp_IsItem(Weap, Thorus_Schwert) == TRUE)
	|| (Hlp_IsItem(Weap, Artos_Schwert) == TRUE)
	|| (Hlp_IsItem(Weap, Rabenrecht) == TRUE)
	|| (Hlp_IsItem(Weap, Prankenhieb) == TRUE)
	|| (Hlp_IsItem(Weap, Whistlers_Schwert) == TRUE)
	|| (Hlp_IsItem(Weap, Stab_des_Lichts) == TRUE)
	|| (Hlp_IsItem(Weap, Kaloms_Schwert) == TRUE)
	|| (Hlp_IsItem(Weap, Streitschlichter) == TRUE)
	|| (Hlp_IsItem(Weap, Roter_Wind) == TRUE)
	|| (Hlp_IsItem(Weap, Namibs_Keule) == TRUE)
	|| (Hlp_IsItem(Weap, Oruns_Keule) == TRUE)
	|| (Hlp_IsItem(Weap, Fortunos_Keule)) == TRUE
	|| (Hlp_IsItem(Weap, Oriks_Axt) == TRUE)
	|| (Hlp_IsItem(Weap, Torlofs_Axt) == TRUE)
	|| (Hlp_IsItem(Weap, Cords_Spalter) == TRUE)
	|| (Hlp_IsItem(Weap, Gorns_Rache) == TRUE)
	|| (Hlp_IsItem(Weap, Lares_Axt) == TRUE)
	|| (Hlp_IsItem(Weap, Silas_Axt) == TRUE)
	|| (Hlp_IsItem(Weap, Heerscherstab) == TRUE)
	|| (Hlp_IsItem(Weap, UluMulu) == TRUE)
	|| (Hlp_IsItem(Weap, Uriziel_1H) == TRUE)
	|| (Hlp_IsItem(Weap, Uriziel_2H) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Vlk_Dagger) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Mace_L_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Bau_Axe) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Vlk_Mace) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Mace_L_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Bau_Mace) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Vlk_Axe) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Mace_L_04) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_ShortSword1) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Nagelknueppel) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Sword_L_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_ShortSword2) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Sense) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Vlk_Sword) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Nov_Mace) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2h_Bau_Axe) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Axe_L_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_MISC_Sword) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Misc_Axe) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Sword_M_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Mil_Sword) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Sld_Axe) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Sld_Sword) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2h_Sld_Axe) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2h_Sld_Sword) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Pal_Sword) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2h_Pal_Sword) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_OrcAxe_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_OrcAxe_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_OrcAxe_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_OrcAxe_04) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_OrcSword_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_OrcSword_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_ShortSword3) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Nagelkeule) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_ShortSword4) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Kriegskeule) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Richtstab) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_ShortSword5) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Kriegshammer1) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Hellebarde) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Nagelkeule2) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schiffsaxt) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Piratensaebel) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schwert) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Common_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Stabkeule) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Zweihaender1) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Steinbrecher) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Spicker) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Streitaxt1) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schwert1) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schwert2) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Doppelaxt) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Avaquar) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Avaquar_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Bartaxt) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Morgenstern) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schwert3) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schwert4) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Special_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Special_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Rapier) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Rubinklinge) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Streitkolben) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Zweihaender2) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Runenschwert) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Rabenschnabel) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schwert5) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Inquisitor) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Streitaxt2) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Zweihaender3) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Special_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Special_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_ElBastardo) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Kriegshammer2) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Meisterdegen) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Folteraxt) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Orkschlaechter) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Zweihaender4) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schlachtaxt) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Krummschwert) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Barbarenstreitaxt) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Sturmbringer) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Special_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Special_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Berserkeraxt) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Drachenschneide) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Special_04) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Special_04) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Blessed_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Blessed_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Blessed_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Blessed_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Blessed_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Blessed_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2h_Rod) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_AlriksSword_Mis) == TRUE)
	|| (Hlp_IsItem(Weap, Holy_Hammer_MIS) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_MalethsGehstock_MIS) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_1H_FerrosSword_Mis) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Adanos_Stab_Magieteil) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Adanos_Stab_Kampfteil) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schaedelbrecher) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schuetterschwert) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schwert_02) == TRUE)
	|| (Hlp_IsItem(Weap, Xeres_Schwert) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Drachenaxt) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW2hOrcMace01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Mace_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Sword_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Sword_Long_04) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Sword_Long_05) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Sword_Broad_04) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Sword_Bastard_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Klauenschwert) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Klingendolch) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Kurzschwert) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Gladius) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Eminem_AchillesSchwert_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Eminem_Eisenklinge_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Kilgorin) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Feuerschwert) == TRUE)
	|| (Hlp_IsItem(Weap, ITMW_ICESWORD) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Sense_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Sense_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Sense_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Eminem_Goldschwert_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schmetteraxt) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Truemmeraxt) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Eminem_Eisenklinge_02) == TRUE)
	|| (Hlp_IsItem(Weap, Goetterschwert) == TRUE)
	{
		return TRUE;
	};

	return FALSE;
};

func int C_IsItemEinhand(var C_ITEM Weap)
{
	
	if (Hlp_IsItem(Weap, ItMw_BeliarWeapon_Raven ) == TRUE) //Joly: Ravens Waffe
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_01 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_02 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_03 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_04 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_05 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_06 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_07 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_08 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_09 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_10 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_11 ) == TRUE) 
	|| (Hlp_IsItem(Weap, Delirium_Dolch) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_12 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_13 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_14 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_15 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_16 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_17 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_18 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_19 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_20 ) == TRUE) 

	//------------------------------------------------

	|| (Hlp_IsItem(Weap, ItMW_Addon_Knife01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Hacker_1h_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Hacker_1h_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Keule_1h_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_FrancisDagger_Mis) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Addon_PIR1hAxe) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Addon_PIR1hSword) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Addon_BanditTrader) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Addon_Betty) == TRUE)
	|| (Hlp_IsItem(Weap, Scars_Schwert) == TRUE)
	|| (Hlp_IsItem(Weap, Lees_Axt) == TRUE)
	|| (Hlp_IsItem(Weap, Artos_Schwert) == TRUE)
	|| (Hlp_IsItem(Weap, Rabenrecht) == TRUE)
	|| (Hlp_IsItem(Weap, Prankenhieb) == TRUE)
	|| (Hlp_IsItem(Weap, Whistlers_Schwert) == TRUE)
	|| (Hlp_IsItem(Weap, Kaloms_Schwert) == TRUE)
	|| (Hlp_IsItem(Weap, Streitschlichter) == TRUE)
	|| (Hlp_IsItem(Weap, Namibs_Keule) == TRUE)
	|| (Hlp_IsItem(Weap, Oruns_Keule) == TRUE)
	|| (Hlp_IsItem(Weap, Fortunos_Keule)) == TRUE
	|| (Hlp_IsItem(Weap, Oriks_Axt) == TRUE)
	|| (Hlp_IsItem(Weap, Cords_Spalter) == TRUE)
	|| (Hlp_IsItem(Weap, Lares_Axt) == TRUE)
	|| (Hlp_IsItem(Weap, Silas_Axt) == TRUE)
	|| (Hlp_IsItem(Weap, Uriziel_1H) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Vlk_Dagger) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Mace_L_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Bau_Axe) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Vlk_Mace) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Mace_L_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Bau_Mace) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Vlk_Axe) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Mace_L_04) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_ShortSword1) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Nagelknueppel) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Sword_L_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_ShortSword2) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Sense) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Vlk_Sword) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Nov_Mace) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_MISC_Sword) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Misc_Axe) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Mil_Sword) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Sld_Axe) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Sld_Sword) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Pal_Sword) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_ShortSword3) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Nagelkeule) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_ShortSword4) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Kriegskeule) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_ShortSword5) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Nagelkeule2) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Piratensaebel) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schwert) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Common_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Steinbrecher) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Spicker) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Streitaxt1) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schwert1) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schwert2) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Morgenstern) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schwert3) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schwert4) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Special_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Rapier) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Rubinklinge) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Streitkolben) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Zweihaender2) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Runenschwert) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Rabenschnabel) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schwert5) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Inquisitor) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Special_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Meisterdegen) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Orkschlaechter) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Special_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Special_04) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Blessed_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Blessed_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Blessed_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_AlriksSword_Mis) == TRUE)
	|| (Hlp_IsItem(Weap, Holy_Hammer_MIS) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_MalethsGehstock_MIS) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_1H_FerrosSword_Mis) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schwert_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Schuetterschwert) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Mace_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Sword_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Sword_Long_04) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Sword_Long_05) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Sword_Broad_04) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Sword_Bastard_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Klauenschwert) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Klingendolch) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Kurzschwert) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Gladius) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Eminem_AchillesSchwert_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Eminem_Eisenklinge_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Kilgorin) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Avaquar) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Avaquar_Geschaerft) == TRUE)

	//------------------------------------------------

	|| (Hlp_IsItem(Weap, ItMW_Addon_Knife01_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Hacker_1h_01_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Hacker_1h_02_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_FrancisDagger_Mis_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Addon_PIR1hAxe_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Addon_PIR1hSword_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Addon_BanditTrader_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Addon_Betty_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Vlk_Dagger_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Mace_L_01_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Bau_Axe_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Vlk_Axe_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_ShortSword1_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Sword_L_03_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_ShortSword2_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Sense_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Vlk_Sword_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_MISC_Sword_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Misc_Axe_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Mil_Sword_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Sld_Axe_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Sld_Sword_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Pal_Sword_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_ShortSword3_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_ShortSword4_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_ShortSword5_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Piratensaebel_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schwert_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Streitaxt1_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schwert1_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schwert2_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schwert3_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schwert4_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Rapier_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Rubinklinge_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Zweihaender2_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Runenschwert_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schwert5_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Meisterdegen_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Orkschlaechter_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schwert_02_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Schuetterschwert_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Sword_03_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Sword_Long_04_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Sword_Long_05_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Sword_Broad_04_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Sword_Bastard_03_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Klauenschwert_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Klingendolch_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Kurzschwert_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Gladius_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Eminem_AchillesSchwert_01_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Eminem_Eisenklinge_01_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Kilgorin_Geschaerft) == TRUE)
	{
		return TRUE;
	};

	return FALSE;
};

func int C_IsItemZweihand(var C_ITEM Weap)
{
	
	if (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_01 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_02 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_03 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_04 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_05 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_06 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_07 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_08 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_09 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_10 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_11 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_12 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_13 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_14 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_15 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_16 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_17 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_18 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_19 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_20 ) == TRUE) 
	|| (Hlp_IsItem(Weap, ItMW_Addon_Stab01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Stab02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Stab03) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Stab04) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Stab05) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Hacker_2h_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Hacker_2h_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Keule_2h_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_RangerStaff_Addon) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Addon_PIR2hAxe) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Addon_PIR2hSword) == TRUE)
	|| (Hlp_IsItem(Weap, Thorus_Schwert) == TRUE)
	|| (Hlp_IsItem(Weap, Stab_des_Lichts) == TRUE)
	|| (Hlp_IsItem(Weap, Roter_Wind) == TRUE)
	|| (Hlp_IsItem(Weap, Torlofs_Axt) == TRUE)
	|| (Hlp_IsItem(Weap, Gorns_Rache) == TRUE)
	|| (Hlp_IsItem(Weap, Heerscherstab) == TRUE)
	|| (Hlp_IsItem(Weap, UluMulu) == TRUE)
	|| (Hlp_IsItem(Weap, Uriziel_2H) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2h_Bau_Axe) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Axe_L_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Sword_M_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2h_Sld_Axe) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2h_Sld_Sword) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2h_Pal_Sword) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_OrcAxe_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_OrcAxe_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_OrcAxe_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_OrcAxe_04) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_OrcSword_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_OrcSword_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Richtstab) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Hellebarde) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schiffsaxt) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Stabkeule) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Zweihaender1) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Streitaxt1) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Doppelaxt) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Bartaxt) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Special_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Zweihaender2) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Streitaxt2) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Zweihaender3) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Special_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_ElBastardo) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Kriegshammer2) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Zweihaender4) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schlachtaxt) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Krummschwert) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Barbarenstreitaxt) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Sturmbringer) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Special_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Berserkeraxt) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Drachenschneide) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Special_04) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Blessed_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Blessed_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Blessed_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2h_Rod) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Adanos_Stab_Magieteil) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Adanos_Stab_Kampfteil) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Drachenaxt) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schaedelbrecher) == TRUE)
	|| (Hlp_IsItem(Weap, Xeres_Schwert) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw2hOrcMace01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Axe_Old_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Sword_Light_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Feuerschwert) == TRUE)
	|| (Hlp_IsItem(Weap, ITMW_ICESWORD) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Sense_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Sense_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Sense_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Eminem_Goldschwert_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schmetteraxt) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Truemmeraxt) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Eminem_Eisenklinge_02) == TRUE)
	|| (Hlp_IsItem(Weap, Goetterschwert) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Hacker_2h_01_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Hacker_2h_02_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Addon_PIR2hAxe_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Addon_PIR2hSword_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2h_Bau_Axe_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Sword_M_01_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2h_Sld_Axe_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2h_Sld_Sword_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2h_Pal_Sword_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_OrcAxe_01_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_OrcAxe_02_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_OrcAxe_03_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_OrcAxe_04_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_OrcSword_01_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_OrcSword_02_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Richtstab_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Hellebarde_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schiffsaxt_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Zweihaender1_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Streitaxt1_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Doppelaxt_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Bartaxt_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Zweihaender2_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Streitaxt2_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Zweihaender3_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_ElBastardo_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Zweihaender4_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schlachtaxt_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Krummschwert_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Barbarenstreitaxt_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Sturmbringer_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Berserkeraxt_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Drachenschneide_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Drachenaxt_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schaedelbrecher_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, Xeres_Schwert_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Axe_Old_02_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Sword_Light_02_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Feuerschwert_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ITMW_ICESWORD_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Sense_01_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Sense_02_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Sense_03_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_2H_Eminem_Goldschwert_01_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Schmetteraxt_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Truemmeraxt_Geschaerft) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Eminem_Eisenklinge_02_Geschaerft) == TRUE)
	{
		return TRUE;
	};

	return FALSE;
};

func int C_IsItemBeliarsWeapon(var C_ITEM Weap)
{	
	if (Hlp_IsItem(Weap, ItMw_BeliarWeapon_Raven) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_04) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_05) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_06) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_07) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_08) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_09) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_10) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_11) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_12) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_13) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_14) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_15) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_16) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_17) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_18) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_19) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_1H_20) == TRUE)

	//------------------------------------------------------

	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_01) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_02) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_03) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_04) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_05) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_06) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_07) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_08) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_09) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_10) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_11) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_12) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_13) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_14) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_15) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_16) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_17) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_18) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_19) == TRUE)
	|| (Hlp_IsItem(Weap, ItMw_BeliarWeapon_2H_20) == TRUE)


	//------------------------------------------------------

	|| (Hlp_IsItem(Weap, ItRu_BeliarsRage) 	== TRUE)
	|| (Hlp_IsItem(Weap, ItRu_SuckEnergy) 		== TRUE)
	|| (Hlp_IsItem(Weap, ItRu_GreenTentacle) 	== TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Swarm) 			== TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Skull) 			== TRUE)
	|| (Hlp_IsItem(Weap, ItRu_SummonZombie) 	== TRUE)
	|| (Hlp_IsItem(Weap, ItRu_SummonGuardian) 	== TRUE)
	{
		return TRUE;
	};

	return FALSE; //DEFAULT
};	

func int C_IsItemGeisterschwert(var C_ITEM Weap)
{	
	if (Hlp_IsItem(Weap, ItMw_Geisterschwert) == TRUE)
	{
		return TRUE;
	};

	return FALSE; //DEFAULT
};

// ***************************
// C_ScHasReadiedBeliarsWeapon
// ***************************
func int C_ScHasReadiedBeliarsWeapon ()
{	
	var C_ITEM ReadyWeap; ReadyWeap = Npc_GetReadiedWeapon(hero);
	
	if (C_IsItemBeliarsWeapon(ReadyWeap))
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};

func int C_ScHasReadiedGeisterschwert ()
{	
	var C_ITEM ReadyWeap; ReadyWeap = Npc_GetReadiedWeapon(hero);
	
	if (C_IsItemGeisterschwert(ReadyWeap))
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};

func int C_ScHasReadiedMagie()
{
	var C_ITEM ReadyWeap; ReadyWeap = Npc_GetReadiedWeapon(hero);

	if (C_IsItemMagie(ReadyWeap))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasReadiedFernkampfwaffe()
{
	var C_ITEM ReadyWeap; ReadyWeap = Npc_GetReadiedWeapon(hero);

	if (C_IsItemFernkampfwaffe(ReadyWeap))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasReadiedBogen()
{
	var C_ITEM ReadyWeap; ReadyWeap = Npc_GetReadiedWeapon(hero);

	if (C_IsItemBogen(ReadyWeap))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasReadiedArmbrust()
{
	var C_ITEM ReadyWeap; ReadyWeap = Npc_GetReadiedWeapon(hero);

	if (C_IsItemArmbrust(ReadyWeap))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasReadiedEinhand()
{
	var C_ITEM ReadyWeap; ReadyWeap = Npc_GetReadiedWeapon(hero);

	if (C_IsItemEinhand(ReadyWeap))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasReadiedZweihand()
{
	var C_ITEM ReadyWeap; ReadyWeap = Npc_GetReadiedWeapon(hero);

	if (C_IsItemZweihand(ReadyWeap))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasReadiedNahkampfwaffe()
{
	var C_ITEM ReadyWeap; ReadyWeap = Npc_GetReadiedWeapon(hero);

	if (C_IsItemNahkampfwaffe(ReadyWeap))
	{
		return TRUE;
	};

	return FALSE;
};

func int C_ScHasReadiedUluMulu ()
{	
	var C_ITEM ReadyWeap; ReadyWeap = Npc_GetReadiedWeapon(hero);
	
	if (C_IsItemUluMulu(ReadyWeap))
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};

func int C_ScHasReadiedDreiGoetterStab ()
{	
	var C_ITEM ReadyWeap; ReadyWeap = Npc_GetReadiedWeapon(hero);
	
	if (C_IsItemDreiGoetterStab(ReadyWeap))
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};

func int C_ScHasReadiedDeliriumWaffe ()
{	
	var C_ITEM ReadyWeap; ReadyWeap = Npc_GetReadiedWeapon(hero);
	
	if (C_IsItemDeliriumWaffe(ReadyWeap))
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};

func int C_ScHasReadiedFeuerstab ()
{	
	var C_ITEM ReadyWeap; ReadyWeap = Npc_GetReadiedWeapon(hero);
	
	if (C_IsItemFeuerstab(ReadyWeap))
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};

func int C_ScHasReadiedAdanosStab ()
{	
	var C_ITEM ReadyWeap; ReadyWeap = Npc_GetReadiedWeapon(hero);
	
	if (C_IsItemAdanosStab(ReadyWeap))
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};

func int C_ScHasReadiedHolyHammer ()
{	
	var C_ITEM ReadyWeap; ReadyWeap = Npc_GetReadiedWeapon(hero);
	
	if (C_IsItemHolyHammer(ReadyWeap))
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};
// ****************************
// C_ScHasEquippedBeliarsWeapon
// ****************************
func int C_ScHasEquippedBeliarsWeapon () //NUR Nahkampf!
{	
	var C_ITEM EquipWeap; EquipWeap = Npc_GetEquippedMeleeWeapon(hero);
	
	if (C_IsItemBeliarsWeapon(EquipWeap))
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};

func int C_ScHasEquippedNahkampfwaffe () //NUR Nahkampf!
{	
	var C_ITEM EquipWeap; EquipWeap = Npc_GetEquippedMeleeWeapon(hero);
	
	if (C_IsItemNahkampfwaffe(EquipWeap))
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};

func int C_ScHasEquippedUluMulu () //NUR Nahkampf!
{	
	var C_ITEM EquipWeap; EquipWeap = Npc_GetEquippedMeleeWeapon(hero);
	
	if (C_IsItemUluMulu(EquipWeap))
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};

func int C_ScHasEquippedDreiGoetterStab () //NUR Nahkampf!
{	
	var C_ITEM EquipWeap; EquipWeap = Npc_GetEquippedMeleeWeapon(hero);
	
	if (C_IsItemDreiGoetterStab(EquipWeap))
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};

func int C_ScHasEquippedAdanosStab () //NUR Nahkampf!
{	
	var C_ITEM EquipWeap; EquipWeap = Npc_GetEquippedMeleeWeapon(hero);
	
	if (C_IsItemAdanosStab(EquipWeap))
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};

func int C_ScHasEquippedHolyHammer () //NUR Nahkampf!
{	
	var C_ITEM EquipWeap; EquipWeap = Npc_GetEquippedMeleeWeapon(hero);
	
	if (C_IsItemHolyHammer(EquipWeap))
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};
// ********************
// B_ClearBeliarsWeapon
// ********************
func void B_ClearBeliarsWeapon ()
{	
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_Raven 		, Npc_HasItems (hero, ItMw_BeliarWeapon_Raven ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_1H_01 		, Npc_HasItems (hero, ItMw_BeliarWeapon_1H_01 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_1H_02 		, Npc_HasItems (hero, ItMw_BeliarWeapon_1H_02 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_1H_03 		, Npc_HasItems (hero, ItMw_BeliarWeapon_1H_03 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_1H_04 		, Npc_HasItems (hero, ItMw_BeliarWeapon_1H_04 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_1H_05 		, Npc_HasItems (hero, ItMw_BeliarWeapon_1H_05 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_1H_06 		, Npc_HasItems (hero, ItMw_BeliarWeapon_1H_06 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_1H_07 		, Npc_HasItems (hero, ItMw_BeliarWeapon_1H_07 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_1H_08 		, Npc_HasItems (hero, ItMw_BeliarWeapon_1H_08 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_1H_09 		, Npc_HasItems (hero, ItMw_BeliarWeapon_1H_09 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_1H_10 		, Npc_HasItems (hero, ItMw_BeliarWeapon_1H_10 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_1H_11 		, Npc_HasItems (hero, ItMw_BeliarWeapon_1H_11 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_1H_12 		, Npc_HasItems (hero, ItMw_BeliarWeapon_1H_12 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_1H_13 		, Npc_HasItems (hero, ItMw_BeliarWeapon_1H_13 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_1H_14 		, Npc_HasItems (hero, ItMw_BeliarWeapon_1H_14 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_1H_15 		, Npc_HasItems (hero, ItMw_BeliarWeapon_1H_15 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_1H_16 		, Npc_HasItems (hero, ItMw_BeliarWeapon_1H_16 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_1H_17 		, Npc_HasItems (hero, ItMw_BeliarWeapon_1H_17 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_1H_18 		, Npc_HasItems (hero, ItMw_BeliarWeapon_1H_18 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_1H_19 		, Npc_HasItems (hero, ItMw_BeliarWeapon_1H_19 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_1H_20 		, Npc_HasItems (hero, ItMw_BeliarWeapon_1H_20 ));

	//------------------------------------------------------

	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_2H_01 		, Npc_HasItems (hero, ItMw_BeliarWeapon_2H_01 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_2H_02 		, Npc_HasItems (hero, ItMw_BeliarWeapon_2H_02 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_2H_03 		, Npc_HasItems (hero, ItMw_BeliarWeapon_2H_03 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_2H_04 		, Npc_HasItems (hero, ItMw_BeliarWeapon_2H_04 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_2H_05 		, Npc_HasItems (hero, ItMw_BeliarWeapon_2H_05 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_2H_06 		, Npc_HasItems (hero, ItMw_BeliarWeapon_2H_06 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_2H_07 		, Npc_HasItems (hero, ItMw_BeliarWeapon_2H_07 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_2H_08 		, Npc_HasItems (hero, ItMw_BeliarWeapon_2H_08 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_2H_09 		, Npc_HasItems (hero, ItMw_BeliarWeapon_2H_09 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_2H_10 		, Npc_HasItems (hero, ItMw_BeliarWeapon_2H_10 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_2H_11 		, Npc_HasItems (hero, ItMw_BeliarWeapon_2H_11 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_2H_12 		, Npc_HasItems (hero, ItMw_BeliarWeapon_2H_12 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_2H_13 		, Npc_HasItems (hero, ItMw_BeliarWeapon_2H_13 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_2H_14 		, Npc_HasItems (hero, ItMw_BeliarWeapon_2H_14 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_2H_15 		, Npc_HasItems (hero, ItMw_BeliarWeapon_2H_15 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_2H_16 		, Npc_HasItems (hero, ItMw_BeliarWeapon_2H_16 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_2H_17 		, Npc_HasItems (hero, ItMw_BeliarWeapon_2H_17 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_2H_18 		, Npc_HasItems (hero, ItMw_BeliarWeapon_2H_18 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_2H_19 		, Npc_HasItems (hero, ItMw_BeliarWeapon_2H_19 ));
	Npc_RemoveInvItems	(hero ,ItMw_BeliarWeapon_2H_20 		, Npc_HasItems (hero, ItMw_BeliarWeapon_2H_20 ));

	//------------------------------------------------------

	/*Npc_RemoveInvItems	(hero ,ItRu_BeliarsRage 	, Npc_HasItems (hero, ItRu_BeliarsRage ));
	Npc_RemoveInvItems	(hero ,ItRu_SuckEnergy 		, Npc_HasItems (hero, ItRu_SuckEnergy ));
	Npc_RemoveInvItems	(hero ,ItRu_GreenTentacle 	, Npc_HasItems (hero, ItRu_GreenTentacle ));
	Npc_RemoveInvItems	(hero ,ItRu_Swarm 			, Npc_HasItems (hero, ItRu_Swarm ));
	Npc_RemoveInvItems	(hero ,ItRu_Skull 			, Npc_HasItems (hero, ItRu_Skull ));
	Npc_RemoveInvItems	(hero ,ItRu_SummonZombie 	, Npc_HasItems (hero, ItRu_SummonZombie ));
	Npc_RemoveInvItems	(hero ,ItRu_SummonGuardian 	, Npc_HasItems (hero, ItRu_SummonGuardian ));*/
};	

var int BeliarWeapCurrentLvL;
var int BeliarWeapNextLvL;
var int BeliarNextDamageChance;
               
func int C_ScCanUpgrateBeliarsWeapon ()
{
	var int herolvl;
	herolvl = hero.level;
	
	if 		(herolvl > 46)	{	BeliarWeapNextLvL = 20;	BeliarNextDamageChance = BeliarDamageChance_20; }	
	else if (herolvl > 44)	{	BeliarWeapNextLvL = 19;	BeliarNextDamageChance = BeliarDamageChance_19; }
	else if (herolvl > 42)	{	BeliarWeapNextLvL = 18;	BeliarNextDamageChance = BeliarDamageChance_18; }
	else if (herolvl > 40)	{	BeliarWeapNextLvL = 17;	BeliarNextDamageChance = BeliarDamageChance_17; }
	else if (herolvl > 38)	{	BeliarWeapNextLvL = 16;	BeliarNextDamageChance = BeliarDamageChance_16; }
	else if (herolvl > 36)	{	BeliarWeapNextLvL = 15;	BeliarNextDamageChance = BeliarDamageChance_15; }
	else if (herolvl > 34)	{	BeliarWeapNextLvL = 14;	BeliarNextDamageChance = BeliarDamageChance_14; }
	else if (herolvl > 32)	{	BeliarWeapNextLvL = 13;	BeliarNextDamageChance = BeliarDamageChance_13; }
	else if (herolvl > 30)	{	BeliarWeapNextLvL = 12;	BeliarNextDamageChance = BeliarDamageChance_12; }
	else if (herolvl > 28)	{	BeliarWeapNextLvL = 11;	BeliarNextDamageChance = BeliarDamageChance_11; }
	else if (herolvl > 26)	{	BeliarWeapNextLvL = 10;	BeliarNextDamageChance = BeliarDamageChance_10; }
	else if (herolvl > 24)	{	BeliarWeapNextLvL = 9;	BeliarNextDamageChance = BeliarDamageChance_09; }
	else if (herolvl > 22)	{	BeliarWeapNextLvL = 8;	BeliarNextDamageChance = BeliarDamageChance_08; }
	else if (herolvl > 20)	{	BeliarWeapNextLvL = 7;	BeliarNextDamageChance = BeliarDamageChance_07; }
	else if (herolvl > 18)	{	BeliarWeapNextLvL = 6;	BeliarNextDamageChance = BeliarDamageChance_06; }
	else if (herolvl > 16)	{	BeliarWeapNextLvL = 5;	BeliarNextDamageChance = BeliarDamageChance_05; }
	else if (herolvl > 14)	{	BeliarWeapNextLvL = 4;	BeliarNextDamageChance = BeliarDamageChance_04; }
	else if (herolvl > 12)	{	BeliarWeapNextLvL = 3;	BeliarNextDamageChance = BeliarDamageChance_03; }
	else if (herolvl > 10)	{	BeliarWeapNextLvL = 2;	BeliarNextDamageChance = BeliarDamageChance_02; }
	else if (herolvl <= 10) {	BeliarWeapNextLvL = 1;	BeliarNextDamageChance = BeliarDamageChance_01; };
		
	if (BeliarWeapCurrentLvL < BeliarWeapNextLvL)
	{
		//BeliarsWeaponSpecialDamage = (herolvl * 2);
		return TRUE;
	};
};
func void B_UpgrateBeliarsWeapon ()//Joly: vorher C_ScCanUpgrateBeliarsWeapon ausführen!!!!!!
{
	////////////////////////////////////////////////////////////////////////////////////////////
	//// LebensenergieAbzug beim Upgraden
	////////////////////////////////////////////////////////////////////////////////////////////
		var int BeliarsTribute;
		var string concatText;
		
		BeliarsTribute = ((BeliarWeapNextLvL - BeliarWeapCurrentLvL)*5);
		
		hero.attribute[ATR_HITPOINTS_MAX] = (hero.attribute[ATR_HITPOINTS_MAX] - BeliarsTribute);
	
		if (BeliarsTribute > 0)
		{
			concatText = ConcatStrings(PRINT_Beliarshitpoints_MAX, IntToString(BeliarsTribute));
			PrintScreen	(concatText, -1, -1, FONT_Screen, 4);
		};
	////////////////////////////////////////////////////////////////////////////////////////////

	BeliarDamageChance = BeliarNextDamageChance;
	BeliarWeapCurrentLvL = BeliarWeapNextLvL;

	if((hero.HitChance[NPC_TALENT_1H]) > (hero.HitChance[NPC_TALENT_2H]))
	{
		if 	 	(BeliarWeapCurrentLvL <= 1){CreateInvItem	(hero, ItMw_BeliarWeapon_1H_01);}
		else if (BeliarWeapCurrentLvL == 2){CreateInvItem	(hero, ItMw_BeliarWeapon_1H_02);}
		else if (BeliarWeapCurrentLvL == 3){CreateInvItem	(hero, ItMw_BeliarWeapon_1H_03);}
		else if (BeliarWeapCurrentLvL == 4){CreateInvItem	(hero, ItMw_BeliarWeapon_1H_04);}
		else if (BeliarWeapCurrentLvL == 5){CreateInvItem	(hero, ItMw_BeliarWeapon_1H_05);}
		else if (BeliarWeapCurrentLvL == 6){CreateInvItem	(hero, ItMw_BeliarWeapon_1H_06);}
		else if (BeliarWeapCurrentLvL == 7){CreateInvItem	(hero, ItMw_BeliarWeapon_1H_07);}
		else if (BeliarWeapCurrentLvL == 8){CreateInvItem	(hero, ItMw_BeliarWeapon_1H_08);}
		else if (BeliarWeapCurrentLvL == 9){CreateInvItem	(hero, ItMw_BeliarWeapon_1H_09);}
		else if (BeliarWeapCurrentLvL == 10){CreateInvItem	(hero, ItMw_BeliarWeapon_1H_10);}
		else if (BeliarWeapCurrentLvL == 11){CreateInvItem	(hero, ItMw_BeliarWeapon_1H_11);}
		else if (BeliarWeapCurrentLvL == 12){CreateInvItem	(hero, ItMw_BeliarWeapon_1H_12);}
		else if (BeliarWeapCurrentLvL == 13){CreateInvItem	(hero, ItMw_BeliarWeapon_1H_13);}
		else if (BeliarWeapCurrentLvL == 14){CreateInvItem	(hero, ItMw_BeliarWeapon_1H_14);}
		else if (BeliarWeapCurrentLvL == 15){CreateInvItem	(hero, ItMw_BeliarWeapon_1H_15);}
		else if (BeliarWeapCurrentLvL == 16){CreateInvItem	(hero, ItMw_BeliarWeapon_1H_16);}
		else if (BeliarWeapCurrentLvL == 17){CreateInvItem	(hero, ItMw_BeliarWeapon_1H_17);}
		else if (BeliarWeapCurrentLvL == 18){CreateInvItem	(hero, ItMw_BeliarWeapon_1H_18);}
		else if (BeliarWeapCurrentLvL == 19){CreateInvItem	(hero, ItMw_BeliarWeapon_1H_19);}
		else if (BeliarWeapCurrentLvL == 20){CreateInvItem	(hero, ItMw_BeliarWeapon_1H_20);};
			
		Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",  self, self, 0, 0, 0, FALSE );      
		Snd_Play ("CS_Prayer_WaveOfInsanity");
		BeliarsWeaponUpgrated = TRUE;
	}
	else //SC is 2H Fighter
	{
		if 	 	(BeliarWeapCurrentLvL <= 1){CreateInvItem	(hero, ItMw_BeliarWeapon_2H_01);}
		else if (BeliarWeapCurrentLvL == 2){CreateInvItem	(hero, ItMw_BeliarWeapon_2H_02);}
		else if (BeliarWeapCurrentLvL == 3){CreateInvItem	(hero, ItMw_BeliarWeapon_2H_03);}
		else if (BeliarWeapCurrentLvL == 4){CreateInvItem	(hero, ItMw_BeliarWeapon_2H_04);}
		else if (BeliarWeapCurrentLvL == 5){CreateInvItem	(hero, ItMw_BeliarWeapon_2H_05);}
		else if (BeliarWeapCurrentLvL == 6){CreateInvItem	(hero, ItMw_BeliarWeapon_2H_06);}
		else if (BeliarWeapCurrentLvL == 7){CreateInvItem	(hero, ItMw_BeliarWeapon_2H_07);}
		else if (BeliarWeapCurrentLvL == 8){CreateInvItem	(hero, ItMw_BeliarWeapon_2H_08);}
		else if (BeliarWeapCurrentLvL == 9){CreateInvItem	(hero, ItMw_BeliarWeapon_2H_09);}
		else if (BeliarWeapCurrentLvL == 10){CreateInvItem	(hero, ItMw_BeliarWeapon_2H_10);}
		else if (BeliarWeapCurrentLvL == 11){CreateInvItem	(hero, ItMw_BeliarWeapon_2H_11);}
		else if (BeliarWeapCurrentLvL == 12){CreateInvItem	(hero, ItMw_BeliarWeapon_2H_12);}
		else if (BeliarWeapCurrentLvL == 13){CreateInvItem	(hero, ItMw_BeliarWeapon_2H_13);}
		else if (BeliarWeapCurrentLvL == 14){CreateInvItem	(hero, ItMw_BeliarWeapon_2H_14);}
		else if (BeliarWeapCurrentLvL == 15){CreateInvItem	(hero, ItMw_BeliarWeapon_2H_15);}
		else if (BeliarWeapCurrentLvL == 16){CreateInvItem	(hero, ItMw_BeliarWeapon_2H_16);}
		else if (BeliarWeapCurrentLvL == 17){CreateInvItem	(hero, ItMw_BeliarWeapon_2H_17);}
		else if (BeliarWeapCurrentLvL == 18){CreateInvItem	(hero, ItMw_BeliarWeapon_2H_18);}
		else if (BeliarWeapCurrentLvL == 19){CreateInvItem	(hero, ItMw_BeliarWeapon_2H_19);}
		else if (BeliarWeapCurrentLvL == 20){CreateInvItem	(hero, ItMw_BeliarWeapon_2H_20);};
	
		Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",  self, self, 0, 0, 0, FALSE );      
		Snd_Play ("CS_Prayer_WaveOfInsanity");
		BeliarsWeaponUpgrated = TRUE;
	};
};

func int C_ScHasUriziel ()
{	
	if (Npc_HasItems (hero, Uriziel_1H ))
	|| (Npc_HasItems(hero, Uriziel_2H))
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};	

// *********************
// C_IsItemBeliarsWeapon
// *********************
func int C_IsItemUriziel(var C_ITEM Weap)
{	
	if (Hlp_IsItem(Weap, Uriziel_1H) == TRUE)
	|| (Hlp_IsItem(Weap, Uriziel_2H) == TRUE)
	{
		return TRUE;
	};

	return FALSE; //DEFAULT
};	

// ***************************
// C_ScHasReadiedBeliarsWeapon
// ***************************
func int C_ScHasReadiedUriziel ()
{	
	var C_ITEM ReadyWeap; ReadyWeap = Npc_GetReadiedWeapon(hero);
	
	if (C_IsItemUriziel(ReadyWeap))
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};

// ****************************
// C_ScHasEquippedBeliarsWeapon
// ****************************
func int C_ScHasEquippedUriziel () //NUR Nahkampf!
{	
	var C_ITEM EquipWeap; EquipWeap = Npc_GetEquippedMeleeWeapon(hero);
	
	if (C_IsItemUriziel(EquipWeap))
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};

func int C_ScHasEiszauber()
{
	if (Npc_HasItems (hero, ItRu_Icebolt))
	|| (Npc_HasItems (hero, ItRu_IceCube))
	|| (Npc_HasItems (hero, ItRu_IceWave))
	|| (Npc_HasItems (hero, ItRu_Thunderstorm))
	|| (Npc_HasItems (hero, ItRu_Geyser))
	|| (Npc_HasItems (hero, ItRu_Waterfist))
	|| (Npc_HasItems (hero, ItRu_Icelance))
	|| (Npc_HasItems (hero, ItSc_Icebolt))
	|| (Npc_HasItems (hero, ItSc_IceCube))
	|| (Npc_HasItems (hero, ItSc_IceWave))
	|| (Npc_HasItems (hero, ItSc_Thunderstorm))
	|| (Npc_HasItems (hero, ItSc_Geyser))
	|| (Npc_HasItems (hero, ItSc_Waterfist))
	|| (Npc_HasItems (hero, ItSc_Icelance))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_IsItemEiszauber (var C_ITEM Weap)
{
	if (Hlp_IsItem(Weap, ItRu_Icebolt)	==	TRUE)	
	|| (Hlp_IsItem(Weap, ItRu_IceCube)	==	TRUE)	
	|| (Hlp_IsItem(Weap, ItRu_IceWave)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Thunderstorm)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Geyser)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Waterfist)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Icelance)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Icebolt)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItSc_IceCube)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItSc_IceWave)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Thunderstorm)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Geyser)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Waterfist)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Icelance)	==	TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasReadiedEiszauber()
{
	var C_ITEM ReadyWeap; ReadyWeap = Npc_GetReadiedWeapon(hero);
	
	if (C_IsItemEiszauber(ReadyWeap))
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};

func int C_ScHasFeuerzauber()
{
	if (Npc_HasItems (hero, ItRu_Firebolt))
	|| (Npc_HasItems (hero, ItRu_InstantFireball))
	|| (Npc_HasItems (hero, ItRu_ChargeFireball))
	|| (Npc_HasItems (hero, ItRu_Firestorm))
	|| (Npc_HasItems (hero, ItRu_Firerain))
	|| (Npc_HasItems (hero, ItRu_Pyrokinesis))
	|| (Npc_HasItems (hero, ItSc_Firebolt))
	|| (Npc_HasItems (hero, ItSc_InstantFireball))
	|| (Npc_HasItems (hero, ItSc_ChargeFireball))
	|| (Npc_HasItems (hero, ItSc_Firestorm))
	|| (Npc_HasItems (hero, ItSc_Firerain))
	|| (Npc_HasItems (hero, ItSc_Pyrokinesis))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_IsItemFeuerzauber (var C_ITEM Weap)
{
	if (Hlp_IsItem(Weap, ItRu_Firebolt)	==	TRUE)	
	|| (Hlp_IsItem(Weap, ItRu_InstantFireball)	==	TRUE)	
	|| (Hlp_IsItem(Weap, ItRu_ChargeFireball)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Firestorm)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Firerain)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItRu_Pyrokinesis)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Firebolt)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItSc_InstantFireball)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItSc_ChargeFireball)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Firestorm)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Firerain)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItSc_Pyrokinesis)	==	TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasReadiedFeuerzauber()
{
	var C_ITEM ReadyWeap; ReadyWeap = Npc_GetReadiedWeapon(hero);
	
	if (C_IsItemFeuerzauber(ReadyWeap))
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};

func int C_ScHasKeule()
{
	if (Npc_HasItems (hero, ItMw_1h_Vlk_Mace))
	|| (Npc_HasItems (hero, ItMw_1H_Mace_L_03))
	|| (Npc_HasItems (hero, ItMw_1h_Bau_Mace)	)
	|| (Npc_HasItems (hero, ItMw_1H_Mace_L_04)	)
	|| (Npc_HasItems (hero, ItMw_Nagelknueppel))
	|| (Npc_HasItems (hero, ItMw_1h_Nov_Mace)	)
	|| (Npc_HasItems (hero, ItMw_Nagelkeule))
	|| (Npc_HasItems (hero, ItMw_Kriegskeule)	)
	|| (Npc_HasItems (hero, ItMw_Kriegshammer1)	)
	|| (Npc_HasItems (hero, ItMw_Nagelkeule2))
	|| (Npc_HasItems (hero, ItMw_Stabkeule)	)
	|| (Npc_HasItems (hero, ItMw_Steinbrecher))
	|| (Npc_HasItems (hero, ItMw_Spicker)	)
	|| (Npc_HasItems (hero, ItMw_Morgenstern)	)
	|| (Npc_HasItems (hero, ItMw_Streitkolben)	)
	|| (Npc_HasItems (hero, ItMw_Rabenschnabel)	)
	|| (Npc_HasItems (hero, ItMw_Kriegshammer2)	)
	|| (Npc_HasItems (hero, ItMw_Kriegshammer1))
	|| (Npc_HasItems (hero, ItMW_Addon_Stab01))
	|| (Npc_HasItems (hero, ItMw_Addon_Stab02))
	|| (Npc_HasItems (hero, ItMW_Addon_Stab03))
	|| (Npc_HasItems (hero, ItMW_Addon_Stab04))
	|| (Npc_HasItems (hero, ItMW_Addon_Stab05))
	|| (Npc_HasItems (hero, ItMW_Addon_Keule_1h_01))
	|| (Npc_HasItems (hero, ItMW_Addon_Keule_2h_01))
	|| (Npc_HasItems (hero, ItMw_RangerStaff_Addon))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_IsItemKeule (var C_ITEM Weap)
{
	if (Hlp_IsItem(Weap, ItMw_1h_Vlk_Mace)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Mace_L_03)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Bau_Mace)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1H_Mace_L_04)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Nagelknueppel)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMw_1h_Nov_Mace)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Nagelkeule)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Kriegskeule)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Kriegshammer1)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Nagelkeule2)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Stabkeule)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Steinbrecher)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Spicker)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Morgenstern)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Streitkolben)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Rabenschnabel)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Kriegshammer2)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Kriegshammer1)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Stab01)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMw_Addon_Stab02)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Stab03)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Stab04)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Stab05)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Keule_1h_01)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMW_Addon_Keule_2h_01)	==	TRUE)
	|| (Hlp_IsItem(Weap, ItMw_RangerStaff_Addon)	==	TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasReadiedKeule()
{
	var C_ITEM ReadyWeap; ReadyWeap = Npc_GetReadiedWeapon(hero);
	
	if (C_IsItemKeule(ReadyWeap))
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};