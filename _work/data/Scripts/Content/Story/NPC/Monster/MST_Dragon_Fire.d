//****************************
//	Firedragon Prototype		
//****************************

PROTOTYPE Mst_Default_Dragon_Fire(C_Npc)			
{
	name							= "Feuerdrache";
	guild							= GIL_DRAGON;
	aivar[AIV_MM_REAL_ID]			= ID_DRAGON_FIRE;
	level							= 500;
	
	bodyStateInterruptableOverride = TRUE;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	200;
	attribute	[ATR_DEXTERITY]		=	50;
	attribute	[ATR_HITPOINTS_MAX]	=	1000;
	attribute	[ATR_HITPOINTS]		=	1000;
	attribute	[ATR_MANA_MAX] 		=	1000;
	attribute	[ATR_MANA] 			=	1000;
	
	//------ Protections ----	
	protection	[PROT_BLUNT]		=	170000;
	protection	[PROT_EDGE]			=	170000;
	protection	[PROT_POINT]		=	170000;	
	protection	[PROT_FIRE]			=	170;
	protection	[PROT_FLY]			=	170;	
	protection	[PROT_MAGIC]		=	170;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
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

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;

	//aivar[AIV_MaxDistToWp]		= 700;
	aivar[AIV_OriginalFightTactic] 	= FAI_DRAGON;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_Rtn_DragonRest;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};


//******************
//	Visuals
//******************

func void B_SetVisuals_Dragon_Fire()
{
	Mdl_SetVisual			(self,	"Dragon.mds");
	//								Body-Mesh				Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dragon_FIRE_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

//*****************
//	Firedragon
//*****************

INSTANCE Dragon_Fire	(Mst_Default_Dragon_Fire)
{
	name				=	"Feomathar";
	B_SetVisuals_Dragon_Fire();

	Npc_SetToFistMode(self);
};

//**************************
//	Firedragon Dragonisland
//*************************

INSTANCE Dragon_Fire_Island	(Mst_Default_Dragon_Fire)
{
	name				=	"Feodaron";
	B_SetVisuals_Dragon_Fire();

	Npc_SetToFistMode(self);
};

INSTANCE Wyver	(Mst_Default_Dragon_Fire)
{
	name				=	"Wyver";

	level	= 100;

	B_SetVisuals_Dragon_Fire();

	Mdl_SetModelScale(self, 0.4, 0.4, 0.4);
	
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItAt_Wyverschuppen, 5);
};

INSTANCE Kleindrache	(Mst_Default_Dragon_Fire)
{
	name				=	"Kleindrache";

	flags = 2;

	level	= 40;

	attribute	[ATR_STRENGTH]		=	150;
	attribute	[ATR_DEXTERITY]		=	200;
	attribute	[ATR_HITPOINTS_MAX]	=	500;
	attribute	[ATR_HITPOINTS]		=	500;
	
	//------ Protections ----	
	protection	[PROT_BLUNT]		=	110000;
	protection	[PROT_EDGE]			=	110000;
	protection	[PROT_POINT]		=	110000;	
	protection	[PROT_FIRE]			=	110;
	protection	[PROT_FLY]			=	110;	
	protection	[PROT_MAGIC]		=	110;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//------ Damage Types ----	
	damagetype 						=	DAM_FIRE|DAM_FLY;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
	damage		[DAM_INDEX_FIRE]	=	109;
	damage		[DAM_INDEX_FLY]		=	1; //Opfer fliegt für Fire+Fly

	B_SetVisuals_Dragon_Fire();

	Mdl_SetModelScale(self, 0.6, 0.6, 0.6);
	
	Npc_SetToFistMode(self);
};

INSTANCE Summoned_DragonFire (Mst_Default_Dragon_Fire)
{
	name							= "Beschworener Feuerdrache";
	guild							= GIL_DRAGON;
	aivar[AIV_MM_REAL_ID]			= ID_SUMMONED_FIREDRAGON;
	level							= 0;
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_Dragon_Fire();
	Npc_SetToFistMode(self);
};