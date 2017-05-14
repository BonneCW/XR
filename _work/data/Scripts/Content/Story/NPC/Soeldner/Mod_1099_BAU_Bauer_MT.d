instance Mod_1099_BAU_Bauer_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	name_Bauer;
	npctype = NPCTYPE_MT_REISBAUER;
	guild 		=	GIL_MIL;      
	level 		=	2;
	voice		= 0;
	id 			=	1099;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 13;
	attribute[ATR_DEXTERITY]	= 10;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 64;
	attribute[ATR_HITPOINTS] 	= 64;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,2,"Hum_Head_Pony", 2,  2,DEFAULT);
	
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talente --------                                    
		     
	
	//-------- inventory --------                                    

		
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1099;
};

FUNC VOID Rtn_start_1099 ()
{
	TA_Smalltalk	(08,00,20,00,"OW_PATH_069");
	TA_Smalltalk	(20,00,08,00,"OW_PATH_069");
};














