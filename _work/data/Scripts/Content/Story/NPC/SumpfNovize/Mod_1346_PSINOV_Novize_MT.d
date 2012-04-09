instance Mod_1346_PSINOV_Novize_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype 		=		Npctype_mt_sumpfnovize;
	guild 		=		GIL_out;
	level 		=		3;

	
	voice 		=		2;
	id 			=		1346;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	30;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	8;
	attribute[ATR_MANA] 			=	8;
	attribute[ATR_HITPOINTS_MAX] 	=	208;
	attribute[ATR_HITPOINTS] 		=	208;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_FatBald", 31 ,  1, NOV_ARMOR_L);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------
	
		
	//-------- inventory --------

	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1346;
};

FUNC VOID Rtn_start_1346 ()
{
	TA_Meditate	(08,00,10,00,"PSI_TEMPLE_COURT_2_MOVEMENT");
	TA_Meditate	(10,00,08,00,"PSI_TEMPLE_COURT_2_MOVEMENT");	
};

FUNC VOID Rtn_Tot_1346 ()
{
	TA_Stand_WP 	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};