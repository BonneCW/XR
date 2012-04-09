INSTANCE Mod_7717_OUT_Ausgestossener_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ausgestoﬂener";
	guild 		= GIL_OUT;
	id 			= 7717;
	voice 		= 08;
	flags       = 0;																	
	npctype		= NPCTYPE_nw_bandit;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_Banditenschwert_Andre); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_NormalBart_Dexter, BodyTex_N, ITAR_bdt_m_01);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 45); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7717;
};

FUNC VOID Rtn_Start_7717 ()
{	
	TA_Stand_ArmsCrossed	(08,00,23,00,"EIS_02");
	TA_Stand_ArmsCrossed	(23,00,08,00,"EIS_02");
};

FUNC VOID Rtn_Tot_7717 ()
{	
	TA_Stand_ArmsCrossed	(08,00,23,00,"TOT");
	TA_Stand_ArmsCrossed	(23,00,08,00,"TOT");
};