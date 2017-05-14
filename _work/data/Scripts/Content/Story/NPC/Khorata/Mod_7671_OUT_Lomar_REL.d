INSTANCE Mod_7671_OUT_Lomar_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lomar";
	guild 		= GIL_DMT;
	id 			= 7671;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------					
	CreateInvItems (self, ItPo_Health_01, 3);									
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Corristo , BodyTex_N, ITAR_Leather_L);
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7671;
};

FUNC VOID Rtn_Start_7671 ()
{	
	TA_Roast_Scavenger	(08,00,22,00,"REL_MOOR_112");
    	TA_Roast_Scavenger	(22,00,08,00,"REL_MOOR_112");
};

FUNC VOID Rtn_Siedlung_7671 ()
{	
	TA_Repair_Hut	(08,00,21,00,"REL_MOOR_213");
	TA_Repair_Hut	(21,00,08,00,"REL_MOOR_213");
};

FUNC VOID Rtn_Tot_7671 ()
{	
	TA_Sit_Chair	(08,00,22,00,"TOT");
    	TA_Sleep	(22,00,08,00,"TOT");
};