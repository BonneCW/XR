instance Mod_7614_OUT_Schuerfer_REL (Npc_Default)
{
	//-------- primary data --------
	
	name =							NAME_Schuerfer;
	npctype = 						Npctype_MAIN;
	guild =							GIL_OUT;      
	level =							6;
	flags =							0;
	
	voice =							5;
	id =							7614;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 2);

	//-------- visuals --------
	B_SetNpcVisual	(self, MALE, "Hum_Head_Fighter", 43, 3, SFB_ARMOR_L);
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

	
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_Start_7614;

};

FUNC VOID Rtn_Start_7614 ()
{
	TA_Stand_Drinking	(01,00,13,00,	"REL_SURFACE_206");
	TA_Stand_Drinking	(13,00,01,00,	"REL_SURFACE_206");
};

FUNC VOID Rtn_Theodorus_7614()
{	
	TA_Stand_Eating	(08,00,23,00,"REL_CITY_001");
	TA_Stand_Eating	(23,00,08,00,"REL_CITY_001");
};

FUNC VOID Rtn_InCity_7614()
{	
	TA_Sit_Chair	(08,00,23,00,"ALTEFESTUNG_07");
	TA_Sit_Chair	(23,00,08,00,"ALTEFESTUNG_07");
};