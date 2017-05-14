instance Mod_7630_RIT_Trent_VM (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Trent";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_OUT;
	level 		=	63;
	voice		= 0;
	id 			=	7630;
		
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 223,  1, ITAR_PAL_M);
        
	Mdl_SetModelFatness(self, 1);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 																
	B_SetFightSkills (self, 80); 
	B_SetAttributesToChapter (self, 5);		
			
	//-------- inventory --------
	EquipItem	(self, ItMw_2h_Pal_Sword);
	
	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_7630;
};

FUNC VOID Rtn_Start_7630 ()
{
	TA_Smalltalk		(23,30,08,30,"MINE_GO_07");
	TA_Smalltalk		(08,30,23,30,"MINE_GO_07");	
};

FUNC VOID Rtn_FollowToNager_7630 ()
{
	TA_Follow_Player		(23,30,08,30,"MINE_GO_37");
	TA_Follow_Player		(08,30,23,30,"MINE_GO_37");
};

FUNC VOID Rtn_GuideToNager_7630 ()
{
	TA_Guide_Player		(23,30,08,30,"MINE_GO_43");
	TA_Guide_Player		(08,30,23,30,"MINE_GO_43");
};

FUNC VOID Rtn_GuideToNager2_7630 ()
{
	TA_Guide_Player		(23,30,08,30,"MINE_GO_45");
	TA_Guide_Player		(08,30,23,30,"MINE_GO_45");
};

FUNC VOID Rtn_WaitAtNager2_7630 ()
{
	TA_Stand_Guarding		(23,30,08,30,"MINE_GO_45");
	TA_Stand_Guarding		(08,30,23,30,"MINE_GO_45");
};

FUNC VOID Rtn_GuideToQueen_7630 ()
{
	TA_Guide_Player		(23,30,08,30,"MINE_GO_53");
	TA_Guide_Player		(08,30,23,30,"MINE_GO_53");
};

FUNC VOID Rtn_Tot_7630 ()
{
	TA_RunToWP		(23,30,08,30,"WECH_02");
	TA_RunToWP		(08,30,23,30,"WECH_02");
};