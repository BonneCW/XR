instance Mod_575_NONE_Fenia_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Fenia";	//Halvors Frau
	guild 		= GIL_PAL;
	id 			= 575;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self, ItMw_1h_Bau_Mace);
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", FaceBabe_N_GreyCloth, BodyTex_N, ITAR_VlkBabe_M_6);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_575;
};

FUNC VOID Rtn_Start_575 ()
{	
	TA_Stand_Guarding		(04,55,20,05,"NW_CITY_PATH_HABOUR_03_01");
    TA_Stomp_Herb 			(20,05,22,05,"NW_CITY_HABOUR_POOR_AREA_PATH_01");
    TA_Sleep	 			(22,05,04,55,"NW_CITY_BED_HALVOR_WEIB");
};

FUNC VOID Rtn_Wanzen_575 ()
{	
	TA_Stand_Guarding		(04,55,20,05,"NW_CITY_PATH_HABOUR_03_01");
    TA_Stomp_Herb 			(20,05,22,05,"NW_CITY_HABOUR_POOR_AREA_PATH_01");
    TA_Pick_FP	 			(22,05,04,55,"NW_CITY_POOR_SMITH_SHARP");
};