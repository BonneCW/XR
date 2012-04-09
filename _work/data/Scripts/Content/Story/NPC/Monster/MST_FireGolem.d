//*************************
//	FireGolem Prototype	
//*************************

PROTOTYPE Mst_Default_FireGolem(C_Npc)			
{
	//----- Monster ----
	name							=	"Feuergolem";
	guild							=	GIL_FIREGOLEM;
	aivar[AIV_MM_REAL_ID]			= 	ID_FIREGOLEM;
	level							=	100;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	200;
	attribute	[ATR_DEXTERITY]		=	25;
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	-1;
	protection	[PROT_EDGE]			=	-1;
	protection	[PROT_POINT]		=	-1;	
	protection	[PROT_FIRE]			=	-1;	
	protection	[PROT_FLY]			=	-1;
	protection	[PROT_MAGIC]		=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//----- Damage Types ----
	damagetype 						=	DAM_FIRE|DAM_FLY;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
	damage		[DAM_INDEX_FIRE]	=	199;
	damage		[DAM_INDEX_FLY]		=	1;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_STONEGOLEM;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};


//***************
//	Visuals
//***************

func void B_SetVisuals_FireGolem()
{
	Mdl_SetVisual			(self,	"Golem.mds");
	Mdl_ApplyOverlayMds 	(self,	"Golem_Firegolem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gol_Fire_Body",DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//***************
//	FireGolem   
//***************

INSTANCE FireGolem	(Mst_Default_FireGolem)
{
	B_SetVisuals_FireGolem();
	Npc_SetToFistMode(self);
};

INSTANCE FireGolem_Griselda_01	(Mst_Default_FireGolem)
{
	B_SetVisuals_FireGolem();
	Npc_SetToFistMode(self);

	protection	[PROT_BLUNT]		=	-1;
	protection	[PROT_EDGE]			=	-1;
	protection	[PROT_POINT]		=	-1;	
	protection	[PROT_FIRE]			=	-1;	
	protection	[PROT_FLY]			=	-1;
};

INSTANCE FireGolem_Moor	(Mst_Default_FireGolem)
{
	B_SetVisuals_FireGolem();
	Npc_SetToFistMode(self);

	protection	[PROT_BLUNT]		=	-1;
	protection	[PROT_EDGE]			=	-1;
	protection	[PROT_POINT]		=	-1;	
	protection	[PROT_FIRE]			=	-1;	
	protection	[PROT_FLY]			=	-1;
};

INSTANCE Summoned_FireGolem (Mst_Default_FireGolem)
{
	name							=	"Beschworener Feuergolem";
	guild							=	GIL_SUMMONED_GOLEM;
	aivar[AIV_MM_REAL_ID]			= 	ID_SUMMONED_FIREGOLEM;
	level							=	0;
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_FireGolem();
	Npc_SetToFistMode	(self);

	attribute	[ATR_STRENGTH]		=	200;
	attribute	[ATR_DEXTERITY]		=	200;
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;
	
	flags = 0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	-1;
	protection	[PROT_EDGE]			=	-1;
	protection	[PROT_POINT]		=	-1;	
	protection	[PROT_FIRE]			=	-1;	
	protection	[PROT_FLY]			=	-1;
	protection	[PROT_MAGIC]		=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
};

INSTANCE FireGolem_Balrog	(Mst_Default_FireGolem)
{
	B_SetVisuals_FireGolem();
	Npc_SetToFistMode(self);

	protection	[PROT_BLUNT]		=	-1;
	protection	[PROT_EDGE]			=	1;
	protection	[PROT_POINT]		=	-1;	
	protection	[PROT_FIRE]			=	-1;	
	protection	[PROT_FLY]			=	-1;
};