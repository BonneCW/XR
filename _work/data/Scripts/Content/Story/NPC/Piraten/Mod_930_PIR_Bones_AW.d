INSTANCE Mod_930_PIR_Bones_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bones";
	guild 		= GIL_NONE;
	id 			= 930;
	voice		= 0;
	flags       = 0;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_BOnesAxt);
	
	// ------ Inventory ------
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart10, BodyTex_N, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1.3);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_930;
};

FUNC VOID Rtn_Start_930 ()
{	
	TA_Practice_Sword 	(06,55,11,55,"ADW_PIRATECAMP_TRAIN_01");
	TA_Stand_Eating	 	(11,55,12,25,"WP_PIR_04");
	TA_Sit_Campfire	 	(12,25,13,25,"WP_PIR_04");
	TA_Stand_Drinking 	(13,25,13,55,"WP_PIR_04");
	TA_Practice_Sword 	(13,55,19,55,"ADW_PIRATECAMP_TRAIN_01");
	TA_Stand_Drinking	(19,55,20,55,"WP_PIR_04");
	TA_Sit_Campfire		(20,55,00,55,"WP_PIR_04");
	TA_Stand_Drinking	(00,55,01,55,"WP_PIR_04");
	TA_Sit_Campfire		(01,55,06,55,"WP_PIR_04");
};

FUNC VOID Rtn_Befreiung_930 ()
{	
	TA_Sit_Campfire		(20,55,00,55,"WP_PIR_02");
	TA_Sit_Campfire		(00,55,20,55,"WP_PIR_02");
};

FUNC VOID Rtn_Sammeln_930 ()
{	
	TA_Stand_WP			(08,00,20,00,"ADW_PIRATECAMP_WAY_02");
	TA_Stand_WP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_02");
};

FUNC VOID Rtn_Artefakt_930 ()
{	
	TA_RunToWP			(08,00,20,00,"ADW_PIRATECAMP_WAY_06");
	TA_RunToWP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_06");
};

FUNC VOID Rtn_Beerdigung_930 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"ADW_PIRATECAMP_BEACH_13");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"ADW_PIRATECAMP_BEACH_13");
};

FUNC VOID Rtn_Tot_930 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"TOT");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"TOT");
};