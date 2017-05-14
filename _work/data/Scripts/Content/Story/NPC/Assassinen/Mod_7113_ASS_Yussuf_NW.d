INSTANCE Mod_7113_ASS_Yussuf_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Yussuf"; 
	guild 		= GIL_OUT;
	id 			= 7113;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);	

	aivar[AIV_FollowDist] = 300;
	aivar[AIV_IGNORE_Murder]		= TRUE;														
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_Vlk_Sword);														
	EquipItem	(self, ItRw_Assassinenbogen);
	
	// ------ Inventory ------
	CreateInvItems (self, ItMi_Gold, 100);
	CreateInvItems (self, ItFo_Apple, 2);
	CreateInvItems (self, ItFo_Bacon, 1);
	CreateInvItems (self, ItRw_Arrow, 20);
	CreateInvItems (self, ItFo_Milk, 2);
	CreateInvItems (self, ItFo_Mutton, 5);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal_Sharky, BodyTex_B,ITAR_Assassine_01);	
	Mdl_SetModelFatness	(self,0);
	//Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds");
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7113;
};

FUNC VOID Rtn_Start_7113()
{	
	TA_Smalltalk_Assassine3 	(07,20,01,20,"WP_ASSASSINE_21");
	TA_Smalltalk_Assassine3		(01,20,07,20,"WP_ASSASSINE_21");
};

FUNC VOID Rtn_Schlacht_7113()
{	
	TA_Stand_Guarding 	(07,20,01,20,"WP_ASSASSINE_12");
	TA_Stand_Guarding	(01,20,07,20,"WP_ASSASSINE_12");
};

FUNC VOID Rtn_Tot_7113()
{	
	TA_Stand_Guarding 	(07,20,01,20,"TOT");
	TA_Stand_Guarding	(01,20,07,20,"TOT");
};

FUNC VOID Rtn_Follow_7113()
{	
	TA_Follow_Player 	(07,20,01,20,"NW_CITY_MAINSTREET_02");
	TA_Follow_Player	(01,20,07,20,"NW_CITY_MAINSTREET_02");
};

FUNC VOID Rtn_Richter_7113()
{	
	TA_Smalltalk_YussufWache 	(07,20,01,20,"NW_CITY_UPTOWN_PATH_19");
	TA_Smalltalk_YussufWache	(01,20,07,20,"NW_CITY_UPTOWN_PATH_19");
};