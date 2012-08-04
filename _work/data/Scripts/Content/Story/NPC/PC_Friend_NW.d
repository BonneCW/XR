instance PC_Friend_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Argez"; 
	guild 		= GIL_OUT;
	id 			= 1605;
	voice 		= 1;
	flags       = 2;																
	npctype		= NPCTYPE_FRIEND;
	
	// ------ AIVARs ------
	aivar[AIV_ToughGuy] 			= TRUE;	
	aivar[AIV_ToughGuyNewsOverride] = TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_VLK_Sword); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 178, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 100); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1605;
};

FUNC VOID Rtn_PreStart_1605()
{	
	TA_Stand_ArmsCrossed	(10,55,18,50,"NW_FARM1_PATH_CITY_07");
	TA_Stand_ArmsCrossed	(18,50,10,55,"NW_FARM1_PATH_CITY_07");
};

FUNC VOID Rtn_Ruhe_1605()
{	
	TA_Sleep	(10,55,18,50,"NW_CITY_HOTEL_UPTSAIRS_04");
	TA_Sleep	(18,50,10,55,"NW_CITY_HOTEL_UPTSAIRS_04");
};

FUNC VOID Rtn_Start_1605()
{	
	TA_Stand_ArmsCrossed	(07,55,10,00,"NW_CITY_HABOUR_JACK");
	TA_Stand_ArmsCrossed	(10,00,21,50,"NW_CITY_MERCHANT_PATH_29_B");
	TA_Sleep		(21,50,07,55,"NW_CITY_HOTEL_UPTSAIRS_04");
};

FUNC VOID Rtn_Tot_1605()
{	
	TA_Stand_ArmsCrossed	(10,55,18,50,"TOT");
	TA_Stand_ArmsCrossed	(18,50,10,55,"TOT");
};

FUNC VOID Rtn_FollowInCity_1605()
{	
	TA_Follow_Player	(10,55,18,50,"WP_SEQUENZ_ARGEZ");
	TA_Follow_Player	(18,50,10,55,"WP_SEQUENZ_ARGEZ");
};

FUNC VOID Rtn_FollowToSaturas_1605()
{	
	TA_Follow_Player	(10,55,18,50,"NW_TROLLAREA_PORTALTEMPEL_STUDY_01");
	TA_Follow_Player	(18,50,10,55,"NW_TROLLAREA_PORTALTEMPEL_STUDY_01");
};

FUNC VOID Rtn_AtSaturas_1605()
{	
	TA_Smalltalk_Plaudern	(10,55,18,50,"NW_TROLLAREA_PORTALTEMPEL_STUDY_01");
	TA_Smalltalk_Plaudern	(18,50,10,55,"NW_TROLLAREA_PORTALTEMPEL_STUDY_01");
};

FUNC VOID Rtn_Smalltalk_1605()
{	
	TA_Smalltalk	(10,55,18,50,"NW_TROLLAREA_PORTALTEMPEL_STUDY_01");
	TA_Smalltalk	(18,50,10,55,"NW_TROLLAREA_PORTALTEMPEL_STUDY_01");
};