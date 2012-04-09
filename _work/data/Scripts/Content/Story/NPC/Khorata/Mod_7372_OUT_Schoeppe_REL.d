instance Mod_7372_OUT_Schoeppe_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Schöppe"; 
	guild 		= GIL_DMT;
	id 			= 7372;
	voice 		= 9;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 10); 
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------					
	
	
	// ------ Inventory ------
	//Händler

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald.", Face_N_Normal_Blade, BodyTex_N, KhorataMagier_01);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7372;
};

FUNC VOID Rtn_Start_7372 ()
{	
	TA_Sit_Throne	(08,00,20,00,"REL_CITY_344");
	TA_Sit_Throne	(20,00,08,00,"REL_CITY_344");
};