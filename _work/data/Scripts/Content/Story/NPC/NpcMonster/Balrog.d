INSTANCE Balrog_Plateau	(Mst_Default_Firegolem)
{
	name	=	"Balrog";
	
	guild							=	GIL_FIREGOLEM;
	aivar[AIV_MM_REAL_ID]			= 	ID_BALROG;
	id = 7194;
	Npc_SetToFistMode(self);

	level							=	200;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	600;
	attribute	[ATR_DEXTERITY]		=	600;
	attribute	[ATR_HITPOINTS_MAX]	=	1800;
	attribute	[ATR_HITPOINTS]		=	1800;
	attribute	[ATR_MANA_MAX] 		=	1000;
	attribute	[ATR_MANA] 			=	1000;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	250000;
	protection	[PROT_EDGE]			=	250000;
	protection	[PROT_POINT]		=	-1;	
	protection	[PROT_FIRE]			=	-1;	
	protection	[PROT_FLY]			=	-1;
	protection	[PROT_MAGIC]		=	200;
	
	//----- Damage Types ----
	damagetype 						=	DAM_FIRE|DAM_FLY;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
	damage		[DAM_INDEX_FIRE]	=	599;
	damage		[DAM_INDEX_FLY]		=	1;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_STONEGOLEM;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	Mdl_SetVisual			(self,	"Balrog.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Balrog_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	daily_routine = Rtn_Start_7194;
	
};

FUNC VOID Rtn_Start_7194()
{
	TA_Roam	(08,00,20,00,"WP_ADANOS_BALROG");
	TA_Roam	(20,00,08,00,"WP_ADANOS_BALROG");
};