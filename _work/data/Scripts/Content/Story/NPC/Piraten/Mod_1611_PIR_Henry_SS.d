INSTANCE Mod_1611_PIR_Henry_SS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Henry";
	guild 		= GIL_out;
	id 			= 1611;
	voice 		= 4;
	flags       = 2;												
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_NewsOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	
	EquipItem (self, ItMw_Krummschwert); 
	
	// ------ Inventory ------
	// Händler
	aivar[AIV_Partymember] = TRUE;
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_P_Normal01, BodyTex_P, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,90); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1611;
};

FUNC VOID Rtn_Start_1611 ()
{	
	TA_Follow_Player	(05,00,20,00,"WP_SS_HENRY");
	TA_Follow_Player	(20,00,05,00,"WP_SS_HENRY");
};