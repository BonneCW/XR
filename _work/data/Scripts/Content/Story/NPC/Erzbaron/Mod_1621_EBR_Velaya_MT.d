instance Mod_1621_EBR_Velaya_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Velaya";
	npctype		= 	npctype_main;
	guild 		=	GIL_OUT;
	level 		=	1;
	voice		= 39;
	id 			=	1621;
	flags      	=   0; // wichtig, weil man sie nicht finishen kann!

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 20;
	attribute[ATR_DEXTERITY] 	= 20;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 40;
	attribute[ATR_HITPOINTS] 	= 40;

	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", 209, 20, NO_ARMOR);	
	//Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds");

	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente -------- 		
	
	//-------- inventory --------                                    
	CreateInvItem (self, ItMiBrush);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1621;
};

FUNC VOID Rtn_start_1621 () //Gomez Zimmer 24h
{
	TA_Sit_Chair		(01,00,10,00,	"OCC_BARONS_UPSTAIRS_LEFT_BACK_ROOM_LEFT_BACK"); 	//Bei Gomez
	TA_Sit_Chair	(10,00,11,00,	"OCC_BARONS_UPSTAIRS_LEFT_BACK_ROOM_FRONT");
	TA_Bathing_Babe		(11,00,14,00,	"OCC_BARONS_UPSTAIRS_LEFT_BACK_ROOM_FRONT");
	TA_Sit_Chair	(14,00,16,00,	"OCC_BARONS_UPSTAIRS_LEFT_BACK_ROOM_FRONT");
	TA_Sit_Chair		(16,00,19,00,	"OCC_BARONS_UPSTAIRS_LEFT_BACK_ROOM_FRONT");
	TA_Sit_Chair	(19,00,01,00,	"OCC_BARONS_UPSTAIRS_LEFT_BACK_ROOM_FRONT");
};

FUNC VOID Rtn_FollowOutOfOC_1621 ()
{
	TA_Follow_Player	(08,00,20,00,"OC1");
	TA_Follow_Player	(20,00,08,00,"OC1");
};

FUNC VOID Rtn_Guiding_1621 ()
{
	TA_Guide_Player	(08,00,20,00,"OW_PATH_1_16_8");
	TA_Guide_Player	(20,00,08,00,"OW_PATH_1_16_8");
};

FUNC VOID Rtn_Pass_1621 ()
{
	TA_RunToWP	(08,00,20,00,"OW_PATH_1_16_8");
	TA_RunToWP	(20,00,08,00,"OW_PATH_1_16_8");
};

FUNC VOID Rtn_FollowToNL_1621 ()
{
	TA_Follow_Player	(08,00,20,00,"NC_DAM");
	TA_Follow_Player	(20,00,08,00,"NC_DAM");
};

FUNC VOID Rtn_Flucht_1621 ()
{
	TA_RunToWP	(08,00,20,00,"WP_INTRO02");
	TA_RunToWP	(20,00,08,00,"WP_INTRO02");
};

FUNC VOID Rtn_Tot_1621 ()
{
	TA_RunToWP	(08,00,20,00,"TOT");
	TA_RunToWP	(20,00,08,00,"TOT");
};

FUNC VOID Rtn_AtSylvio_1621 ()
{
	TA_Sit_Chair	(08,00,20,00,"NC_HUT04_IN");
	TA_Sit_Chair	(20,00,08,00,"NC_HUT04_IN");
};