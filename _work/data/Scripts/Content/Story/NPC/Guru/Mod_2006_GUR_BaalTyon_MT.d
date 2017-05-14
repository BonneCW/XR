instance Mod_2006_GUR_BaalTyon_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Baal Tyon";
	Npctype 	=		NPCTYPE_Main;
	guild 		=		GIL_OUT;
	level 		=		28;
	flags 		=		NPC_FLAG_IMMORTAL;
	
	voice		= 0;
	id 			=		2006;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	70;
	attribute[ATR_DEXTERITY] 		=	35;
	attribute[ATR_MANA_MAX] 		=	50;
	attribute[ATR_MANA] 			=	50;
	attribute[ATR_HITPOINTS_MAX] 	=	376;
	attribute[ATR_HITPOINTS] 		=	376;

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
	daily_routine = Rtn_start_2006;
	
};

FUNC VOID Rtn_start_2006 ()
{
    TA_Sleep	(02,00,08,00,"PSI_23_HUT_IN");
    TA_Preach_PSI	(08,00,02,00,"PSI_TEACH_CADAR");
};

FUNC VOID Rtn_Tempel_2006 ()
{
	TA_Pray_Sleeper_FP 	(08,00,20,00,"PSI_TEMPLE_NOVIZE_PR6");
	TA_Pray_Sleeper_FP 	(20,00,08,00,"PSI_TEMPLE_NOVIZE_PR6");
};

FUNC VOID Rtn_Tot_2006 ()
{
	TA_Stand_WP 	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};