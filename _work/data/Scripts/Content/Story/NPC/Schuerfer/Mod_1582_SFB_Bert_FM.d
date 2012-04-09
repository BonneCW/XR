instance Mod_1582_SFB_Bert_FM (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Bert";
	npctype =						npctype_MAIN;
	guild =							GIL_DMT;      
	level =							3;
	flags	=	2;						
	
	voice =							10;
	id =							1582;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		15;
	attribute[ATR_STRENGTH] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	76;
	attribute[ATR_HITPOINTS] =		76;

	//-------- visuals --------
	// 				animations
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",70, 3, SFB_ARMOR_L);
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");

	
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                                    

	
	//-------- inventory --------                                    

	

	//-------------Daily Routine-------------
	daily_routine = Rtn_FMstart_1582;
	};

FUNC VOID Rtn_FMstart_1582 ()	//FM
{
	TA_Sit_Campfire		(00,00,23,00,"FM_176");
	TA_Sit_Campfire		(23,00,24,00,"FM_176");
};

FUNC VOID Rtn_Gerettet_1582 ()	//FM
{
	TA_Pick_Ore		(00,00,23,00,"FM_89");
	TA_Pick_Ore		(23,00,24,00,"FM_89");
};