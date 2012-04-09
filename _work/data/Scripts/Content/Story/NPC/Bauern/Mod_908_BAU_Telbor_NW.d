instance Mod_908_BAU_Telbor_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Telbor"; 
	guild 		= GIL_NONE;
	id 			= 908;
	voice 		= 12;
	flags       = 0;							
	npctype		= NPCTYPE_MAIN;
	
	//aivars 
	aivar[AIV_IgnoresArmor] = TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fatbald", Face_B_Normal01, BodyTex_B, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_908;
};

FUNC VOID Rtn_Start_908 ()
{	
	TA_Rake_FP (00,00,12,00,"NW_FARM2_FIELD_TELBOR");
	TA_Rake_FP (12,00,00,00,"NW_FARM2_FIELD_TELBOR");
};

FUNC VOID Rtn_Abgang_908 ()
{	
	TA_Stand_ArmsCrossed		(05,00,21,00,"NW_CITY_TO_FARM2_04");
	TA_Stand_ArmsCrossed		(21,00,05,00,"NW_CITY_TO_FARM2_04");
};

FUNC VOID Rtn_City_908 ()
{	
	TA_Sit_Campfire		(05,00,21,00,"WP_FLUECHTLINGE");
	TA_Sit_Campfire		(21,00,05,00,"WP_FLUECHTLINGE");
};

FUNC VOID Rtn_WantingBack_908 ()
{	
	TA_Stand_ArmsCrossed		(05,00,21,00,"NW_CITY_MERCHANT_PATH_29_B");
	TA_Stand_ArmsCrossed		(21,00,05,00,"NW_CITY_MERCHANT_PATH_29_B");
};