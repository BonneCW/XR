instance Mod_1326_PSINOV_Novize_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype 		=		Npctype_mt_sumpfnovize;
	guild 		=		GIL_out;
	level 		=		3;
	
	voice		= 0;
	id 			=		1326;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	10;
	attribute[ATR_DEXTERITY] 		=	10;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	76;
	attribute[ATR_HITPOINTS] 		=	76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 30 ,  1, NOV_ARMOR_L);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------
	
		
	//-------- inventory --------
//-------------Daily Routine-------------
	daily_routine = Rtn_start_1326;
};

FUNC VOID Rtn_start_1326 ()
{
	TA_Sleep		(23,55,08,05,"PSI_12_HUT_IN_BED2");
	TA_Listen		(08,05,23,55,"PSI_12_HUT_EX_TEACH2");
};

FUNC VOID Rtn_Leichengase_1326 ()
{
	TA_Smalltalk_Plaudern		(23,55,08,05,"PSI_TRAINING_8");
	TA_Smalltalk_Plaudern		(08,05,23,55,"PSI_TRAINING_8");
};

FUNC VOID Rtn_Tot_1326 ()
{
	TA_Stand_WP 	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};