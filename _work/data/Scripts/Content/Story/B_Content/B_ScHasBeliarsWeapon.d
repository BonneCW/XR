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