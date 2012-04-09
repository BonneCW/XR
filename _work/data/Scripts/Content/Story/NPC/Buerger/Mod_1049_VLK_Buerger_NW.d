instance Mod_1049_VLK_Buerger_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BUERGER; 
	guild 		= GIL_PAL;
	id 			= 1049;
	voice 		= 8;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_NormalBart06, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1049;
};

FUNC VOID Rtn_PreStart_1049()
{	
	TA_Listen_Monty		(08,00,20,00,"WP_MONTY_BLUBBER_01");
	TA_Smalltalk		(20,00,08,00,"NW_CITY_MERCHANT_SHOP03_FRONT_03");
};

FUNC VOID Rtn_Start_1049()
{	
	TA_Stand_ArmsCrossed	(05,20,20,20,"NW_CITY_MERCHANT_PATH_14_C");
	TA_Smalltalk		(20,20,05,20,"NW_CITY_MERCHANT_SHOP03_FRONT_03");
};
