INSTANCE Mod_7694_BDT_Bandit_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Landstreicher";
	guild 		= GIL_out;
	id 			= 7694;
	voice 		= 03;
	flags       = 0;																	
	npctype		= NPCTYPE_mt_bandit;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);

	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_strong;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_Banditenschwert); 	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal08, BodyTex_N, ITAR_bdt_m_01);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 45); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7694;
};

FUNC VOID Rtn_Start_7694 ()
{
	TA_Stand_Eating		(22,30,17,00,"NW_CITY_TO_FARM2_04");
	TA_Stand_Eating 	(17,00,22,30,"NW_CITY_TO_FARM2_04");
};