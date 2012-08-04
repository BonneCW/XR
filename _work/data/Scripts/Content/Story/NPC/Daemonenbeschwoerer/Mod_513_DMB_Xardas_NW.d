INSTANCE Mod_513_DMB_Xardas_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Xardas";
	guild 		= GIL_DMT;
	id 			= 513;
	voice 		= 14;
	flags       = 2;																	
	npctype		= NPCTYPE_FRIEND;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	aivar[AIV_IgnoresArmor] 		= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);	
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																				
	EquipItem	(self, ItMW_BeliarStab);
	
	// ------ Inventory ------
	//B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic",Face_N_Xardas , BodyTex_N, ITAR_DMB_S);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_513;

	B_SetSchwierigkeit();
};

FUNC VOID Rtn_PreStart_513()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"NW_XARDAS_START");
	TA_Stand_ArmsCrossed	(20,00,08,00,"NW_XARDAS_START");
};

FUNC VOID Rtn_Start_513()
{
	TA_Read_Bookstand	(05,00,07,00,"NW_XARDAS_TOWER_IN1_27");
	TA_Read_Bookstand	(07,00,09,00,"NW_XARDAS_TOWER_IN1_28");
	TA_Pray_Innos		(09,00,11,00,"WP_XARDAS_PREACH_02");
	TA_Cook_Stove		(11,00,13,00,"WP_XARDAS_COOK");
	TA_Sit_Throne		(13,00,14,00,"NW_XARDAS_TOWER_IN1_32");
	TA_Potion_Alchemy	(14,00,17,00,"NW_XARDAS_TOWER_IN1_29");
	TA_Read_Bookstand	(17,00,19,00,"NW_XARDAS_TOWER_IN1_22");
	TA_Sit_Throne		(19,00,22,00,"NW_XARDAS_TOWER_IN1_32");
	TA_Pray_Innos		(22,00,23,00,"WP_XARDAS_PREACH_02");
	TA_Sleep		(23,00,05,00,"NW_XARDAS_TOWER_IN1_31");
};

FUNC VOID Rtn_Rat_513()
{
	TA_Sit_Throne		(08,00,20,00,"WP_KLOSTER_KELLER_RAT_XARDAS");
	TA_Sit_Throne		(20,00,08,00,"WP_KLOSTER_KELLER_RAT_XARDAS");
};

FUNC VOID Rtn_Privat_513()
{
	TA_Stand_ArmsCrossed		(08,00,20,00,"NW_KDF_LIBRARY_15");
	TA_Stand_ArmsCrossed		(20,00,08,00,"NW_KDF_LIBRARY_15");
};

FUNC VOID Rtn_Tot_513()
{
	TA_Stand_WP		(08,00,20,00,"TOT");
	TA_Stand_WP		(20,00,08,00,"TOT");
};

FUNC VOID Rtn_GardeInnos_513()
{
	TA_Smalltalk_Plaudern	(08,00,20,00,"NW_XARDAS_START");
	TA_Smalltalk_Plaudern	(20,00,08,00,"NW_XARDAS_START");
};

FUNC VOID Rtn_Drachen_513()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"NW_FOREST_PATH_66_M");
	TA_Stand_ArmsCrossed	(20,00,08,00,"NW_FOREST_PATH_66_M");
};

FUNC VOID Rtn_Bummel_513()
{
	TA_Read_Bookstand	(05,00,07,00,"NW_XARDAS_TOWER_IN1_27");
	TA_Read_Bookstand	(07,00,05,00,"NW_XARDAS_TOWER_IN1_27");
};