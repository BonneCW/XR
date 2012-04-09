//***************************
//	Undeaddragon Prototype	
//***************************

PROTOTYPE Mst_Default_Dragon_Undead(C_Npc)			
{
	//----- Monster ----
	name							=	"Untoter Drache";
	guild							=	GIL_DRAGON;
	aivar[AIV_MM_REAL_ID]			= 	ID_DRAGON_UNDEAD;
	level							=	100;
	
	bodyStateInterruptableOverride 	= 	TRUE;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		= 400;
	attribute	[ATR_DEXTERITY]		= 60;
	attribute	[ATR_HITPOINTS_MAX]	= 2000;
	attribute	[ATR_HITPOINTS]		= 2000;
	attribute	[ATR_MANA_MAX] 		= 2000;
	attribute	[ATR_MANA] 		= 2000;
	attribute	[ATR_REGENERATEMANA] 	= 1;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		= 100000;
	protection	[PROT_EDGE]			= 10000;
	protection	[PROT_POINT]		= -1;
	protection	[PROT_FIRE]			= 200;
	protection	[PROT_FLY]			= 200;	
	protection	[PROT_MAGIC]		= 200;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//----- Damage Types ----
	damagetype 						=	DAM_FIRE|DAM_FLY;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
	damage		[DAM_INDEX_FIRE]	=	249;
	damage		[DAM_INDEX_FLY]		=	1;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----	
	fight_tactic	=	FAI_DRAGON;
	
	//----- Senses & Ranges ----	
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= 1000;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	aivar[AIV_MaxDistToWp]			= 1000;
	aivar[AIV_OriginalFightTactic] 	= FAI_DRAGON;

	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_Rtn_DragonRest;
	
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};


//*************
//	Visuals
//*************

func void B_SetVisuals_Dragon_Undead()
{
	Mdl_SetVisual			(self,	"Dragon.mds");
	//								Body-Mesh				Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dragon_Undead_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//*****************
//	Undeaddragon	
//*****************
INSTANCE Dragon_Undead	(Mst_Default_Dragon_Undead)
{
	B_SetVisuals_Dragon_Undead();
	effect							=	"spellfx_undead_dragon";

	CreateInvItems	(self, ItAt_SoulStone_UD, 1);

	Npc_SetToFistMode(self);
};

INSTANCE Dragon_Undead_Mini	(Mst_Default_Dragon_Undead)
{
	B_SetVisuals_Dragon_Undead();
	flags				   			= 	0;
	name							=	"Kleiner Untoter Drache";
	level							=	40;

	Mdl_SetModelScale(self, 0.5, 0.5, 0.5);
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		= 300;
	attribute	[ATR_DEXTERITY]		= 300;
	attribute	[ATR_HITPOINTS_MAX]	= 1000;
	attribute	[ATR_HITPOINTS]		= 1000;
	attribute	[ATR_MANA_MAX] 		= 1000;
	attribute	[ATR_MANA] 			= 1000;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		= 150000;
	protection	[PROT_EDGE]			= 150000;
	protection	[PROT_POINT]		= -1;
	protection	[PROT_FIRE]			= 150;
	protection	[PROT_FLY]			= 150;	
	protection	[PROT_MAGIC]		= 150;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];


	Npc_SetToFistMode(self);
};