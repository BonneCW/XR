INSTANCE Mod_7100_ASS_Zahit_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Zahit"; 
	guild 		= GIL_OUT;
	id 			= 7100;
	voice		= 0;
	flags       = 2;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Assassinenschwert);														
	EquipItem	(self, ItRw_Assassinenbogen);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal_Sharky, BodyTex_B,ITAR_Assassine_01);	
	Mdl_SetModelFatness	(self,0);
	//Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds");
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7100;
};

FUNC VOID Rtn_Start_7100()
{	
	TA_Stand_Guarding 	(07,20,01,20,"WP_ASSASSINE_13");
	TA_Stand_Guarding	(01,20,07,20,"WP_ASSASSINE_13");
};

FUNC VOID Rtn_Austausch_7100 ()
{	
	TA_Stand_ArmsCrossed	(08,00,23,00,"NW_CITY_MERCHANT_PATH_15");
	TA_Sleep		(23,00,08,00,"NW_CITY_HOTEL_BED_07");
};

FUNC VOID Rtn_Tot_7100()
{	
	TA_Stand_Guarding 	(07,20,01,20,"TOT");
	TA_Stand_Guarding	(01,20,07,20,"TOT");
};