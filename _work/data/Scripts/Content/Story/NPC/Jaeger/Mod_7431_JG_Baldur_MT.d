instance Mod_7431_JG_Baldur_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Baldur"; 
	guild 		= GIL_OUT;
	id 			= 7431;
	voice 		= 8;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 																	
	EquipItem (self, ItRw_Bow_L_03); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Lefty, BodyTex_N, ITAR_Leather_L);
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7431;
};

FUNC VOID Rtn_Start_7431()
{	
	TA_Sit_Campfire	(08,00,20,00,"WP_MT_JAEGERLAGER_04");
	TA_Sit_Campfire	(20,00,08,00,"WP_MT_JAEGERLAGER_04");
};

FUNC VOID Rtn_KapThree_7431()
{	
	TA_Sit_Campfire		(08,00,16,00,"WP_MT_JAEGERLAGER_04");
	TA_Smalltalk_Waldis1	(16,00,20,00,"WP_MT_JAEGERLAGER_04");
	TA_Sit_Campfire		(20,00,08,00,"WP_MT_JAEGERLAGER_04");
};
