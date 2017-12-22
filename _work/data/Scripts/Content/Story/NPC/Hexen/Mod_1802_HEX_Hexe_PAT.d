instance Mod_1802_HEX_Hexe_PAT (Npc_Default)
{
	// ------ NSC ------
	name 		= name_hexe;
	guild 		= GIL_strf;
	id 			= 1802;
	voice		= 43;
	flags       = 0;	//Joly:nur solange Alnveres da ist!																	
	npctype		= NPCTYPE_pat_hexe;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_strong;	
	
	// ------ Equippte Waffen ------																	
	//EquipItem			(self, ItMw_1h_Bau_Axe);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_Lilo, BodyTexBabe_N, ITAR_hexe);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1802;
};

FUNC VOID Rtn_PreStart_1802 ()
{	
	TA_stand_Wp		(05,00,23,59,"WP_PAT_LAGER_03_01");
    TA_Stand_WP			(23,59,05,00,"WP_PAT_LAGER_03_01");
};