//**********************
//	Alligator Prototype		
//**********************

PROTOTYPE Mst_Default_Addon_Alligator (C_Npc)			
{
	//----- Monster ----
	name							=	"Alligator";
	guild							=	GIL_Alligator;
	aivar[AIV_MM_REAL_ID]			= 	ID_Alligator;
	level							=	16;
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	Hlp_Random(41)+80;
	attribute	[ATR_DEXTERITY]		=	Hlp_Random(21);
	attribute	[ATR_HITPOINTS_MAX]	=	Hlp_Random(99)+150;
	attribute	[ATR_HITPOINTS]		=	attribute[ATR_HITPOINTS_MAX];
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	Hlp_Random(41)*1000+120000;
	protection	[PROT_EDGE]		=	Hlp_Random(41)*1000+120000;
	protection	[PROT_POINT]		=	Hlp_Random(41)*1000+120000;
	protection	[PROT_FIRE]		=	0;
	protection	[PROT_FLY]		=	Hlp_Random(41)+120;
	protection	[PROT_MAGIC]		=	Hlp_Random(41)+30;

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

	level							=	20;
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	150;
	attribute	[ATR_DEXTERITY]		=	40;
	attribute	[ATR_HITPOINTS_MAX]	=	450;
	attribute	[ATR_HITPOINTS]		=	450;
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

	level							=	20;
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	150;
	attribute	[ATR_DEXTERITY]		=	40;
	attribute	[ATR_HITPOINTS_MAX]	=	450;
	attribute	[ATR_HITPOINTS]		=	450;
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