instance Mod_7480_OUT_Wendel_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wendel"; 
	guild 		= GIL_OUT;
	id 			= 7480;
	voice		= 0;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_BaalNetbek, BodyTex_N, ITAR_Wendel);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7480;
};

FUNC VOID Rtn_Start_7480()
{	
	TA_Smalltalk	(22,00,08,00,"REL_CITY_199");
	TA_Smalltalk	(08,00,12,00,"WASSERANLAGE_03");
	TA_Smalltalk	(12,00,16,00,"REL_CITY_336");
	TA_Smalltalk	(16,00,22,00,"REL_CITY_363");
};

FUNC VOID Rtn_Endres_7480 ()
{	
	TA_Stand_ArmsCrossed	(05,30,20,30,"REL_CITY_366");
	TA_Stand_ArmsCrossed	(20,30,05,30,"REL_CITY_366");
};

FUNC VOID Rtn_Stadthalter_7480()
{	
	TA_Sit_Throne	(08,00,23,00,"RATHAUSUNENTBURGERMEISTER");
	TA_Pick_FP	(23,00,02,00,"REL_CITY_255");
	TA_Sit_Chair	(02,00,08,00,"REL_CITY_026");
};

FUNC VOID Rtn_Verhandlung_7480()
{	
	TA_Smalltalk_Plaudern	(08,00,23,00,"RATHAUSUNTEN_01");
	TA_Smalltalk_Plaudern	(23,00,08,00,"RATHAUSUNTEN_01");
};

FUNC VOID Rtn_Andre_7480 ()
{
	TA_Sit_Chair	(08,00,23,00,"REL_CITY_026");
	TA_Sit_Chair	(23,00,08,00,"REL_CITY_026");
};