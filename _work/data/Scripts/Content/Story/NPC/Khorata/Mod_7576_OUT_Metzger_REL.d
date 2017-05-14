instance Mod_7576_OUT_Metzger_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Metzger"; 
	guild 		= GIL_OUT;
	id 			= 7576;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Lefty, BodyTex_N, ITAR_Metzger);
	Mdl_SetModelFatness	(self,0); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7576;
};

FUNC VOID Rtn_Start_7576()
{	
	TA_Stand_Guarding	(07,00,12,00,"FLEISCHER_05");
	TA_Smalltalk		(12,00,14,00,"ALTEFESTUNG_010");
	TA_Stand_Guarding	(14,00,18,00,"FLEISCHER_05");
	TA_Sit_Throne		(18,00,22,00,"FLEISCHERFUER");
	TA_Sleep		(22,00,17,00,"FLEISCHER_08");
};

FUNC VOID Rtn_Besichtigung_7576()
{	
	TA_RunToWP	(08,00,20,00,"REL_CITY_057");
	TA_RunToWP 	(20,00,08,00,"REL_CITY_057");
};

FUNC VOID Rtn_Flucht_7576()
{	
	TA_FleeToWP		(07,00,12,00,"FLEISCHER_05");
	TA_FleeToWP		(12,00,14,00,"ALTEFESTUNG_010");
	TA_FleeToWP		(14,00,18,00,"FLEISCHER_05");
	TA_FleeToWP		(18,00,22,00,"FLEISCHERFUER");
	TA_FleeToWP		(22,00,17,00,"FLEISCHER_08");
};