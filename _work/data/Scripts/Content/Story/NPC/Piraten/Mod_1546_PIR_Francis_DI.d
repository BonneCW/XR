INSTANCE Mod_1546_PIR_Francis_DI (Npc_Default)
{
	// ------ NSC ------
	name 		= "Francis";
	guild 		= GIL_out;
	id 			= 1546;
	voice		= 0;
	flags       = FALSE;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Schwert1);  
	
	// ------ Inventory ------
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Cipher_neu, BodyTex_N, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1546;
};

FUNC VOID Rtn_Start_1546 ()
{	
	TA_Sit_Bench 	(05,00,20,00,"WP_DI_FRANCIS_SIT_BENCH");
	TA_Sit_Bench 	(20,00,05,00,"WP_DI_FRANCIS_SIT_BENCH");
};

FUNC VOID Rtn_Stollen_1546 ()
{	
	TA_Pick_FP 	(05,00,20,00,"WP_DI_HOEHLE_01_TUNNEL_4");
	TA_Pick_FP 	(20,00,05,00,"WP_DI_HOEHLE_01_TUNNEL_4");
};