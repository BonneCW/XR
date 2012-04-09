instance Mod_598_MIL_Mika_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Mika";	
	guild 		= GIL_PAL;	//Joly: Wenn GIL_OUT Probleme macht, bitte mir Bescheid geben!!!  Björn
	id 			= 598;
	voice 		= 12;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
	aivar[AIV_ToughGuy]		= TRUE;		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Milizschwert);
	CreateInvItems (self, ItPo_Health_01, 4);	//Joly: damit er frisch bei Farm2 ankommt.								
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	CreateInvItems	(self, ItWr_Lehrling01, 1);
	CreateInvItems	(self, ItWr_Lehrling02, 1);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fatbald", Face_L_ToughBart_Quentin, BodyTex_L, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_598;
};

FUNC VOID Rtn_Start_598 ()
{	
	TA_Stand_Guarding	(08,00,22,00,"NW_CITY_TO_FOREST_01");
	TA_Stand_Guarding	(22,00,08,00,"NW_CITY_TO_FOREST_01");
};

FUNC VOID Rtn_Mord_598 ()
{	
	TA_RunToWP	(08,00,22,00,"NW_CITY_TO_FOREST_04_05");
	TA_RunToWP	(22,00,08,00,"NW_CITY_TO_FOREST_04_05");
};

FUNC VOID Rtn_Hehler_598 ()
{	
	TA_Stand_Guarding	(04,00,23,00,"NW_CITY_TO_FOREST_01");
	TA_Smalltalk	(23,00,04,00,"NW_CITY_HEROLD_02");
};

FUNC VOID Rtn_Flucht_598 ()
{	
	TA_FleeToWP	(08,00,22,00,"WP_ASSASSINE_08");
	TA_FleeToWP	(22,00,08,00,"WP_ASSASSINE_08");
};

FUNC VOID Rtn_Tot_598 ()
{	
	TA_RunToWP	(08,00,22,00,"TOT");
	TA_RunToWP	(22,00,08,00,"TOT");
};