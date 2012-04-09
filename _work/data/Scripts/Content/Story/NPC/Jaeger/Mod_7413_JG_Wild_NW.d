instance Mod_7413_JG_Wild_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wild"; 
	guild 		= GIL_OUT;
	id 			= 7413;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																		
	EquipItem (self, ItRw_Bow_L_03); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Asghan, BodyTex_N,ITAR_Leather_L);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7413;
};

FUNC VOID Rtn_Start_7413 ()
{	
	TA_Sit_Bench 		(06,00,23,00,"NW_TAVERNE_TROLLAREA_MONSTER_02_01"); 
	TA_Sleep		(23,00,06,00,"WP_DRAGO_LAGER_02");
};

FUNC VOID Rtn_AtNandor_7413 ()
{	
	TA_Sit_Campfire 		(08,00,23,00,"WP_NANDOR_TENT_01"); 
    TA_Sit_Campfire			(23,00,08,00,"WP_NANDOR_TENT_01");
};