INSTANCE Mod_759_NONE_Dragomir_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dragomir";
	guild 		= GIL_NONE;
	id 			= 759;
	voice 		= 12;
	flags       = 2;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	EquipItem 	(self,itRw_Mil_Crossbow); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Tough_Lee_ähnlich, BodyTex_N, ITAR_Leather_L);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_759;
};

FUNC VOID Rtn_Start_759 ()
{	
	TA_Sit_Bench 		(08,00,23,00,"NW_TAVERNE_TROLLAREA_MONSTER_02_01"); 
    TA_Sit_Bench			(23,00,08,00,"NW_TAVERNE_TROLLAREA_MONSTER_02_01");
};

FUNC VOID Rtn_AtNandor_759 ()
{	
	TA_Sit_Campfire 		(08,00,23,00,"WP_NANDOR_TENT_01"); 
    TA_Sit_Campfire			(23,00,08,00,"WP_NANDOR_TENT_01");
};