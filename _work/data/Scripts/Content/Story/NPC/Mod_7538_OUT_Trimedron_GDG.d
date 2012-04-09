INSTANCE Mod_7538_OUT_Trimedron_GDG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Trimedron";
	guild 		= GIL_out;
	id 			= 7538;
	voice 		= 7;
	flags       = NPC_FLAG_GHOST|NPC_FLAG_IMMORTAL;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Piratensaebel);
	
	// ------ Inventory ------
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_L_Ratford, BodyTex_L, ITAR_Raven_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_7538;
};

FUNC VOID Rtn_PreStart_7538 ()
{	
	TA_Stand_Guarding 	 	(06,10,19,10,"WP_GDG_02");
	TA_Stand_Guarding	 	(19,10,20,10,"WP_GDG_02");
};
