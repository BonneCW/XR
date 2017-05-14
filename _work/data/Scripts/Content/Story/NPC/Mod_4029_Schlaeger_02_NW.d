instance Mod_4029_Schlaeger_02_NW (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Schläger";
	Npctype 		=		Npctype_main;
	guild 		=		GIL_STRF;
	level 		=		20;
	 	
	voice		= 0;
	id 			=		4029;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 2);


	EquipItem	(self, ItMw_1H_Mace_02);

	CreateInvItems	(self, ItWr_TodeslisteVonCanthar, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 121, BodyTex_N,ITAR_BDT_L_01);

	Mdl_SetModelFatness(self,0);
	
	B_SetFightSkills	(self, 25);
	B_CreateAmbientInv 	(self);

	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------

	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_4029;

	//------------- //MISSIONs-------------
};

FUNC VOID Rtn_start_4029 ()
{
	TA_Stand_WP	(02,00,08,00,"WAY_PASS_MILL_02");
	TA_Stand_WP	(08,00,02,00,"WAY_PASS_MILL_02"); 
};