//**********************
//	Alligator Prototype		
//**********************

PROTOTYPE Mst_Default_Addon_Alligator (C_Npc)			
{
	//----- Monster ----
	name							=	"Alligator";
	guild							=	GIL_Alligator;
	aivar[AIV_MM_REAL_ID]			= 	ID_Alligator;
	level							=	18;
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	10;
	attribute	[ATR_HITPOINTS_MAX]	=	200;
	attribute	[ATR_HITPOINTS]		=	200;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	140000;
	protection	[PROT_EDGE]			=	140000;
	protection	[PROT_POINT]		=	140000;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	140;
	protection	[PROT_MAGIC]		=	50;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf Taktik ----
	fight_tactic	=	FAI_ALLIGATOR;

	//----- Sense & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;

	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;

	if (Hlp_Random(100) < 5)
	{
		CreateInvItems (self, ItAt_GoblinBone, 1);
	};
};

//************
//	Visuals
//************

func void B_SetVisuals_Alligator ()
{
	Mdl_SetVisual			(self,	"Alligator.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"KRO_BODY",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//**************
//	Alligator    	
//**************

INSTANCE Alligator	(Mst_Default_Addon_Alligator)
{
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};

INSTANCE Alligator_AJ_01	(Mst_Default_Addon_Alligator)
{
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};

INSTANCE Alligator_AJ_02	(Mst_Default_Addon_Alligator)
{
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};

INSTANCE Alligator_AJ_03	(Mst_Default_Addon_Alligator)
{
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};

INSTANCE Alligator_AJ_04	(Mst_Default_Addon_Alligator)
{
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};

INSTANCE Alligator_AJ_05	(Mst_Default_Addon_Alligator)
{
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};

INSTANCE Alligator_AJ_06	(Mst_Default_Addon_Alligator)
{
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};

INSTANCE Alligator_AJ_07	(Mst_Default_Addon_Alligator)
{
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};

INSTANCE Alligator_AJ_08	(Mst_Default_Addon_Alligator)
{
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};

INSTANCE Alligator_AJ_09	(Mst_Default_Addon_Alligator)
{
	name	=	"Muttertier";

	level							=	15;
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	130;
	attribute	[ATR_DEXTERITY]		=	40;
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	160000;
	protection	[PROT_EDGE]			=	160000;
	protection	[PROT_POINT]		=	1640000;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	140;
	protection	[PROT_MAGIC]		=	60;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};

INSTANCE Alligator_AJ_10	(Mst_Default_Addon_Alligator)
{
	name	=	"Muttertier";

	level							=	15;
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	130;
	attribute	[ATR_DEXTERITY]		=	40;
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	160000;
	protection	[PROT_EDGE]			=	160000;
	protection	[PROT_POINT]		=	1640000;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	140;
	protection	[PROT_MAGIC]		=	60;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};