instance Mod_7531_JG_Wilderer_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wilderer"; 
	guild 		= GIL_STRF;
	id 			= 7531;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);														
		
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
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7531;
};

FUNC VOID Rtn_Start_7531()
{	
	TA_Stand_Guarding	(06,05,20,15,"REL_SURFACE_005");
	TA_Stand_Guarding	(20,15,06,05,"REL_SURFACE_005"); 
};

FUNC VOID Rtn_Flucht_7531()
{	
	TA_FleeToWP	(06,05,20,15,"TOT");
	TA_FleeToWP	(20,15,06,05,"TOT"); 
};