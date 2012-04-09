instance Mod_1347_PSINOV_Novize_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype 		=		Npctype_mt_sumpfnovize;
	guild 		=		GIL_out;
	level 		=		14;
	
	voice 		=		5;
	id 			=		1347;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	30;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	19;
	attribute[ATR_MANA] 			=	19;
	attribute[ATR_HITPOINTS_MAX] 	=	208;
	attribute[ATR_HITPOINTS] 		=	208;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 22,  1, NOV_ARMOR_H);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
		
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);			
	
	//-------- inventory --------

	
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1347;
};

FUNC VOID Rtn_start_1347 ()
{
	TA_Meditate	(08,00,10,00,"PSI_TEMPLE_COURT_2");
	TA_Meditate	(10,00,08,00,"PSI_TEMPLE_COURT_2");	
};

FUNC VOID Rtn_Tot_1347 ()
{
	TA_Stand_WP 	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};