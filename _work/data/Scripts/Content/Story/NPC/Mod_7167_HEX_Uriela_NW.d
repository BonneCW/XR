instance Mod_7167_HEX_Uriela_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Uriela";	
	guild 		= GIL_OUT;
	id 			= 7167;
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
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", FaceBabe_N_Anne, BodyTex_N, ITAR_hexe);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7167;
};

FUNC VOID Rtn_Start_7167 ()
{	
    TA_Cook_Stove 	(08,00,10,00,"NW_FARM2_HOUSE_IN_04");
    TA_Cook_Stove 	(10,00,08,00,"NW_FARM2_HOUSE_IN_04");
    
};

FUNC VOID Rtn_AtDemon_7167 ()
{	
	TA_Circle		(08,00,22,00,"NW_CASTLEMINE_01");
  	TA_Circle		(22,00,08,00,"NW_CASTLEMINE_01");
};

FUNC VOID Rtn_AtBengar_7167 ()
{	
	TA_Smalltalk		(08,00,22,00,"NW_FARM3_BENGAR");
  	TA_Sleep		(22,00,08,00,"NW_FARM3_HOUSE_IN_BED");
};

FUNC VOID Rtn_AtTaverne_7167()
{	
	TA_Sit_Chair		(20,00,08,00,"NW_TAVERNE_IN_RANGERMEETING");
	TA_Sit_Chair		(08,00,20,00,"NW_TAVERNE_IN_RANGERMEETING");
};

FUNC VOID Rtn_Schiff_7167 ()
{	
    TA_Cook_Stove 	(08,00,10,00,"SHIP_IN_30");
    TA_Cook_Stove 	(10,00,08,00,"SHIP_IN_30");
    
};
