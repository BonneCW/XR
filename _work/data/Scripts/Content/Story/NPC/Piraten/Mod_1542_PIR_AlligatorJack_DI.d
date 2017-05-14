INSTANCE Mod_1542_PIR_AlligatorJack_DI (Npc_Default)
{
	// ------ NSC ------
	name 		= "Alligator Jack";
	guild 		= GIL_out;
	id 			= 1542;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_FollowDist] = 300;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Piratensaebel);
		
	// ------ Inventory ------
	CreateInvItems (self, itpo_Health_02, 4);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_B_CorAngar, BodyTex_B, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1.5);		
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,90); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1542;
};

FUNC VOID Rtn_Start_1542 ()
{	
	TA_Smalltalk			 (23,00,06,00,"WP_DI_AJ_STAND_SMALLTALK");
	TA_Smalltalk			 (06,00,08,30,"WP_DI_AJ_STAND_SMALLTALK");
};

FUNC VOID Rtn_Skelett_1542 ()
{	
	TA_Follow_Player (06,00,14,00,"WP_DI_HOEHLE_RITUAL");
	TA_Follow_Player (14,00,06,00,"WP_DI_HOEHLE_RITUAL");
};