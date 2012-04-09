instance Mod_741_NONE_Monty_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Monty"; 
	guild 		= GIL_PAL;
	id 			= 741;
	voice 		= 8;
	flags       = 0;							
	npctype		= NPCTYPE_MAIN;
	
	//aivars 
	aivar[AIV_IgnoresArmor]  = TRUE;
	aivar[AIV_ToughGuy] 	 = TRUE; 
	aivar[AIV_ToughGuyNewsOverride] 	 = TRUE; 
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart04, BodyTex_N, ITAR_Bau_L);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_741;
};

FUNC VOID Rtn_PreStart_741 ()
{	
	TA_Preach_Monty		(08,00,20,00,"NW_CITY_HABOUR_POOR_AREA_01");
	TA_Read_Bookstand	(20,00,08,00,"NW_CITY_HABOUR_WERFT_IN_01");
};

FUNC VOID Rtn_Start_741 ()
{	
	TA_Read_Bookstand (00,00,12,00,"NW_CITY_HABOUR_WERFT_IN_01");
	TA_Read_Bookstand (12,00,00,00,"NW_CITY_HABOUR_WERFT_IN_01");
};