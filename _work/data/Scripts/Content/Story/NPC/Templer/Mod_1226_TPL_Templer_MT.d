instance Mod_1226_TPL_Templer_MT (Npc_Default)
{
	//-------- primary data --------
	name =							Name_Templer;
	npctype =						NPCTYPE_mt_templer;
	guild =							GIL_out;
	level =							12;
	
	
	voice =							29;
	id =							1226;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		130;
	attribute[ATR_DEXTERITY] =		25;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	184;
	attribute[ATR_HITPOINTS] =		184;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Bald", 66,  1, TPL_ARMOR_L);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_01);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1226;
};

FUNC VOID Rtn_start_1226 ()
{
	TA_Sleep			(23,00,06,10,"PSI_34_HUT_IN");
	TA_Practice_Sword	(06,10,23,00,"PSI_TRAINING_8");
};

FUNC VOID Rtn_Leichengase_1226 ()
{
	TA_Smalltalk		(23,00,06,10,"PSI_MEETING_BRIDGE_MOVEMENT");
	TA_Smalltalk		(06,10,23,00,"PSI_MEETING_BRIDGE_MOVEMENT");
};

FUNC VOID Rtn_Leichengase2_1226 ()
{
	TA_Smalltalk_Plaudern	(00,00,06,00,"PSI_PATH_6_8");
	TA_Smalltalk_Plaudern	(06,00,00,00,"PSI_PATH_6_8");	
};

FUNC VOID Rtn_Posten_1226 ()
{
	TA_Stand_WP	(01,00,05,00,"WP_MT_SUMPF_TEMPLER_03");
    TA_Stand_WP	(05,00,01,00,"WP_MT_SUMPF_TEMPLER_03");
};

FUNC VOID Rtn_Tot_1226 ()
{
	TA_Stand_WP 	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};