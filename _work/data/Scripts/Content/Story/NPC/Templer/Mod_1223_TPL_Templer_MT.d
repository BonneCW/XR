instance Mod_1223_TPL_Templer_MT (Npc_Default)
{
	//-------- primary data --------
	name =							name_Templer;
	npctype =						NPCTYPE_MAIN;
	guild =							GIL_out;
	level =							17;
	
	
	voice =							29;
	id =							1223;
		
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
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 59 ,  1, TPL_ARMOR_M);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_02);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1223;
};

FUNC VOID Rtn_start_1223 ()
{
	TA_Stand_Guarding	(08,00,20,00,"PSI_GATE_GUARD_2"); 
	TA_Stand_Guarding	(20,00,08,00,"PSI_GATE_GUARD_2");
};

FUNC VOID Rtn_Tot_1223 ()
{
	TA_Stand_WP 	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};