INSTANCE Mod_521_NONE_Erol_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Erol";
	guild 		= GIL_OUT;
	id 			= 521;
	voice 		= 10;
	flags       = 2;																	
	npctype		= NPCTYPE_MAIN;

	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	aivar[AIV_IgnoresArmor] 		= TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);	

	attribute[ATR_STRENGTH] = 90;																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_2H_Eminem_Goldschwert_01);
	CreateInvItems (self, ItPo_Health_01, 3);									
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Corristo , BodyTex_N, ITAR_VLK_L);
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_521;
};

FUNC VOID Rtn_PreStart_521 ()
{	
	TA_Sit_Chair		(08,00,11,00,"NW_BIGFARM_HUT_IN_01");
	TA_Stand_Eating		(11,00,13,00,"NW_BIGFARM_HUT_01");
	TA_Sit_Chair		(13,00,18,00,"NW_BIGFARM_HUT_IN_01");
	TA_Smoke_Joint		(18,00,20,00,"NW_BIGFARM_HUT_01");
	TA_Sit_Bench		(20,00,22,00,"NW_BIGFARM_HUT_BENCH_02");
    	TA_Sleep		(22,00,08,00,"NW_BIGFARM_HUTINSIDE_BED");
};

FUNC VOID Rtn_Tot_521 ()
{	
	TA_Sit_Chair	(08,00,22,00,"TOT");
    	TA_Sleep	(22,00,08,00,"TOT");
};

FUNC VOID Rtn_Fahrender_521 ()
{	
	TA_Sit_Chair		(08,00,12,00,"NW_BIGFARM_KITCHEN_07");
	TA_Stand_Eating		(12,00,14,00,"NW_TAVERNE_IN_01");
	TA_Smalltalk		(14,00,20,00,"NW_CITY_MERCHANT_PATH_28_B");
	TA_Stand_Drinking	(20,00,22,00,"NW_CITY_HABOUR_TAVERN01_STAND_01");
    	TA_Sleep		(22,00,08,00,"NW_BIGFARM_HUTINSIDE_BED");
};

FUNC VOID Rtn_FollowToLance_521 ()
{	
	TA_Follow_Player	(08,00,22,00,"NW_TROLLAREA_RUINS_05");
    	TA_Follow_Player	(22,00,08,00,"NW_TROLLAREA_RUINS_05");
};

FUNC VOID Rtn_AtWMs_521 ()
{	
	TA_Smalltalk		(08,00,20,00,"NW_TROLLAREA_PORTAL_03"); 
	TA_Smalltalk		(20,00,08,00,"NW_TROLLAREA_PORTAL_03");
};