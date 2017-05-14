instance Mod_7205_GUR_BaalNetbek_AW (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Baal Netbek";
	Npctype 	=		NPCTYPE_Main;
	guild 		=		GIL_OUT;
	level 		=		28;
	flags       = NPC_FLAG_GHOST|NPC_FLAG_IMMORTAL;		
	voice		= 0;
	id 			=		7205;
		
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
	
	B_SetAttributesToChapter (self, 6);
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7205;
	fight_tactic	=	FAI_HUMAN_MAGE;
};

FUNC VOID Rtn_start_7205 ()
{
	TA_Stand_ArmsCrossed			(07,00,00,00,Npc_GetNearestWP(hero));
	TA_Stand_ArmsCrossed		(00,00,07,00,Npc_GetNearestWP(hero));
};

FUNC VOID Rtn_Tot_7205 ()
{
	TA_Pray_Sleeper_FP 	(08,00,20,00,"TOT");
	TA_Pray_Sleeper_FP 	(20,00,08,00,"TOT");
};