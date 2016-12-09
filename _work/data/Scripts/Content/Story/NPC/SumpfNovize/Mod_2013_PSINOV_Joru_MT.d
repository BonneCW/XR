instance Mod_2013_PSINOV_Joru_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Baal Joru";
	Npctype 		=		Npctype_Main;
	guild	 		=		GIL_OUT;
	level 		=		9;
	flags 		=		0;
	
	voice 		=		7;
	id 			=		2013;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 168 ,  1, GUR_ARMOR_M);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
		
	
	//-------- inventory --------

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2013;
	
	//------------- //MISSIONs-------------
};

FUNC VOID Rtn_start_2013 () //ST: Teach-Platz 1 (Joru-Platz)
{
	TA_Sleep	(23,55,08,05,"PSI_14_HUT_IN");
	TA_Preach_PSI	(08,05,23,55,"PSI_11_HUT_EX");
};

FUNC VOID Rtn_Tempel_2013 ()
{
	TA_Pray_Sleeper_FP 	(08,00,20,00,"PSI_TEMPLE_NOVIZE_PR6");
	TA_Pray_Sleeper_FP 	(20,00,08,00,"PSI_TEMPLE_NOVIZE_PR6");
};

FUNC VOID Rtn_Sumpfmensch_2013 ()
{
	TA_Stand_Guarding 	(08,00,20,00,"PATH_AROUND_PSI07");
	TA_Stand_Guarding 	(20,00,08,00,"PATH_AROUND_PSI07");
};

FUNC VOID Rtn_AtDarrion_2013 ()
{
	TA_Stand_WP		(10,00,22,00,"PSI_26_HUT_IN");
	TA_Stand_WP		(22,00,10,00,"PSI_26_HUT_IN");
};

FUNC VOID Rtn_Tot_2013 ()
{
	TA_Stand_WP 	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};