INSTANCE Mod_7133_ASS_Sinbad_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Sinbad"; 
	guild 		= GIL_OUT;
	id 			= 7133;
	voice 		= 13;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Assassinenschwert);														
	EquipItem	(self, ItRw_Assassinenbogen);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal_Sharky, BodyTex_B,ITAR_Assassine_01);	
	Mdl_SetModelFatness	(self,0);
	//Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds");
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7133;
};

FUNC VOID Rtn_Start_7133()
{	
	TA_Smalltalk 	(07,20,01,20,"WP_ASSASSINE_33");
	TA_Smalltalk	(01,20,07,20,"WP_ASSASSINE_33");
};

FUNC VOID Rtn_Training_7133()
{	
	TA_Guide_Player 	(07,20,01,20,"WP_ASSASSINENTRAINING");
	TA_Guide_Player		(01,20,07,20,"WP_ASSASSINENTRAINING");
};

FUNC VOID Rtn_Schlacht_7133()
{	
	TA_Stand_Guarding 	(07,20,01,20,"WP_ASSASSINE_51");
	TA_Stand_Guarding	(01,20,07,20,"WP_ASSASSINE_51");
};

FUNC VOID Rtn_Tot_7133()
{	
	TA_Stand_Guarding 	(07,20,01,20,"TOT");
	TA_Stand_Guarding	(01,20,07,20,"TOT");
};