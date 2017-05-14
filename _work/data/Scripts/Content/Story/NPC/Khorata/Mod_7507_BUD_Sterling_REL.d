instance Mod_7507_BUD_Sterling_REL (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Sterling";
	npctype =						npctype_MAIN;
	guild =							GIL_out;      
	level =							2;
	
	
	voice		= 0;
	id =							7507;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		13;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	64;
	attribute[ATR_HITPOINTS] =		64;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,2,"Hum_Head_FatBald", 0,  2, VLK_ARMOR_L);

	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    
	
	//-------- inventory --------                                    

	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7507;
};

FUNC VOID Rtn_start_7507 ()
{
	TA_Sit_Bench		(22,00,07,00,"REL_CITY_111");
	TA_Sit_Bench		(07,00,22,00,"REL_CITY_111");
};

FUNC VOID Rtn_Tot_7507 ()
{
	TA_Sit_Bench		(22,00,07,00,"TOT");
	TA_Sit_Bench		(07,00,22,00,"TOT");
};










