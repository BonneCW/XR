instance Mod_1095_BAU_Bauer_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	name_Bauer;
	npctype = NPCTYPE_MT_REISBAUER;
	guild 		=	GIL_MIL;      
	level 		=	2;
	voice		= 0;
	id 			=	1095;

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
	//			body mesh     ,bdytex,skin,head mesh     ,headtex 2,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,2,"Hum_Head_Pony",51,  2,DEFAULT);
	
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talente --------                                    
		     
	
	//-------- inventory --------                                    

		
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1095;
};

FUNC VOID Rtn_start_1095 ()
{
	TA_Sit_Campfire  (20,00,07,00,"NC_PATH59"); //CF1
	TA_Wash_FP 	(07,00,07,18,"NC_PATH_PEASANT_OUTSIDE8_WASH");
	TA_PickRice		(07,18,20,00,"NC_PATH82");
};














