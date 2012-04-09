instance Mod_1964_JG_Jaeger_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_JAEGER; 
	guild 		= GIL_OUT;
	id 			= 1964;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																		
	EquipItem (self, ItRw_Bow_L_03); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Asghan, BodyTex_N,ITAR_Leather_L);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1964;
};

FUNC VOID Rtn_Start_1964()
{	
	TA_Sit_Campfire	(06,05,20,15,"OW_WOODRUIN_WOLF_SPAWN");
	TA_Sit_Campfire		(20,15,06,05,"OW_WOODRUIN_WOLF_SPAWN"); 
};