instance Mod_185_NONE_Alvro_NW (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Alvro";
	npctype	 	=	npctype_main;
	guild 		=	GIL_OUT;      
	level 		=	8;
	voice 		= 	2;
	id 			=	185;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 45;
	attribute[ATR_DEXTERITY] 	= 11;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 136;
	attribute[ATR_HITPOINTS] 	= 136;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh	,bdytex,skin,head mesh,	1headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Fighter", 164,  0,ITAR_SMITH);
	
	
	Mdl_SetModelFatness(self,0);
	
	
	fight_tactic	=	FAI_HUMAN_STRONG;
		
	//-------- Talente --------                                    
	
		
	
	//-------- inventory --------                                    

		
			
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_185;

};

FUNC VOID Rtn_start_185 ()
{
	TA_Potion_Alchemy (08,00,20,00,"NW_CITY_SMFOREST_BANDIT_02");
	TA_Potion_Alchemy (20,00,08,00,"NW_CITY_SMFOREST_BANDIT_02");
};