instance Mod_1584_SFB_Schuerfer_FM (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_schuerfer;
	npctype =						npctype_fm_schuerfer;
	guild =							GIL_mil;      
	level =							3;	
	
	voice =							10;
	id =							1584;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		15;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	76;
	attribute[ATR_HITPOINTS] =		76;

	//-------- visuals --------
	// 				animations
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", 67, 3, SFB_ARMOR_L);
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                                    

	
	//-------- inventory --------                                    

	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1584;
};

FUNC VOID Rtn_start_1584 ()	//FM
{
	//TA_Pick_Ore		(00,00,23,00,"FM_103");
	//TA_Pick_Ore		(23,00,24,00,"FM_103");
	TA_Stand_Eating		(00,00,23,00,"FM_103");
	TA_Stand_Eating		(23,00,24,00,"FM_103");
};

FUNC VOID Rtn_Pause_1584 ()	//FM
{
	TA_Stand_Eating		(00,00,23,00,"FM_103");
	TA_Stand_Eating		(23,00,24,00,"FM_103");
};