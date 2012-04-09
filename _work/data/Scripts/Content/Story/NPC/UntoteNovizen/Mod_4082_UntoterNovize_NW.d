instance Mod_4082_UntoterNovize_NW (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Untoter Elite-Novize";
	Npctype 		=		Npctype_UNTOTERNOVIZE;
	guild 		=		GIL_STRF;
	level 		=		20;
	 	
	voice 		=		2;
	id 			=		4082;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);
	level 		=		50;


	EquipItem	(self, ItMw_1h_Nov_Mace);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 14, 0,"Hum_Head_FatBald", 198,  1, ITAR_UntoterNovize);

	Mdl_SetModelFatness(self,0);
	
	B_SetFightSkills	(self, 65);
	B_CreateAmbientInv 	(self);

	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------

	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_4082;

	//------------- //MISSIONs-------------
};

FUNC VOID Rtn_start_4082 ()
{
	TA_Circle	(02,00,08,00,"NW_TROLLAREA_RUINS_10");
	TA_Circle	(08,00,02,00,"NW_TROLLAREA_RUINS_10"); 
};