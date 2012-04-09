instance Mod_108_BAU_Pardos_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Pardos"; 
	guild 		= GIL_NONE;
	id 			= 108;
	voice 		= 3;
	flags       = 0;							
	npctype		= NPCTYPE_MAIN;
	
	//aivars 
	aivar[AIV_IgnoresArmor] = TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMW_Sense_01);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Asghan, BodyTex_N, ITAR_BAU_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_108;
};

FUNC VOID Rtn_Start_108 ()
{	
	TA_Pick_FP	(07,00,18,00, "NW_FARM3_FIELD_04");
	TA_Sit_Campfire	(18,00,07,00, "NW_FARM3_STABLE_REST_01");
};

FUNC VOID Rtn_Unheil_108 ()
{	
	TA_Sit_Chair (00,00,12,00, "NW_TAVERNE_IN_RANGERMEETING");
	TA_Sit_Chair (12,00,00,00, "NW_TAVERNE_IN_RANGERMEETING");
};