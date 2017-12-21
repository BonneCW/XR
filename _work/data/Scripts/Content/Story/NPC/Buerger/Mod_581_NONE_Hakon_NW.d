instance Mod_581_NONE_Hakon_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Hakon";
	guild 		= GIL_PAL;
	id 			= 581;
	voice		= 3;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_HakonSchwert_02);
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart20, BodyTex_N, ITAR_BuergerNew_01);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50);
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_581;
};

FUNC VOID Rtn_Start_581 ()
{	
	TA_Stand_ArmsCrossed	(05,10,00,10,"NW_CITY_HAKON");
        TA_Sleep				(00,10,05,10,"NW_CITY_HOTEL_BED_04");
};

FUNC VOID Rtn_RunAway_581()
{	
	TA_FleeToWP 	(08,00,23,00,"NW_CITY_MERCHANT_TAVERN01_IN_01");
    TA_FleeToWP		(23,00,08,00,"NW_CITY_MERCHANT_TAVERN01_IN_01"); 
};

FUNC VOID Rtn_Follow_581 ()
{	
	TA_Follow_Player	(05,10,00,10,"NW_CITY_HAKON");
        TA_Follow_Player	(00,10,05,10,"NW_CITY_HAKON");
};