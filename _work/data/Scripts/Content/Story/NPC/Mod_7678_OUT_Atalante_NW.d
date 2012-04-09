instance Mod_7678_OUT_Atalante_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Atalante"; 
	guild 		= GIL_DMT;
	id 			= 7678;
	voice 		= 16;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//----------AIVARS--------------
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", FaceBabe_N_BlackHair, BodyTexBabe_N, ITAR_VlkBabe_H);		
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 90); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7678;
};

FUNC VOID Rtn_Start_7678()
{	
	TA_Stand_Guarding 	(07,00,23,00,"NW_FOREST_PATH_31_NAVIGATION3");
	TA_Stand_Guarding	(23,00,07,00,"NW_FOREST_PATH_31_NAVIGATION3");
};

FUNC VOID Rtn_Transform_7678()
{	
	TA_Transform_Wolf	(08,00,20,00,"NW_FOREST_PATH_31_NAVIGATION3");
	TA_Transform_Wolf 	(20,00,08,00,"NW_FOREST_PATH_31_NAVIGATION3");
};

FUNC VOID Rtn_Tot_7678()
{	
	TA_Smalltalk	(08,00,20,00,"TOT");
	TA_Smalltalk 	(20,00,08,00,"TOT");
};