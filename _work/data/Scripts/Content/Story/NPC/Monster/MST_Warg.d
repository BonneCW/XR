//*************************
//	Warg Prototype
//*************************

PROTOTYPE Mst_Default_Warg(C_Npc)			
{
	//----- Monster ----
	name							=	"Warg";
	guild							=	GIL_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_WARG;
	level							=	30;		
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	225;
	attribute	[ATR_DEXTERITY]		=	15;
	attribute	[ATR_HITPOINTS_MAX]	=	300;	
	attribute	[ATR_HITPOINTS]		=	300;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	125000;
	protection	[PROT_EDGE]			=	125000;
	protection	[PROT_POINT]		=	75000;
	protection	[PROT_FIRE]			=	125;
	protection	[PROT_FLY]			=	125;
	protection	[PROT_MAGIC]		=	45;

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

	aivar[AIV_MM_RoamStart] 	= 6;	
	aivar[AIV_MM_RoamEnd]		= 22;
	aivar[AIV_MM_SleepStart]	= 22;
	aivar[AIV_MM_SleepEnd]		= 6;

	if (Hlp_Random(100) < 15)
	{
		CreateInvItems (self, ItAt_GoblinBone, 1+Hlp_Random(3));
	};
	if (Hlp_Random(100) < 10)
	{
		CreateInvItems (self, ItAt_SkeletonBone, 1+Hlp_Random(2));
	};

	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

PROTOTYPE Mst_Default_Blackwolf(C_Npc)			
{
	//----- Monster ----
	name							=	"Schwarzer Wolf";
	level							=	 9;
	guild							=	GIL_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_WOLF;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	45;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	90;
	attribute	[ATR_HITPOINTS]		=	90;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	45000;
	protection	[PROT_EDGE]			=	45000;
	protection	[PROT_POINT]		=	45000;
	protection	[PROT_FIRE]			=	45;
	protection	[PROT_FLY]			=	45;
	protection	[PROT_MAGIC]		=	10;

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

	aivar[AIV_MM_RoamStart] 	= 6;	
	aivar[AIV_MM_RoamEnd]		= 22;
	aivar[AIV_MM_SleepStart]	= 22;
	aivar[AIV_MM_SleepEnd]		= 6;

	if (Hlp_Random(100) < 15)
	{
		CreateInvItems (self, ItAt_GoblinBone, 1+Hlp_Random(3));
	};
	if (Hlp_Random(100) < 10)
	{
		CreateInvItems (self, ItAt_SkeletonBone, 1+Hlp_Random(2));
	};

	CreateInvItems (self, ItFo_MuttonRaw, 2);
};


//*************
//	Visuals
//*************


func void B_SetVisuals_WARG()
{
	Mdl_SetVisual			(self, "Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Warg_Body2",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_BLACKWOLF()
{
	Mdl_SetVisual			(self, "Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Warg_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

//************
//	Warg
//************

INSTANCE Warg	(Mst_Default_Warg)
{
	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};

INSTANCE Warg_Urs	(Mst_Default_Warg)
{
	name		= "Urs";

	flags = 2;

	guild = GIL_SUMMONED_WOLF;

	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};

INSTANCE Warg_Mirza	(Mst_Default_Warg)
{
	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItAm_Mirza, 1);
};

INSTANCE Warg_Atalante	(Mst_Default_Warg)
{
	name		= "weiblicher Warg";

	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};

INSTANCE Warg_Atalante2	(Mst_Default_Warg)
{
	name		= "Atalante";
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	275;
	attribute	[ATR_DEXTERITY]		=	25;
	attribute	[ATR_HITPOINTS_MAX]	=	500;	
	attribute	[ATR_HITPOINTS]		=	500;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	155000;
	protection	[PROT_EDGE]			=	155000;
	protection	[PROT_POINT]		=	105000;
	protection	[PROT_FIRE]			=	155;
	protection	[PROT_FLY]			=	155;
	protection	[PROT_MAGIC]		=	75;

	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};

INSTANCE WargTransform	(Mst_Default_Warg)
{
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	150+(Mod_WM_Tiergestalt*hero.level);
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	300+(Mod_WM_Tiergestalt*hero.level*10);	
	attribute	[ATR_HITPOINTS]		=	300+(Mod_WM_Tiergestalt*hero.level*10);
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	125000+(Mod_WM_Tiergestalt*hero.level)*1000;
	protection	[PROT_EDGE]			=	125000+(Mod_WM_Tiergestalt*hero.level)*1000;
	protection	[PROT_POINT]		=	75000+(Mod_WM_Tiergestalt*hero.level)*1000;
	protection	[PROT_FIRE]			=	125+(Mod_WM_Tiergestalt*hero.level);
	protection	[PROT_FLY]			=	125+(Mod_WM_Tiergestalt*hero.level);
	protection	[PROT_MAGIC]		=	0+(Mod_WM_Tiergestalt*hero.level);

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	damagetype 						=	DAM_EDGE|DAM_MAGIC|DAM_FIRE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
	damage		[DAM_INDEX_EDGE]	=	self.attribute[ATR_STRENGTH];
//	damage		[DAM_INDEX_POINT]	=	0;
	damage		[DAM_INDEX_FIRE]	=	(Mod_WM_Tiergestalt*(hero.level/10)*3);
//	damage		[DAM_INDEX_FLY]		=	0;
	damage		[DAM_INDEX_MAGIC]	=	(Mod_WM_Tiergestalt*(hero.level/10)*3);

	Npc_PercEnable (self, PERC_ASSESSSURPRISE , B_StopMagicTransform);
	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};
//**********************************************
//	Schwarzer Wolf  (MIS)
//*********************************************

INSTANCE BlackWolf	(Mst_Default_Blackwolf)
{
	B_SetVisuals_BLACKWOLF();
	Npc_SetToFistMode(self);
};

INSTANCE BlackWolf_Maleth_01	(Mst_Default_Warg)
{
	name							=	"Schwarzer Wolf";
	level							=	 9;		
	//für Inventory
	aivar[AIV_MM_REAL_ID]			= 	ID_WOLF;
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	45;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	90;
	attribute	[ATR_HITPOINTS]		=	90;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	45000;
	protection	[PROT_EDGE]			=	45000;
	protection	[PROT_POINT]		=	45000;
	protection	[PROT_FIRE]			=	45;
	protection	[PROT_FLY]			=	45;
	protection	[PROT_MAGIC]		=	45;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	B_SetVisuals_BLACKWOLF();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);
};

INSTANCE BlackWolf_Maleth_02	(Mst_Default_Warg)
{
	name							=	"Schwarzer Wolf";
	level							=	 9;		
	//für Inventory
	aivar[AIV_MM_REAL_ID]			= 	ID_WOLF;
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	45;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	90;
	attribute	[ATR_HITPOINTS]		=	90;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	45000;
	protection	[PROT_EDGE]			=	45000;
	protection	[PROT_POINT]		=	45000;
	protection	[PROT_FIRE]			=	45;
	protection	[PROT_FLY]			=	45;
	protection	[PROT_MAGIC]		=	45;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	B_SetVisuals_BLACKWOLF();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);
};

INSTANCE BlackWolf_Maleth_03	(Mst_Default_Warg)
{
	name							=	"Schwarzer Wolf";
	level							=	 9;		
	//für Inventory
	aivar[AIV_MM_REAL_ID]			= 	ID_WOLF;
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	45;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	90;
	attribute	[ATR_HITPOINTS]		=	90;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	45000;
	protection	[PROT_EDGE]			=	45000;
	protection	[PROT_POINT]		=	45000;
	protection	[PROT_FIRE]			=	45;
	protection	[PROT_FLY]			=	45;
	protection	[PROT_MAGIC]		=	45;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	B_SetVisuals_BLACKWOLF();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);
};

INSTANCE Summoned_BlackWolf	(Mst_Default_Warg)
{
	name							=	"Beschworener Schwarzer Wolf";
	guild							=	GIL_SUMMONED_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_SUMMONED_WOLF;
	level							=	0; //10

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	45;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	90;
	attribute	[ATR_HITPOINTS]		=	90;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	45000;
	protection	[PROT_EDGE]			=	45000;
	protection	[PROT_POINT]		=	45000;
	protection	[PROT_FIRE]			=	45;
	protection	[PROT_FLY]			=	45;
	protection	[PROT_MAGIC]		=	45;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	Npc_RemoveInvItems (self, ItAt_GoblinBone, Npc_HasItems(self, ItAt_GoblinBone));
	Npc_RemoveInvItems (self, ItAt_SkeletonBone, Npc_HasItems(self, ItAt_SkeletonBone));
	Npc_RemoveInvItems (self, ItFo_MuttonRaw, Npc_HasItems(self, ItFo_MuttonRaw));
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_BlackWolf();
	Npc_SetToFistMode(self);
};




INSTANCE Warg_RatfordDrax_01	(Mst_Default_Warg)
{
	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};
INSTANCE Warg_RatfordDrax_02	(Mst_Default_Warg)
{
	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};
INSTANCE Warg_RatfordDrax_03	(Mst_Default_Warg)
{
	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};
INSTANCE Warg_RatfordDrax_04	(Mst_Default_Warg)
{
	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};
INSTANCE Warg_RatfordDrax_05	(Mst_Default_Warg)
{
	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};
INSTANCE Warg_RatfordDrax_06	(Mst_Default_Warg)
{
	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};
INSTANCE Warg_RatfordDrax_07	(Mst_Default_Warg)
{
	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};
INSTANCE Warg_RatfordDrax_08	(Mst_Default_Warg)
{
	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};
INSTANCE Warg_RatfordDrax_09	(Mst_Default_Warg)
{
	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};
INSTANCE Warg_RatfordDrax_10	(Mst_Default_Warg)
{
	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};
INSTANCE Warg_RatfordDrax_11	(Mst_Default_Warg)
{
	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};
INSTANCE Warg_RatfordDrax_12	(Mst_Default_Warg)
{
	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};
INSTANCE Warg_RatfordDrax_13	(Mst_Default_Warg)
{
	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};
INSTANCE Warg_RatfordDrax_14	(Mst_Default_Warg)
{
	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};
INSTANCE Warg_RatfordDrax_15	(Mst_Default_Warg)
{
	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};
INSTANCE Warg_RatfordDrax_16	(Mst_Default_Warg)
{
	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};
INSTANCE Warg_RatfordDrax_17	(Mst_Default_Warg)
{
	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};
INSTANCE Warg_RatfordDrax_18	(Mst_Default_Warg)
{
	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};
INSTANCE Warg_RatfordDrax_19	(Mst_Default_Warg)
{
	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};
INSTANCE Warg_RatfordDrax_20	(Mst_Default_Warg)
{
	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};
INSTANCE Warg_RatfordDrax_21	(Mst_Default_Warg)
{
	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};
INSTANCE Warg_RatfordDrax_22	(Mst_Default_Warg)
{
	CreateInvItems	(self, ItMi_Focus_Meer, 1);

	B_SetVisuals_Warg();
	Npc_SetToFistMode(self);
};