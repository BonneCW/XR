instance Mod_1875_GRD_Botschafter_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Botschafter";
	guild 		= GIL_OUT;
	id 			= 1875;
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
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems	(self, ItWr_AliBotschaft, 1);
		
	// ------ visuals ------					
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Whistler, BodyTex_N, GRD_ARMOR_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------				
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1875;
};

FUNC VOID Rtn_Start_1875 ()
{	
	TA_Sit_Campfire			(08,00,23,00,"SPAWN_OW_SCA_01_BADITS2");
    TA_Sit_Campfire			(23,00,08,00,"SPAWN_OW_SCA_01_BADITS2");
 
};