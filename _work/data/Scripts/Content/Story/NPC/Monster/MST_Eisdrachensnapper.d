//********************************
//	Eisdrachensnapper Prototype			
//********************************

PROTOTYPE Mst_Default_Eisdrachensnapper(C_Npc)			
{
	//----- Monster ----
	name							=	"Eisdrachensnapper";
	guild							=	GIL_SNAPPER;
	aivar[AIV_MM_REAL_ID]			= 	ID_EISDRACHENSNAPPER;
	level							=	40;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	Hlp_Random(51) + 175;
	attribute	[ATR_DEXTERITY]		=	Hlp_Random(21) + 10;
	attribute	[ATR_HITPOINTS_MAX]	=	Hlp_Random(101) + 350;
	attribute	[ATR_HITPOINTS]		=	attribute[ATR_HITPOINTS_MAX];
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 		=	0;
	
	//------ Protections ----	
	protection	[PROT_BLUNT]		=	Hlp_Random(51)*1000 + 125000;
	protection	[PROT_EDGE]		=	Hlp_Random(51)*1000 + 125000;
	protection	[PROT_POINT]		=	Hlp_Random(51)*1000 + 125000;	
	protection	[PROT_FIRE]		=	Hlp_Random(51) + 125;
	protection	[PROT_FLY]		=	150;
	protection	[PROT_MAGIC]		=	Hlp_Random(51) + 75;

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
	fight_tactic	=	FAI_SNAPPER;
	
	//----- Senses & Ranges ----	
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= TRUE;
	
	//----- Daily Routine ----	
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_RestStart]		= OnlyRoutine;

	if (Hlp_Random(100) < 15)
	{
		CreateInvItems (self, ItAt_GoblinBone, 1+Hlp_Random(3));
	};
	if (Hlp_Random(100) < 10)
	{
		CreateInvItems (self, ItAt_SkeletonBone, 1+Hlp_Random(2));
	};
};


//***********
//	Visuals
//***********

func void B_SetVisuals_Eisdrachensnapper()
{
	Mdl_SetVisual			(self,	"Dragonsnapper.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"EISDRACHENSNAPPER_BODY",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//********************
//	Eisdrachensnapper    
//********************

INSTANCE Eisdrachensnapper	(Mst_Default_Eisdrachensnapper)
{
	B_SetVisuals_Eisdrachensnapper();
	Npc_SetToFistMode(self);
};