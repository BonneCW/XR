INSTANCE Mod_1550_PIR_Matt_DI (Npc_Default)
{
	// ------ NSC ------
	name 		= "Matt";
	guild 		= GIL_out;
	id 			= 1550;
	voice		= 0;
	flags       = FALSE;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_FollowDist] = 500;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Addon_PIR2hAxe);
	
	// ------ Inventory ------
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal14, BodyTex_N, ITAR_PIR_L_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1550;
};

FUNC VOID Rtn_Start_1550 ()
{	
	TA_Sit_Bench 		(07,05,16,05,"WP_DI_MATT_SIT_BENCH");
	TA_Sit_Bench 	(16,05,20,05,"WP_DI_MATT_SIT_BENCH");
};