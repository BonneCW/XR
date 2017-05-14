instance Mod_1359_PSINOV_Novize_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype 	=		Npctype_mt_sumpfnovize;
	guild 		=		GIL_out;
	level 		=		20;
	flags 		=		0;
	
	voice		= 0;
	id 			=		1359;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH]	 		=	20;
	attribute[ATR_DEXTERITY] 		=	20;
	attribute[ATR_MANA_MAX] 		= 	100;
	attribute[ATR_MANA] 			=	100;
	attribute[ATR_HITPOINTS_MAX] 	=	76;
	attribute[ATR_HITPOINTS] 		=	76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 28,  1, NOV_ARMOR_L);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------
	
		
	//-------- inventory --------

	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1359;
};

FUNC VOID Rtn_start_1359 () //Kaloms PrivatHausWache
{
    TA_Guard_Passage	(08,00,20,00,"PSI_22_HUT_EX_GUARD");
    TA_Guard_Passage	(20,00,08,00,"PSI_22_HUT_EX_GUARD");	
};

FUNC VOID Rtn_Tot_1359 ()
{
	TA_Stand_WP 	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};


