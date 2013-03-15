instance Mod_1116_PSINOV_Caine_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Baal Caine";
	Npctype 	=		Npctype_Main;
	guild 		=		GIL_OUT;
	level 		=		9;
	
	voice 		=		31;
	id 			=		1116;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1 ,"Hum_Head_Psionic", 21,  1, GUR_ARMOR_M);
	
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
		
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);			
	
	//-------- inventory --------

	
        
	//-------- inventory --------
	
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1116;
};

FUNC VOID Rtn_start_1116 ()
{
	TA_Sleep		(23,00,08,00,"PSI_21_HUT_IN");
	TA_Potion_Alchemy(08,00,09,00,"PSI_LABOR_BASEMENT_1");
	TA_Smoke_Joint		(09,00,10,00,"PSI_21_HUT_EX");
	TA_Potion_Alchemy(10,00,11,00,"PSI_LABOR_BASEMENT_1");
	TA_Smoke_Joint		(11,00,12,00,"PSI_21_HUT_EX");
	TA_Potion_Alchemy(12,00,13,00,"PSI_LABOR_BASEMENT_1");
	TA_Smoke_Joint		(13,00,14,00,"PSI_21_HUT_EX");
	TA_Potion_Alchemy(14,00,15,00,"PSI_LABOR_BASEMENT_1");
	TA_Smoke_Joint		(15,00,16,00,"PSI_21_HUT_EX");
	TA_Potion_Alchemy(16,00,17,00,"PSI_LABOR_BASEMENT_1");
	TA_Smoke_Joint		(17,00,18,00,"PSI_21_HUT_EX");
	TA_Potion_Alchemy(18,00,19,00,"PSI_LABOR_BASEMENT_1");
	TA_Smoke_Joint		(19,00,20,00,"PSI_21_HUT_EX");
	TA_Potion_Alchemy(20,00,21,00,"PSI_LABOR_BASEMENT_1");
	TA_Smoke_Joint		(21,00,22,00,"PSI_21_HUT_EX");
	TA_Potion_Alchemy(22,00,23,00,"PSI_LABOR_BASEMENT_1");
};

FUNC VOID Rtn_Tempel_1116 ()
{
	TA_Pray_Sleeper_FP 	(08,00,20,00,"PSI_TEMPLE_NOVIZE_PR6");
	TA_Pray_Sleeper_FP 	(20,00,08,00,"PSI_TEMPLE_NOVIZE_PR6");
};

FUNC VOID Rtn_Leichengase_1116 ()
{
	TA_Stand_ArmsCrossed 	(08,00,20,00,"PSI_TRAINING_TEACHER");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"PSI_TRAINING_TEACHER");
};

FUNC VOID Rtn_Tot_1116 ()
{
	TA_Stand_WP 	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};