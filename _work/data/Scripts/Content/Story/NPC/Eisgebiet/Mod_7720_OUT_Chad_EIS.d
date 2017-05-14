instance Mod_7720_OUT_Chad_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Chad"; 
	guild 		= GIL_OUT;
	id 			= 7720;
	voice		= 0;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Lefty, BodyTex_N, ITAR_Eisgebiet_01);
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7720;
};

FUNC VOID Rtn_Start_7720()
{	
	TA_Sleep	(06,05,20,15,"EIS_415");
	TA_Sleep	(20,15,06,05,"EIS_415"); 
};
