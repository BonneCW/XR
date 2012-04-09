instance Mod_7115_NONE_Nadja_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Nadja";	
	guild 		= GIL_PAL;
	id 			= 7115;
	voice 		= 16;
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
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_Hure, BodyTex_N, ITAR_BuergerinNew_01);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7115;
};

FUNC VOID Rtn_Down_7115 ()
{	
	TA_Stand_Drinking	(05,00,17,00,"NW_PUFF_DANCE");
	TA_Dance			(17,00,21,00,"NW_PUFF_DANCE");
	TA_Stand_Drinking	(21,00,21,30,"NW_PUFF_DANCE");
    TA_Dance			(21,30,05,00,"NW_PUFF_DANCE");
};

FUNC VOID Rtn_Start_7115 ()
{	
	TA_Smalltalk	(08,00,23,00,"NW_CITY_HABOUR_PUFF_PECK");
  	TA_Smalltalk	(23,00,08,00,"NW_CITY_HABOUR_PUFF_PECK");
};

FUNC VOID Rtn_Erpressung_7115()
{
	TA_Smalltalk	(08,00,22,00,"NW_CITY_HABOUR_HUT_03_IN");
	TA_Smalltalk	(22,00,08,00,"NW_CITY_HABOUR_HUT_03_IN");
};
