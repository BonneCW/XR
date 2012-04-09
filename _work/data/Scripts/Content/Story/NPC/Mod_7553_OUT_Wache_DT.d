instance Mod_7553_OUT_Wache_DT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wache"; 
	guild 		= GIL_STRF;
	id 			= 7553;
	voice 		= 1;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																
	//EquipItem	(self, ItMw_Schwert3); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart_Huno, BodyTex_N, GRD_ARMOR_M);	
	Mdl_SetModelFatness	(self,2);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7553;
};

FUNC VOID Rtn_Start_7553()
{	
	TA_Sit_Campfire	(08,00,20,00,"DT_009");
	TA_Sit_Campfire	(20,00,08,00,"DT_009");
};

FUNC VOID Rtn_Kampf_7553()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"DT_022");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"DT_022");
};