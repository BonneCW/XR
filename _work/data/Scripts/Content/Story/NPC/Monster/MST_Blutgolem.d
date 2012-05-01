//***************************
//	Blutgolem Prototype			
//***************************

PROTOTYPE Mst_Default_Blutgolem(C_Npc)			
{
	//----- Monster ----
	name							=	"Blutgolem";
	guild							=	GIL_STONEGOLEM;
	aivar[AIV_MM_REAL_ID]			= 	ID_Blutgolem;
	level							=	100;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	125;
	attribute	[ATR_DEXTERITY]		=	25;
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 		=	100;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	150000;
	protection	[PROT_EDGE]		=	150000;
	protection	[PROT_POINT]		=	150000;
	protection	[PROT_FIRE]		=	-1;
	protection	[PROT_FLY]		=	-1;	
	protection	[PROT_MAGIC]		=	-1;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//---- Damage Types ----
	damagetype 						=	DAM_FLY;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_STONEGOLEM;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

//-------------------------------------------------------------
func void B_SetVisuals_Blutgolem()
{
	Mdl_SetVisual			(self,	"Golem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Blutgolem_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//******************
//	Stone Golem   	
//******************

INSTANCE Blutgolem	(Mst_Default_Blutgolem)
{
	B_SetVisuals_Blutgolem();
	Npc_SetToFistMode	(self);

	CreateInvItems	(self, ItSc_AuraDesStehlens, 2);
};

INSTANCE Blutgolem_02	(Mst_Default_Blutgolem)
{
	B_SetVisuals_Blutgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE Blutgolem_03	(Mst_Default_Blutgolem)
{
	B_SetVisuals_Blutgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE Blutgolem_Moor	(Mst_Default_Blutgolem)
{
	B_SetVisuals_Blutgolem();
	Npc_SetToFistMode	(self);
};