instance Mod_7790_SFB_Schuerfer_PAT (Npc_Default)
{
	//-------- primary data --------
	
	name =						NAME_Schuerfer;
	npctype = 					Npctype_MAIN;
	guild =						GIL_VLK;  
	level =						6;
	voice		= 0;
	id =						7790;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		30;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	112;
	attribute[ATR_HITPOINTS] =		112;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Thief", 40,  1, SFB_ARMOR_L);
	
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

	
	//-------------Daily Routine-------------

	daily_routine = Rtn_Start_7790;

};

FUNC VOID Rtn_Start_7790 ()
{
	TA_Sit_Campfire		(01,00,13,00,"WP_PAT_KLOSTER_002");
	TA_Sit_Campfire		(13,00,01,00,"WP_PAT_KLOSTER_002");
};

FUNC VOID Rtn_Mine_7790 ()
{
	TA_Pick_Ore	(01,00,13,00,"WP_PAT_UG_RUNENSTEIN_09");
	TA_Pick_Ore	(13,00,01,00,"WP_PAT_UG_RUNENSTEIN_09");
};

FUNC VOID Rtn_Tot_7790 ()
{
	TA_Pick_Ore	(01,00,13,00,"TOT");
	TA_Pick_Ore	(13,00,01,00,"TOT");
};