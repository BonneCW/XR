instance Mod_7578_OUT_Brauer_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Brauer"; 
	guild 		= GIL_OUT;
	id 			= 7578;
	voice 		= 6;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart_Senyan, BodyTex_N, ITAR_Smith);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7578;
};

FUNC VOID Rtn_Start_7578()
{	
	TA_Read_Bookstand	(07,00,09,00,"BRAUERKESSEL");
	TA_Potion_Alchemy	(09,00,11,00,"BRAUERKESSEL");
	TA_Read_Bookstand	(11,00,13,00,"BRAUERKESSEL");
	TA_Potion_Alchemy	(13,00,15,00,"BRAUERKESSEL");
	TA_Read_Bookstand	(15,00,17,00,"BRAUERKESSEL");
	TA_Potion_Alchemy	(17,00,19,00,"BRAUERKESSEL");
	TA_Read_Bookstand	(19,00,21,00,"BRAUERKESSEL");
	TA_Sleep		(21,00,07,00,"BRAUERBETT01");
};

FUNC VOID Rtn_Erhard_7578()
{	
	TA_RunToWp	(06,05,20,15,"REL_SURFACE_041");
	TA_RunToWP	(20,15,06,05,"REL_SURFACE_041"); 
};

FUNC VOID Rtn_Besichtigung_7578()
{	
	TA_RunToWP	(08,00,20,00,"REL_CITY_057");
	TA_RunToWP 	(20,00,08,00,"REL_CITY_057");
};

FUNC VOID Rtn_Flucht_7578()
{	
	TA_FleeToWP	(07,00,21,00,"BRAUERKESSEL");
	TA_FleeToWP	(21,00,07,00,"BRAUERBETT01");
};
