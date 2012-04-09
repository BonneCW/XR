instance Mod_3001_PSINOV_Balor_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Balor";
	Npctype	 	=		Npctype_Main;
	guild 		=		GIL_OUT;
	level 		=		15;
	
	voice 		=		1;
	id 			=		3001;
		
	
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
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Bald", 26,  1, NOV_ARMOR_L);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------

	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_3001;
};

FUNC VOID Rtn_start_3001 () //Sumpfkraut-Sammler-Chef 2
{
	TA_Pick_FP		(07,00,19,00,"PATH_TAKE_HERB_06");
	TA_Pick_FP		(19,00,07,00,"PATH_TAKE_HERB_06");
};

FUNC VOID Rtn_Tot_3001 ()
{
	TA_Stand_WP 	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};