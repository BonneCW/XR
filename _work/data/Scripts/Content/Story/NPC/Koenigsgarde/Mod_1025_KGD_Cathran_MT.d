instance Mod_1025_KGD_Cathran_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Cathran";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_OUT;
	voice		= 0;
	id 			=	1025;
		
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 13,  1, ITAR_ERZBARON_BLAU);
        
	Mdl_SetModelFatness(self,2);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 																
	B_SetFightSkills (self, 80); 
	B_SetAttributesToChapter (self, 5);		
			
	//-------- inventory --------
	EquipItem	(self, ItMw_Hellebarde);
	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1025;
};

FUNC VOID Rtn_start_1025 ()
{
	TA_Stand_Guarding	(21,00,22,00,"OW_PATH_1_17_4");
	TA_Sit_Bench		(22,00,21,00,"OW_PATH_1_17_3");	
};

FUNC VOID Rtn_KillMission_1025 ()
{
	TA_Stand_ArmsCrossed		(08,30,10,30,"OCC_BARONS_GREATHALL_RIGHT_FRONT");
	TA_Stand_Drinking		(10,30,21,30,"OCC_MERCS_RIGHT_ROOM_BACK");	
	TA_Stand_WP		(21,30,08,30,"OW_PATH_1_17_2");
};
