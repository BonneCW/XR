INSTANCE Mod_7199_ASS_Amir_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Amir"; 
	guild 		= GIL_OUT;
	id 			= 7199;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);															
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_Katana);														
	EquipItem	(self, ItRw_Runenbogen);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Mordrag, BodyTex_N,ITAR_Vlk_H);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7199;
};

FUNC VOID Rtn_Start_7199 ()
{	
	TA_Stand_ArmsCrossed	(08,00,23,00,"NW_CITY_MERCHANT_PATH_15");
	TA_Stand_ArmsCrossed		(23,00,08,00,"NW_CITY_MERCHANT_PATH_15");
};

FUNC VOID Rtn_Lehmar_7199 ()
{	
	TA_Stand_ArmsCrossed	(08,00,23,00,"NW_CITY_TO_LIGHTHOUSE_01");
	TA_Stand_ArmsCrossed	(23,00,08,00,"NW_CITY_TO_LIGHTHOUSE_01");
};

FUNC VOID Rtn_Versteck_7199 ()
{	
	TA_Guide_Player	(08,00,23,00,"WP_ASSASSINE_13");
	TA_Guide_Player	(23,00,08,00,"WP_ASSASSINE_13");
};

FUNC VOID Rtn_Austausch_7199()
{	
	TA_Stand_Guarding 	(07,20,01,20,"WP_ASSASSINE_13");
	TA_Stand_Guarding	(01,20,07,20,"WP_ASSASSINE_13");
};

FUNC VOID Rtn_Tot_7199()
{	
	TA_Stand_Guarding 	(07,20,01,20,"TOT");
	TA_Stand_Guarding	(01,20,07,20,"TOT");
};