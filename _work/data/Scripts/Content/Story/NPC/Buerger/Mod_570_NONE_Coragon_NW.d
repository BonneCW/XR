instance Mod_570_NONE_Coragon_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Coragon"; 
	guild 		= GIL_PAL;
	id 			= 570;
	voice 		= 9;
	flags       = 2;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1H_quantarie_Schwert_01);
	
	
	// ------ Inventory ------
	//Händler

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald.", Face_N_Normal_Blade, BodyTex_N, ITAR_SMITH);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_570;
};

FUNC VOID Rtn_Start_570 ()
{	
	TA_Stand_ArmsCrossed	(08,00,22,00,"NW_CITY_TAVERN_IN_03");
    TA_Stand_ArmsCrossed	(22,00,08,00,"NW_CITY_TAVERN_IN_03");
};