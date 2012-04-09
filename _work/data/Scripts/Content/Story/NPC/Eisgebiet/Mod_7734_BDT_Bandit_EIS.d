INSTANCE Mod_7734_BDT_Bandit_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Bandit;
	guild 		= GIL_STRF;
	id 			= 7734;
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
	daily_routine 		= Rtn_Start_7734;
};

FUNC VOID Rtn_Start_7734 ()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"NORDOSTENLOCH_11");
	TA_Stand_ArmsCrossed	(20,00,08,00,"NORDOSTENLOCH_11");
};