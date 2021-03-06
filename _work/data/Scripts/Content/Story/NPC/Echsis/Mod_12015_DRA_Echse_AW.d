INSTANCE Mod_12015_DRA_Echse_AW	(C_NPC)
{
	//----- Monster ----
	name	=	"Junger Echsenmensch";
	guild	=	GIL_DRACONIAN;
	id	= 	12015;
	level	=	35;
	voice	=	23;
	Npctype =	NPCTYPE_MAIN;
	exp 	=	5;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	130;
	attribute	[ATR_DEXTERITY]		=	130;
	attribute	[ATR_HITPOINTS_MAX]	=	260;
	attribute	[ATR_HITPOINTS]		=	260;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	130;
	protection	[PROT_EDGE]			=	130;
	protection	[PROT_POINT]		=	130; 
	protection	[PROT_FIRE]			=	130;
	protection	[PROT_FLY]			=	130;
	protection	[PROT_MAGIC]		=	65;	
	
	//----- HitChances -----
	HitChance	[NPC_TALENT_1H]			= 80;
	HitChance	[NPC_TALENT_2H]			= 80;
	HitChance	[NPC_TALENT_BOW]		= 80;
	HitChance	[NPC_TALENT_CROSSBOW]	= 80;
	
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_ORC;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_EchsenBody	(self);

	EquipItem (self, ItMw_2H_OrcSword_01);

	//----- Daily Routine ----

	daily_routine	=	Rtn_Start_12015;
};

FUNC VOID Rtn_Start_12015()
{
	TA_Stand_WP_Orc		(08,00,20,00,"BL_UP_RING_01");
	TA_Stand_WP_Orc		(20,00,08,00,"BL_UP_RING_01");
};

FUNC VOID Rtn_FollowWSS_12015()
{
	TA_Follow_Player		(08,00,20,00,"BL_UP_RING_01");
	TA_Follow_Player		(20,00,08,00,"BL_UP_RING_01");
};

FUNC VOID Rtn_Tot_12015()
{
	TA_Stand_WP_ORC		(08,00,20,00,"TOT");
	TA_Stand_WP_ORC		(20,00,08,00,"TOT");
};

FUNC VOID Rtn_Schlacht_12015()
{
	TA_Stand_WP_Orc		(08,00,20,00,"ADW_SUMPF_GRENZEGEBIET_08");
	TA_Stand_WP_Orc		(20,00,08,00,"ADW_SUMPF_GRENZEGEBIET_08");
};