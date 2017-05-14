instance Mod_1090_BAU_Bauer_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	name_Bauer;
	npctype = NPCTYPE_MT_REISBAUER;
	guild 		=	GIL_MIL;      
	level 		=	2;
	voice		= 0;
	id 			=	1090;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 15;
	attribute[ATR_DEXTERITY]	= 11;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 76;
	attribute[ATR_HITPOINTS] 	= 76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Pony", 3,  1,DEFAULT);
	
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD;
	
	//-------- Talente --------                                    
	
	
	daily_routine = Rtn_start_1090;
};

FUNC VOID Rtn_start_1090 ()
{
	TA_Sleep		(20,30,07,30,"NC_PATH_PEASANT2");
	TA_PickRice		(07,30,20,30,"NC_PATH81");
};














