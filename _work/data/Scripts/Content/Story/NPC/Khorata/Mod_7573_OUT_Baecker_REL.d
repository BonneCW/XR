instance Mod_7573_OUT_Baecker_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bäcker"; 
	guild 		= GIL_OUT;
	id 			= 7573;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart_Huno, BodyTex_N, ITAR_Baecker);	
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7573;
};

FUNC VOID Rtn_Start_7573()
{	
	TA_Stand_ArmsCrossed	(05,00,11,00,"BACKER_02");
	TA_Stand_Drinking 	(11,00,12,00,"ALTEFESTUNG_014");
	TA_Smalltalk 		(12,00,14,00,"ALTEFESTUNG_010");	// Mit Metzger
	TA_Stand_ArmsCrossed 	(14,00,18,00,"BACKER_02");
	TA_Sit_Throne	 	(18,00,21,00,"BACKER_03");
	TA_Sleep	 	(21,00,05,00,"BACKER_04");
};
