INSTANCE Knucker_11001_NW	(Mst_Default_Dragon_Fire)
{
	name	=	"Knucker";
	
	guild							=	GIL_DRAGON;
	aivar[AIV_MM_REAL_ID]			= 	ID_DRAGON_ROCK;
	id = 11001;
	Npc_SetToFistMode(self);
	voice	= 22;
	flags = 2;

	level							=	500;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	200;
	attribute	[ATR_DEXTERITY]		=	200;
	attribute	[ATR_HITPOINTS_MAX]	=	1000;
	attribute	[ATR_HITPOINTS]		=	1000;
	attribute	[ATR_MANA_MAX] 		=	1000;
	attribute	[ATR_MANA] 			=	1000;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	
	//------ Protections ----	
	protection	[PROT_BLUNT]		= 160000;
	protection	[PROT_EDGE]			= 160000;
	protection	[PROT_POINT]		= 160000;	
	protection	[PROT_FIRE]			= 160;
	protection	[PROT_FLY]			= 160;	
	protection	[PROT_MAGIC]		= 160;
	
	//------ Damage Types ----	
	damagetype 						=	DAM_FIRE|DAM_FLY;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
	damage		[DAM_INDEX_FIRE]	=	149;
	damage		[DAM_INDEX_FLY]		=	1; //Opfer fliegt für Fire+Fly
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_DRAGON;
	
	//----- Sense & Ranges ----	
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_DRAGON_ACTIVE_MAX;

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;

	//aivar[AIV_MaxDistToWp]		= 700;
	aivar[AIV_OriginalFightTactic] 	= FAI_DRAGON;
	
	Mdl_SetVisual			(self,	"Dragon.mds");
	//								Body-Mesh				Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dragon_Rock_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	daily_routine = Rtn_Start_11001;
	
};

FUNC VOID Rtn_Start_11001()
{
	TA_Smalltalk_Dragon	(08,00,20,00,"WP_DRAGON_KNUCKERUNDCO_SMALLTALK");
	TA_Smalltalk_Dragon	(20,00,08,00,"WP_DRAGON_KNUCKERUNDCO_SMALLTALK");
};