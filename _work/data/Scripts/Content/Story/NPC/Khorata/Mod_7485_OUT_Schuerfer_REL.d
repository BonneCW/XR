instance Mod_7485_OUT_Schuerfer_REL (Npc_Default)
{
	//-------- primary data --------
	
	name =							NAME_Schuerfer;
	npctype = 						Npctype_MAIN;
	guild =							GIL_OUT;      
	level =							6;
	flags =							0;	
	voice =							1;
	id =							7485;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 2);

	//-------- visuals --------
	B_SetNpcVisual	(self, MALE, "Hum_Head_Pony", 7, 3, SFB_ARMOR_L);
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	
	Mdl_SetModelFatness(self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

	
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_Start_7485;

};

FUNC VOID Rtn_Start_7485 ()
{
	TA_Pick_Ore	(01,00,13,00,	"RM_26");
	TA_Pick_Ore	(13,00,01,00,	"RM_26");
};