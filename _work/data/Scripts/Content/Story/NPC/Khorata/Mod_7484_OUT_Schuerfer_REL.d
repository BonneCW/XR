instance Mod_7484_OUT_Schuerfer_REL (Npc_Default)
{
	//-------- primary data --------
	
	name =							NAME_Schuerfer;
	npctype = 						Npctype_MAIN;
	guild =							GIL_OUT;      
	level =							6;
	flags =							0;
	
	voice =							2;
	id =							7484;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 2);

	//-------- visuals --------
	B_SetNpcVisual	(self, MALE, "Hum_Head_Pony", 43, 2, SFB_ARMOR_L);
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

	
		
	//-------------Daily Routine-------------

	daily_routine = Rtn_Start_7484;
	
	//------------- //MISSIONs-------------
};

FUNC VOID Rtn_Start_7484 ()
{
	TA_Pick_Ore	(01,00,13,00,	"RM_50");
	TA_Pick_Ore	(13,00,01,00,	"RM_50");
};

FUNC VOID Rtn_Tot_7484()
{	
	TA_Pick_ore		(05,30,11,35,"TOT");
	TA_Pick_Ore	 	(11,35,05,30,"TOT");
};






