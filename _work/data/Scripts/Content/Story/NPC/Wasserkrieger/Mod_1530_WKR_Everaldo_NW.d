instance Mod_1530_WKR_Everaldo_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Everaldo"; 
	guild 		= GIL_NOV;
	id 			= 1530;
	voice		= 0;
	flags       = 0;							
	npctype		= NPCTYPE_MAIN;
	

	// ------ Attribute ------
	
	B_SetAttributesToChapter	(self, 4);
	EquipItem	(self, ItMw_AdanosSchwert);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	aivar[AIV_ToughGuy]		= TRUE;	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart22, BodyTex_N, ITAR_WKR_H);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1530;
};

FUNC VOID Rtn_Start_1530 ()
{	
	TA_Stand_Guarding 		(08,00,23,00,"NW_KRONKELLARES_03");
    TA_Stand_Guarding		(23,00,08,00,"NW_KRONKELLARES_03");
};

FUNC VOID Rtn_Sammeln_1530 ()
{
	TA_Stand_WP	(08,00,23,00,"TAVERNE");
    TA_Stand_WP	(23,00,08,00,"TAVERNE");
};

FUNC VOID Rtn_Balrog_1530 ()
{
	TA_RunToWP	(08,00,23,00,"WP_ADANOS_BALROG");
    TA_RunToWP	(23,00,08,00,"WP_ADANOS_BALROG");
};

FUNC VOID Rtn_Gigant_1530 ()
{
	TA_RunToWP	(08,00,23,00,"NW_TO_PASS_01");
    TA_RunToWP	(23,00,08,00,"NW_TO_PASS_01");
};