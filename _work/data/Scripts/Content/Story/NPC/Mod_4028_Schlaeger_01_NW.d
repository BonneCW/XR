instance Mod_4028_Schlaeger_01_NW (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Schläger";
	Npctype 		=		Npctype_main;
	guild 		=		GIL_STRF;
	level 		=		20;
	 	
	voice 		=		2;
	id 			=		4028;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 2);


	EquipItem	(self, ItMw_1H_Mace_02);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 123, BodyTex_N,ITAR_BDT_L_01);

	Mdl_SetModelFatness(self,0);
	
	B_SetFightSkills	(self, 15);
	B_CreateAmbientInv 	(self);

	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------

	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_4028;

	//------------- //MISSIONs-------------
};

FUNC VOID Rtn_start_4028 ()
{
	TA_Stand_WP	(02,00,08,00,"WAY_PASS_MILL_02");
	TA_Stand_WP	(08,00,02,00,"WAY_PASS_MILL_02"); 
};