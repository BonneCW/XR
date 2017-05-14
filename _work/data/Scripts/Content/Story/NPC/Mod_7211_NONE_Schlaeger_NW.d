instance Mod_7211_NONE_Schlaeger_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Schläger";
	guild 		= GIL_OUT;
	id 			= 7211;
	voice		= 0;
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
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Weak_Cipher_alt, BodyTex_N, ITAR_Sld_L);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7211;
};

FUNC VOID Rtn_Start_7211 ()
{	
	TA_Smalltalk_Plaudern	(18,00,06,00,"NW_CITY_KANAL_14");
	TA_Smalltalk_Plaudern	(06,00,18,00,"TOT");
};

FUNC VOID Rtn_Tot_7211()
{	
	TA_Sit_Bench	(08,00,20,00,"NW_CANTHARINSEL_22");
	TA_Sit_Bench	(20,00,08,00,"NW_CANTHARINSEL_22");
};