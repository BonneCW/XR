instance Mod_1088_BAU_Bauer_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	name_Bauer;
	npctype = NPCTYPE_MT_REISBAUER;
	guild 		=	GIL_MIL;      
	level 		=	2;
	voice		= 0;
	id 			=	1088;

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
	//		         body mesh,	body tex, skin,    headmms,            head tex, teeth, ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,2,"Hum_Head_Bald", 1,  2, DEFAULT);
	
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------                                    
	
		
	//-------- inventory --------                                    

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1088;
};

FUNC VOID Rtn_start_1088 ()
{
	TA_Sleep		(20,20,07,20,"NC_PATH_PEASANT2");
	TA_PickRice		(07,20,20,20,"NC_PATH81");
};
















