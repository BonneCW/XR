instance Mod_1258_RIT_RITTER_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_RITTER;
	guild 		= GIL_PAL;
	id 			= 1258;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_nw_paladin ;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Schwert_02);
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart06, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1258;
};

FUNC VOID Rtn_Start_1258 ()
{
	TA_Practice_Sword 	(08,00,23,00,"NW_CITY_PALCAMP_02");
    TA_Practice_Sword	(23,00,08,00,"NW_CITY_PALCAMP_02");	
};

