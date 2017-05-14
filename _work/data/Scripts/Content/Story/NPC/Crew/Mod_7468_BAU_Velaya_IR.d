instance Mod_7468_BAU_Velaya_IR (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Velaya";
	npctype		= 	npctype_main;
	guild 		=	GIL_OUT;
	level 		=	1;
	voice		= 0;
	id 			=	7468;
	flags      	=   0; // wichtig, weil man sie nicht finishen kann!

	//-------- abilities --------
	B_SetAttributesToChapter (self, 4);

	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", 209, 20, Itar_Leather_F);	
	//Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds");

	
	fight_tactic	=	FAI_HUMAN_STRONG;
	aivar[AIV_Partymember] 		= TRUE;

	//-------- Talente -------- 																		
	B_SetFightSkills (self, 60);	
	
	//-------- inventory --------      															
	EquipItem	(self, ItMw_Meisterdegen); 															
	EquipItem (self, ItRw_Sld_Bow_Schmetter);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7468;
};

FUNC VOID Rtn_start_7468 () //Gomez Zimmer 24h
{
	TA_Sit_Bench	(06,00,19,00,	"SHIP_DECK_29");
	TA_Sit_Bench	(19,00,06,00,	"SHIP_DECK_29");
	
};

FUNC VOID Rtn_Follow_7468 ()
{	
	TA_Follow_Player	(08,00,20,00,"SHIP_DECK_29");
	TA_Follow_Player	(20,00,08,00,"SHIP_DECK_29");
};

FUNC VOID Rtn_Waiting_7468 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"DI_DRACONIANAREA_17");
	TA_Stand_ArmsCrossed	(20,00,08,00,"DI_DRACONIANAREA_17");
};