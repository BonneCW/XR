instance Mod_7574_OUT_Lehrling_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bäckerlehrling"; 
	guild 		= GIL_OUT;
	id 			= 7574;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	//EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal06, BodyTex_N, ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7574;
};

FUNC VOID Rtn_Start_7574()
{	
	TA_Stand_Sweeping	(05,00,12,00,"BACKER_02");
	TA_Stand_Eating		(12,00,13,00,"REL_CITY_250");
	TA_Smalltalk 		(13,00,15,00,"REL_SURFACE_159");	// Mit Metzgerlehrling
	TA_Smalltalk 		(15,00,18,00,"REL_SURFACE_159");	// Mit Müller
	TA_Sit_Chair 		(18,00,05,00,"BACKER_03");
};
