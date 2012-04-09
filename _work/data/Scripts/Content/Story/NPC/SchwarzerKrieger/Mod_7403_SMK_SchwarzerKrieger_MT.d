instance Mod_7403_SMK_SchwarzerKrieger_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_schwarzerkrieger;
	npctype		= 	NPCTYPE_MAIN;
	guild 		=	GIL_kdf;
	level 		=	10;
	voice 		=	13;
	id 			=	7403;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 5);
	EquipItem	(self, ItMw_BeliarsRache);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Fighter", 4,  1, itar_smk_L);
        
       
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
			
	//-------- inventory --------
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_7403;
};



FUNC VOID Rtn_start_7403 ()
{
	TA_Stand_Guarding 	(00,00,12,00,"OW_OM_ENTRANCE03");
	TA_Stand_Guarding 	(12,00,24,00,"OW_OM_ENTRANCE03");
};

FUNC VOID Rtn_Tot_7403 ()
{
	TA_Stand_Guarding 	(00,00,12,00,"TOT");
	TA_Stand_Guarding 	(12,00,24,00,"TOT");
};