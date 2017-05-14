instance Mod_1039_VLK_Buergerin_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Buergerin;	
	guild 		= GIL_PAL;
	id 			= 1039;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self, ItMw_1H_quantarie_Schwert_01);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe4", FaceBabe_N_VlkBlonde, BodyTex_N, ITAR_VlkBabe_L);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1039;
};

FUNC VOID Rtn_Start_1039 ()
{	
	TA_Stand_ArmsCrossed	(05,10,20,17,"NW_CITY_MERCHANT_PATH_14_C");
    TA_Smalltalk			(20,17,05,10,"NW_CITY_MERCHANT_PATH_32");
};

FUNC VOID Rtn_LobartAlwin_1039 ()
{
	TA_Smalltalk_Plaudern	(08,00,20,00,"WP_ALWIN_SEQUENZ");
	TA_Smalltalk_Plaudern	(20,00,08,00,"WP_ALWIN_SEQUENZ");
};