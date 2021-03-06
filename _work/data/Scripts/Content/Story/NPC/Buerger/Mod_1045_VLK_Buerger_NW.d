instance Mod_1045_VLK_Buerger_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BUERGER; 
	guild 		= GIL_PAL;
	id 			= 1045;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Lefty, BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1045;
};

FUNC VOID Rtn_Start_1045()
{	
	TA_Smalltalk	(06,10,13,00,"NW_CITY_MERCHANT_SHOP01_FRONT_03");
    TA_Smalltalk	(13,00,14,02,"NW_CITY_MAINSTREET_05");
    TA_Smalltalk	(14,02,17,00,"NW_CITY_MERCHANT_SHOP01_FRONT_03");
    TA_Smalltalk	(17,00,18,02,"NW_CITY_MAINSTREET_05");
    TA_Smalltalk	(18,02,20,10,"NW_CITY_MERCHANT_SHOP01_FRONT_03");
	TA_Sit_Chair	(20,10,06,10,"NW_CITY_TAVERN_IN_05");
};

FUNC VOID Rtn_Daemonisch_1045 ()
{
	TA_Stand_Eating	(08,00,23,00,"NW_CITY_TAVERN_IN_04");
	TA_Stand_Eating	(23,00,08,00,"NW_CITY_TAVERN_IN_04");	
};
