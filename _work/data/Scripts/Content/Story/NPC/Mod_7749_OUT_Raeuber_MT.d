instance Mod_7749_OUT_Raeuber_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Räuber"; 
	guild 		= GIL_OUT;
	id 			= 7749;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	CreateInvItems	(self, ItRi_Siegelring, 1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Lefty, BodyTex_N, ITAR_Governor);
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7749;
};

FUNC VOID Rtn_Start_7749()
{
	TA_Sit_Bench		(08,00,23,00,"OW_PATH_1_17_3");
	TA_Sit_Bench		(23,00,08,00,"OW_PATH_1_17_3");	
};

FUNC VOID Rtn_See_7749()
{
	TA_Stand_Guarding		(08,00,23,00,"WP_INTRO_SHORE");
	TA_Stand_Guarding		(23,00,08,00,"WP_INTRO_SHORE");	
};

FUNC VOID Rtn_See2_7749()
{
	TA_Stand_Guarding		(08,00,23,00,"OW_PATH_WARAN05_SPAWN02");
	TA_Stand_Guarding		(23,00,08,00,"OW_PATH_WARAN05_SPAWN02");	
};