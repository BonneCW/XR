INSTANCE Mod_7156_ASS_Mirza_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Mirza"; 
	guild 		= GIL_OUT;
	id 			= 7156;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal_Sharky, BodyTex_B, ITAR_Assassine_02);	
	Mdl_SetModelFatness	(self,0);
	//Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds");
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 100); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7156;
};

FUNC VOID Rtn_Start_7156()
{	
	TA_Stand_ArmsCrossed 	(07,20,01,20,"WP_ASSASSINE_47");
	TA_Stand_ArmsCrossed	(01,20,07,20,"WP_ASSASSINE_47");
};

FUNC VOID Rtn_Verrat_7156()
{
	TA_Stand_ArmsCrossed 	(07,20,22,00,"WP_ASSASSINE_47");
	TA_Smalltalk_Assassine4 (22,00,02,00,"NW_BIGFARM_LAKE_CAVE_07");
	TA_Stand_ArmsCrossed	(02,00,07,20,"WP_ASSASSINE_47");
};

FUNC VOID Rtn_Verrat2_7156()
{
	TA_Stand_ArmsCrossed 	(07,20,22,00,"WP_ASSASSINE_47");
	TA_Smalltalk		(22,00,02,00,"NW_BIGFARM_LAKE_CAVE_07");
	TA_Stand_ArmsCrossed	(02,00,07,20,"WP_ASSASSINE_47");
};

FUNC VOID Rtn_Flucht_7156()
{	
	TA_FleeToWP 	(07,20,01,20,"WP_ASSASSINE_08");
	TA_FleeToWP	(01,20,07,20,"WP_ASSASSINE_08");
};

FUNC VOID Rtn_Tot_7156()
{	
	TA_Stand_Guarding 	(07,20,01,20,"TOT");
	TA_Stand_Guarding	(01,20,07,20,"TOT");
};