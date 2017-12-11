instance Mod_7192_VLK_Buergerin_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "aufgebrachte Frau";	
	guild 		= GIL_PAL;
	id 			= 7192;
	voice		= 19;
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
	EquipItem (self, ItMw_1H_quantarie_Schwert_01);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_BabeHair", FaceBabe_N_HairAndCloth, BodyTex_N, ITAR_VlkBabe_L);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7192;
};

FUNC VOID Rtn_Start_7192 ()
{	
	TA_Stand_ArmsCrossed	(05,00,17,00,"NW_CITY_MERCHANT_PATH_36_B");
	TA_Stand_ArmsCrossed	(17,00,05,00,"NW_CITY_MERCHANT_PATH_36_B");
};

FUNC VOID Rtn_Flucht_7192 ()
{	
	TA_FleeToWP	(05,00,17,00,"TOT");
	TA_FleeToWP	(17,00,05,00,"TOT");
};
