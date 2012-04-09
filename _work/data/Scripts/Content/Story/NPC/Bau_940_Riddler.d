instance Bau_989_Riddler (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Riddler";
	npctype	 	=	npctype_main;
	guild 		=	GIL_OUT;      
	level 		=	8;
	voice 		= 	9;
	id 			=	989;

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
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Fighter", 164,  0,-1);
	
	
	Mdl_SetModelFatness(self,0);
	
	CreateInvItem	(self, theriddle6);

	fight_tactic	=	FAI_HUMAN_COWARD;
		
	//-------- Talente --------                                    
	
		
	
	//-------- inventory --------                                    

		
			
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_989;

};

FUNC VOID Rtn_start_989 ()
{
	TA_Stand_WP (08,00,20,00,"OW_FOGDUNGEON_36_MOVEMENT");
	TA_Stand_WP (20,00,08,00,"OW_FOGDUNGEON_36_MOVEMENT");
};