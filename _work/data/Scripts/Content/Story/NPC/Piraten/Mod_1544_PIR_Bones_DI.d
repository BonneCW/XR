INSTANCE Mod_1544_PIR_Bones_DI (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bones";
	guild 		= GIL_out;
	id 			= 1544;
	voice 		= 1;
	flags       = 0;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Addon_PIR2hAxe);
	
	// ------ Inventory ------
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart10, BodyTex_N, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1.3);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1544;
};

FUNC VOID Rtn_PreStart_1544 ()
{	
	TA_Practice_Sword 	(06,55,19,55,"WP_DI_BONES_PRACTICE_SWORD");
	TA_Stand_Drinking	(19,55,20,55,"WP_DI_BONES_PRACTICE_SWORD");
	TA_Practice_Sword	(20,55,00,55,"WP_DI_BONES_PRACTICE_SWORD");
	TA_Stand_Drinking	(00,55,01,55,"WP_DI_BONES_PRACTICE_SWORD");
	TA_Practice_Sword	(01,55,06,55,"WP_DI_BONES_PRACTICE_SWORD");
};

FUNC VOID Rtn_Skelett_1544 ()
{	
	TA_Follow_Player (06,00,14,00,"WP_DI_HOEHLE_01_OBEN_SKELETT");
	TA_Follow_Player (14,00,06,00,"WP_DI_HOEHLE_01_OBEN_SKELETT");
};