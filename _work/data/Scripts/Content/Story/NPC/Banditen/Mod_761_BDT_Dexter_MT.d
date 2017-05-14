instance Mod_761_BDT_Dexter_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dexter"; 
	guild 		= GIL_OUT;
	id 			= 761;
	voice		= 0;
	flags       = 2;								
	npctype		= NPCTYPE_MAIN;
	
	//--------Aivars-----------
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1H_quantarie_Fantasyschwert_01);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItKE_Dexter,1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart_Dexter, BodyTex_N, ITAR_BDT_H_01);	
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
		// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 90); 

	daily_routine = Rtn_Start_761;
};	 
	// ------ TA ------
FUNC VOID RTn_Start_761()
{
	TA_Stand_Eating	(08,00,08,30,"LOCATION_11_13");
	TA_Smalltalk	(08,30,12,00,"LOCATION_11_13");
	TA_Stand_Eating (12,00,12,30,"LOCATION_11_13");
	TA_Smalltalk	(12,30,18,00,"LOCATION_11_07");
	TA_Sit_Campfire	(18,00,08,00,"LOCATION_11_12_02");
};

FUNC VOID Rtn_Eingang_761()
{
	TA_Stand_WP	(08,00,20,00,"LOCATION_11_15");
	TA_Stand_WP	(20,00,08,00,"LOCATION_11_15");
};

FUNC VOID Rtn_Hoehle_761()
{
	TA_FleeToWP	(08,00,20,00,"LOCATION_11_11");
	TA_FleeToWP	(20,00,08,00,"LOCATION_11_11");
};

FUNC VOID Rtn_InPsicamp_761 ()
{
	TA_Stand_WP			(02,10,07,40,"PSI_TEMPLE_IN_05");
	TA_Stand_WP		(07,40,21,05,"PSI_TEMPLE_IN_05");
	TA_Stand_WP		(21,05,02,10,"PSI_TEMPLE_IN_05");
};

FUNC VOID Rtn_Tot_761()
{
	TA_FleeToWP	(08,00,20,00,"TOT");
	TA_FleeToWP	(20,00,08,00,"TOT");
};