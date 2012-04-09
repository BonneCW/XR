instance Mod_7625_KGD_Granmar_VM (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Granmar";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_OUT;
	voice 		=	8;
	id 		=	7625;
	flags		=	2;
		
	//-------- abilities --------

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	


	
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 56,  1, SSLD_ARMOR);
        
	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 																
	B_SetFightSkills (self, 60); 
	B_SetAttributesToChapter (self, 4);	
			
	//-------- inventory --------
	EquipItem	(self, ItMw_GranmarKeule);
	
	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7625;
};

FUNC VOID Rtn_start_7625 ()
{
	TA_Stand_Guarding	(08,00,20,00,"MINE_GO_07");
	TA_Stand_Guarding	(20,00,08,00,"MINE_GO_07");		
};

FUNC VOID Rtn_GuideToSee_7625 ()
{
	TA_Guide_Player	(08,00,20,00,"MINE_GO_17");
	TA_Guide_Player	(20,00,08,00,"MINE_GO_17");		
};

FUNC VOID Rtn_GuideToNager_7625 ()
{
	TA_Guide_Player	(08,00,20,00,"MINE_GO_51");
	TA_Guide_Player	(20,00,08,00,"MINE_GO_51");		
};

FUNC VOID Rtn_Wache_7625 ()
{
	TA_Stand_Guarding	(08,00,20,00,"MINE_GO_51");
	TA_Stand_Guarding	(20,00,08,00,"MINE_GO_51");		
};

FUNC VOID Rtn_Trent_7625 ()
{
	TA_Smalltalk		(23,30,08,30,"MINE_GO_07");
	TA_Smalltalk		(08,30,23,30,"MINE_GO_07");	
};