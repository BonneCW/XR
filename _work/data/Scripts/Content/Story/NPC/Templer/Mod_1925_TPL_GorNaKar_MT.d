instance Mod_1925_TPL_GorNaKar_MT (Npc_Default)
{
	//-------- primary data --------
	name =							"Gor Na Kar";
	npctype =						NPCTYPE_main;
	guild =							GIL_out;
	level =							12;
	
	
	voice		= 0;
	id =							1925;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Psionic", 62,  1, TPL_ARMOR_H);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_01);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1925;
};

FUNC VOID Rtn_start_1925 ()
{
	TA_Stand_ArmsCrossed	(06,00,18,00,"PSI_TEMPLE_NOVIZE_PR2");	
	TA_Stand_ArmsCrossed	(18,00,06,00,"PSI_TEMPLE_NOVIZE_PR2");	
};

FUNC VOID Rtn_FollowToOc_1925 ()
{
    TA_Follow_Player	(06,00,18,00,"OCR_NORTHGATE_ADVANCE");	
    TA_Follow_Player	(18,00,06,00,"OCR_NORTHGATE_ADVANCE");	
};

FUNC VOID Rtn_FollowToBartholo_1925 ()
{
    TA_Follow_Player	(06,00,18,00,"OCC_BARONS_DANCE");	
    TA_Follow_Player	(18,00,06,00,"OCC_BARONS_DANCE");	
};

FUNC VOID Rtn_StayAtOC_1925 ()
{
    TA_Stand_ArmsCrossed	(06,00,18,00,"OCC_BARONS_GREATHALL_RIGHT_FRONT");	
    TA_Stand_ArmsCrossed	(18,00,06,00,"OCC_BARONS_GREATHALL_RIGHT_FRONT");	
};

