instance Mod_7776_BDT_Bandit_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Räuber";
	guild 		= GIL_STRF;
	id 			= 7776;
	voice 		= 6;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Banditenschwert);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_Mordrag, BodyTex_N, ITAR_BDT_M_01);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_7776;
};

FUNC VOID Rtn_Start_7776 ()
{
	TA_Smalltalk	(08,00,20,00,"NW_XARDAS_TOWER_SECRET_CAVE_01");
	TA_Smalltalk	(20,00,08,00,"NW_XARDAS_TOWER_SECRET_CAVE_01");
};