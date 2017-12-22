INSTANCE Mod_522_NONE_Vanja_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Vanja";
	guild 		= GIL_PAL;
	id 			= 522;
	voice		= 43;
	flags       = 0;				
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;
	
	// ------ Equippte Waffen ------		
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------				
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", FaceBabe_B_RedLocks, BodyTexBabe_B, ITAR_VlkBabe_M);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 20); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_522;
};

FUNC VOID Rtn_Start_522()
{
	TA_Dance	(20,00,08,00,"NW_PUFF_DANCE");
	TA_Dance	(08,00,20,00,"NW_PUFF_DANCE");
};

FUNC VOID Rtn_Erpressung_522()
{
	TA_Smalltalk	(08,00,22,00,"NW_CITY_HABOUR_HUT_03_IN");
	TA_Smalltalk	(22,00,08,00,"NW_CITY_HABOUR_HUT_03_IN");
};