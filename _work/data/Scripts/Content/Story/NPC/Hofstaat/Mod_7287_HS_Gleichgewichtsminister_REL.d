instance Mod_7287_HS_Gleichgewichtsminister_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Königlicher Gleichgewichtsminister"; 
	guild 		= GIL_OUT;
	id 			= 7287;
	voice 		= 1;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self,ItMw_1H_quantarie_Schwert_01);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_BaalNetbek, BodyTex_N,ITAR_Hofstaatler);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7287;
};

FUNC VOID Rtn_Start_7287 ()
{	
	TA_Stand_ArmsCrossed			(08,00,23,00,"REL_307");
    TA_Sleep			(23,00,08,00,"REL_308");		
};

FUNC VOID Rtn_Drogenminister_7287()
{	
	TA_Guide_Player			(08,00,23,00,"REL_301");
    TA_Guide_Player			(23,00,08,00,"REL_301");		
};
