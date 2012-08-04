instance Mod_1224_TPL_Templer_MT (Npc_Default)
{
	//-------- primary data --------
	name =							Name_Templer;
	npctype =						NpcType_mt_templer;
	guild =							GIL_out;
	level =							17;
	
	voice =							29;
	id =							1224;
		
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
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			Body-Mesh	Body-Tex  Skin-Color	Head-MMS    Head-Tex	Teeth-Tex Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1 ,"Hum_Head_Psionic", 60 ,  1, TPL_ARMOR_M);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_02);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1224;
};

FUNC VOID Rtn_start_1224 ()
{
	TA_Guard_Passage (08,00,20,00,"PSI_PATH_5_1_GUARD");
	TA_Guard_Passage (20,00,08,00,"PSI_PATH_5_1_GUARD");
};

FUNC VOID Rtn_Tot_1224 ()
{
	TA_Stand_WP 	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};