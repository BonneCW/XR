instance Mod_1046_VLK_Buerger_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BUERGER; 
	guild 		= GIL_PAL;
	id 			= 1046;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Asghan, BodyTex_N,ITAR_Vlk_H);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1046;
};

FUNC VOID Rtn_Start_1046()
{	
	TA_Smalltalk	(06,05,20,15,"NW_CITY_MERCHANT_SHOP01_FRONT_03_C");
	TA_Sleep		(20,15,06,05,"NW_CITY_LEOMAR_BED_07"); 
};

FUNC VOID Rtn_Daemonisch_1046 ()
{	
	TA_Stand_Drinking 	(08,00,22,00,"NW_TAVERNE_IN_01"); 
	TA_Stand_Drinking		(22,00,08,00,"NW_TAVERNE_IN_01");
};
