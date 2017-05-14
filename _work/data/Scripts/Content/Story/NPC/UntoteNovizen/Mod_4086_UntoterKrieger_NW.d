instance Mod_4086_UntoterKrieger_NW (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Untoter Krieger";
	Npctype 		=		Npctype_main;
	guild 		=		GIL_STRF;
	level 		=		40;
	 	
	voice		= 0;
	id 			=		4086;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);


	EquipItem	(self, ItMw_1h_Nov_Mace);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 15, 0,"Hum_Head_FatBald", 201,  1, ITAR_UntoterKrieger);

	Mdl_SetModelFatness(self,0);
	
	B_SetFightSkills	(self, 65);
	B_CreateAmbientInv 	(self);

	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------

	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_4086;

	//------------- //MISSIONs-------------
};

FUNC VOID Rtn_start_4086 ()
{
	TA_Stand_WP	(02,00,08,00,"NW_KRONKELLARES_03");
	TA_Stand_WP	(08,00,02,00,"NW_KRONKELLARES_03"); 
};