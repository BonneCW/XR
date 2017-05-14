INSTANCE Mod_7782_ASS_Assassine_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Assassine"; 
	guild 		= GIL_OUT;
	id 			= 7782;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_Vlk_Sword);														
	EquipItem	(self, ItRw_Assassinenbogen);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal_Sharky, BodyTex_B, ITAR_Assassine_01);	
	Mdl_SetModelFatness	(self,0);
	//Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds");
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7782;
};

FUNC VOID Rtn_Start_7782()
{
	TA_Stand_Guarding 	(07,20,01,20,"NW_CITY_HABOUR_HUT_03_IN_07");
	TA_Stand_Guarding	(01,20,07,20,"NW_CITY_HABOUR_HUT_03_IN_07");
};

FUNC VOID Rtn_Tot_7782 ()
{
	TA_RunToWP	 	(07,20,01,20,"TOT");
	TA_RunToWP		(01,20,07,20,"TOT");
};