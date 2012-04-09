instance Mod_7236_GUR_Guru_NW (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Guru";
	Npctype 	=		NPCTYPE_Main;
	guild 		=		GIL_OUT;
	level 		=		28;
	flags 		=		0;
	
	voice 		=		11;
	id 			=		7236;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	70;
	attribute[ATR_DEXTERITY] 		=	35;
	attribute[ATR_MANA_MAX] 		=	50;
	attribute[ATR_MANA] 			=	50;
	attribute[ATR_HITPOINTS_MAX] 	=	20;
	attribute[ATR_HITPOINTS] 		=	20;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1,1 ,"Hum_Head_Psionic", 167,  1, GUR_ARMOR_M);

	
	Mdl_SetModelFatness(self,0);

	//-------- Talente -------
	
	B_SetAttributesToChapter (self, 6);
	fight_tactic		= FAI_HUMAN_STRONG;
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7236;
	
};

FUNC VOID Rtn_start_7236 ()
{
    TA_Stand_Guarding	(02,00,08,00,"NW_CITY_MERCHANT_PATH_28_B");
    TA_Stand_Guarding	(08,00,02,00,"NW_CITY_MERCHANT_PATH_28_B");
};