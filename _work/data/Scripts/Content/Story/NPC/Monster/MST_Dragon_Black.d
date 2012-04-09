//***************************
//	Blackdragon Prototype	
//***************************

PROTOTYPE Mst_Default_Dragon_Black(C_Npc)			
{
	//----- Monster ----
	name							=	"Schwarzer Drache";
	guild							=	GIL_DRAGON;
	aivar[AIV_MM_REAL_ID]			= 	ID_DRAGON_Black;
	level							=	300;
	
	bodyStateInterruptableOverride = TRUE;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		= 200;
	attribute	[ATR_DEXTERITY]		= 50;
	attribute	[ATR_HITPOINTS_MAX]	= 1000;
	attribute	[ATR_HITPOINTS]		= 1000;
	attribute	[ATR_MANA_MAX] 		= 1000;
	attribute	[ATR_MANA] 			= 1000;
	
	//------ Protections ----	
	protection	[PROT_BLUNT]		= 150000;
	protection	[PROT_EDGE]			= 150000;
	protection	[PROT_POINT]		= 150000;	
	protection	[PROT_FIRE]			= 150;
	protection	[PROT_FLY]			= 150;
	protection	[PROT_MAGIC]		= 150;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//----- Damage Types ----
	damagetype 						=	DAM_FIRE|DAM_FLY;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
	damage		[DAM_INDEX_FIRE]	=	129;
	damage		[DAM_INDEX_FLY]		=	1; //Opfer fliegt für Fire+Fly
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----	
	
	
	//----- Senses & Ranges ----	
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_DRAGON_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
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

func void B_SetVisuals_Dragon_Black()
{
	Mdl_SetVisual			(self,	"Dragon.mds");
	//								Body-Mesh				Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dragon_Black_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//*****************
//	Blackdragon	
//*****************
INSTANCE Dragon_Black	(Mst_Default_Dragon_Black)
{
	//name		=	"Pandrodor";
	//flags				   			= 	NPC_FLAG_IMMORTAL;
	fight_tactic	=	FAI_DRAGON;
	B_SetVisuals_Dragon_Black();
	Npc_SetToFistMode(self);

	bodyStateInterruptableOverride = TRUE;
};


INSTANCE Summoned_Dragon_Black (Mst_Default_Dragon_Black)
{
	name							= "Beschworener Schwarzer Drache";
	guild							= GIL_DRAGON;
	aivar[AIV_MM_REAL_ID]			= ID_SUMMONED_STONEDRAGON;
	level							= 0;
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_Dragon_Black();
	Npc_SetToFistMode(self);
};
