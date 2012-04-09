instance Mod_978_RIT_Marcos_NW  (Npc_Default)
{
	// ------ NSC ------
	name 		= "Marcos";
	guild 		= GIL_PAL;
	id 			= 978;
	voice 		= 4;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);													
		
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Schwert_02);
	EquipItem			(self, ItRw_Mil_Crossbow);
	
	// ------ Inventory ------
	
	CreateInvItems (self, ItPo_Health_03,5);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_Tough_Rodriguez, BodyTex_P, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_978;
};

FUNC VOID Rtn_Start_978 ()
{	
	TA_Practice_Sword		(08,00,23,00,"NW_CITY_PALCAMP_08");
    TA_Practice_Sword		(23,00,08,00,"NW_CITY_PALCAMP_08");
};

FUNC VOID Rtn_Schiff_978 ()
{	
	TA_Practice_Sword		(08,00,23,00,"SHIP_DECK_07");
    TA_Practice_Sword		(23,00,08,00,"SHIP_DECK_07");
};