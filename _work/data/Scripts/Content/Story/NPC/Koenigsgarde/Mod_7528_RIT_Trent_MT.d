instance Mod_7528_RIT_Trent_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Trent";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_OUT;
	level 		=	63;
	voice 		=	6;
	id 			=	7528;
	flags = 2;
		
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 223,  1, ITAR_PAL_M);
        
	Mdl_SetModelFatness(self,2);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 																
	B_SetFightSkills (self, 80); 
	B_SetAttributesToChapter (self, 5);		
			
	//-------- inventory --------
	EquipItem	(self, ItMw_2h_Pal_Sword);
	
	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7528;
};

FUNC VOID Rtn_start_7528 ()
{
	TA_Sit_Campfire		(23,30,08,30,"CASTLE_27");
	TA_Sit_Campfire		(08,30,23,30,"CASTLE_27");	
};

FUNC VOID Rtn_GuideToOrks_7528 ()
{
	TA_Guide_Player		(23,30,08,30,"CASTLE_36");
	TA_Guide_Player		(08,30,23,30,"CASTLE_36");	
};