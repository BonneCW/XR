instance Mod_7618_OUT_Norman_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Norman"; 
	guild 		= GIL_OUT;
	id 			= 7618;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_Weak_Cutter, BodyTex_P, SFB_ARMOR_L);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7618;
};

FUNC VOID Rtn_Start_7618()
{	
	TA_Smoke_Joint		(05,30,11,35,"REL_SURFACE_206");
	TA_Smoke_Joint	 	(11,35,05,30,"REL_SURFACE_206");
};

FUNC VOID Rtn_Theodorus_7618()
{	
	TA_Stand_Eating	(08,00,23,00,"REL_CITY_001");
	TA_Stand_Eating	(23,00,08,00,"REL_CITY_001");
};

FUNC VOID Rtn_InCity_7618()
{	
	TA_Sit_Chair	(08,00,23,00,"ALTEFESTUNG_010");
	TA_Sit_Chair	(23,00,08,00,"ALTEFESTUNG_010");
};