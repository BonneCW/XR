instance Mod_1324_PSINOV_Novize_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype 		=		Npctype_mt_sumpfnovize;
	guild 		=		GIL_out;
	level 		=		9;
	
	voice		= 0;
	id 			=		1324;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	15;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	148;
	attribute[ATR_HITPOINTS] 		=	148;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1 , 1,"Hum_Head_Psionic", 30,  1, NOV_ARMOR_M);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------
	
	//-------- inventory --------

	
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1324;
};

FUNC VOID Rtn_start_1324 ()
{
    TA_Stomp_Herb	(07,00,00,00,"PSI_HERB_PLACE_2");// schläft PSI_16_HUT_IN
    TA_Sleep 		(00,00,07,00,"PSI_6_HUT_IN_BED2");
};

FUNC VOID Rtn_Leichengase_1324 ()
{
	TA_Smalltalk_Plaudern		(23,55,08,05,"PSI_TRAINING_3");
	TA_Smalltalk_Plaudern		(08,05,23,55,"PSI_TRAINING_3");
};

FUNC VOID Rtn_Tot_1324 ()
{
	TA_Stand_WP 	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};