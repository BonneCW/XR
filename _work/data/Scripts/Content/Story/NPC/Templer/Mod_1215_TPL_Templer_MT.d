instance Mod_1215_TPL_Templer_MT (Npc_Default)
{
	//-------- primary data --------
	name =							Name_Templer;
	npctype =						NpcType_mt_templer;
	guild =							GIL_out;
	level =							17;
	flags =							0;
	
	voice =							8;
	id =							1215;
		
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
	//			Body-Mesh	Body-Tex  Skin-Color	Head-MMS    Head-Tex	Teeth-Tex Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1 ,"Hum_Head_Psionic", 65 , 1, TPL_ARMOR_M);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_01);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1215;
};

FUNC VOID Rtn_start_1215 () //Auf Klotz bei Tempelplatz
{
	TA_Stand_Guarding		(08,00,22,00,"PSI_GUARD_TEMPLE_5_2"); 
    TA_Stand_Guarding		(22,00,08,00,"PSI_GUARD_TEMPLE_5_2"); 
};

FUNC VOID Rtn_Tot_1215 ()
{
	TA_Stand_WP 	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};