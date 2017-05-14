INSTANCE Mod_7163_ASS_Kamal_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Kamal"; 
	guild 		= GIL_OUT;
	id 			= 7163;
	voice		= 0;
	flags       = 2;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------		
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal_Sharky, BodyTex_B,ITAR_Assassine_02);	
	Mdl_SetModelFatness	(self,0);
	//Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds");
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7163;
};

FUNC VOID Rtn_Start_7163()
{	
	TA_Potion_Alchemy 	(07,20,01,20,"WP_ASSASSINE_53");
	TA_Potion_Alchemy	(01,20,07,20,"WP_ASSASSINE_53");
};

FUNC VOID Rtn_Plaudern_7163()
{	
	TA_Smalltalk 	(07,20,01,20,"WP_ASSASSINE_67");
	TA_Smalltalk	(01,20,07,20,"WP_ASSASSINE_67");
};

FUNC VOID Rtn_Schlacht_7163()
{	
	TA_Stand_Guarding 	(07,20,01,20,"WP_ASSASSINE_51");
	TA_Stand_Guarding	(01,20,07,20,"WP_ASSASSINE_51");
};

FUNC VOID Rtn_Tot_7163()
{	
	TA_Stand_Guarding 	(07,20,01,20,"TOT");
	TA_Stand_Guarding	(01,20,07,20,"TOT");
};