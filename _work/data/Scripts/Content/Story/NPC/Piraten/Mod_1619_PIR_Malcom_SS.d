INSTANCE Mod_1619_PIR_Malcom_SS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Malcom";
	guild 		= GIL_out;
	id 			= 1619;
	voice		= 0;
	flags       = 2;															
	npctype		= NPCTYPE_MAIN;
		
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Addon_PIR1hAxe);					

	// ------ Inventory ------
	aivar[AIV_Partymember] = TRUE;
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Normal_Sly, BodyTex_N, ITAR_PIR_L_Addon);	  
	Mdl_SetModelFatness	(self, 1.1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,60); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1619;
};

FUNC VOID Rtn_PreStart_1619 ()
{	
	TA_Follow_Player (06,00,14,00,"WP_SS_MALCOLM");
	TA_Follow_Player (14,00,06,00,"WP_SS_MALCOLM");
};