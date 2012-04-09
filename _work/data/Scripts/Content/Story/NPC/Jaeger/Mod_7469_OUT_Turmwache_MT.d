instance Mod_7469_OUT_Turmwache_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Turmwache";
	guild 		= GIL_OUT;
	id 			= 7469;
	voice 		= 13;
	flags       = 0;							
	npctype		= NPCTYPE_MAIN;
	
	
	//--------Aivars-------------
	aivar[AIV_ToughGuy] = TRUE; 
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);			
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------			
	EquipItem			(self, ItMw_1H_quantarie_Fantasyschwert_01);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------					
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Whistler, BodyTex_N, ITAR_Lurker);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------				
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7469;
};

FUNC VOID Rtn_Start_7469 ()
{	
	TA_Stand_Guarding			(08,00,23,00,"WP_MT_JAEGERLAGER_14");
	TA_Stand_Guarding			(23,00,08,00,"WP_MT_JAEGERLAGER_14");
};