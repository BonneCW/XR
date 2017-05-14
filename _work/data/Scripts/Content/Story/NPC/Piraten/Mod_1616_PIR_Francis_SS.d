INSTANCE Mod_1616_PIR_Francis_SS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Francis";
	guild 		= GIL_out;
	id 			= 1616;
	voice		= 0;
	flags       = 2;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Schwert1);  
	
	// ------ Inventory ------
	aivar[AIV_Partymember] = TRUE;
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Cipher_neu, BodyTex_N, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1616;
};

FUNC VOID Rtn_Start_1616 ()
{	
	TA_Follow_Player 	(05,00,20,00,"WP_SS_FRANCIS");
	TA_Follow_Player 	(20,00,05,00,"WP_SS_FRANCIS");
};