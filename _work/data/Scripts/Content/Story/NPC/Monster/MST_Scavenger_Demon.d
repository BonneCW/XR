//****************************
//	Scavenger-Demon Prototype
//****************************

PROTOTYPE Mst_Default_Scavenger_Demon(C_Npc)			
{
	//----- Monster ----
	name							=	"Graslandscavenger";
	guild							=	GIL_SCAVENGER;
	aivar[AIV_MM_REAL_ID]			= 	ID_SCAVENGER_DEMON;
	level							=	12;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	60;
	attribute	[ATR_DEXTERITY]		=	15;
	attribute	[ATR_HITPOINTS_MAX]	=	120;
	attribute	[ATR_HITPOINTS]		=	120;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections -----
	protection	[PROT_BLUNT]		=	60000;
	protection	[PROT_EDGE]			=	60000;
	protection	[PROT_POINT]		=	10000;
	protection	[PROT_FIRE]			=	60;
	protection	[PROT_FLY]			=	60;
	protection	[PROT_MAGIC]		=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;
	//damage		[DAM_INDEX_BLUNT]	=	0;
	//damage		[DAM_INDEX_EDGE]	=	30;	//STR wird genommen, wenn Summe aller dam = 0
	//damage		[DAM_INDEX_POINT]	=	0;
	//damage		[DAM_INDEX_FIRE]	=	0;
	//damage		[DAM_INDEX_FLY]		=	0;
	//damage		[DAM_INDEX_MAGIC]	=	0;
	
	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_SCAVENGER;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	
	//----- Daily Routine ----	
	start_aistate				= ZS_MM_AllScheduler;

	CreateInvItems (self, ItFo_MuttonRaw, 2);
	
	aivar[AIV_MM_SleepStart] 	= 22;	
	aivar[AIV_MM_SleepEnd]		= 6;
	aivar[AIV_MM_EatGroundStart]= 6;
	aivar[AIV_MM_EatGroundEnd]	= 22;

	if (Hlp_Random(100) < 8)
	{
		CreateInvItems (self, ItMi_Gold, Hlp_Random(3)+1);
	};
	if (Hlp_Random(100) < 2)
	{
		CreateInvItems (self, ItMi_SilverRing, 1);
	};
	if (Hlp_Random(100) < 1)
	{
		CreateInvItems (self, ItMi_GoldRing, 1);
	};
	if (Hlp_Random(100) < 1)
	{
		CreateInvItems (self, ItMi_GoldNugget_Addon, 1);
	};
	if (Hlp_Random(100) < 1)
	{
		CreateInvItems (self, ItMi_Nugget, 1);
	};
};


//************
//	Visuals
//************


func void B_SetVisuals_Scavenger_Demon()
{
	Mdl_SetVisual			(self,	"ScavengerGL.mds");
	//								Body-Mesh					Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Scavenger_Demon_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Scavenger_Wald()
{
	Mdl_SetVisual			(self,	"ScavengerGL.mds");
	//								Body-Mesh					Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Scavenger_Wald_Body",		0,	0,	"",			DEFAULT,  	DEFAULT,	-1);
};


//***************
//	Scavenger    
//***************

INSTANCE Scavenger_Demon	(Mst_Default_Scavenger_Demon)
{
	if (r_max(1) == 0)
	{
		B_SetVisuals_Scavenger_Demon();
	}
	else
	{
		B_SetVisuals_Scavenger_Wald();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Scavenger_Demon_Dalton_01	(Mst_Default_Scavenger_Demon)
{
	B_SetVisuals_Scavenger_Demon();
	Npc_SetToFistMode(self);
};

INSTANCE Scavenger_Demon_Dalton_02	(Mst_Default_Scavenger_Demon)
{
	B_SetVisuals_Scavenger_Demon();
	Npc_SetToFistMode(self);
};

INSTANCE Scavenger_Demon_Dalton_03	(Mst_Default_Scavenger_Demon)
{
	B_SetVisuals_Scavenger_Demon();
	Npc_SetToFistMode(self);
};

INSTANCE Scavenger_Demon_Dalton_04	(Mst_Default_Scavenger_Demon)
{
	B_SetVisuals_Scavenger_Demon();
	Npc_SetToFistMode(self);
};