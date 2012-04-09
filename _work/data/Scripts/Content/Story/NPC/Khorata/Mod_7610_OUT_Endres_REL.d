INSTANCE Mod_7610_OUT_Endres_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Endres"; 
	guild 		= GIL_OUT;
	id 			= 7610;
	voice 		= 13;
	flags       = NPC_FLAG_GHOST|NPC_FLAG_IMMORTAL;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);															
	attribute[ATR_HITPOINTS] = 1;
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Mordrag, BodyTex_N,ITAR_Vlk_L );	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7610;
};

FUNC VOID Rtn_Start_7610 ()
{	
	TA_Stand_ArmsCrossed	(05,00,22,00,"TOT");
	TA_Stand_ArmsCrossed	(22,00,05,00,"REL_SURFACE_208");
};

FUNC VOID Rtn_Tot_7610 ()
{	
	TA_Stand_ArmsCrossed	(05,00,22,00,"TOT");
	TA_Stand_ArmsCrossed	(22,00,05,00,"TOT");
};