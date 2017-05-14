instance Mod_1725_PSINOV_Novize_NW (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Fanatischer Novize";
	Npctype 		=		Npctype_nw_sumpfnovize;
	guild 		=		GIL_strf;
	level 		=		3;
	 	
	voice		= 0;
	id 			=		1725;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 28,  1, ITAR_NovizeFanatiker);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------

	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1725;

	//------------- //MISSIONs-------------
};

FUNC VOID Rtn_start_1725 ()
{
	TA_Sit_Campfire	(02,00,08,00,"NW_FARM1_BANDITS_CAVE_07");
	TA_Sit_Campfire	(08,00,02,00,"NW_FARM1_BANDITS_CAVE_07"); 
};