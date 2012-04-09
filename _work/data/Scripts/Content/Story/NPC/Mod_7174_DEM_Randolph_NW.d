instance Mod_7174_DEM_Randolph_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Halbinfernalischer Randolph";
	guild 		= GIL_DMT;
	id 			= 7174;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	level = 60;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;														
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------															
	EquipItem			(self, ItMw_Sense_01);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 206, 17, ItAr_Bau_L);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 100); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_preStart_7174;
};

FUNC VOID Rtn_preStart_7174 ()
{	
	TA_Circle 			(05,00,21,00,"NW_LITTLESTONEHENDGE_02");
    TA_Circle		(21,00,05,00,"NW_LITTLESTONEHENDGE_02");
};

FUNC VOID Rtn_Down_7174 ()
{	
	TA_Drained 			(05,00,21,00,"NW_LITTLESTONEHENDGE_02");
    TA_Drained		(21,00,05,00,"NW_LITTLESTONEHENDGE_02");
};

FUNC VOID Rtn_Tot_7174 ()
{	
	TA_Drained 			(05,00,21,00,"TOT");
    TA_Drained		(21,00,05,00,"TOT");
};