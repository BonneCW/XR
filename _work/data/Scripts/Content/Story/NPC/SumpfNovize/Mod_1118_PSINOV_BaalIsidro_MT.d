instance Mod_1118_PSINOV_BaalIsidro_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Baal Isidro";
	Npctype 	=		Npctype_Main;
	guild 		=		GIL_OUT;
	level 		=		9;
	
	voice 		=		3;
	id 			=		1118;
		
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
	Mdl_SetVisualBody	(self,"hum_body_Naked0",1, 1 ,"Hum_Head_FatBald", 29 ,  1, NOV_ARMOR_M);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
		
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);			
	
	//-------- inventory --------

		
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1118;
};

FUNC VOID Rtn_start_1118 ()
{
	TA_Sit_Chair (08,00,20,00,"NC_TAVERN_SIT2"); 
	TA_Sit_Chair (20,00,08,00,"NC_TAVERN_SIT2");
};

FUNC VOID Rtn_Kagan_1118 ()
{
	TA_Stand_WP (08,00,20,00,"NC_TAVERN_OUT_GUARD"); 
	TA_Stand_WP (20,00,08,00,"NC_TAVERN_OUT_GUARD");
};

FUNC VOID Rtn_Lager_1118 ()
{
	TA_Smoke_Waterpipe (08,00,20,00,"PSI_31_HUT_EX"); 
	TA_Smoke_Waterpipe (20,00,08,00,"PSI_31_HUT_EX");
};
