instance Mod_7331_HS_Koenig_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "König"; 
	guild 		= GIL_OUT;
	id 			= 7331;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//--------Aivars-----------
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 0);
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NORMAL19, BodyTex_N,ITAR_Hofstaatler);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self,30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7331;
};

FUNC VOID Rtn_Start_7331()
{	
	TA_Stand_ArmsCrossed		(20,00,08,00,"PATH_TAKE_HERB_07");
	TA_Stand_ArmsCrossed		(08,00,20,00,"PATH_TAKE_HERB_07");
};

FUNC VOID Rtn_Fest_7331()
{	
	TA_Dance		(21,00,07,00,"PATH_TAKE_HERB_07");
	TA_Dance		(07,00,21,00,"PATH_TAKE_HERB_07");
};

FUNC VOID Rtn_Tot_7331()
{	
	TA_Stand_ArmsCrossed		(20,00,08,00,"TOT");
	TA_Stand_ArmsCrossed		(08,00,20,00,"TOT");
};