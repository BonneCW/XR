INSTANCE Monster_11071_Transportsnapper_REL	(Npc_Default)
{
	name	=	"Transportsnapper";
	
	guild							=	GIL_SHEEP;
	aivar[AIV_MM_REAL_ID]			= 	ID_SNAPPER;
	id = 11071;
	Npc_SetToFistMode(self);
	voice	= 22;
	flags  = 2;
	level							=	120;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	200;
	attribute	[ATR_DEXTERITY]		=	200;
	attribute	[ATR_HITPOINTS_MAX]	=	500;
	attribute	[ATR_HITPOINTS]		=	500;
	attribute	[ATR_MANA_MAX] 		=	1000;
	attribute	[ATR_MANA] 			=	1000;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	
	//------ Protections ----	
	protection	[PROT_BLUNT]		=	170000;
	protection	[PROT_EDGE]			=	170000;
	protection	[PROT_POINT]		=	170000;	
	protection	[PROT_FIRE]			=	170;
	protection	[PROT_FLY]			=	170;	
	protection	[PROT_MAGIC]		=	170;
	
	//------ Damage Types ----	
	damagetype 						=	DAM_FIRE|DAM_FLY;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
	damage		[DAM_INDEX_FIRE]	=	249;
	damage		[DAM_INDEX_FLY]		=	1; //Opfer fliegt für Fire+Fly
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_DRAGON;
	
	//----- Sense & Ranges ----	
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_DRAGON_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;

	//aivar[AIV_MaxDistToWp]		= 700;
	aivar[AIV_OriginalFightTactic] 	= FAI_DRAGON;
	
	Mdl_SetVisual			(self,	"Snapper.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"TranSna_Body",		0,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	daily_routine = Rtn_Start_11071;
	
};

FUNC VOID Rtn_Start_11071()
{
	TA_Roam			(07,00,07,30,"REL_129");
	TA_Roam			(07,30,08,00,"REL_116");
	TA_Roam			(08,00,18,00,"REL_SURFACE_206");
	TA_Roam			(18,00,18,30,"REL_116");
	TA_Roam			(18,30,19,00,"REL_129");
	TA_Roam			(19,00,07,00,"REL_CITY_363");
};