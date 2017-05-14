instance Mod_752_NONE_Sonja_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Sonja";	
	guild 		= GIL_PAL;
	id 			= 752;
	voice		= 0;
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
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe6", FaceBabe_L_Charlotte2, BodyTexBabe_L, ITAR_VlkBabe_H);	

	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_752;
};

FUNC VOID Rtn_Start_752 ()
{	
	TA_Sit_Throne	(08,00,23,00,"NW_CITY_PUFF_THRONE"); 
    TA_Sit_Throne	(23,00,08,00,"NW_CITY_PUFF_THRONE");
};

FUNC VOID Rtn_Bartok_752()
{
	TA_Smalltalk	(08,00,22,00,"NW_CITY_HABOUR_PUFF_PECK");
	TA_Smalltalk	(22,00,08,00,"NW_CITY_HABOUR_PUFF_PECK");
};

FUNC VOID Rtn_Erpressung_752()
{
	TA_Smalltalk	(08,00,22,00,"NW_CITY_HABOUR_HUT_03_IN");
	TA_Smalltalk	(22,00,08,00,"NW_CITY_HABOUR_HUT_03_IN");
};

FUNC VOID Rtn_Sex_752()
{
	TA_Stand_ArmsCrossed	(08,00,22,00,"NW_CITY_HABOUR_PUFF_NADJA");
	TA_Stand_ArmsCrossed	(22,00,08,00,"NW_CITY_HABOUR_PUFF_NADJA");
};