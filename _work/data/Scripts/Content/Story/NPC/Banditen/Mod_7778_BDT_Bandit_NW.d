instance Mod_7778_BDT_Bandit_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Banditenanführer";
	guild 		= GIL_STRF;
	id 			= 7778;
	voice 		= 12;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Tough_Pacho, BodyTex_B, ITAR_BDT_H_01);	
	Mdl_SetModelFatness	(self, 0.75);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_7778;
};

FUNC VOID Rtn_Start_7778 ()
{
	TA_Stand_Drinking    (10,00,12,00,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Drinking    (12,00,10,00,"NW_XARDAS_TOWER_SECRET_CAVE_04");
};