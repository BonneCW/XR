instance Mod_7168_HEX_Hexe_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_hexe;	
	guild 		= GIL_OUT;
	id 			= 7168;
	voice		= 43;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_BabeHair", FaceBabe_N_HairAndCloth, BodyTex_N, ITAR_hexe);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7168;
};

FUNC VOID Rtn_Start_7168 ()
{	
	TA_Sweep_FP	(06,30,08,00,"NW_FARM2_HOUSE_IN_03");
    TA_Sweep_FP		(08,00,06,30,"NW_FARM2_HOUSE_IN_03");
};

FUNC VOID Rtn_AtDemon_7168 ()
{	
	TA_Sit_Campfire		(08,00,22,00,"NW_CASTLEMINE_TOWER_CAMPFIRE_04");
  	TA_Sit_Campfire		(22,00,08,00,"NW_CASTLEMINE_TOWER_CAMPFIRE_04");
};

FUNC VOID Rtn_AtBengar_7168 ()
{	
	TA_Pick_FP		(08,00,22,00,"NW_FARM3_FIELD_01");
  	TA_Sit_Chair		(22,00,08,00,"NW_FARM3_HOUSE_IN_3");
};

FUNC VOID Rtn_AtTaverne_7168()
{	
	TA_Sit_Chair		(20,00,08,00,"NW_TAVERNE_IN_RANGERMEETING");
	TA_Sit_Chair		(08,00,20,00,"NW_TAVERNE_IN_RANGERMEETING");
};
