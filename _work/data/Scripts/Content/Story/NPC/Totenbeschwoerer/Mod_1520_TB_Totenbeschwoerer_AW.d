INSTANCE Mod_1520_TB_Totenbeschwoerer_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Totenbeschwörer"; 
	guild 		= GIL_DMT;
	id 			= 1520;
	voice 		= 9;
	flags       = 0;																
	
	// ------ AIVARs ------
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self); //NICHT, Alrik soll nicht mehr Gold haben!
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Bloodwyn, BodyTex_N,ITAR_Vlk_L );	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self,100);
	
	attribute[ATR_MANA_MAX] = 20000;
	attribute[ATR_MANA]	= 20000;

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1520;
};

FUNC VOID Rtn_Start_1520() //NICHT ÄNDERN --> DIALOG!
{	
	TA_Stand_Guarding	(10,55,19,15,"NW_CITY_PATH_HABOUR_16_01");
	TA_Stand_Drinking	(19,15,03,30,"NW_CITY_HABOUR_TAVERN01_01");
	TA_Sit_Bench		(03,30,10,55,"NW_CITY_PATH_HABOUR_16_01");
};