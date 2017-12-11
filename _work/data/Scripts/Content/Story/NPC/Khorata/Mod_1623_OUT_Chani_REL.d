instance Mod_1623_OUT_Chani_REL (Npc_Default)
{
	//-------- primary data --------

	name 		=	"Chani";
	npctype		= 	npctype_main;
	guild 		=	GIL_out;
	level 		=	1;
	voice		= 19;
	id 			=	1623;
	flags      	=   NPC_FLAG_IMMORTAL; // wichtig, weil man sie nicht finishen kann!

	//-------- abilities --------
	attribute[ATR_STRENGTH] 		= 20;
	attribute[ATR_DEXTERITY] 		= 20;
	attribute[ATR_MANA_MAX] 		= 0;
	attribute[ATR_MANA] 			= 0;
	attribute[ATR_HITPOINTS_MAX]	= 52;
	attribute[ATR_HITPOINTS] 		= 52;

	//-------- visuals --------

	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", 142, 30, NO_ARMOR);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds");


	//-------- inventory --------

	//-------------Daily Routine-------------
	daily_routine = Rtn_PreStart_1623;
};

FUNC VOID Rtn_PreStart_1623()
{
	TA_Smalltalk	(21,00,09,00,	"REL_MOOR_143");
	TA_Smalltalk	(09,00,21,00,	"REL_MOOR_143");
};

FUNC VOID Rtn_Abenteurer_1623()
{
	TA_Smalltalk_Plaudern	(21,00,09,00,	"REL_MOOR_143");
	TA_Smalltalk_Plaudern	(09,00,21,00,	"REL_MOOR_143");
};

FUNC VOID Rtn_Start_1623()
{
	TA_Dance		(08,00,22,00,	"REL_MOOR_144");
	TA_Sleep		(22,00,08,00,	"REL_MOOR_161");
};

FUNC VOID Rtn_Siedlung_1623()
{
	TA_Smalltalk	(21,00,09,00,	"REL_MOOR_215");
	TA_Smalltalk	(09,00,21,00,	"REL_MOOR_215");
};