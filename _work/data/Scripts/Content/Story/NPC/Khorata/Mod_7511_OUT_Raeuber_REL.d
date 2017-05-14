instance Mod_7511_OUT_Raeuber_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Räuber"; 
	guild 		= GIL_OUT;
	id 			= 7511;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Herek, BodyTex_N, ITAR_bdt_m_01);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 45); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7511;
};

FUNC VOID Rtn_Start_7511()
{	
	TA_Sit_Campfire	(08,00,23,00,"REL_SURFACE_123");
	TA_Sit_Campfire	(23,00,08,00,"REL_SURFACE_123");	
};
