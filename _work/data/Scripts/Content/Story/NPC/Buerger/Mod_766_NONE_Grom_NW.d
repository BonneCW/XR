INSTANCE Mod_766_NONE_Grom_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Grom";
	guild 		= GIL_OUT;
	id 			= 766;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_P_Gilbert, BodyTex_P, ITAR_Leather_L);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_766;
};

FUNC VOID Rtn_Start_766 ()
{	
	TA_Stand_Eating		(08,00,23,00,"WP_STAND_GRIMBALD"); 
	TA_Sleep		(23,00,08,00,"NW_CASTLEMINE_TROLL_04_B");
};

FUNC VOID Rtn_AtLager_766 ()
{	
	TA_Saw	 		(08,00,20,00,"NW_CASTLEMINE_TROLL_04_B"); 
	TA_Holzspalten 		(20,00,23,00,"NW_CASTLEMINE_TROLL_04_B"); 
	TA_Sleep		(23,00,08,00,"NW_CASTLEMINE_TROLL_04_B");
};