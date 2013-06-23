//***************************
//	Shadowbeast Prototype	
//***************************

PROTOTYPE Mst_Default_Shadowbeast(C_Npc)			
{
	//----- Monster ----
	name							=	"Schattenläufer";
	guild							=	GIL_SHADOWBEAST;
	aivar[AIV_MM_REAL_ID]			= 	ID_SHADOWBEAST;
	level							=	30;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	270;
	attribute	[ATR_DEXTERITY]		=	25;
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	150000;
	protection	[PROT_EDGE]			=	150000;
	protection	[PROT_POINT]		=	100000;
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	75;

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
	fight_tactic	=	FAI_SHADOWBEAST;

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

	CreateInvItems (self, ItFo_MuttonRaw, 4);
};


//***************
//	Visuals
//***************

func void B_SetVisuals_Shadowbeast()
{
	Mdl_SetVisual			(self,"Shadow.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sha_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_ShadowbeastRider()
{
	Mdl_SetVisual			(self,"Shadow.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sha_Rider_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Feuerlaeufer()
{
	Mdl_SetVisual			(self,"Shadow.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sha_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Wasserlaeufer()
{
	Mdl_SetVisual			(self,"Shadow.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sha_Body",		2,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Eislaeufer()
{
	Mdl_SetVisual			(self,"Shadow.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sha_Ice_Body",		0,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Nightmare()
{
	Mdl_SetVisual			(self,"Shadow.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sha_Body",		3,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_ShadowbeastNew()
{
	Mdl_SetVisual			(self,"Shadow.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sha_Body",		4,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//*******************
//	Shadowbeast    	
//*******************

INSTANCE Shadowbeast	(Mst_Default_Shadowbeast)
{
	B_SetVisuals_Shadowbeast();
	Npc_SetToFistMode(self);
};

INSTANCE Shadowbeast_XW_01	(Mst_Default_Shadowbeast)
{
	B_SetVisuals_Shadowbeast();
	Npc_SetToFistMode(self);
};

INSTANCE Shadowbeast_XW_02	(Mst_Default_Shadowbeast)
{
	B_SetVisuals_Shadowbeast();
	Npc_SetToFistMode(self);

	start_aistate	= ZS_MM_Rtn_XWArena;
};

INSTANCE Shadowbeast_XW_03	(Mst_Default_Shadowbeast)
{
	B_SetVisuals_Shadowbeast();
	Npc_SetToFistMode(self);

	start_aistate	= ZS_MM_Rtn_XWArena;
};

INSTANCE Shadowbeast_GorNaKosh	(Mst_Default_Shadowbeast)
{
	name = "alter verwundeter Schattenläufer";

	level							=	15;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	135;
	attribute	[ATR_DEXTERITY]		=	25;
	attribute	[ATR_HITPOINTS_MAX]	=	100;
	attribute	[ATR_HITPOINTS]		=	300;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	75000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	50000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	protection	[PROT_MAGIC]		=	37;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	B_SetVisuals_Shadowbeast();
	Npc_SetToFistMode(self);
};

INSTANCE Shadowbeast_Trent	(Mst_Default_Shadowbeast)
{
	B_SetVisuals_Shadowbeast();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 4);
};

INSTANCE Shadowbeast_Rider	(Mst_Default_Shadowbeast)
{
	B_SetVisuals_ShadowbeastRider();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 4);
};

INSTANCE ShadowbeastNew	(Mst_Default_Shadowbeast)
{
	aivar[AIV_MM_REAL_ID]			= 	ID_SHADOWBEAST;

	B_SetVisuals_ShadowbeastNew();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 4);
};

INSTANCE Feuerlaeufer	(Mst_Default_Shadowbeast)
{
	name	= "Feuerläufer";

	aivar[AIV_MM_REAL_ID]			= 	ID_FIRESHADOWBEAST;

	level	= 100;

	effect	= "SPELLFX_FIREARMOR";

	attribute	[ATR_STRENGTH]		=	240;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	600;
	attribute	[ATR_HITPOINTS]		=	600;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	150000;
	protection	[PROT_EDGE]			=	150000;
	protection	[PROT_POINT]		=	100000;
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	100;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	damagetype 						=	DAM_FIRE;

	B_SetVisuals_Feuerlaeufer();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 4);
	CreateInvItems	(self, ItAt_FireShadowFur, 1);
	CreateInvItems	(self, ItAt_FireShadowHorn, 1);
};

INSTANCE Wasserlaeufer	(Mst_Default_Shadowbeast)
{
	name	= "Wasserläufer";

	aivar[AIV_MM_REAL_ID]			= 	ID_WATERSHADOWBEAST;

	level	= 100;

	attribute	[ATR_STRENGTH]		=	240;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	600;
	attribute	[ATR_HITPOINTS]		=	600;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	150000;
	protection	[PROT_EDGE]			=	150000;
	protection	[PROT_POINT]		=	100000;
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	100;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	effect	= "SPELLFX_ICEARMOR";

	B_SetVisuals_Wasserlaeufer();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 4);
	CreateInvItems	(self, ItAt_WaterShadowFur, 1);
	CreateInvItems	(self, ItAt_WaterShadowHorn, 1);
};

INSTANCE Eislaeufer_FGE	(Mst_Default_Shadowbeast)
{
	name	= "Eisläufer";

	aivar[AIV_MM_REAL_ID]			= 	ID_WATERSHADOWBEAST;

	level	= 100;

	attribute	[ATR_STRENGTH]		=	240;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	600;
	attribute	[ATR_HITPOINTS]		=	600;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	150000;
	protection	[PROT_EDGE]			=	150000;
	protection	[PROT_POINT]		=	100000;
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	100;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	effect	= "SPELLFX_ICEARMOR";

	B_SetVisuals_Eislaeufer();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 4);
};

INSTANCE Eislaeufer	(Mst_Default_Shadowbeast)
{
	name	= "Eisläufer";

	aivar[AIV_MM_REAL_ID]			= 	ID_WATERSHADOWBEAST;

	level	= 100;

	attribute	[ATR_STRENGTH]		=	240;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	600;
	attribute	[ATR_HITPOINTS]		=	600;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	150000;
	protection	[PROT_EDGE]			=	150000;
	protection	[PROT_POINT]		=	100000;
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	100;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	effect	= "SPELLFX_ICEARMOR";

	B_SetVisuals_Eislaeufer();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 4);
};

INSTANCE Nightmare	(Mst_Default_Shadowbeast)
{
	name	= "Nachtmahr";

	aivar[AIV_MM_REAL_ID]			= 	ID_NIGHTMARE;

	level	= 50;

	effect	= "SPELLFX_DARKARMOR";

	attribute	[ATR_STRENGTH]		=	240;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	600;
	attribute	[ATR_HITPOINTS]		=	600;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	150000;
	protection	[PROT_EDGE]			=	150000;
	protection	[PROT_POINT]		=	100000;
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	100;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	B_SetVisuals_Nightmare();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 4);
	CreateInvItems	(self, ItAt_NightmareFur, 1);
	CreateInvItems	(self, ItAt_NightmareHorn, 1);
};

INSTANCE ShadowbeastTransform	(Mst_Default_Shadowbeast)
{
	Npc_PercEnable (self, PERC_ASSESSSURPRISE , B_StopMagicTransform);
	B_SetVisuals_Shadowbeast();
	Npc_SetToFistMode(self);
};