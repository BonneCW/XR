INSTANCE Mod_7783_OUT_Schmuggler_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Schmuggler"; 
	guild 		= GIL_OUT;
	id 			= 7783;
	voice 		= 9;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN; //plündert nicht!!! (und ein Freischlag)
	
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	EquipItem(self, ItMw_Nagelknueppel);
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self); //NICHT, Alrik soll nicht mehr Gold haben!
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Bloodwyn, BodyTex_N, ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self,10);
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7783;
};

FUNC VOID Rtn_Start_7783() //NICHT ÄNDERN --> DIALOG!
{
	TA_Stand_Guarding 	(07,20,01,20,"NW_CITY_HABOUR_HUT_03_IN_07");
	TA_Stand_Guarding	(01,20,07,20,"NW_CITY_HABOUR_HUT_03_IN_07");
};

FUNC VOID Rtn_AtNagur_7783()
{	
	TA_Sit_Chair		(08,00,23,00,"NW_CITY_HABOUR_TAVERN01_02");
	TA_Sit_Chair		(23,00,08,00,"NW_CITY_HABOUR_TAVERN01_02"); 
};