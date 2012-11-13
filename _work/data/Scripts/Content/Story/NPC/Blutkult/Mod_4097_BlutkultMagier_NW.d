instance Mod_4097_BlutkultMagier_NW (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Blutkultmagier";
	Npctype 		=		Npctype_main;
	guild 		=		GIL_DMT;
	level 		=		60;
	 	
	voice 		=		2;
	id 			=		4097;
		
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

	CreateInvItems	(self, ItKe_MagicTempelKey, 1);

	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------

	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_4097;

	//------------- //MISSIONs-------------
};

FUNC VOID Rtn_start_4097 ()
{
	TA_Stand_WP	(02,00,08,00,"NW_FARM2_TAVERNCAVE1_07");
	TA_Stand_WP	(08,00,02,00,"NW_FARM2_TAVERNCAVE1_07"); 
};