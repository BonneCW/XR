instance Mod_7562_OUT_Alvar_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Alvar"; 
	guild 		= GIL_OUT;
	id 			= 7562;
	voice		= 0;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart_Huno, BodyTex_N, NO_ARMOR);
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 

	CreateInvItems	(self, ItAr_FakeArmor_Alvar, 1);
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7562;
};

FUNC VOID Rtn_Start_7562()
{		
	TA_Sit_Bench	(08,00,20,00,"EIS_268");
	TA_Sleep 	(20,00,08,00,"EIS_268");
};
