instance Mod_7579_OUT_Lehrling_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Brauerlehrling"; 
	guild 		= GIL_OUT;
	id 			= 7579;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	//EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak04, BodyTex_N, ITAR_Bau_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7579;
};

FUNC VOID Rtn_Start_7579()
{	
	TA_Saw			(06,45,12,00,"REL_CITY_393");
	TA_Sit_Chair		(12,00,14,00,"BRAUERWOHNEN");
	TA_Saw			(14,00,18,00,"REL_CITY_393");
	TA_Sit_Bench		(18,00,21,05,"REL_CITY_245");
	TA_Saw			(21,05,06,45,"BRAUERBETT02");
};
