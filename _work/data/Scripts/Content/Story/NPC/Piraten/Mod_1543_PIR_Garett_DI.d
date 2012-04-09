INSTANCE Mod_1543_PIR_Garett_DI (Npc_Default)
{
	// ------ NSC ------
	name 		= "Garett";
	guild 		= GIL_out;
	id 			= 1543;
	voice 		= 9;
	flags       = FALSE;													
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Piratensaebel);
	
	// ------ Inventory ------
	// Händler
	CreateInvItems (self, ItBE_Addon_Prot_EdgPoi, 1); 
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_N_NormalBart05, BodyTex_N, ITAR_PIR_L_Addon);	  
	Mdl_SetModelFatness	(self, 1.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1543;
};

FUNC VOID Rtn_Start_1543 ()
{	
	TA_Smalltalk			(08,00,20,00,"WP_DI_AJ_STAND_SMALLTALK");
	TA_Smalltalk	 	(20,00,08,00,"WP_DI_AJ_STAND_SMALLTALK");
};

FUNC VOID Rtn_Skelett_1543 ()
{	
	TA_Follow_Player (06,00,14,00,"WP_DI_HOEHLE_01_OBEN_SKELETT");
	TA_Follow_Player (14,00,06,00,"WP_DI_HOEHLE_01_OBEN_SKELETT");
};