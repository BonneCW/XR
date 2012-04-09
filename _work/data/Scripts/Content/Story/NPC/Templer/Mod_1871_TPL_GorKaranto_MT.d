instance Mod_1871_TPL_GorKaranto_MT (Npc_Default)
{
	//-------- primary data --------
	name =							"Gor Karanto";
	npctype =						npctype_main;
	guild =							GIL_OUT;
	level =							12;
	
	
	voice =							8;
	id =							1871;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		25;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	184;
	attribute[ATR_HITPOINTS] =		184;
	
	B_SetAttributesToChapter (self, 5);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Bald", 66,  1, TPL_ARMOR_L);

	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,2);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_02);

	B_SetFightSkillS	(self, 70);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1871;
};

FUNC VOID Rtn_start_1871 ()
{
	TA_Sleep		(23,45,07,45,"OCR_HUT_32");
	TA_Sit_Chair		(07,45,10,05,"OCR_HUT_32");
	TA_Smalltalk		(10,05,16,00,"OCR_SMALLTALK_A_OC_ARENA");
	TA_Practice_Sword	(16,00,17,15,"OCR_ARENABATTLE");
	TA_Sit_Campfire		(17,15,23,45,"OCR_CAMPFIRE_I_1");
};

FUNC VOID Rtn_ArenaFight_1871 ()
{
	TA_Stand_WP	(20,00,08,00,"OCR_ARENABATTLE_TRAIN2");
	TA_Stand_WP	(08,00,20,00,"OCR_ARENABATTLE_TRAIN2");
};

FUNC VOID Rtn_Fight_1871 ()
{
	TA_ArenaFight	(20,00,08,00,"OCR_ARENABATTLE_TRAIN2");
	TA_ArenaFight	(08,00,20,00,"OCR_ARENABATTLE_TRAIN2");
};

