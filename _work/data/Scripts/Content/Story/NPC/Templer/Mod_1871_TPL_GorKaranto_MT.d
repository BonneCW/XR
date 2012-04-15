instance Mod_1871_TPL_GorKaranto_MT (Npc_Default)
{
	//-------- primary data --------
	name =							"Gor Karanto";
	npctype =						npctype_main;
	guild =							GIL_OUT;
	
	voice =							8;
	id =							1871;
		
	//-------- abilities --------	
	B_SetAttributesToChapter (self, 5);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self, "HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self, "hum_body_Naked0", 1, 1, "Hum_Head_Bald", 66, 1, TPL_ARMOR_L);

	Mdl_SetModelFatness(self, -1);
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_02);

	B_SetFightSkillS	(self, 70);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_1871;
};

FUNC VOID Rtn_Start_1871 ()
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