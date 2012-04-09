instance DemonKnight_01 (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dämonenritter";	
	guild 		= GIL_OUT;
	id 			= 1939;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_main;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1h_Mil_Sword);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Drax, BodyTex_N, ITAR_Raven_Addon);	
	Mdl_SetModelFatness	(self,-1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1939;
};

FUNC VOID Rtn_Start_1939()
{	
	TA_Smalltalk_Plaudern	(05,00,20,15,"OW_PATH_1_15");
    TA_Smalltalk_Plaudern	(20,15,22,15,"OW_PATH_1_15");
    TA_Smalltalk_Plaudern	(22,15,00,15,"OW_PATH_1_15");
    TA_Smalltalk_Plaudern	(00,15,02,15,"OW_PATH_1_15");
    TA_Smalltalk_Plaudern	(02,15,04,15,"OW_PATH_1_15");
    TA_Smalltalk_Plaudern	(04,15,05,00,"OW_PATH_1_15");
};

FUNC VOID Rtn_AltesLager_1939()
{	
	TA_RunToWP	(08,00,23,00,"OC1");
    TA_RunToWP	(23,00,08,00,"OC1");
};
