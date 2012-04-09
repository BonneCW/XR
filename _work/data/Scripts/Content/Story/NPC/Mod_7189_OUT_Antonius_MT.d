instance Mod_7189_OUT_Antonius_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Antonius"; 
	guild 		= GIL_OUT;
	id 			= 7189;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	CreateInvItems	(self, ItMi_Stuff_Barbknife_01, 10);
	CreateInvItems	(self, ItMi_Pan, 3);
	CreateInvItems	(self, ItMi_Gold, 150);
	CreateInvItems	(self, ItFo_Addon_Grog, 10);
	CreateInvItems	(self, ItFo_Cheese, 1);
	CreateInvItems	(self, ItFo_Bread, 1);																
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Asghan, BodyTex_N,ITAR_Vlk_H);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7189;
};

FUNC VOID Rtn_Start_7189()
{	
	TA_Stand_WP	(06,05,20,15,"PATH_OC_NC");
	TA_Stand_WP		(20,15,06,05,"PATH_OC_NC"); 
};
