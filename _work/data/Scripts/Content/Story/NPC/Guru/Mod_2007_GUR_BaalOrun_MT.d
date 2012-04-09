instance Mod_2007_GUR_BaalOrun_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Baal Orun";
	Npctype 	=		NPCTYPE_Main;
	guild 		=		GIL_OUT;
	level 		=		28;
	
	voice 		=		12;
	id 			=		2007;
		
	///-------- abilities --------
	attribute[ATR_STRENGTH] 		=	70;
	attribute[ATR_DEXTERITY] 		=	60;
	attribute[ATR_MANA_MAX] 		=	50;
	attribute[ATR_MANA] 			=	50;
	attribute[ATR_HITPOINTS_MAX] 	=	376;
	attribute[ATR_HITPOINTS] 		=	376;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 166,  1, GUR_ARMOR_M);

	
	Mdl_SetModelFatness(self,0);

	//-------- Talente --------
	
	//-------- inventory --------
	
	EquipItem (self, Oruns_Keule);
	B_SetAttributesToChapter (self, 6);
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2007;
	fight_tactic	=	FAI_HUMAN_MAGE;
};

FUNC VOID Rtn_start_2007 ()
{
    TA_Stand_ArmsCrossed			(07,00,00,00,"PSI_PATH_2_6");
    TA_Sleep		(00,00,07,00,"PSI_TREE_IN");
};

FUNC VOID Rtn_Tempel_2007 ()
{
	TA_Pray_Sleeper_FP 	(08,00,20,00,"PSI_TEMPLE_NOVIZE_PR6");
	TA_Pray_Sleeper_FP 	(20,00,08,00,"PSI_TEMPLE_NOVIZE_PR6");
};