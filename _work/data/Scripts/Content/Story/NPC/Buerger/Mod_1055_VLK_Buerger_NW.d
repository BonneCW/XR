instance Mod_1055_VLK_Buerger_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BUERGER; 
	guild 		= GIL_PAL;
	id 			= 1055;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Normal_GorNaBar, BodyTex_L,ITAR_Vlk_M);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1055;
};

FUNC VOID Rtn_PreStart_1055()
{	
	TA_Listen_Monty			(08,00,20,00,"NW_CITY_HABOUR_POOR_AREA_01_B");
	TA_Smalltalk			(20,00,03,00,"NW_CITY_HABOUR_03");
	TA_Sit_Throne			(03,00,05,00,"NW_CITY_PUFF_THRONE");
	TA_Smalltalk			(05,00,08,00,"NW_CITY_WAY_TO_SHIP_01");
};

FUNC VOID Rtn_Start_1055()
{	
	TA_Stand_ArmsCrossed	(11,00,19,00,"NW_CITY_WATCH_FIGHT_02");
    TA_Smalltalk			(19,00,03,00,"NW_CITY_HABOUR_03");
    TA_Sit_Throne			(03,00,05,00,"NW_CITY_PUFF_THRONE");
    TA_Smalltalk			(05,00,11,00,"NW_CITY_WAY_TO_SHIP_01");
};
