instance Mod_7619_OUT_Frazer_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Frazer"; 
	guild 		= GIL_OUT;
	id 			= 7619;
	voice 		= 13;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal06, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7619;
};

FUNC VOID Rtn_Start_7619()
{	
	TA_Drained	(08,00,23,00,"REL_SURFACE_206");
	TA_Drained 	(23,00,08,00,"REL_SURFACE_206");
};

FUNC VOID Rtn_Theodorus_7619()
{	
	TA_Stand_Eating	(08,00,23,00,"REL_CITY_001");
	TA_Stand_Eating	(23,00,08,00,"REL_CITY_001");
};

FUNC VOID Rtn_InCity_7619()
{	
	TA_Smoke_Joint	(08,00,23,00,"ALTEFESTUNG_08");
	TA_Smoke_Joint	(23,00,08,00,"ALTEFESTUNG_08");
};

FUNC VOID Rtn_InCity2_7619()
{	
	TA_Sleep	(08,00,23,00,"REL_CITY_320");
	TA_Sleep	(23,00,08,00,"REL_CITY_320");
};