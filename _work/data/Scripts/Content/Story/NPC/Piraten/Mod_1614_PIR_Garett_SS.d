INSTANCE Mod_1614_PIR_Garett_SS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Garett";
	guild 		= GIL_out;
	id 			= 1614;
	voice 		= 9;
	flags       = 2;													
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Piratensaebel);
	
	// ------ Inventory ------
	// Händler

	aivar[AIV_Partymember] = TRUE;
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_N_NormalBart05, BodyTex_N, ITAR_PIR_L_Addon);	  
	Mdl_SetModelFatness	(self, 1.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1614;
};

FUNC VOID Rtn_Start_1614 ()
{	
	TA_Follow_Player		(08,00,20,00,"WP_SS_GARETT");
	TA_Follow_Player	 	(20,00,08,00,"WP_SS_GARETT");
};