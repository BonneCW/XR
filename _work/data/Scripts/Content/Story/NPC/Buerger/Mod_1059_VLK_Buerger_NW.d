instance Mod_1059_VLK_Buerger_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Buerger; 
	guild 		= GIL_PAL;
	id 			= 1059;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ AIVARs ------
	aivar[AIV_ToughGuy] 			= TRUE;	
	aivar[AIV_ToughGuyNewsOverride] = TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Herek, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1059;
};

FUNC VOID Rtn_PreStart_1059()
{	
	TA_Listen_Monty		(08,00,20,00,"WP_MONTY_BLUBBER_01");
	TA_Smalltalk		(20,00,03,05,"NW_CITY_HABOUR_04");
	TA_Stand_Drinking	(03,05,05,05,"NW_CITY_HABOUR_PUFF_IN_01");
	TA_Smalltalk		(05,05,08,00,"NW_CITY_HABOUR_POOR_AREA_01");
};

FUNC VOID Rtn_Start_1059()
{	
	TA_Stand_ArmsCrossed	(10,55,18,50,"NW_CITY_WATCH_FIGHT_02");
    TA_Smalltalk			(18,50,03,05,"NW_CITY_HABOUR_04");
    TA_Stand_Drinking		(03,05,05,05,"NW_CITY_HABOUR_PUFF_IN_01");
	TA_Smalltalk			(05,05,10,05,"NW_CITY_HABOUR_POOR_AREA_01");
};
