instance Mod_1924_TPL_GorNaMon_MT (Npc_Default)
{
	//-------- primary data --------
	name =							"Gor Na Mon";
	Npctype =						NpcType_main;
	guild =							GIL_out;
	level =							17;
	
	voice =							13;
	id =							1924;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 2,"Hum_Head_Bald", 13 , 2, TPL_ARMOR_H);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	senses 			=	SENSE_SEE|SENSE_HEAR|SENSE_SMELL;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_Zweihaender1);
	
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1924;
};

FUNC VOID Rtn_start_1924 ()
{
	TA_Stand_ArmsCrossed	(06,00,18,00,"PSI_TEMPLE_NOVIZE_PR2");	
	TA_Stand_ArmsCrossed	(18,00,06,00,"PSI_TEMPLE_NOVIZE_PR2");	
};

FUNC VOID Rtn_GuideToOc_1924 ()
{
	TA_Guide_Player	(06,00,18,00,"OCR_NORTHGATE_ADVANCE");	
	TA_Guide_Player	(18,00,06,00,"OCR_NORTHGATE_ADVANCE");	
};

FUNC VOID Rtn_GuideToBartholo_1924 ()
{
	TA_Guide_Player	(06,00,18,00,"OCC_BARONS_DANCE");	
	TA_Guide_Player	(18,00,06,00,"OCC_BARONS_DANCE");	
};

FUNC VOID Rtn_StayAtOC_1924 ()
{
	TA_Stand_ArmsCrossed	(06,00,18,00,"OCC_BARONS_RIGHT_ROOM_BACK");	
	TA_Stand_ArmsCrossed	(18,00,06,00,"OCC_BARONS_RIGHT_ROOM_BACK");	
};

FUNC VOID Rtn_Sumpfmensch_1924 ()
{
	TA_Stand_Guarding 	(08,00,20,00,"PATH_AROUND_PSI07");
	TA_Stand_Guarding 	(20,00,08,00,"PATH_AROUND_PSI07");
};

