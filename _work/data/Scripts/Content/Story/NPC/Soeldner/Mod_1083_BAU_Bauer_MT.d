instance Mod_1083_BAU_Bauer_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							NAME_BAUER;
	guild =							GIL_MIL;      
	level =							2;
	flags =							0;
	
	voice		= 0;
	id =							1083;

	npctype = NPCTYPE_MT_REISBAUER;


	//-------- abilities --------
	attribute[ATR_STRENGTH] =		20;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] =		88;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Thief", 5, 1,DEFAULT);
	
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

		
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1083;
};

FUNC VOID Rtn_start_1083 ()
{
	TA_Sleep		(20,00,07,00,"NC_PATH_PEASANT3");
	TA_Wash_FP		(07,00,07,20,"NC_PATH_PEASANT5");
	TA_PickRice		(07,20,20,00,"NC_DAM_BOTTOM");
};
















