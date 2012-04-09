instance Mod_7481_OUT_Monteur_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Monteur"; 
	guild 		= GIL_OUT;
	id 			= 7481;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self,ItMw_1H_quantarie_Schwert_01);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart21, BodyTex_N, ITAR_Monteur);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7481;
};

FUNC VOID Rtn_Start_7481()
{	
	TA_Smalltalk	(22,05,08,05,"REL_CITY_199");
	TA_Smalltalk	(08,05,12,05,"WASSERANLAGE_03");
	TA_Smalltalk	(12,05,16,05,"REL_CITY_336");
	TA_Smalltalk	(16,05,22,05,"REL_CITY_363");
};

FUNC VOID Rtn_Endres_7481 ()
{	
	TA_Stand_ArmsCrossed	(05,30,20,30,"REL_CITY_366");
	TA_Stand_ArmsCrossed	(20,30,05,30,"REL_CITY_366");
};
