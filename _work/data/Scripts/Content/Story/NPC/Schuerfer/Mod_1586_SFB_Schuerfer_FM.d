instance Mod_1586_SFB_Schuerfer_FM (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_schuerfer;
	npctype =						npctype_fm_schuerfer;
	guild =							GIL_mil;      
	level =							3;
	
	
	voice =							10;
	id =							1586;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		15;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	76;
	attribute[ATR_HITPOINTS] =		76;

	//-------- visuals --------
	// 				animations
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",67, 3, SFB_ARMOR_L);
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    

	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	
	//-------- inventory --------                                    

	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1586;
};

FUNC VOID Rtn_start_1586 ()	//FM
{
	TA_Cook_Cauldron		(00,00,23,00,"FM_159");
	TA_Cook_Cauldron		(23,00,24,00,"FM_159");
};