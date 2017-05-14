INSTANCE Mod_7118_ASS_Anwaerter_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Anwärter"; 
	guild 		= GIL_OUT;
	id 			= 7118;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Assassinenkralle);														
	EquipItem	(self, ItRw_Todesbogen);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal_Sharky, BodyTex_B,ITAR_Assassine_01);	
	Mdl_SetModelFatness	(self,0);
	//Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds");
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7118;
};

FUNC VOID Rtn_Start_7118()
{	
	TA_Smalltalk 	(07,20,01,20,"WP_ASSASSINE_25");
	TA_Smalltalk	(01,20,07,20,"WP_ASSASSINE_25");
};

FUNC VOID Rtn_Training_7118()
{	
	TA_Practice_Sword 	(07,20,01,20,"WP_ASSASSINENTRAINING");
	TA_Practice_Sword	(01,20,07,20,"WP_ASSASSINENTRAINING");
};

FUNC VOID Rtn_Schlacht_7118()
{	
	TA_Stand_Guarding 	(07,20,01,20,"WP_ASSASSINE_51");
	TA_Stand_Guarding	(01,20,07,20,"WP_ASSASSINE_51");
};

FUNC VOID Rtn_Tot_7118()
{	
	TA_Stand_Guarding 	(07,20,01,20,"TOT");
	TA_Stand_Guarding	(01,20,07,20,"TOT");
};