instance Mod_7497_BlutkultMagier_NW (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Blutkult Magier";
	Npctype 		=		Npctype_main;
	guild 		=		GIL_DMT;
	level 		=		60;
	 	
	voice 		=		2;
	id 			=		7497;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 5);

	level 		=		65;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 211, 21, Ritual_Magier);		
	
	Mdl_SetModelFatness(self,0);
	
	B_SetFightSkills	(self, 65);
	B_CreateAmbientInv 	(self);

	CreateInvItems	(self, ItPo_Blood, 4);
	CreateInvItems	(self, ItPl_Mushroom_03, 3);
	CreateInvItems	(self, ItWr_Rezept_Blutkult, 1);
	CreateInvItems	(self, ItWr_BlutkultMage2, 1);

	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------

	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7497;

	//------------- //MISSIONs-------------
};

FUNC VOID Rtn_start_7497 ()
{
	TA_Stand_WP	(02,00,08,00,"NW_FARM2_TO_TAVERNCAVE1_05");
	TA_Stand_WP	(08,00,02,00,"NW_FARM2_TO_TAVERNCAVE1_05"); 
};