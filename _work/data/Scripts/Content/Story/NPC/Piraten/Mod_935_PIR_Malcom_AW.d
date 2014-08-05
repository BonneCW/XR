INSTANCE Mod_935_PIR_Malcom_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Malcom";
	guild 		= GIL_OUT;
	id 			= 935;
	voice 		= 30;
	flags       = 0;															
	npctype		= NPCTYPE_MAIN;
		
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Addon_PIR1hAxe);
	
	// ------ Inventory ------
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Normal_Sly, BodyTex_N, ITAR_PIR_L_Addon);	  
	Mdl_SetModelFatness	(self, 1.1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,10); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_935;
};

FUNC VOID Rtn_Start_935 ()
{	
	TA_Sit_Campfire (06,00,10,00,"ADW_PIRATECAMP_LUMBER_SIT");
	TA_Saw			(10,00,14,00,"ADW_PIRATECAMP_WAY_15");
	TA_Sit_Campfire (14,00,18,00,"ADW_PIRATECAMP_LUMBER_SIT");
	TA_Saw			(18,00,22,00,"ADW_PIRATECAMP_WAY_15");
	TA_Sit_Campfire (22,00,02,00,"ADW_PIRATECAMP_LUMBER_SIT");
	TA_Sit_Campfire	(02,00,06,00,"ADW_PIRATECAMP_LUMBER_SIT");
};

FUNC VOID Rtn_ToJack_935 ()
{	
	TA_Guide_Player		(08,00,20,00,"ADW_PIRATECAMP_WAY_07");
	TA_Guide_Player		(20,00,08,00,"ADW_PIRATECAMP_WAY_07");
};

FUNC VOID Rtn_ToCanyon_935 ()
{	
	TA_Guide_Player		(08,00,20,00,"ADW_CANYON_MINE2_10");
	TA_Guide_Player		(20,00,08,00,"ADW_CANYON_MINE2_10");
};

FUNC VOID Rtn_Belagert_935 ()
{	
	TA_Sit_Campfire		(08,00,20,00,"WP_PIR_04");
	TA_Sit_Campfire 	(20,00,08,00,"WP_PIR_04");
};

FUNC VOID Rtn_Sammeln_935 ()
{	
	TA_Stand_WP			(08,00,20,00,"ADW_PIRATECAMP_WAY_02");
	TA_Stand_WP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_02");
};

FUNC VOID Rtn_Artefakt_935 ()
{	
	TA_RunToWP			(08,00,20,00,"ADW_PIRATECAMP_WAY_06");
	TA_RunToWP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_06");
};

FUNC VOID Rtn_Beerdigung_935 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"ADW_PIRATECAMP_BEACH_13");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"ADW_PIRATECAMP_BEACH_13");
};

FUNC VOID Rtn_Tot_935 ()
{	
	TA_Stand_Guarding 	(05,00,20,00,"TOT");
	TA_Stand_Guarding	(20,00,05,00,"TOT");
};