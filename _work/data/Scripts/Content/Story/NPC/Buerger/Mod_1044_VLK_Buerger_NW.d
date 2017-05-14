instance Mod_1044_VLK_Buerger_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BUERGER; 
	guild 		= GIL_PAL;
	id 			= 1044;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Herek, BodyTex_N,ITAR_Vlk_M);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1044;
};

FUNC VOID Rtn_PreStart_1044()
{	
	TA_Stand_ArmsCrossed		(05,00,08,00,"NW_CITY_MERCHANT_PATH_15");
	TA_Listen_Monty			(08,00,20,00,"WP_MONTY_BLUBBER_03");
	TA_Smalltalk			(20,00,03,50,"NW_CITY_MERCHANT_STAND_01");
	TA_Smalltalk			(03,50,05,00,"NW_CITY_TAVERN_IN_06");
};

FUNC VOID Rtn_Start_1044()
{	
	TA_Stand_ArmsCrossed	(05,00,20,00,"NW_CITY_MERCHANT_PATH_15");
	TA_Smalltalk			(20,00,03,50,"NW_CITY_MERCHANT_STAND_01");
    TA_Smalltalk			(03,50,05,00,"NW_CITY_TAVERN_IN_06");
};

FUNC VOID Rtn_Daemonisch_1044 ()
{
	TA_Stand_Eating	(08,00,23,00,"NW_CITY_TAVERN_IN_04");
	TA_Stand_Eating	(23,00,08,00,"NW_CITY_TAVERN_IN_04");	
};
