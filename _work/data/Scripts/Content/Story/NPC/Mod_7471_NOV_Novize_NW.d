INSTANCE Mod_7471_NOV_Novize_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Novize;
	guild 		= GIL_STRF;
	id 			= 7471;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_nw_feuernovize;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_Nov_Mace); 
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal03, BodyTex_N, ITAR_NOV_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7471;
};

FUNC VOID Rtn_Start_7471 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"WP_NANDOR_TENT_01");
	TA_Stand_ArmsCrossed	(20,00,08,00,"WP_NANDOR_TENT_01");
};