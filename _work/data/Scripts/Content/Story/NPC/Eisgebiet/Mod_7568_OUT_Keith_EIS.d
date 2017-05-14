instance Mod_7568_OUT_Keith_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Keith"; 
	guild 		= GIL_OUT;
	id 			= 7568;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Lefty, BodyTex_N, ITAR_Eisgebiet_01);
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7568;
};

FUNC VOID Rtn_Start_7568()
{	
	TA_Sit_Campfire	(06,10,18,00,"EIS_340");
	TA_Sit_Campfire	(18,00,06,00,"EIS_340");
};

FUNC VOID Rtn_Eissee_7568()
{	
	TA_Guide_Player	(06,10,18,00,"EIS_358");
	TA_Guide_Player	(18,00,06,00,"EIS_358");
};