instance Mod_7397_PSINOV_Turgor_REL (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Turgor";
	Npctype 		=	Npctype_MAIN;
	guild 		=		GIL_out;
	level 		=		9;	
	
	voice 		=		27;
	id 			=		7397;
		
	//-------- abilities --------
	B_SetAttributesToChapter (self, 3);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 26,  1, NOV_ARMOR_M);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------
		
	B_SetFightSkills (self, 45);			
	
	//-------- inventory --------

	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7397;
};

FUNC VOID Rtn_start_7397 () //Sumpfkraut-Sammler
{
	TA_Sit_Campfire (07,05,19,05,"REL_SURFACE_069");
	TA_Sit_Campfire (19,05,07,05,"REL_SURFACE_069");
};

