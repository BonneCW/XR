INSTANCE Mod_770_NONE_Niclas_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Niclas";
	guild 		= GIL_OUT;
	id 			= 770;
	voice 		= 15;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	EquipItem 	(self,itRw_SLD_BOW); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_NormalBart12, BodyTex_N, ITAR_Leather_L);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_770;
};

FUNC VOID Rtn_Start_770 ()
{	
	TA_Stand_Guarding 		(08,00,23,00,"WP_JAEGERLAGER_01"); 
    TA_Stand_Guarding		(23,00,08,00,"WP_JAEGERLAGER_01");
};