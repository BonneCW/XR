instance Mod_7748_OUT_Raeuber_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Räuber"; 
	guild 		= GIL_OUT;
	id 			= 7748;
	voice 		= 8;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	CreateInvItems	(self, ItRi_Siegelring, 1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Lefty, BodyTex_N, ITAR_Governor);
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7748;
};

FUNC VOID Rtn_Start_7748()
{
	TA_Stand_Guarding		(08,00,23,00,"REL_SURFACE_243");
	TA_Stand_Guarding		(23,00,08,00,"REL_SURFACE_243");	
};

FUNC VOID Rtn_See_7748()
{
	TA_Stand_Guarding		(08,00,23,00,"RELWIDNIS_36");
	TA_Stand_Guarding		(23,00,08,00,"RELWIDNIS_36");	
};
