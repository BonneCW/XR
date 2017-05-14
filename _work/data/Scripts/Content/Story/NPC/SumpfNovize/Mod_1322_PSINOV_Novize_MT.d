instance Mod_1322_PSINOV_Novize_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype	 	=		Npctype_mt_sumpfnovize;
	guild 		=		GIL_out;
	level 		=		9;

	
	voice		= 0;
	id 			=		1322;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1 ,"Hum_Head_FatBald", 29 ,  1, NOV_ARMOR_M);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------
		
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);			
	
	//-------- inventory --------

	
 
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1322;
};

FUNC VOID Rtn_start_1322 ()
{
	TA_Smoke_Joint	(07,30,01,00,"PSI_PATH_1_3_BLUBBER");
	TA_Sleep	(01,00,07,30,"PSI_2_HUT_IN");
};

FUNC VOID Rtn_Leichengase_1322 ()
{
	TA_Smalltalk_Plaudern		(23,55,08,05,"PSI_PATH_6_7");
	TA_Smalltalk_Plaudern		(08,05,23,55,"PSI_PATH_6_7");
};

FUNC VOID Rtn_Tot_1322 ()
{
	TA_Stand_WP 	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};