instance Mod_1016_KGD_Hymir_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Hymir";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_OUT;
	voice		= 16;
	id 			=	1016;
		
	//-------- abilities --------

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	


	
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 13,  1, ITAR_Erzbaron_Blau);
        
	Mdl_SetModelFatness(self,2);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 																
	B_SetFightSkills (self, 90); 
	B_SetAttributesToChapter (self, 5);		
			
	//-------- inventory --------
	EquipItem	(self, ItMw_Orkschlaechter);
	

	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1016;
};

FUNC VOID Rtn_start_1016 ()
{
	TA_Sit_Throne	(00,00,08,00,	"MC_THRON_SIT");
	TA_Sit_Throne	(08,00,00,00,	"MC_THRON_SIT");			
	
};

FUNC VOID Rtn_InPsicamp_1016 ()
{
	TA_Stand_WP		(02,10,21,05,"PSI_TEMPLE_IN_05");
	TA_Stand_WP		(21,05,02,10,"PSI_TEMPLE_IN_05");
};

FUNC VOID Rtn_Tot_1016 ()
{
	TA_Sit_Throne	(00,00,08,00,	"TOT");
	TA_Sit_Throne	(08,00,00,00,	"TOT");			
	
};
