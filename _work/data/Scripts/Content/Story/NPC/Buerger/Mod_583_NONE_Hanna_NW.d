instance Mod_583_NONE_Hanna_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Hanna";
	guild 		= GIL_PAL;
	id 			= 583;
	voice		= 21;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------						FaceBabe_N_HairAndCloth																
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", FaceBabe_N_WhiteCloth, BodyTex_N, ITAR_VlkBabe_L_5);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_583;
};

FUNC VOID Rtn_Start_583 ()
{
	TA_Stand_ArmsCrossed	(08,00,22,00,"NW_CITY_HANNA");
	TA_Stand_ArmsCrossed	(22,00,08,00,"NW_CITY_HANNA");
};

FUNC VOID Rtn_TagPause_583 ()
{
	TA_Stand_ArmsCrossed	(08,00,10,55,"NW_CITY_HANNA");
	TA_RunToWP		(10,55,11,25,"NW_CITY_MAINSTREET_05");
	TA_Stand_ArmsCrossed	(11,25,08,00,"NW_CITY_HANNA");
};

FUNC VOID Rtn_Knast_583 ()
{
	TA_Stand_ArmsCrossed		(08,00,22,00,"NW_CITY_HABOUR_KASERN_RENGARU");
	TA_Stand_ArmsCrossed		(22,00,08,00,"NW_CITY_HABOUR_KASERN_RENGARU");
};