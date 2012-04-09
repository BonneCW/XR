instance Mod_2003_GUR_BaalTondral_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Baal Tondral";
	Npctype 		=		Npctype_Main;
	guild 		=		GIL_OUT;
	level 		=		28;
	flags 		=		0;
	
	voice 		=		13;
	id 			=		2003;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	60;
	attribute[ATR_DEXTERITY] 		=	40;
	attribute[ATR_MANA_MAX] 		=	50;
	attribute[ATR_MANA] 			=	50;
	attribute[ATR_HITPOINTS_MAX] 	=	388;
	attribute[ATR_HITPOINTS] 		=	388;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1,1 ,"Hum_Head_Psionic", 165,  1, GUR_ARMOR_M);

	Mdl_SetModelFatness(self,0);

	//-------- Talente --------
	
	//-------- inventory --------

		B_SetAttributesToChapter (self, 6);
	fight_tactic		= FAI_HUMAN_STRONG;

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2003;
};

FUNC VOID Rtn_start_2003 ()
{
    TA_Sleep	(23,00,07,45,"PSI_28_HUT_IN");
    TA_Preach_PSI	(07,45,23,00,"PSI_PLATFORM_TEACHER");	
};

FUNC VOID Rtn_Tempel_2003 ()
{
	TA_Pray_Sleeper_FP 	(08,00,20,00,"PSI_TEMPLE_NOVIZE_PR6");
	TA_Pray_Sleeper_FP 	(20,00,08,00,"PSI_TEMPLE_NOVIZE_PR6");
};


