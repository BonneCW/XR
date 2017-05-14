instance Mod_748_NONE_Rengaru_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Rengaru"; 
	guild 		= GIL_OUT;
	id 			= 748;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_Vlk_Sword); 
	
	
	// ------ Inventory ------
	CreateInvItems (self, ItMi_Gold, 50); //hat er Nagur geklaut! Muss genau 50 im Inv haben M.F. 
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_ToughBart01, BodyTex_N,ITAR_Vlk_02);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_748;
};

FUNC VOID Rtn_Start_748()
{	
	TA_Stand_ArmsCrossed	(05,15,20,15,"NW_CITY_MERCHANT_PATH_35");
	TA_Stand_Drinking 	(20,15,05,15,"NW_CITY_MERCHANT_PATH_35"); 
};

FUNC VOID Rtn_Dieb_748()
{	
	TA_Read_Bookstand	(05,15,20,15,"NW_CITY_KANAL_ROOM_05_01");
	TA_Read_Bookstand 	(20,15,05,15,"NW_CITY_KANAL_ROOM_05_01"); 
};

FUNC VOID Rtn_Tot_748 ()
{	
	TA_RunToWP	(08,00,22,00,"TOT");
	TA_RunToWP	(22,00,08,00,"TOT");
};