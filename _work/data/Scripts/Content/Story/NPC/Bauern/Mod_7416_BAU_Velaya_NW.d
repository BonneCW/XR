instance Mod_7416_BAU_Velaya_NW (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Velaya";
	npctype		= 	npctype_main;
	guild 		=	GIL_OUT;
	level 		=	1;
	voice		= 17;
	id 			=	7416;
	flags      	=   0; // wichtig, weil man sie nicht finishen kann!

	//-------- abilities --------
	B_SetAttributesToChapter (self, 4);

	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", 209, 20, Itar_Leather_F);	
	//Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds");

	
	fight_tactic	=	FAI_HUMAN_STRONG;
															
	EquipItem	(self, ItMw_Meisterdegen); 															
	EquipItem (self, ItRw_Sld_Bow);

	//-------- Talente -------- 																	
	B_SetFightSkills (self, 60);		
	
	//-------- inventory --------    
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7416;
};

FUNC VOID Rtn_start_7416 () //Gomez Zimmer 24h
{
	TA_Sit_Chair	(06,00,11,00,	"NW_CITY_HABOUR_TAVERN01_08");
	TA_Sit_Chair	(11,00,19,00,	"NW_CITY_HABOUR_TAVERN01_08");
	TA_Sit_Chair	(19,00,06,00,	"NW_CITY_HABOUR_TAVERN01_08");
	
};

FUNC VOID Rtn_schiff_7416 () //Gomez Zimmer 24h
{
	TA_Sit_Bench	(06,00,19,00,	"SHIP_DECK_29");
	TA_Sit_Bench	(19,00,06,00,	"SHIP_DECK_29");
	
};