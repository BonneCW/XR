instance Mod_1082_BAU_Rufus_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Rufus";
	npctype		=	npctype_main;
	guild 		=	GIL_MIL;      
	level 		=	4;
	voice		= 0;
	id 			=	1082;

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
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,2,"Hum_Head_Bald", 2, 2, DEFAULT);
	
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	                            	
	//-------- Talente -------- 	                                  
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);		
	
	
	//-------- inventory --------                                    

	
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1082;
};

FUNC VOID Rtn_start_1082 ()
{
	TA_PickRice		(07,10,20,10,"NC_PATH83_MOVEMENT"); 
	TA_Sit_Campfire	(20,10,07,10,"NC_PATH_PEASANT_OUTSIDE5");
};

FUNC VOID Rtn_Flucht_1082 ()
{
	TA_Stand_ArmsCrossed		(07,10,20,10,"OW_PATH_057"); 
	TA_Stand_ArmsCrossed		(20,10,07,10,"OW_PATH_057");
};

FUNC VOID Rtn_Pass_1082 ()
{
	TA_Follow_Player		(07,10,20,10,"OW_PATH_056"); 
	TA_Follow_Player		(20,10,07,10,"OW_PATH_056");
};

FUNC VOID Rtn_Tot_1082 ()
{
	TA_Stand_ArmsCrossed		(07,10,20,10,"TOT"); 
	TA_Stand_ArmsCrossed		(20,10,07,10,"TOT");
};