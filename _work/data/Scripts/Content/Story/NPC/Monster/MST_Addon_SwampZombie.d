//*********************
//	Zombie Prototype	
//*********************

PROTOTYPE Mst_Default_SwampZombie(C_Npc)			
{
	//----- Monster ----
	name							=	"Moorleiche";
	guild							=	GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID]			= 	ID_ZOMBIE;
	level							=	15;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	10;
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	75000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	75000;	
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	protection	[PROT_MAGIC]		=	30;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//----- Damage Type ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf Taktik ----
	fight_tactic	=	FAI_ZOMBIE;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};


//*************
//	Visuals
//*************

//-------------------------------------------------------------
// Zwei Hautfarben mit jeweils zwei Gesichtstexturen
//-------------------------------------------------------------
func void B_SetVisuals_SwampZombie()
{
	var int rnd;
	rnd = Hlp_Random(2);
	var int rnd2;
	rnd2 = Hlp_Random(2) + 2*rnd;

	Mdl_SetVisual			(self,	"SwampZombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		1,			rnd,			"Zom_Head", 5+rnd2,  		DEFAULT,	-1);
};

//***********
//	Zombie01   
//***********

INSTANCE SwampZombie		(Mst_Default_SwampZombie)
{
	B_SetVisuals_SwampZombie();
	Npc_SetToFistMode(self);
};

INSTANCE SwampZombie_Moor_01		(Mst_Default_SwampZombie)
{
	B_SetVisuals_SwampZombie();
	Npc_SetToFistMode(self);
};

INSTANCE SwampZombie_Moor_02		(Mst_Default_SwampZombie)
{
	B_SetVisuals_SwampZombie();
	Npc_SetToFistMode(self);
};

INSTANCE SwampZombie_Moor_03		(Mst_Default_SwampZombie)
{
	B_SetVisuals_SwampZombie();
	Npc_SetToFistMode(self);
};

INSTANCE SwampZombie_Moor_04		(Mst_Default_SwampZombie)
{
	B_SetVisuals_SwampZombie();
	Npc_SetToFistMode(self);
};

INSTANCE SwampZombie_Moor_05		(Mst_Default_SwampZombie)
{
	B_SetVisuals_SwampZombie();
	Npc_SetToFistMode(self);
};

INSTANCE SwampZombie_Moor_06		(Mst_Default_SwampZombie)
{
	B_SetVisuals_SwampZombie();
	Npc_SetToFistMode(self);
};

INSTANCE SwampZombie_Moor_07		(Mst_Default_SwampZombie)
{
	B_SetVisuals_SwampZombie();
	Npc_SetToFistMode(self);
};

INSTANCE SwampZombie_Moor_08		(Mst_Default_SwampZombie)
{
	B_SetVisuals_SwampZombie();
	Npc_SetToFistMode(self);
};

INSTANCE SwampZombie_Moor_09		(Mst_Default_SwampZombie)
{
	B_SetVisuals_SwampZombie();
	Npc_SetToFistMode(self);
};

INSTANCE SwampZombie_Moor_10		(Mst_Default_SwampZombie)
{
	B_SetVisuals_SwampZombie();
	Npc_SetToFistMode(self);
};

INSTANCE SwampZombie_Moor_11		(Mst_Default_SwampZombie)
{
	B_SetVisuals_SwampZombie();
	Npc_SetToFistMode(self);
};

INSTANCE SwampZombie_Moor_12		(Mst_Default_SwampZombie)
{
	B_SetVisuals_SwampZombie();
	Npc_SetToFistMode(self);
};

INSTANCE SwampZombie_Moor_13		(Mst_Default_SwampZombie)
{
	B_SetVisuals_SwampZombie();
	Npc_SetToFistMode(self);
};

INSTANCE SwampZombie_Moor_14		(Mst_Default_SwampZombie)
{
	B_SetVisuals_SwampZombie();
	Npc_SetToFistMode(self);
};

INSTANCE SwampZombie_Moor_15		(Mst_Default_SwampZombie)
{
	B_SetVisuals_SwampZombie();
	Npc_SetToFistMode(self);
};

INSTANCE SwampZombie_Moor_16		(Mst_Default_SwampZombie)
{
	B_SetVisuals_SwampZombie();
	Npc_SetToFistMode(self);
};

INSTANCE SwampZombie_Moor_17		(Mst_Default_SwampZombie)
{
	B_SetVisuals_SwampZombie();
	Npc_SetToFistMode(self);
};

INSTANCE SwampZombie_Moor_18		(Mst_Default_SwampZombie)
{
	B_SetVisuals_SwampZombie();
	Npc_SetToFistMode(self);
};

INSTANCE SwampZombie_Moor_19		(Mst_Default_SwampZombie)
{
	B_SetVisuals_SwampZombie();
	Npc_SetToFistMode(self);
};

INSTANCE SwampZombie_Moor_20		(Mst_Default_SwampZombie)
{
	B_SetVisuals_SwampZombie();
	Npc_SetToFistMode(self);
};