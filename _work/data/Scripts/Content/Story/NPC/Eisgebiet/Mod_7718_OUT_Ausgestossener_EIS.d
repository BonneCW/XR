INSTANCE Mod_7718_OUT_Ausgestossener_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ausgestoﬂener";
	guild 		= GIL_OUT;
	id 			= 7718;
	voice 		= 03;
	flags       = 0;																	
	npctype		= NPCTYPE_nw_bandit;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_strong;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_Banditenschwert_Andre); 	
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
	daily_routine 		= Rtn_Start_7718;
};

FUNC VOID Rtn_Start_7718 ()
{
	TA_Stand_ArmsCrossed	(08,00,23,00,"EIS_02");
	TA_Stand_ArmsCrossed	(23,00,08,00,"EIS_02");
};

FUNC VOID Rtn_Tot_7718 ()
{	
	TA_Stand_ArmsCrossed	(08,00,23,00,"TOT");
	TA_Stand_ArmsCrossed	(23,00,08,00,"TOT");
};
