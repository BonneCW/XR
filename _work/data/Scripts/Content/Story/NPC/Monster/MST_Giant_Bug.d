//*************************
//	Giant_Bug Prototype		
//*************************

PROTOTYPE Mst_Default_Giant_Bug(C_Npc)			
{
	//----- Monster ----
	name							=	"Feldräuber";
	guild							=	GIL_GIANT_BUG;
	aivar[AIV_MM_REAL_ID]			= 	ID_GIANT_BUG;
	level							=	8;
 
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	5;
	attribute	[ATR_HITPOINTS_MAX]	=	80;
	attribute	[ATR_HITPOINTS]		=	80;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	40000;
	protection	[PROT_EDGE]			=	40000;
	protection	[PROT_POINT]		=	40000;
	protection	[PROT_FIRE]			=	40;
	protection	[PROT_FLY]			=	40;
	protection	[PROT_MAGIC]		=	10;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//----- Damage TYpes ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	= 	FAI_GIANT_BUG;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
};

PROTOTYPE Mst_Default_YGiant_Bug(C_Npc)			
{
	//----- Monster ----
	name							=	"Junger Feldräuber";
	level							=	4;
	guild							=	GIL_GIANT_BUG;
	aivar[AIV_MM_REAL_ID]			= 	ID_GIANT_BUG;
 
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	20;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	40;
	attribute	[ATR_HITPOINTS]		=	40;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	20000;
	protection	[PROT_EDGE]			=	20000;
	protection	[PROT_POINT]		=	20000;
	protection	[PROT_FIRE]			=	20;
	protection	[PROT_FLY]			=	20;
	protection	[PROT_MAGIC]		=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//----- Damage TYpes ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	= 	FAI_GIANT_BUG;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
};


//************
//	Visuals
//************

func void B_SetVisuals_Giant_Bug()
{
	Mdl_SetVisual			(self,	"Giant_Bug.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Giant_Bug_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//***************
//	Giant_Bug    
//***************

INSTANCE Giant_Bug	(Mst_Default_Giant_Bug)
{
	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);
};

INSTANCE Insekt_03	(Mst_Default_Giant_Bug)
{
	level							=	1;

	aivar[AIV_MM_REAL_ID]			= 	ID_INSEKT;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		= 10;
	attribute	[ATR_DEXTERITY]		= 0;
	attribute	[ATR_HITPOINTS_MAX]	= 10;
	attribute	[ATR_HITPOINTS]		= 10;
	attribute	[ATR_MANA_MAX] 		= 0;
	attribute	[ATR_MANA] 			= 0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		= 0;
	protection	[PROT_EDGE]			= 0;
	protection	[PROT_POINT]		= 0;
	protection	[PROT_FIRE]			= 0;
	protection	[PROT_FLY]			= 0;
	protection	[PROT_MAGIC]		= 0;

	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);

	Mdl_SetModelScale(self, 0.2, 0.2, 0.2);
};

INSTANCE Insekt_06	(Mst_Default_Giant_Bug)
{
	level							=	1;

	aivar[AIV_MM_REAL_ID]			= 	ID_INSEKT;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		= 10;
	attribute	[ATR_DEXTERITY]		= 0;
	attribute	[ATR_HITPOINTS_MAX]	= 10;
	attribute	[ATR_HITPOINTS]		= 10;
	attribute	[ATR_MANA_MAX] 		= 0;
	attribute	[ATR_MANA] 			= 0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		= 0;
	protection	[PROT_EDGE]			= 0;
	protection	[PROT_POINT]		= 0;
	protection	[PROT_FIRE]			= 0;
	protection	[PROT_FLY]			= 0;
	protection	[PROT_MAGIC]		= 0;

	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);

	Mdl_SetModelScale(self, 0.2, 0.2, 0.2);
};


//**************************************
//	junge Giant_Bug   (für Spielstart) 	
//**************************************

INSTANCE YGiant_Bug	(Mst_Default_Giant_Bug)
{
	B_SetVisuals_Giant_Bug();
	Mdl_SetModelScale(self, 0.9, 0.9, 0.9);
	Npc_SetToFistMode(self);
};