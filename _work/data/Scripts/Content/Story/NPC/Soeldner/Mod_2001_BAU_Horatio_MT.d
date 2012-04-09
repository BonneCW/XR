instance Mod_2001_BAU_Horatio_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Horatio";
	npctype	 	=	npctype_main;
	guild 		=	GIL_MIL;      
	level 		=	8;
	voice 		= 	9;
	id 			=	2001;

	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh	,bdytex,skin,head mesh,	1headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Fighter", 164,  1,-1);
	
	
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD;
		
	//-------- Talente --------                                    
	
		
	
	//-------- inventory --------                                    

		
			
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_2001;

};

FUNC VOID Rtn_start_2001 ()
{
	TA_Sit_Campfire	(20,00,06,00,"NC_PATH_PEASANT_OUTSIDE10");//CF3
	TA_Pick_FP		(06,00,20,00,"NC_PATH78_A");
};











