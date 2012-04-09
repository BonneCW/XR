instance Mod_1260_RIT_Neron_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Neron";
	guild 		= GIL_PAL;
	id 			= 1260;
	voice 		= 4;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Schwert_02);
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart02, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1260;
};

FUNC VOID Rtn_Start_1260 ()
{
	TA_Stand_Guarding	(08,00,23,00,"NW_CITY_WAY_TO_SHIP_02");
    TA_Stand_Guarding	(23,00,08,00,"NW_CITY_WAY_TO_SHIP_02");	
};

FUNC VOID Rtn_Laterne_1260 ()
{
	TA_Stand_Guarding	(08,00,23,00,"WP_NERON_01");
    TA_Stand_Guarding	(23,00,08,00,"WP_NERON_01");	
};
