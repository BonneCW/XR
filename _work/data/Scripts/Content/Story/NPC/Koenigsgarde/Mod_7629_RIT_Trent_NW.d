instance Mod_7629_RIT_Trent_NW (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Trent";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_OUT;
	level 		=	63;
	voice		= 0;
	id 			=	7629;
		
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 223,  1, ITAR_PAL_M);
        
	Mdl_SetModelFatness(self,1);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 																
	B_SetFightSkills (self, 80); 
	B_SetAttributesToChapter (self, 5);		
			
	//-------- inventory --------
	EquipItem	(self, ItMw_2h_Pal_Sword);
	
	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7629;
};

FUNC VOID Rtn_start_7629 ()
{
	TA_Stand_WP		(23,30,08,30,"WAYTOPORT_07");
	TA_Stand_WP		(08,30,23,30,"WAYTOPORT_07");	
};

FUNC VOID Rtn_Shadowbeast_7629 ()
{
	TA_RunToWP		(23,30,08,30,"WAYTOPORT_09");
	TA_RunToWP		(08,30,23,30,"WAYTOPORT_09");
};

FUNC VOID Rtn_Tot_7629 ()
{
	TA_RunToWP		(23,30,08,30,"TOT");
	TA_RunToWP		(08,30,23,30,"TOT");	
};