instance Mod_593_NONE_Lucy_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lucy"; //Alwins Frau
	guild 		= GIL_PAL;
	id 			= 593;
	voice		= 43;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self, ItMw_1h_Bau_Mace);	
	// ------ visuals ------						FaceBabe_N_HairAndCloth																
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", FaceBabe_N_Anne, BodyTex_N, ITAR_BauBabe_L);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_593;
};

FUNC VOID Rtn_Start_593 ()
{	
	TA_Rake_FP 			(05,00,19,00,"NW_CITY_PICK_02");
	TA_Cook_Stove		(19,00,22,00,"NW_CITY_HABOUR_HUT_07_IN");
	TA_Sleep			(22,00,05,00,"NW_CITY_HABOUR_HUT_07_BED_01");
};

FUNC VOID Rtn_LobartAlwin_593 ()
{
	TA_Smalltalk_Plaudern	(08,00,20,00,"WP_ALWIN_SEQUENZ");
	TA_Smalltalk_Plaudern	(20,00,08,00,"WP_ALWIN_SEQUENZ");
};