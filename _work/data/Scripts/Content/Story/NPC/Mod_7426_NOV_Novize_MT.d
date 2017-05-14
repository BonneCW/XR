INSTANCE Mod_7426_NOV_Novize_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Novize;
	guild 		= GIL_STRF;
	id 			= 7426;
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
	
	CreateInvItems	(self, ItMi_SpezielleRune, 1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal03, BodyTex_N, ITAR_NOV_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7426;
};

FUNC VOID Rtn_Start_7426 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"WP_MT_JAEGERLAGER_04");
	TA_Stand_ArmsCrossed	(20,00,08,00,"WP_MT_JAEGERLAGER_04");
};