instance Mod_577_NONE_Garvell_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Garvell"; 
	guild 		= GIL_OUT;
	id 			= 577;
	voice 		= 4;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Schwert3); 
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Lefty, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_577;
};

FUNC VOID Rtn_Start_577()
{	
	TA_Stand_Drinking	(04,50,19,11,"NW_CITY_HABOUR_07");
    TA_Smalltalk		(19,11,00,01,"NW_CITY_HABOUR_TAVERN01_SMALLTALK_01");
    TA_Stand_Drinking	(00,01,04,50,"NW_CITY_HABOUR_TAVERN01_STAND_01");
};

FUNC VOID Rtn_Killer_577()
{
	TA_Stand_ArmsCrossed	(08,00,22,00,Npc_GetNearestWP(hero));
	TA_Stand_ArmsCrossed	(22,00,08,00,Npc_GetNearestWP(hero));
};