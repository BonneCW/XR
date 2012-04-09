//***************************
//	Swampshark Prototype	
//***************************

PROTOTYPE Mst_Default_Swampshark(C_Npc)			
{
	//----- Monster ----
	name							=	"Sumpfhai";
	guild							=	GIL_SWAMPSHARK;
	aivar[AIV_MM_REAL_ID]			= 	ID_SWAMPSHARK;
	level							=	24;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	175;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	100000;
	protection	[PROT_EDGE]			=	100000;
	protection	[PROT_POINT]		=	100000;
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	100;
	protection	[PROT_MAGIC]		=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_SWAMPSHARK;

	//----- Sense & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;

	if (Hlp_Random(100) < 15)
	{
		CreateInvItems (self, ItAt_GoblinBone, 1+Hlp_Random(3));
	};
	if (Hlp_Random(100) < 10)
	{
		CreateInvItems (self, ItAt_SkeletonBone, 1+Hlp_Random(2));
	};
};


//***************
//	Visuals
//***************


func void B_SetVisuals_Swampshark()
{
	Mdl_SetVisual			(self,	"Swampshark.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Swa_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Swampshark_Bad()
{
	Mdl_SetVisual			(self,	"Swampshark.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Swa_Body",		3,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Swampshark_Bad2()
{
	Mdl_SetVisual			(self,	"Swampshark.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Swa_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Lindwurm()
{
	Mdl_SetVisual			(self,	"Swampshark.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Swa_Body",		2,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Wurm()
{
	Mdl_SetVisual			(self,	"Swampshark.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Swa_Body",		5,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

/*************************************************************************
**	Swampshark    														**
*************************************************************************/

INSTANCE Swampshark	(Mst_Default_Swampshark)
{
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);
};

INSTANCE Swampshark_Undead	(Mst_Default_Swampshark)
{
	name	= "Untoter Sumpfhai";
	aivar[AIV_MM_REAL_ID]			= 	ID_UNDEADSWAMPSHARK;

	level = 40;

	B_SetVisuals_Swampshark_Bad();
	Npc_SetToFistMode(self);
};

INSTANCE Swampshark_Undead2	(Mst_Default_Swampshark)
{
	name	= "Untoter Sumpfhai";

	level = 40;

	B_SetVisuals_Swampshark_Bad2();
	Npc_SetToFistMode(self);
};

INSTANCE Summoned_UndeadSwampshark (Mst_Default_Swampshark)
{
	name							=	"Beschworener untoter Sumpfhai";
	guild							=	GIL_SUMMONED_GOLEM;
	aivar[AIV_MM_REAL_ID]			= 	ID_SUMMONED_UNDEADSWAMPSHARK;
	level							=	0;

	attribute	[ATR_STRENGTH]		=	200;
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_Swampshark_Bad();
	Npc_SetToFistMode	(self);
};

INSTANCE Lindwurm	(Mst_Default_Swampshark)
{
	name	= "Lindwurm";
	aivar[AIV_MM_REAL_ID]			= 	ID_LINDWURM;

	CreateInvItems	(self, ItAt_LindwurmHaut, 1);
	level							=	300;

	attribute	[ATR_STRENGTH]		=	300;
	attribute	[ATR_HITPOINTS_MAX]	=	500;
	attribute	[ATR_HITPOINTS]		=	500;
	attribute	[ATR_DEXTERITY]		=	30;

	//----- Protections ----	
	protection	[PROT_BLUNT]		=	180000;
	protection	[PROT_EDGE]			=	180000;
	protection	[PROT_POINT]		=	180000;	
	protection	[PROT_FIRE]			=	90;
	protection	[PROT_FLY]			=	30;	
	protection	[PROT_MAGIC]		=	90;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	B_SetVisuals_Lindwurm();
	Npc_SetToFistMode(self);
};

INSTANCE Swampshark_Fuetterung_01	(Mst_Default_Swampshark)
{
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);

	aivar[AIV_MM_FollowTime] = 999999;

	CreateInvItems	(self, ItFo_SwampSharkFleisch, 1);
};


INSTANCE Swampshark_Fuetterung_02_01	(Mst_Default_Swampshark)
{
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);

	aivar[AIV_MM_FollowTime] = 999999;
};

INSTANCE Swampshark_Fuetterung_02_02	(Mst_Default_Swampshark)
{
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);

	aivar[AIV_MM_FollowTime] = 999999;
};

INSTANCE Swampshark_Fuetterung_02_03	(Mst_Default_Swampshark)
{
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);

	aivar[AIV_MM_FollowTime] = 999999;
};

INSTANCE Swampshark_Fuetterung_02_04	(Mst_Default_Swampshark)
{
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);

	aivar[AIV_MM_FollowTime] = 999999;
};

INSTANCE Swampshark_Fuetterung_02_05	(Mst_Default_Swampshark)
{
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);

	aivar[AIV_MM_FollowTime] = 999999;
};


INSTANCE Swampshark_Fuetterung_03_01	(Mst_Default_Swampshark)
{
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);

	aivar[AIV_MM_FollowTime] = 999999;
};

INSTANCE Swampshark_Fuetterung_03_02	(Mst_Default_Swampshark)
{
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);

	aivar[AIV_MM_FollowTime] = 999999;
};

INSTANCE Swampshark_Fuetterung_03_03	(Mst_Default_Swampshark)
{
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);

	aivar[AIV_MM_FollowTime] = 999999;
};

INSTANCE Swampshark_Fuetterung_03_04	(Mst_Default_Swampshark)
{
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);

	aivar[AIV_MM_FollowTime] = 999999;
};

INSTANCE Swampshark_Fuetterung_03_05	(Mst_Default_Swampshark)
{
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);

	aivar[AIV_MM_FollowTime] = 999999;
};

INSTANCE Wurm	(Mst_Default_Swampshark)
{
	name	=	"Morastwurm";
	level							=	1;
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	10;
	attribute	[ATR_HITPOINTS_MAX]	=	10;
	attribute	[ATR_HITPOINTS]		=	10;

	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	0;
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_MAGIC]		=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	B_SetVisuals_Wurm();
	Npc_SetToFistMode(self);

	Mdl_SetModelScale(self, 0.1, 0.1, 0.1);
	
};

INSTANCE Seeungeheuer_Teutonica	(Mst_Default_Swampshark)
{
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);

	Mdl_SetModelScale(self, 2.0, 2.0, 2.0);
};