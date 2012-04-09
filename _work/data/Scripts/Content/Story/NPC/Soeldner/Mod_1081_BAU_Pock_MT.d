instance Mod_1081_BAU_Pock_MT (Npc_Default)
{
	//-------- primary data --------
	
	name		=	"Pock";
	npctype		=	npctype_main;
	guild 		=	GIL_MIL;    
	level 		=	4;
	voice 		=	4;
	id 			=	1081; 

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
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Pony", 3,  1,DEFAULT);
	
	Mdl_SetModelFatness(self,0);
	fight_tactic	=	FAI_HUMAN_COWARD;
	
	//-------- Talente --------                                    
	
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);		
	
	//-------- inventory --------                                    

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1081;
};

FUNC VOID Rtn_start_1081 ()
{
	TA_Sleep	    (20,15,07,15,"NC_PATH_PEASANT_OUTSIDE2"); //CF2
	TA_PickRice		(07,15,20,15,"NC_PATH54_02");
};





