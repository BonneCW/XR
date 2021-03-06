INSTANCE Mod_561_NONE_Baltram_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Baltram";
	guild 		= GIL_NONE;
	id 			= 561;
	voice		= 16;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_NPCIsRanger] = TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1H_quantarie_Schwert_01);
	
	// ------ Inventory ------
	// H�ndler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Markus_Kark, BodyTex_N, ITAR_VLK_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_561;
};

FUNC VOID Rtn_Start_561 ()
{	
	TA_Stand_ArmsCrossed	(05,05,20,05,"NW_CITY_ZURIS");
	TA_Smalltalk			(20,05,00,05,"NW_CITY_BEER_05");
    TA_Sleep 				(00,05,05,05,"NW_CITY_HOTEL_BED_02");
};