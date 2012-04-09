instance Mod_7617_OUT_Schuerfer_REL (Npc_Default)
{
	//-------- primary data --------
	
	name =							NAME_Schuerfer;
	npctype = 						Npctype_MAIN;
	guild =							GIL_mil;      
	level =							6;
	flags =							0;
	
	voice =							2;
	id =							7617;


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

	daily_routine = Rtn_Start_7617;
	
	//------------- //MISSIONs-------------
};

FUNC VOID Rtn_Start_7617 ()
{
	TA_Stand_Eating	(01,00,13,00,	"REL_SURFACE_206");
	TA_Stand_Eating	(13,00,01,00,	"REL_SURFACE_206");
};

FUNC VOID Rtn_Theodorus_7617()
{	
	TA_Stand_Eating	(08,00,23,00,"REL_CITY_001");
	TA_Stand_Eating	(23,00,08,00,"REL_CITY_001");
};

FUNC VOID Rtn_InCity_7617()
{	
	TA_Sit_Chair	(08,00,23,00,"ALTEFESTUNG_010");
	TA_Sit_Chair	(23,00,08,00,"ALTEFESTUNG_010");
};