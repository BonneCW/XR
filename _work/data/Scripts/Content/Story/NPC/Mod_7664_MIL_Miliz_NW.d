instance Mod_7664_MIL_Miliz_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "aufgebrachte Miliz";	
	guild 		= GIL_STRF;
	id 			= 7664;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart10, BodyTex_N, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7664;
};

FUNC VOID Rtn_Start_7664()
{	
	TA_Stand_Guarding	(07,00,20,58,"NW_CASTLEMINE_PATH_02");
	TA_Stand_Guarding	(20,58,07,00,"NW_CASTLEMINE_PATH_02");
};