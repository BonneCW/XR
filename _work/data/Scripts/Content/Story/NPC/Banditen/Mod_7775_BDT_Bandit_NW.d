instance Mod_7775_BDT_Bandit_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bandit";
	guild 		= GIL_STRF;
	id 			= 7775;
	voice 		= 13;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Banditenschwert);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 	
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_L_NormalBart01, BodyTex_L, ITAR_BDT_M_01);	
	Mdl_SetModelFatness	(self, - 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_7775;
};

FUNC VOID Rtn_Start_7775()
{
	TA_Stand_Drinking 	(02,00,10,00,"NW_XARDAS_TOWER_VALLEY_07");
	TA_Stand_Drinking 	(10,00,02,00,"NW_XARDAS_TOWER_VALLEY_07");
};