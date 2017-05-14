instance Mod_7190_OUT_Hortensius_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Hortensius"; 
	guild 		= GIL_OUT;
	id 			= 7190;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	CreateInvItems	(self, ItMi_Scoop, 7);
	CreateInvItems	(self, ItMi_Stomper, 4);
	CreateInvItems	(self, ItMi_Lute, 2);
	CreateInvItems	(self, ItMi_Gold, 140);
	CreateInvItems	(self, ItFo_Honey, 6);
	CreateInvItems	(self, ItFo_Booze, 12);															
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Asghan, BodyTex_N,ITAR_Vlk_H);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7190;
};

FUNC VOID Rtn_Start_7190()
{	
	TA_Stand_WP	(06,05,20,15,"PATH_OC_PSI_19");
	TA_Stand_WP		(20,15,06,05,"PATH_OC_PSI_19"); 
};
