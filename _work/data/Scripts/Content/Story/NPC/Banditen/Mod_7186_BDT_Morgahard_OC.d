instance Mod_7186_BDT_Morgahard_OC (Npc_Default)
{
	// ------ NSC ------
	name 		= "Morgahard"; 
	guild 		= GIL_OUT;
	id 			= 7186;
	voice 		= 7;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	//aivar[AIV_EnemyOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG ;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_Banditenschwert); 														
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);								
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Bartholo, BodyTex_N, ITAR_BDT_M_01);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7186;
};

FUNC VOID Rtn_Start_7186 ()
{	
	TA_Follow_Player	(16,00,22,00,"WP_OCC_258"); 
	TA_Follow_Player	(22,00,16,00,"WP_OCC_258");
};

FUNC VOID Rtn_Tot_7186()
{
	TA_Stand_WP	(08,00,20,00,"TOT");
	TA_Stand_WP	(20,00,08,00,"TOT");
};