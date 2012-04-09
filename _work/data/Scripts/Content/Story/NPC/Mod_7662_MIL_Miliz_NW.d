instance Mod_7662_MIL_Miliz_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "aufgebrachte Miliz";	
	guild 		= GIL_STRF;
	id 			= 7662;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_nw_miliz;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Milizschwert);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Tough01, BodyTex_L, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7662;
};

FUNC VOID Rtn_Start_7662()
{	
	TA_Stand_Guarding	(01,00,03,00,"NW_CASTLEMINE_TOWER_CAMPFIRE_01");
	TA_Stand_Guarding	(03,00,01,00,"NW_CASTLEMINE_TOWER_CAMPFIRE_01");
};
