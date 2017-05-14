instance Mod_7530_JG_Wilderer_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wilderer"; 
	guild 		= GIL_STRF;
	id 			= 7530;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 																	
	EquipItem (self, ItRw_Bow_L_03); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Lefty, BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 25); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7530;
};

FUNC VOID Rtn_Start_7530()
{	
	TA_Stand_Guarding	(06,05,20,15,"REL_SURFACE_033");
	TA_Stand_Guarding	(20,15,06,05,"REL_SURFACE_033"); 
};
