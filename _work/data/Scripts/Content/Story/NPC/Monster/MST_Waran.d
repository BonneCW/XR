//**********************
//	Waran Prototype		
//**********************

PROTOTYPE Mst_Default_Waran(C_Npc)			
{
	//----- Monster ----
	name							=	"Waran";
	guild							=	GIL_WARAN;
	aivar[AIV_MM_REAL_ID]			= 	ID_WARAN;
	level							=	12;
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	80;
	attribute	[ATR_DEXTERITY]		=	5;
	attribute	[ATR_HITPOINTS_MAX]	=	120;
	attribute	[ATR_HITPOINTS]		=	120;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	100000;
	protection	[PROT_EDGE]			=	100000;
	protection	[PROT_POINT]		=	100000;
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	100;
	protection	[PROT_MAGIC]		=	20;

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
	fight_tactic	=	FAI_WARAN;

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

func void B_SetVisuals_Waran()
{
	Mdl_SetVisual			(self,	"Waran.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"War_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//**************
//	Waran    	
//**************

INSTANCE Waran	(Mst_Default_Waran)
{
	B_SetVisuals_Waran();
	Npc_SetToFistMode(self);
};

INSTANCE Waran_William	(Mst_Default_Waran)
{
	B_SetVisuals_Waran();
	Npc_SetToFistMode(self);
};

INSTANCE BrandonWaran	(Mst_Default_Waran)
{
	name							=	"Strandwaran";

	B_SetVisuals_Waran();
	Npc_SetToFistMode(self);

	Mdl_SetModelScale	(self, 1.2, 1.2, 1.2);
};