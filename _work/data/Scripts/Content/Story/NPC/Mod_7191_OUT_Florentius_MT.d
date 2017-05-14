instance Mod_7191_OUT_Florentius_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Florentius"; 
	guild 		= GIL_OUT;
	id 			= 7191;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	CreateInvItems	(self, ItFo_Apple, 12);
	CreateInvItems	(self, ItMi_Gold, 198);
	CreateInvItems	(self, ItFo_Cheese, 10);
	CreateInvItems	(self, ItFo_Wine, 8);	
	CreateInvItems	(self, ItWr_JuanBook, 1);															
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Asghan, BodyTex_N,ITAR_Vlk_H);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7191;
};

FUNC VOID Rtn_Start_7191()
{	
	TA_Stand_WP	(06,05,20,15,"PATH_OC_NC_27");
	TA_Stand_WP		(20,15,06,05,"PATH_OC_NC_27"); 
};
