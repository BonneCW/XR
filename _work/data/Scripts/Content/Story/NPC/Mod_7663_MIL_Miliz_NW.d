instance Mod_7663_MIL_Miliz_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "aufgebrachte Miliz";	
	guild 		= GIL_STRF;
	id 			= 7663;
	voice		= 0;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart16, BodyTex_N, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7663;
};

FUNC VOID Rtn_Start_7663()
{	
	TA_Stand_Guarding	(01,00,03,00,"NW_CASTLEMINE_TOWER_CAMPFIRE_01");
	TA_Stand_Guarding	(03,00,01,00,"NW_CASTLEMINE_TOWER_CAMPFIRE_01");
};
