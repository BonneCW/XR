instance Mod_1024_KGD_Melcador_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Melcador";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_NONE;
	voice		= 0;
	id 			=	1024;
		
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");



	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 13,  1, SSLD_ARMOR);
        
	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 																
	B_SetFightSkills (self, 60); 
	B_SetAttributesToChapter (self, 4);		
			
	//-------- inventory --------
	EquipItem	(self, ItMw_Bartaxt);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1024;
};

FUNC VOID Rtn_start_1024 ()
{
	TA_Sit_Bench		(06,00,12,00,"MC_FP_2");
	TA_Stand_WP		(12,00,14,00,"MC_WA_02");
	TA_Sit_Bench		(14,00,16,00,"MC_FP_2");		
	TA_Smalltalk		(16,00,20,00,"MC_FP_3"); // mit Ole
	TA_Sit_Bench		(20,00,21,00,"MC_FP_2");
	TA_Smalltalk		(21,00,23,00,"MC_FP_3"); // mit Berdin
	TA_Stand_WP		(23,00,01,00,"MC_WA_02");
	TA_Sleep		(01,00,06,00,"KG_006");	
};

FUNC VOID Rtn_ToOc_1024 ()
{
	TA_Guide_Player		(20,00,08,30,"OCR_OUTSIDE_HUT_2");
	TA_Guide_Player		(08,30,20,00,"OCR_OUTSIDE_HUT_2");	
};

FUNC VOID Rtn_TalkWith_1024 ()
{
	TA_Smalltalk		(20,00,08,30,"OCR_OUTSIDE_HUT_2");
	TA_Smalltalk		(08,30,20,00,"OCR_OUTSIDE_HUT_2");	
};

FUNC VOID Rtn_FollowToCosta_1024 ()
{
	TA_Follow_Player		(20,00,08,30,"OCR_OUTSIDE_HUT_2");
	TA_Follow_Player		(08,30,20,00,"OCR_OUTSIDE_HUT_2");	
};