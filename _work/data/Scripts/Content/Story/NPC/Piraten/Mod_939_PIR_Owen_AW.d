INSTANCE Mod_939_PIR_Owen_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Owen";
	guild 		= GIL_OUT;
	id 			= 939;
	voice 		= 31;
	flags       = 2;															
	npctype		= NPCTYPE_MAIN;
		
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Addon_PIR1hAxe);
	
	// ------ Inventory ------
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal16, BodyTex_N, ITAR_PIR_L_Addon);	  
	Mdl_SetModelFatness	(self, 1.1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_939;
};

FUNC VOID Rtn_Start_939 ()
{	
	TA_Sit_Campfire	(08,00,13,00,"WP_PIR_01");
	TA_Smalltalk_Piraten3	(13,00,17,00,"WP_PIR_02");
	TA_Sit_Campfire	(17,00,20,00,"WP_PIR_01");
	TA_Stand_Eating	(20,00,21,00,"WP_PIR_01");
	TA_Sit_Campfire	(21,00,08,00,"WP_PIR_01");
};

FUNC VOID Rtn_Kidnapped_939 ()
{
	TA_Sit_Campfire	(08,00,20,00,"WP_UNDEAD_08");
	TA_Sit_Campfire	(20,00,08,00,"WP_UNDEAD_08");
};

FUNC VOID Rtn_Bill_939 ()
{
	TA_Follow_Player	(08,00,20,00,"WP_UNDEAD_09");
	TA_Follow_Player	(20,00,08,00,"WP_UNDEAD_09");
};

FUNC VOID Rtn_Greg_939 ()
{
	TA_Smalltalk_Plaudern	(08,00,20,00,"WP_BLA_PIR_01");
	TA_Smalltalk_Plaudern	(20,00,08,00,"WP_BLA_PIR_01");
};

FUNC VOID Rtn_Sammeln_939 ()
{	
	TA_Stand_WP			(08,00,20,00,"ADW_PIRATECAMP_WAY_04");
	TA_Stand_WP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_04");
};

FUNC VOID Rtn_Artefakt_939 ()
{	
	TA_FleeToWP			(08,00,20,00,"ADW_PIRATECAMP_WAY_17");
	TA_FleeToWP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_17");
};

FUNC VOID Rtn_Beerdigung_939 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"ADW_PIRATECAMP_BEACH_13");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"ADW_PIRATECAMP_BEACH_13");
};

FUNC VOID Rtn_Tot_939 ()
{	
	TA_Stand_Guarding 	(05,00,20,00,"TOT");
	TA_Stand_Guarding	(20,00,05,00,"TOT");
};