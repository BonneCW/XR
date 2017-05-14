instance Mod_7545_OUT_Wache_DT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wache"; 
	guild 		= GIL_STRF;
	id 			= 7545;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Streitaxt1); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal06, BodyTex_N, GRD_ARMOR_M);	
	Mdl_SetModelFatness	(self,2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7545;
};

FUNC VOID Rtn_Start_7545()
{	
	TA_Sit_Chair	(08,00,20,00,"DT_012");
	TA_Sit_Chair 	(20,00,08,00,"DT_012");
};

FUNC VOID Rtn_Kampf_7545()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"DT_022");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"DT_022");
};
