//***************************
//	Swampgolem Prototype			
//***************************

PROTOTYPE Mst_Default_Addon_SwampGolem(C_Npc)			
{
	//----- Monster ----
	name							=	"Sumpfgolem";
	guild							=	GIL_SWAMPGOLEM;
	aivar[AIV_MM_REAL_ID]			= 	ID_SWAMPGOLEM;
	level							=	10;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		= 155;
	attribute	[ATR_DEXTERITY]		= 20;
	attribute	[ATR_HITPOINTS_MAX]	= 300;
	attribute	[ATR_HITPOINTS]		= 300;
	attribute	[ATR_MANA_MAX] 		= 0;
	attribute	[ATR_MANA] 			= 0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		= 90000;
	protection	[PROT_EDGE]			= 90000;
	protection	[PROT_POINT]		= -1;
	protection	[PROT_FIRE]			= -1;
	protection	[PROT_FLY]			= -1;	
	protection	[PROT_MAGIC]		= -1;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//---- Damage Types ----
	damagetype 						=	DAM_BLUNT|DAM_FLY;
	damage		[DAM_INDEX_BLUNT]	=	154;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
	damage		[DAM_INDEX_FLY]		=	1;
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
func void B_SetVisuals_Swampgolem()
{
	Mdl_SetVisual			(self,	"SwampGolem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gol_Sumpf_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//******************
//	Swampgolem
//******************

INSTANCE SwampGolem	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Griselda_01	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Moor	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_01	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_02	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_03	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_04	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_05	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_06	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_07	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_08	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_09	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_10	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_11	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_12	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_13	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_14	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_15	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_16	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_17	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_18	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_19	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_20	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_21	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_22	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_23	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_24	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolem_Schlacht_25	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

//******************
//	SwampGolem_Valley
//******************

INSTANCE SwampGolem_Valley	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
	aivar[AIV_MaxDistToWp]			= 1500;
	aivar[AIV_OriginalFightTactic] 	= FAI_STONEGOLEM;

	protection	[PROT_BLUNT]		= 75000;
	protection	[PROT_EDGE]			= 75000;
	protection	[PROT_FIRE]			= -1;
	protection	[PROT_FLY]			= -1;	
	protection	[PROT_MAGIC]		= -1;
};

INSTANCE SwampGolem_GigantDerVorzeit	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);

	protection	[PROT_BLUNT]		= 75000;
	protection	[PROT_EDGE]			= 75000;
	protection	[PROT_FIRE]			= -1;
	protection	[PROT_FLY]			= -1;	
	protection	[PROT_MAGIC]		= -1;
};

INSTANCE Wurzelzwerg	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);

	name							=	"Wurzelzwerg";
	level							=	10;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		= 45;
	attribute	[ATR_DEXTERITY]		= 125;
	attribute	[ATR_HITPOINTS_MAX]	= 100;
	attribute	[ATR_HITPOINTS]		= 100;
	attribute	[ATR_MANA_MAX] 		= 0;
	attribute	[ATR_MANA] 			= 0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		= 40000;
	protection	[PROT_EDGE]			= 40000;
	protection	[PROT_POINT]		= 40000;
	protection	[PROT_FIRE]			= 40;
	protection	[PROT_FLY]			= 40;	
	protection	[PROT_MAGIC]		= 40;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	Mdl_SetModelScale(self, 0.6, 0.6, 0.6);
	
	//---- Damage Types ----
	damagetype 						=	DAM_BLUNT;
};



INSTANCE Summoned_SwampGolem (Mst_Default_Addon_SwampGolem)
{
	name							=	"Beschworener Sumpfgolem";
	guild							=	GIL_SUMMONED_GOLEM;
	aivar[AIV_MM_REAL_ID]			= 	ID_SUMMONED_GOLEM;
	level							=	0;
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);

	attribute	[ATR_STRENGTH]		=	125;
	attribute	[ATR_DEXTERITY]		=	125;
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	50000;
	protection	[PROT_EDGE]			=	100000;
	protection	[PROT_POINT]		=	150000;
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	100;	
	protection	[PROT_MAGIC]		=	100;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
};