INSTANCE Mod_1548_PIR_Samuel_DI (Npc_Default)
{
	// ------ NSC ------
	name 		= "Samuel";
	guild 		= GIL_out;
	id 			= 1548;
	voice 		= 14;
	flags       = FALSE;											
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1H_Mace_L_03);
	
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBAld", Face_B_Saturas, BodyTex_B, ITAR_PIR_L_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1548;
};

FUNC VOID Rtn_Start_1548 ()
{	
	TA_Potion_Alchemy	(06,00,08,00,"WP_DI_MAGIERAUM_INSIDE");
	TA_Stand_Drinking	(08,00,10,00,"WP_DI_ENTRANCE_MAGIERKELLER");
	TA_Potion_Alchemy	(10,00,12,00,"WP_DI_MAGIERAUM_INSIDE");
	TA_Stand_Drinking	(12,00,14,00,"WP_DI_ENTRANCE_MAGIERKELLER");
	TA_Potion_Alchemy	(14,00,16,00,"WP_DI_MAGIERAUM_INSIDE");
	TA_Stand_Drinking	(16,00,18,00,"WP_DI_ENTRANCE_MAGIERKELLER");
	TA_Potion_Alchemy	(18,00,20,00,"WP_DI_MAGIERAUM_INSIDE");
	TA_Stand_Drinking	(20,00,22,00,"WP_DI_ENTRANCE_MAGIERKELLER");

	TA_Potion_Alchemy	(22,00,06,00,"WP_DI_MAGIERAUM_INSIDE");
};