instance Mod_7561_OUT_Alvar_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Alvar"; 
	guild 		= GIL_OUT;
	id 			= 7561;
	voice 		= 1;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	//EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart_Huno, BodyTex_N, ITAR_Eisgebiet_02);
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7561;
};

FUNC VOID Rtn_Start_7561()
{	
	TA_Sit_Chair	(06,00,08,00,"EIS_DORF_016");
	TA_Sit_Bench	(08,00,12,00,"EIS_DORF_014");
	TA_Sit_Chair	(12,00,14,00,"EIS_DORF_016");
	TA_Sit_Bench	(14,00,18,00,"EIS_DORF_014");
	TA_Sit_Throne	(18,00,21,00,"EIS_DORF_021");
	TA_Sleep 	(21,00,06,00,"EIS_DORF_018");
};

FUNC VOID Rtn_Tot_7561()
{	
	TA_RunToWP	(08,00,20,00,"TOT");
	TA_RunToWP 	(20,00,08,00,"TOT");
};

FUNC VOID Rtn_AtHexe_7561()
{	
	TA_Stand_WP	(08,00,20,00,"EIS_323");
	TA_Stand_WP 	(20,00,08,00,"EIS_323");
};

FUNC VOID Rtn_Nah_7561()
{	
	TA_Stand_WP	(08,00,20,00,"EIS_326");
	TA_Stand_WP 	(20,00,08,00,"EIS_326");
};

FUNC VOID Rtn_Thys_7561()
{	
	TA_Stand_WP	(08,00,20,00,"EIS_75");
	TA_Stand_WP 	(20,00,08,00,"EIS_75");
};
