instance Mod_1017_KGD_Granmar_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Granmar";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_OUT;
	voice 		=	26;
	id 			=	1017;
		
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
	EquipItem	(self, ItMw_1h_Bau_Mace);
	
	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1017;
};

FUNC VOID Rtn_start_1017 ()
{
	TA_Stand_Guarding	(08,00,20,00,"MC_EINGANG_2");
	TA_Smalltalk		(20,00,24,00,"KG_001");	
	TA_Sleep		(24,00,08,00,"MC_S_003");	
};

FUNC VOID Rtn_Tot_1017 ()
{
	TA_Stand_Guarding	(08,00,20,00,"TOT");
	TA_Stand_Guarding	(20,00,08,00,"TOT");		
};
