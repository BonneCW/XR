INSTANCE Mod_1549_PIR_Malcom_DI (Npc_Default)
{
	// ------ NSC ------
	name 		= "Malcom";
	guild 		= GIL_out;
	id 			= 1549;
	voice 		= 4;
	flags       = 0;															
	npctype		= NPCTYPE_MAIN;
		
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Addon_PIR1hAxe);					

	// ------ Inventory ------
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Normal_Sly, BodyTex_N, ITAR_PIR_L_Addon);	  
	Mdl_SetModelFatness	(self, 1.1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,10); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1549;
};

FUNC VOID Rtn_PreStart_1549 ()
{	
	TA_Sit_Campfire (06,00,14,00,"WP_DI_MALCOLM_SIT");
	TA_Sit_Campfire (14,00,22,00,"WP_DI_MALCOLM_SIT");
	TA_Sit_Campfire (22,00,02,00,"WP_DI_MALCOLM_SIT");
	TA_Sit_Campfire	(02,00,06,00,"WP_DI_MALCOLM_SIT");
};

FUNC VOID Rtn_Skelett_1549 ()
{	
	TA_Follow_Player (06,00,14,00,"WP_DI_HOEHLE_01_OBEN_SKELETT");
	TA_Follow_Player (14,00,06,00,"WP_DI_HOEHLE_01_OBEN_SKELETT");
};

FUNC VOID Rtn_Stollen_1549 ()
{	
	TA_Pick_FP 	(05,00,20,00,"WP_DI_HOEHLE_01_TUNNEL_4");
	TA_Pick_FP 	(20,00,05,00,"WP_DI_HOEHLE_01_TUNNEL_4");
};