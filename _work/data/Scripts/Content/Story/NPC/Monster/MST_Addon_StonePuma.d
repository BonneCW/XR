//***************************
//	Shadowbeast Prototype	
//***************************

PROTOTYPE Mst_Default_StonePuma(C_Npc)			
{
	//----- Monster ----
	name							=	"Puma";
	guild							=	GIL_Gargoyle;
	aivar[AIV_MM_REAL_ID]			= 	ID_Gargoyle;
	level							=	20;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	Hlp_Random(101) - 150;	// 150 - 250
	attribute	[ATR_DEXTERITY]		=	Hlp_Random(21);		// 0 - 20
	attribute	[ATR_HITPOINTS_MAX]	=	Hlp_Random(201) + 300;	// 300 - 500
	attribute	[ATR_HITPOINTS]		=	attribute[ATR_HITPOINTS_MAX];
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 		=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	Hlp_Random(41)*1000 + 80000;	// 80 - 120
	protection	[PROT_EDGE]		=	Hlp_Random(41)*1000 + 80000;	// 80 - 120
	protection	[PROT_POINT]		=	Hlp_Random(41)*1000 + 80000;	// 80 - 120
	protection	[PROT_FIRE]		=	Hlp_Random(51) + 50;		// 50 - 100
	protection	[PROT_FLY]		=	0;
	protection	[PROT_MAGIC]		=	Hlp_Random(51) + 25;		// 25 - 75

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
	fight_tactic	=	FAI_GARGOYLE;

	//----- Senses & Ranges ----
	senses			= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_SleepStart] 	= 6;	
	aivar[AIV_MM_SleepEnd]		= 20;
	aivar[AIV_MM_RoamStart]		= 20;
	aivar[AIV_MM_RoamEnd]		= 6;

	if (Hlp_Random(100) < 15)
	{
		CreateInvItems (self, ItAt_GoblinBone, 1+Hlp_Random(3));
	};
	if (Hlp_Random(100) < 10)
	{
		CreateInvItems (self, ItAt_SkeletonBone, 1+Hlp_Random(2));
	};

	CreateInvItems	(self, ItFo_MuttonRaw, 2);
};


//***************
//	Visuals
//***************

func void B_SetVisuals_StonePuma()
{
	Mdl_SetVisual			(self,"StonePuma.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"StonePuma_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Puma()
{
	Mdl_SetVisual			(self,"StonePuma.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Puma_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//*******************
//	StonePuma    	
//*******************

INSTANCE Puma	(Mst_Default_StonePuma)
{
	B_SetVisuals_Puma();
	Npc_SetToFistMode(self);
};

INSTANCE StonePuma	(Mst_Default_StonePuma)
{
	name = "Steinpuma";

	B_SetVisuals_StonePuma();
	Npc_SetToFistMode(self);
};
