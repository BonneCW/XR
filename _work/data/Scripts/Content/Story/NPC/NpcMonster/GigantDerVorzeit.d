INSTANCE GigantDerVorzeit	(Mst_Default_Firegolem)
{
	name	=	"Gigant der Vorzeit";
	
	guild							=	GIL_TROLL;
	aivar[AIV_MM_REAL_ID]			= 	ID_GIGANTDERVORZEIT;
	id = 7195;
	Npc_SetToFistMode(self);

	level							=	200;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	250;
	attribute	[ATR_DEXTERITY]		=	90;
	attribute	[ATR_HITPOINTS_MAX]	=	2200;
	attribute	[ATR_HITPOINTS]		=	2200;
	attribute	[ATR_MANA_MAX] 		=	1000;
	attribute	[ATR_MANA] 			=	1000;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	150000;
	protection	[PROT_EDGE]			=	150000;
	protection	[PROT_POINT]		=	-1;	
	protection	[PROT_FIRE]			=	170;	
	protection	[PROT_FLY]			=	-1;
	protection	[PROT_MAGIC]		=	130;
	
	//----- Damage Types ----
	damagetype 						=	DAM_BLUNT|DAM_FLY;
	damage		[DAM_INDEX_BLUNT]	=	899;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
	damage		[DAM_INDEX_FLY]		=	1;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_TROLL;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	Mdl_SetVisual			(self,	"Troll.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Tro_Body",		4,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	daily_routine = Rtn_Start_7195;
	
};

FUNC VOID Rtn_Start_7195()
{
	TA_Roam	(08,00,20,00,"NW_TO_PASS_01");
	TA_Roam	(20,00,08,00,"NW_TO_PASS_01");
};