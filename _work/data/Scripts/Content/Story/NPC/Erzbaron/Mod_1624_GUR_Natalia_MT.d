instance Mod_1624_GUR_Natalia_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Natalia";
	npctype		= 	npctype_main;
	guild 		=	GIL_out;      
	level 		=	1;
	voice		= 43;
	id 			=	1624;
	flags      	=   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH]	 		= 20;
	attribute[ATR_DEXTERITY] 		= 20;
	attribute[ATR_MANA_MAX] 		= 0;
	attribute[ATR_MANA] 			= 0;
	attribute[ATR_HITPOINTS_MAX]	= 52;
	attribute[ATR_HITPOINTS] 		= 52;

	//-------- visuals --------

	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", 227, 29, NO_ARMOR);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds");
	
	fight_tactic	=	FAI_HUMAN_COWARD;
	
	//-------- Talente -------- 
	
	//-------- inventory --------                                    

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1624;
};

FUNC VOID Rtn_start_1624()
{
	TA_Sit_Chair		(07,00,09,00,	"PSI_TEMPLE_ROOMS_IN");
	TA_Stand_Sweeping	(09,00,12,00,	"PSI_TEMPLE_IN_05");
	TA_Sit_Chair		(12,00,15,00,	"PSI_TEMPLE_ROOMS_IN");
	TA_Sweep_FP		(15,00,19,00,	"PSI_TEMPLE_ROOMS_IN_02");
	TA_Waermen		(19,00,22,00,	"PSI_TEMPLE_ROOMS_IN");
	TA_Sleep		(22,00,07,00,	"PSI_TEMPLE_ROOMS_IN");
};