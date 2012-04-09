PROTOTYPE Mst_Default_Orcdog(C_Npc)			
{
	//----- Monster ----
	name							=	"Orkhund";
	guild							=	GIL_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_ORCDOG;
	level							=	12;		
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	150;
	attribute	[ATR_DEXTERITY]		=	10;
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

	if (Hlp_Random(100) < 5)
	{
		CreateInvItems (self, ItAt_GoblinBone, 1);
	};
};


//*************
//	Visuals
//*************


func void B_SetVisuals_Orcdog()
{
	Mdl_SetVisual			(self, "Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Warg_Body",	1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//************
//	Warg
//************

INSTANCE Orcdog	(Mst_Default_Orcdog)
{
	B_SetVisuals_Orcdog();

	guild				=	GIL_SUMMONED_WOLF;
	aivar[AIV_MM_REAL_ID]		= 	ID_SCHAEFERHUND;
	Npc_SetToFistMode(self);
	start_aistate			= ZS_MM_RTN_Schaeferhund;
};

INSTANCE Wally	(Mst_Default_Orcdog)
{
	name	=	"Wally";

	guild		=	GIL_SUMMONED_WOLF;

	B_SetVisuals_Orcdog();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Orcdog_Big	(Mst_Default_Orcdog)
{
	name = "Großer Orkhund";

	level = 45;
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	350;
	attribute	[ATR_DEXTERITY]		=	25;
	attribute	[ATR_HITPOINTS_MAX]	=	600;	
	attribute	[ATR_HITPOINTS]		=	600;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	125000;
	protection	[PROT_EDGE]			=	125000;
	protection	[PROT_POINT]		=	75000;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	125;
	protection	[PROT_MAGIC]		=	50;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	//----- Damage Types ----
	damagetype 						=	DAM_FLY;

	B_SetVisuals_Orcdog();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
	CreateInvItems	(self, ItAt_BigOrcDogFur, 1);

	Mdl_SetModelScale(self, 1.2, 1.2, 1.2);
};