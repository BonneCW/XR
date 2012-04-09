instance Mod_1213_TPL_Templer_MT (Npc_Default)
{
	//-------- primary data --------
	name =							"Caines Leibwache";
	npctype =						NPCTYPE_MAIN;
	guild =							GIL_out;
	level =							25;
	
	voice =							13;
	id =							1213;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		130;
	attribute[ATR_DEXTERITY] =		80;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	292;
	attribute[ATR_HITPOINTS] =		292;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 63,  1, TPL_ARMOR_H);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,2);
	
	//-------- inventory --------
	EquipItem (self, ItMw_2H_Sword_Light_02);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1213;
};

FUNC VOID Rtn_start_1213 () //Kaloms Wache
{
    TA_Guard_Passage	(09,00,21,00,"PSI_LABOR_GUARD_1");
    TA_Guard_Passage	(21,00,09,00,"PSI_LABOR_GUARD_1");
};

FUNC VOID Rtn_Tot_1213 ()
{
	TA_Stand_WP 	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};