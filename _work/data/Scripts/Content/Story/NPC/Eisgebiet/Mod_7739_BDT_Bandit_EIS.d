INSTANCE Mod_7739_BDT_Bandit_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Bandit;
	guild 		= GIL_STRF;
	id 			= 7739;
	voice 		= 8;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal06, BodyTex_N, ITAR_BDT_H_01);		
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7739;
};

FUNC VOID Rtn_Start_7739 ()
{
	TA_Pick_FP	(08,00,20,00,"NORDOSTENLOCH_5");
	TA_Pick_FP	(20,00,08,00,"NORDOSTENLOCH_5");
};