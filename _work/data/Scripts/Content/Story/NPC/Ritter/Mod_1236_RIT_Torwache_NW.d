instance Mod_1236_RIT_Torwache_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Torwache;
	guild 		= GIL_PAL;
	id 			= 1236;
	voice 		= 9;
	flags       = 2;															
	npctype		= NPCTYPE_MAIN;
	
	//------- AI Vars ----------
	aivar[AIV_NewsOverride] 	= TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Schwert_03);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Whistler, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 0.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1236;
};

FUNC VOID Rtn_Start_1236 ()
{
	TA_Guard_Passage	(08,00,23,00,"NW_CITYHALL_GUARD_01");
	TA_Guard_Passage	(23,00,08,00,"NW_CITYHALL_GUARD_01");	
};
