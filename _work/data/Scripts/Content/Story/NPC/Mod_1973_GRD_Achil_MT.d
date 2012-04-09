INSTANCE Mod_1973_GRD_Achil_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Achil";
	guild 		= GIL_out;
	id 			= 1973;
	voice 		= 08;
	flags       = 0;																	
	npctype		= NPCTYPE_main;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																				
	EquipItem (self, ItRw_Bow_L_03); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_NormalBart_Dexter, BodyTex_N, grd_armor_m);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 45); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1973;
};

FUNC VOID Rtn_Start_1973 ()
{	
	TA_Sit_Campfire		(08,00,20,00,"WP_MT_HECTA_UND_ACHIL");
	TA_Sit_Campfire	(20,00,08,00,"WP_MT_HECTA_UND_ACHIL");
};

FUNC VOID Rtn_Flucht_1973 ()
{	
	TA_FleeToWP		(08,00,20,00,"TOT");
	TA_FleeToWP	(20,00,08,00,"TOT");
};