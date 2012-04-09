INSTANCE Mod_1620_PIR_Morgan_SS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Morgan";
	guild 		= GIL_out;
	id 			= 1620;
	voice 		= 7;
	flags       = 2;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Doppelaxt);

	aivar[AIV_Partymember] = TRUE;
	
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_L_Tough_Santino, BodyTex_L, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_START_1620;
};

FUNC VOID Rtn_START_1620 ()
{
	TA_Follow_Player 		(23,00,09,00,"WP_SS_AJ");
	TA_Follow_Player		(09,00,23,00,"WP_SS_AJ");
};