instance Mod_7547_OUT_Wache_DT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wache"; 
	guild 		= GIL_STRF;
	id 			= 7547;
	voice 		= 8;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Schwert3); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_NormalBart06, BodyTex_N, GRD_ARMOR_M);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7547;
};

FUNC VOID Rtn_Start_7547()
{	
	TA_Sleep	(08,00,20,00,"DT_020");
	TA_Sleep 	(20,00,08,00,"DT_020");
};

FUNC VOID Rtn_Kampf_7547()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"DT_022");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"DT_022");
};
