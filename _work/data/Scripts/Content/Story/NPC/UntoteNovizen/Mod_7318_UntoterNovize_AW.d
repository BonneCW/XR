instance Mod_7318_UntoterNovize_AW (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Untoter Novize";
	Npctype 		=		Npctype_UNTOTERNOVIZE;
	guild 		=		GIL_STRF;
	level 		=		20;
	 	
	voice		= 0;
	id 			=		7318;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 15, 0,"Hum_Head_FatBald", 199,  1, ITAR_UntoterNovize);

	Mdl_SetModelFatness(self,0);
	
	B_SetFightSkills	(self, 65);
	B_CreateAmbientInv 	(self);

	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------

	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7318;

	//------------- //MISSIONs-------------
};

FUNC VOID Rtn_start_7318 ()
{
	TA_Stand_WP	(02,00,08,00,"WP_UNDEAD_07");
	TA_Stand_WP	(08,00,02,00,"WP_UNDEAD_07"); 
};