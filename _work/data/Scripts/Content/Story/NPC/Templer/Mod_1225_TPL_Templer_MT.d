instance Mod_1225_TPL_Templer_MT (Npc_Default)
{
	//-------- primary data --------
	name =							Name_Templer;
	npctype =						NPCTYPE_mt_templer;
	guild =							GIL_out;
	level =							12;
	
	
	voice		= 0;
	id =							1225;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_FatBald", 61,  1, TPL_ARMOR_L);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_01);
	
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1225;
};

FUNC VOID Rtn_start_1225 ()
{
    TA_Sleep			(23,10,06,00,"PSI_33_HUT_IN");
    TA_Sleep			(06,00,23,10,"PSI_33_HUT_IN");	
    //TA_PracticeSword	(06,00,23,10,"PSI_PATH_6_7"); 	//SN: zum ewigen Schlafen verdammt, da der SC an dieser Stelle seine Lern-Anim abspielen soll
};

FUNC VOID Rtn_Tot_1225 ()
{
	TA_Stand_WP 	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};