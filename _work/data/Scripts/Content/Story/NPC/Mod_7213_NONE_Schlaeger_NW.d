instance Mod_7213_NONE_Schlaeger_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Schläger"; 
	guild 		= GIL_OUT;
	id 			= 7213;
	voice 		= 8;
	flags       = 0;							
	npctype		= NPCTYPE_MAIN;
	
	//aivars 
	aivar[AIV_IgnoresArmor]  = TRUE;
	aivar[AIV_ToughGuy] 	 = TRUE; 
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart04, BodyTex_N, ITAR_Sld_L);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7213;
};

FUNC VOID Rtn_Start_7213 ()
{	
	TA_Stand_WP	(18,00,06,00,"NW_CITY_KANAL_14");
	TA_Stand_WP	(06,00,18,00,"TOT");
};

FUNC VOID Rtn_Weg_7213 ()
{	
	TA_Stand_WP	(18,00,06,00,"NW_CITY_KANAL_13");
	TA_Stand_WP	(06,00,18,00,"TOT");
};

FUNC VOID Rtn_Nah_7213 ()
{	
	TA_Stand_WP	(18,00,06,00,"NW_CITY_KANAL_09");
	TA_Stand_WP	(06,00,18,00,"TOT");
};

FUNC VOID Rtn_Tot_7213()
{	
	TA_Smoke_Joint	(08,00,20,00,"NW_CANTHARINSEL_20");
	TA_Smoke_Joint	(20,00,08,00,"NW_CANTHARINSEL_20");
};