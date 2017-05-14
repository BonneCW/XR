instance Mod_1348_PSINOV_Novize_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Novize;
	Npctype 		=		NPCTYPE_mt_sumpfnovize;
	guild 		=		GIL_out;
	level 		=		14;

	
	voice		= 0;
	id 			=		1348;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_FatBald", 27 ,  1, NOV_ARMOR_H);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD;
	

	//-------- Talente --------
		
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);			
	
	//-------- inventory --------

	
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1348;
};

FUNC VOID Rtn_start_1348 ()
{
	TA_Meditate	(08,00,10,00,"PSI_TEMPLE_NOVIZE_PR4_MOVEMENT");
	TA_Meditate	(10,00,08,00,"PSI_TEMPLE_NOVIZE_PR4_MOVEMENT");	
};

FUNC VOID Rtn_Tot_1348 ()
{
	TA_Stand_WP 	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};