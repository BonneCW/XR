instance Mod_1119_PSINOV_Shrat_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Shrat";
	Npctype 		=		Npctype_Main;
	guild 		=		GIL_OUT;
	level 		=		3;
	 	
	voice 		=		2;
	id 			=		1119;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	10;
	attribute[ATR_DEXTERITY] 		=	10;
	attribute[ATR_MANA_MAX] 		=	7;
	attribute[ATR_MANA] 			=	7;
	attribute[ATR_HITPOINTS_MAX] 	=	76;
	attribute[ATR_HITPOINTS] 		=	76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 28,  1, NOV_ARMOR_L);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------

	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1119;
};

FUNC VOID Rtn_start_1119()
{
   TA_Sit_Campfire	(08,00,20,00,"PATH_SWAMP_HUT");
   TA_Sit_Campfire	(20,00,08,00,"PATH_SWAMP_HUT");
};
