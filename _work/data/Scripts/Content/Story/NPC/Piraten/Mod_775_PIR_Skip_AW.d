INSTANCE Mod_775_PIR_Skip_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Skip";
	guild 		= GIL_NONE;
	id 			= 775;
	voice		= 0;
	flags       = FALSE;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_FollowDist] = 300;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_ShortSword2);
	EquipItem (self, ItRw_sld_bow); 
	
	// ------ Inventory ------
	CreateInvItems (self, itpo_Health_03, 2);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Pirat01, BodyTex_N, ITAR_PIR_L_Addon);
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_775;
};

FUNC VOID Rtn_Start_775 ()
{	
	TA_Stand_Drinking		(07,30,11,30,"ADW_PIRATECAMP_HUT3_01");
	TA_Sit_Bench			(11,30,16,30,"ADW_PIRATECAMP_HUT3_BENCH");
	TA_Stand_Eating			(16,30,17,30,"ADW_PIRATECAMP_HUT3_01");
	TA_Sit_Bench			(17,30,20,30,"ADW_PIRATECAMP_HUT3_BENCH");	
	TA_Sit_Campfire			(20,30,01,30,"ADW_PIRATECAMP_BEACH_17"); 
	TA_Stand_Drinking		(01,30,02,30,"ADW_PIRATECAMP_BEACH_17"); 
	TA_Sleep			(02,30,07,30,"ADW_PIRATECAMP_HUT3_02");
};

FUNC VOID Rtn_Plaudern_775 ()
{
	TA_Smalltalk_Plaudern		(22,00,12,00,"WP_BLA_PIR_01");
	TA_Smalltalk_Plaudern		(12,00,22,00,"WP_BLA_PIR_01");
};

FUNC VOID Rtn_Befreiung_775 ()
{	
	TA_Sleep				(07,30,11,30,"ADW_PIRATECAMP_HUT3_01");
	TA_Sleep				(11,30,07,30,"ADW_PIRATECAMP_HUT3_02");
};

FUNC VOID Rtn_Sammeln_775 ()
{	
	TA_Stand_WP			(08,00,20,00,"ADW_PIRATECAMP_WAY_02");
	TA_Stand_WP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_02");
};

FUNC VOID Rtn_Artefakt_775 ()
{	
	TA_RunToWP			(08,00,20,00,"ADW_PIRATECAMP_WAY_06");
	TA_RunToWP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_06");
};

FUNC VOID Rtn_Beerdigung_775 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"ADW_PIRATECAMP_BEACH_13");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"ADW_PIRATECAMP_BEACH_13");
};