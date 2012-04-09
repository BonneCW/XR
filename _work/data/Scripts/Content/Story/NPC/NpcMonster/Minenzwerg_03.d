INSTANCE Minenzwerg_03	(Npc_Default)
{
	name	=	"Minenzwerg";
	guild							=	GIL_GOBBO;
	aivar[AIV_MM_REAL_ID]			= 	ID_GOBBO_GREEN;
	id = 7209;
	level	=	4;
	flags       = NPC_FLAG_GHOST|NPC_FLAG_IMMORTAL;	
	
	// ------ Attribute ------
	attribute	[ATR_STRENGTH]		=	20;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	20;
	attribute	[ATR_HITPOINTS]		=	20;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	
	// ------ Protection ------
	protection	[PROT_BLUNT]		=	20000;
	protection	[PROT_EDGE]			=	20000;
	protection	[PROT_POINT]		=	20000;
	protection	[PROT_FIRE]			=	20;
	protection	[PROT_FLY]			=	20;
	protection	[PROT_MAGIC]		=	0;

	// ------ Damage Types ------						//entweder EIN damagetype oder mehrere damage[x], die dann addiert werden und getrennten Rüstungsabzug bekommen
	damagetype 						=	DAM_EDGE;

	fight_tactic	=	FAI_GOBBO;
	
	// ------ senses & ranges ------
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_MM_Packhunter]	= TRUE;
	
	Mdl_SetVisual			(self,	"Gobbo.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gob_Body",		0,			DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	Npc_SetToFightMode (self, ItMw_Zwergenhacke);

	daily_routine = Rtn_Start_7209;
	
};

FUNC VOID Rtn_Start_7209()
{
	TA_Pick_Ore	(08,00,20,00,"NW_TROLLAREA_RUINS_CAVE_01");
	TA_Pick_Ore	(20,00,08,00,"NW_TROLLAREA_RUINS_CAVE_01");
};