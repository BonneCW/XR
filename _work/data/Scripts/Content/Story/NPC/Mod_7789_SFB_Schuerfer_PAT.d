instance Mod_7789_SFB_Schuerfer_PAT (Npc_Default)
{
	//-------- primary data --------
	
	name =					NAME_Schuerfer;
	npctype =				npctype_MAIN;
	guild =					GIL_VLK;  
	level =					3;
	voice =					1;
	id =					7789;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		15;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	76;
	attribute[ATR_HITPOINTS] =		76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Psionic", 42,  1, SFB_ARMOR_L);
	
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

	
	//-------------Daily Routine-------------

	daily_routine = Rtn_Start_7789;
	
	//------------ //MISSIONs------------------

};

FUNC VOID Rtn_Start_7789 ()
{
	TA_Sit_Campfire		(01,00,13,00,"WP_PAT_KLOSTER_002");
	TA_Sit_Campfire		(13,00,01,00,"WP_PAT_KLOSTER_002");
};

FUNC VOID Rtn_Mine_7789 ()
{
	TA_Pick_Ore	(01,00,13,00,"WP_PAT_UG_RUNENSTEIN_11");
	TA_Pick_Ore	(13,00,01,00,"WP_PAT_UG_RUNENSTEIN_11");
};

FUNC VOID Rtn_Tot_7789 ()
{
	TA_Pick_Ore	(01,00,13,00,"TOT");
	TA_Pick_Ore	(13,00,01,00,"TOT");
};