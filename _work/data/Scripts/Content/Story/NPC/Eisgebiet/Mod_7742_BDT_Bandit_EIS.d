INSTANCE Mod_7742_BDT_Bandit_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bandit";
	guild 		= GIL_STRF;
	id 			= 7742;
	voice 		= 03;
	flags       = 0;																	
	npctype		= NPCTYPE_nw_bandit;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);	
	
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
	daily_routine 		= Rtn_Start_7742;
};

FUNC VOID Rtn_Start_7742 ()
{	
	TA_Sit_Chair		(08,00,20,00,"NORDOSTENLOCH_7");
	TA_Sit_Chair		(20,00,08,00,"NORDOSTENLOCH_7");
};
