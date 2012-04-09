INSTANCE Mod_931_PIR_Brandon_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Brandon";
	guild 		= GIL_NONE;
	id 			= 931;
	voice 		= 4;
	flags       = FALSE;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_FollowDist] = 400;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Addon_PIR1hAxe);
	
	// ------ Inventory ------
	CreateInvItems (self, itpo_Health_03, 1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Tough_Okyl, BodyTex_N, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1.1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_931;
};

FUNC VOID Rtn_Start_931 ()
{	
	TA_Smalltalk 		(07,03,21,03,"ADW_PIRATECAMP_BEACH_08");
	TA_Stand_Drinking	(21,03,22,03,"ADW_PIRATECAMP_BEACH_18");
	TA_Sit_Campfire		(22,03,01,03,"ADW_PIRATECAMP_BEACH_18");
	TA_Stand_Drinking	(01,03,03,03,"ADW_PIRATECAMP_BEACH_18");
	TA_Sit_Campfire		(03,03,04,03,"ADW_PIRATECAMP_BEACH_18");
	TA_Pee				(04,03,04,09,"ADW_PIRATECAMP_BEACH_18");
	TA_Stand_Drinking	(04,09,04,14,"ADW_PIRATECAMP_BEACH_18");
	TA_Sit_Campfire		(04,14,07,03,"ADW_PIRATECAMP_BEACH_18");
};

FUNC VOID Rtn_Sammeln_931 ()
{	
	TA_Stand_WP			(08,00,20,00,"ADW_PIRATECAMP_WAY_02");
	TA_Stand_WP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_02");
};

FUNC VOID Rtn_Artefakt_931 ()
{	
	TA_RunToWP			(08,00,20,00,"ADW_PIRATECAMP_WAY_06");
	TA_RunToWP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_06");
};

FUNC VOID Rtn_Beerdigung_931 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"ADW_PIRATECAMP_BEACH_13");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"ADW_PIRATECAMP_BEACH_13");
};

FUNC VOID Rtn_Tot_931 ()
{	
	TA_Stand_Guarding 	(05,00,20,00,"TOT");
	TA_Stand_Guarding	(20,00,05,00,"TOT");
};