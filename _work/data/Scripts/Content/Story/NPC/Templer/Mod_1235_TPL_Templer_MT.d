instance Mod_1235_TPL_Templer_MT (Npc_Default)
{
	//-------- primary data --------
	name =							Name_Templer;
	Npctype =						NpcType_mt_templer;
	guild =							GIL_out;
	level =							17;
	flags =							0;
	
	voice		= 0;
	id =							1235;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1 ,"Hum_Head_FatBald", 60 , 1, TPL_ARMOR_M);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	senses 			=	SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	
	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_02);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1235;
};

FUNC VOID Rtn_start_1235 ()
{
    TA_Guard_Passage	(06,00,18,00,"PSI_TEMPLE_LEFT_GUARD");	
    TA_Guard_Passage	(18,00,06,00,"PSI_TEMPLE_LEFT_GUARD");	
};

FUNC VOID Rtn_Tot_1235 ()
{
	TA_Stand_WP 	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};