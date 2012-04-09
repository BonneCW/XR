INSTANCE Mod_1615_PIR_Bones_SS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bones";
	guild 		= GIL_out;
	id 			= 1615;
	voice 		= 1;
	flags       = 2;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Addon_PIR2hAxe);
	
	// ------ Inventory ------
	aivar[AIV_Partymember] = TRUE;
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart10, BodyTex_N, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1.3);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1615;
};

FUNC VOID Rtn_PreStart_1615 ()
{	
	TA_Follow_Player 	(06,55,19,55,"WP_SS_HENRY");
	TA_Follow_Player	(19,55,06,55,"WP_SS_HENRY");
};