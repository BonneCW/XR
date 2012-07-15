instance Mod_2008_PSINOV_Ghorim_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Ghorim";
	Npctype	 	=		Npctype_Main;
	guild 		=		GIL_OUT;
	level 		=		9;

	voice 		=		2;
	id 			=		2008;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 168,  1, NOV_ARMOR_L);

	
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
		
	//-------- inventory --------

	EquipItem (self, ItMw_ShortSword2);
	
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_PreStart_2008;
};

FUNC VOID Rtn_PreStart_2008 ()
{
	TA_Stomp_Herb 	(06,55,23,55,"PSI_HERB_PLACE_1");
	TA_Sleep 	(23,55,06,55,"PSI_6_HUT_IN_BED3");
};

FUNC VOID Rtn_Sumpfmensch_2008 ()
{
	TA_Stomp_Herb 	(07,00,22,00,"PSI_HERB_PLACE_1");
	TA_Sit_Campfire	(22,00,07,00,"PSI_PLACE");
};

FUNC VOID Rtn_Tot_2008 ()
{
	TA_Stand_WP 	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};