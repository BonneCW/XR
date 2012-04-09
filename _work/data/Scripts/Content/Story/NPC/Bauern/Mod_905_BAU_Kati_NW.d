instance Mod_905_BAU_Kati_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Kati";
	guild 		= GIL_NONE;
	id 			= 905;
	voice 		= 16;
	flags       = 0;	//Joly:nur solange Alnveres da ist!																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_Lilo, BodyTexBabe_N, ITAR_BauBabe_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_905;
};

FUNC VOID Rtn_PreStart_905 ()
{	
	TA_Sleep			(05,00,23,59,"NW_FARM2_HOUSE_IN_02");
	TA_Sleep			(23,59,05,00,"NW_FARM2_HOUSE_IN_02");
};

FUNC VOID Rtn_Start_905 ()
{	
	TA_Cook_Stove		(05,00,10,00,"NW_FARM2_HOUSE_IN_04");
    TA_Sit_Bench		(10,00,12,00,"NW_FARM2_BENCH_02");
   	TA_Cook_Stove		(12,00,20,55,"NW_FARM2_HOUSE_IN_04");
    TA_Roast_Scavenger 	(20,55,23,59,"NW_FARM2_BBQ");
    TA_Sleep			(23,59,05,00,"NW_FARM2_HOUSE_IN_02");
};

FUNC VOID Rtn_Tot_905 ()
{	
	TA_Sleep			(05,00,23,59,"TOT");
	TA_Sleep			(23,59,05,00,"TOT");
};