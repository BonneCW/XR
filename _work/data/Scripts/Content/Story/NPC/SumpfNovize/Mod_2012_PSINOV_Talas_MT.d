instance Mod_2012_PSINOV_Talas_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Talas";
	Npctype 	=		NPCTYPE_Main;
	guild 		=	    GIL_OUT;
	level 		=	    4;
	flags 		= 		NPC_FLAG_IMMORTAL;
	
	voice 		=     	2;
	id 			=     	2012;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	15;
	attribute[ATR_DEXTERITY] 		=	10;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	78;
	attribute[ATR_HITPOINTS] 		=	78;
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_FatBald", 168 ,  1, NOV_ARMOR_L);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	
	//-------- Talente --------
		
	
	//-------- inventory --------

	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2012;
};

FUNC VOID Rtn_start_2012 ()
{
   TA_Smoke_Joint		(24,00,06,00,"PSI_PATH_TEMPLE_4_MOVEMENT");
   TA_Smoke_Joint		(06,00,24,00,"PSI_PATH_TEMPLE_4_MOVEMENT");	
};

FUNC VOID Rtn_AtGate_2012 ()
{
   TA_Stand_ArmsCrossed		(24,00,06,00,"PSI_START");
   TA_Stand_ArmsCrossed		(06,00,24,00,"PSI_START");	
};

FUNC VOID Rtn_GuideToTondral_2012 ()
{
   TA_Guide_Player		(24,00,06,00,"PSI_PLATFORM_LISTEN_2");
   TA_Guide_Player		(06,00,24,00,"PSI_PLATFORM_LISTEN_2");	
};

FUNC VOID Rtn_Tyon_2012 ()
{
   TA_Guide_Player		(24,00,06,00,"PSI_TEACH_TRAIN");
   TA_Guide_Player		(06,00,24,00,"PSI_TEACH_TRAIN");	
};

FUNC VOID Rtn_Tondral_2012 ()
{
   TA_Guide_Player		(24,00,06,00,"PSI_PLATFORM_LISTEN_2");
   TA_Guide_Player		(06,00,24,00,"PSI_PLATFORM_LISTEN_2");	
};

FUNC VOID Rtn_Orun_2012 ()
{
   TA_Guide_Player		(24,00,06,00,"PSI_PLACE");
   TA_Guide_Player		(06,00,24,00,"PSI_PLACE");	
};

FUNC VOID Rtn_Joru_2012 ()
{
   TA_Guide_Player		(24,00,06,00,"PSI_12_HUT_EX_TEACH2");
   TA_Guide_Player		(06,00,24,00,"PSI_12_HUT_EX_TEACH2");	
};

FUNC VOID Rtn_Caine_2012 ()
{
   TA_Guide_Player		(24,00,06,00,"PSI_STEG2");
   TA_Guide_Player		(06,00,24,00,"PSI_STEG2");	
};

FUNC VOID Rtn_BeiNamib_2012 ()
{
   TA_RunToWP		(24,00,06,00,"PSI_GUARD_TREE_EX");
   TA_RunToWP		(06,00,24,00,"PSI_GUARD_TREE_EX");	
};