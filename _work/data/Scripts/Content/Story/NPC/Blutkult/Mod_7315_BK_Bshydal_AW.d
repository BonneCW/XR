instance Mod_7315_BK_Bshydal_AW (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Bshydal";
	Npctype 		=		Npctype_main;
	guild 		=		GIL_OUT;
	level 		=		60;
	 	
	voice		= 0;
	id 			=		7315;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 5);

	level 		=		60;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 210, 21, Ritual_Magier);		
	
	Mdl_SetModelFatness(self,0);
	
	B_SetFightSkills	(self, 65);
	B_CreateAmbientInv 	(self);

	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------

	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7315;

	//------------- //MISSIONs-------------
};

FUNC VOID Rtn_start_7315 ()
{
	TA_Stand_Guarding	(02,00,08,00,"WP_AW_BEL_07");
	TA_Stand_Guarding	(08,00,02,00,"WP_AW_BEL_07"); 
};

FUNC VOID Rtn_Tot_7315 ()
{
	TA_Stand_Guarding	(02,00,08,00,"TOT");
	TA_Stand_Guarding	(08,00,02,00,"TOT"); 
};