INSTANCE Zombie_11017_FM (Npc_Default)
{
	// ------ NSC ------
	name 		= "Zombie - Schürfer";	
	guild							=	GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID]			= 	ID_ZOMBIE;
	level							=	20;
	id = 11017;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	100;
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

	//----- Protection ----
	protection	[PROT_BLUNT]		=	50000;
	protection	[PROT_EDGE]			=	50000;
	protection	[PROT_POINT]		=	50000;	
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	50;
	protection	[PROT_MAGIC]		=	0;
	
	//----- Damage Type ----
	damagetype 						=	DAM_EDGE;																
		
	// ------ Kampf-Taktik ------
	fight_tactic	=	FAI_ZOMBIE;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;	
	
	B_SetNpcVisualZombie 		(self, MALE, "Zom_Head", 1, 1, NO_ARMOR);
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_11017;
};

FUNC VOID Rtn_Start_11017 ()
{	
	TA_Pick_Ore	(08,00,22,00,"FM_182");
	TA_Pick_Ore	(22,00,08,00,"FM_182");
};

FUNC VOID Rtn_Tot_11017 ()
{	
	TA_Stand_WP	(08,00,22,00,"TOT");
	TA_Stand_WP	(22,00,08,00,"TOT");
};