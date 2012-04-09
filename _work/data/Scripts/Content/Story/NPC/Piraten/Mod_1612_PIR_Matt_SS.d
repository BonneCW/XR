INSTANCE Mod_1612_PIR_Matt_SS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Matt";
	guild 		= GIL_out;
	id 			= 1612;
	voice 		= 10;
	flags       = 2;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_Partymember] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
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
	B_SetFightSkills (self,70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1612;
};

FUNC VOID Rtn_Start_1612 ()
{	
	TA_Follow_Player	(20,05,16,05,"WP_SS_MATT");
	TA_Follow_Player 	(16,05,20,05,"WP_SS_MATT");
};