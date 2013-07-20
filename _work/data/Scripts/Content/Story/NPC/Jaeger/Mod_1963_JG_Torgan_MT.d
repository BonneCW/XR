INSTANCE Mod_1963_JG_Torgan_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Torgan";
	guild 		= GIL_OUT;
	id 			= 1963;
	voice 		= 13;
	flags       = 2;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItRw_Bow_L_03); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", 190, BodyTex_P, ITAR_Schattenläufer);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1963;
};

FUNC VOID Rtn_Start_1963()
{	
	TA_Stand_Guarding		(08,00,20,00,"WP_MT_JAEGERLAGER_15");
	TA_Stand_Guarding			(20,00,08,00,"WP_MT_JAEGERLAGER_15");
};