INSTANCE Mod_7781_SNOV_Novize_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Novize;
	guild 		= GIL_OUT;
	id 			= 7781;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_sNov_Mace);														
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal04, BodyTex_N, ITAR_NOV_DMB_01);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 25); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7781;
};

FUNC VOID Rtn_Start_7781 ()
{
	TA_Smalltalk_Plaudern 	(07,20,01,20,"NW_CITY_HABOUR_13");
	TA_Smalltalk_Plaudern	(01,20,07,20,"NW_CITY_HABOUR_13");
};

FUNC VOID Rtn_Lagerhaus_7781 ()
{
	TA_RunToWP	 	(07,20,01,20,"NW_CITY_HABOUR_HUT_03_IN_07");
	TA_RunToWP		(01,20,07,20,"NW_CITY_HABOUR_HUT_03_IN_07");
};

FUNC VOID Rtn_Tot_7781 ()
{
	TA_RunToWP	 	(07,20,01,20,"TOT");
	TA_RunToWP		(01,20,07,20,"TOT");
};