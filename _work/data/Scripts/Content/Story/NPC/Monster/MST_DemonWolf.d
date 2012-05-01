//********************
//	Wolf Prototype														
//********************

PROTOTYPE Mst_Default_DemonWolf(C_Npc)			
{
	//----- Monster ----
	name = "Dämonischer Wolf";
	guild							=	GIL_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_WOLF;
	effect	= "SPELLFX_DARKARMOR";
	level = 12;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	Hlp_Random(61) + 40;	// 40 - 100
	attribute	[ATR_DEXTERITY]		=	Hlp_Random(16);		// 0 - 15
	attribute	[ATR_HITPOINTS_MAX]	=	Hlp_Random(101) + 100;	// 100 - 200
	attribute	[ATR_HITPOINTS]		=	attribute[ATR_HITPOINTS_MAX];
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 		=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	Hlp_Random(51)*1000 + 35000;	// 35 - 85
	protection	[PROT_EDGE]		=	Hlp_Random(51)*1000 + 35000;	// 35 - 85
	protection	[PROT_POINT]		=	Hlp_Random(31)*1000 + 20000;	// 20 - 50
	protection	[PROT_FIRE]		=	Hlp_Random(31) + 20;		// 20 - 50
	protection	[PROT_FLY]		=	30;
	protection	[PROT_MAGIC]		=	Hlp_Random(31) + 10;		// 10 - 40

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	//---- Damage Types ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf Taktik ----
	fight_tactic	=	FAI_WOLF;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= TRUE;

	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	if (Hlp_Random(100) < 15)
	{
		CreateInvItems (self, ItAt_GoblinBone, 1+Hlp_Random(3));
	};
	if (Hlp_Random(100) < 10)
	{
		CreateInvItems (self, ItAt_SkeletonBone, 1+Hlp_Random(2));
	};
};


//************
//	Visuals
//************


func void B_SetVisuals_DemonWolf()
{
	Mdl_SetVisual			(self,"Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"DemonWolf_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	Mdl_SetModelScale(self, 1.5, 1.5, 1.5);
};

INSTANCE DemonWolf	(Mst_Default_DemonWolf)
{
	B_SetVisuals_DemonWolf();
	Npc_SetToFistMode(self);
};

INSTANCE DemonWolf_Zahm	(Mst_Default_DemonWolf)
{
	B_SetVisuals_DemonWolf();
	Npc_SetToFistMode(self);

	guild = GIL_SUMMONED_WOLF;
};

INSTANCE DemonWolf_GigantDerVorzeit	(Mst_Default_DemonWolf)
{
	B_SetVisuals_DemonWolf();
	Npc_SetToFistMode(self);
};