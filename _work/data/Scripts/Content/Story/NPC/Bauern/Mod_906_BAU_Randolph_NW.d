instance Mod_906_BAU_Randolph_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Randolph";
	guild 		= GIL_DMT;
	id 			= 906;
	voice		= 0;
	flags       = 0;	//Joly:nur solange Alnveres da ist!																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);														
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------															
	EquipItem			(self, ItMw_Sense_01);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal_Kharim, BodyTex_B, ITAR_Bau_L);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 20); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_preStart_906;
};
//Joly: NIE AUF EINE BANK ODER THRON SETZEN
FUNC VOID Rtn_preStart_906 ()
{	
	TA_Sit_Chair 			(05,00,21,00,"NW_FARM2_HOUSE_IN_07");
    TA_Sit_Chair		(21,00,05,00,"NW_FARM2_HOUSE_IN_07");
};

FUNC VOID Rtn_Start_906 ()
{	
	TA_Pick_FP 			(05,00,21,00,"NW_FARM2_FIELD_04");
	TA_Stand_Eating		(21,00,05,00,"NW_FARM2_OUT_07");
};

FUNC VOID Rtn_FollowPlayer_906 ()
{	
	TA_RunToWP 		(05,00,21,00,Npc_GetNearestWP(hero));
	TA_RunToWP		(21,00,05,00,Npc_GetNearestWP(hero));
};

FUNC VOID Rtn_Tot_906 ()
{	
	TA_Sit_Campfire 			(05,00,21,00,"TOT");
    TA_Sit_Campfire		(21,00,05,00,"TOT");
};

FUNC VOID Rtn_InCave_906 ()
{	
	TA_Sit_Campfire 			(05,00,21,00,"NW_RITUALFOREST_CAVE_04");
    TA_Sit_Campfire		(21,00,05,00,"NW_RITUALFOREST_CAVE_04");
};

FUNC VOID Rtn_Flucht_906 ()
{	
	TA_FleeTOWP 			(05,00,21,00,"FARM4");
    TA_FleeToWP		(21,00,05,00,"FARM4");
};

FUNC VOID Rtn_NoDemon_906 ()
{	
	TA_Stand_WP 			(05,00,21,00,"NW_LITTLESTONEHENDGE_02");
    TA_Stand_WP		(21,00,05,00,"NW_LITTLESTONEHENDGE_02");
};

FUNC VOID Rtn_Schiff_906()
{	
	TA_Sit_Bench	(08,00,20,00,"SHIP_DECK_25");
	TA_Sit_Bench	(20,00,08,00,"SHIP_DECK_25");
};