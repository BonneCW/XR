instance Mod_1214_TPL_Templer_MT (Npc_Default)
{
	//-------- primary data --------
	name =							Name_Templer;
	npctype =						NPCTYPE_mt_templer;
	guild =							GIL_out;
	level =							17;
	flags =							0;
	
	voice =							13;
	id =							1214;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		130;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	244;
	attribute[ATR_HITPOINTS] =		244;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 64 ,  1, TPL_ARMOR_M);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_01);
	
	
	//------------- //MISSIONs-------------

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1214;
};

FUNC VOID Rtn_start_1214 () //Horst, trifft sich mit 1425
{
	TA_Smalltalk(06,00,07,00,"PSI_SWAMP_6");
	TA_Stand_Guarding	(07,00,08,00,"PSI_PATH_9_12");
	TA_Smalltalk(08,00,09,00,"PSI_SWAMP_6");
	TA_Stand_Guarding	(09,00,10,00,"PSI_PATH_9_12");
	
	TA_Smalltalk(10,00,11,00,"PSI_SWAMP_6");
	TA_Stand_Guarding	(11,00,12,00,"PSI_PATH_9_12");
	TA_Smalltalk(12,00,13,00,"PSI_SWAMP_6");
	TA_Stand_Guarding	(13,00,14,00,"PSI_PATH_9_12");
	
	TA_Smalltalk(14,00,15,00,"PSI_SWAMP_6");
	TA_Stand_Guarding	(15,00,16,00,"PSI_PATH_9_12");
	TA_Smalltalk(16,00,17,00,"PSI_SWAMP_6");
	TA_Stand_Guarding	(17,00,18,00,"PSI_PATH_9_12");
	
	TA_Smalltalk(18,00,19,00,"PSI_SWAMP_6");
	TA_Stand_Guarding	(19,00,20,00,"PSI_PATH_9_12");
	TA_Smalltalk(20,00,21,00,"PSI_SWAMP_6");
	TA_Stand_Guarding	(21,00,22,00,"PSI_PATH_9_12");
	
	TA_Smalltalk(22,00,23,00,"PSI_SWAMP_6");
	TA_Stand_Guarding	(23,00,00,00,"PSI_PATH_9_12");
	TA_Smalltalk(00,00,01,00,"PSI_SWAMP_6");
	TA_Stand_Guarding	(01,00,02,00,"PSI_PATH_9_12");
	
	TA_Smalltalk(02,00,03,00,"PSI_SWAMP_6");
	TA_Stand_Guarding	(03,00,04,00,"PSI_PATH_9_12");
	TA_Smalltalk(04,00,05,00,"PSI_SWAMP_6");
	TA_Stand_Guarding	(05,00,06,00,"PSI_PATH_9_12");
};

FUNC VOID Rtn_Tot_1214 ()
{
	TA_Stand_WP 	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};