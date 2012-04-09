//***************************
//	 Sheep Prototype		
//***************************

PROTOTYPE Mst_Default_Sheep(C_Npc)			
{
	//----- Maonster ----
	name							=	"Schaf";
	guild							=	GIL_SHEEP;
	aivar[AIV_MM_REAL_ID]			= 	ID_SHEEP;
	level							=	1;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	5;
	attribute	[ATR_DEXTERITY]		=	5;
	attribute	[ATR_HITPOINTS_MAX]	=	5;
	attribute	[ATR_HITPOINTS]		=	5;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	0;
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
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
	//fight_tactic					= FAI_Giant_Rat;//Schafe kämpfen nicht!!

	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;

	//----- Daily Routine ----
	
};


//************
//	Visuals
//************

func void B_SetVisuals_Sheep()
{
	Mdl_SetVisual			(self,	"Sheep.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sheep_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

// ------ Hammel ------
func void B_SetVisuals_Hammel ()
{
	Mdl_SetVisual			(self,	"Sheep.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Hammel_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//***************
//	Sheep
//***************

INSTANCE Sheep	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Lamm	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 1);

	Mdl_SetModelScale(self, 0.7, 0.7, 0.7);
};

INSTANCE SheepTransform	(Mst_Default_Sheep)
{
	Npc_PercEnable (self, PERC_ASSESSSURPRISE , B_StopMagicTransform);
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
};

INSTANCE Trollschaf	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_Follow_Player;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
	CreateInvItems (self, ItMi_Schafsmagen, 1);
};

INSTANCE Krautschaf	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_Follow_Player;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

//***************
//	Hammel
//***************

INSTANCE Hammel	(Mst_Default_Sheep)
{
	name	= "Hammel";

	B_SetVisuals_Hammel();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 1);
};

INSTANCE Hammel_Bengar_01	(Mst_Default_Sheep)
{
	name	= "Hammel";

	B_SetVisuals_Hammel();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 1);
};

INSTANCE Sheep_Bengar_01	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Sheep_Bengar_02	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Sheep_Bengar_03	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Sheep_Bengar_04	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Sheep_Bengar_05	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Hammel_WW	(Mst_Default_Sheep)
{
	name	= "Anführer der Schafe";

	B_SetVisuals_Hammel();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItMi_MagicKamm, 1);
};

INSTANCE Sheep_Opolos_01	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Sheep_Opolos_02	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Sheep_Opolos_03	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Hammel_Lobart_01	(Mst_Default_Sheep)
{
	name	= "Hammel";

	B_SetVisuals_Hammel();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 1);
};

INSTANCE Hammel_Lobart_02	(Mst_Default_Sheep)
{
	name	= "Hammel";

	B_SetVisuals_Hammel();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 1);
};

INSTANCE Hammel_Lobart_03	(Mst_Default_Sheep)
{
	name	= "Hammel";

	B_SetVisuals_Hammel();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 1);
};

INSTANCE Hammel_Lobart_04	(Mst_Default_Sheep)
{
	name	= "Hammel";

	B_SetVisuals_Hammel();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 1);
};

INSTANCE Sheep_Lobart_01	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Sheep_Lobart_02	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Sheep_Lobart_03	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Sheep_Lobart_04	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Sheep_Lobart_05	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Sheep_Lobart_06	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Sheep_Lobart_07	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Sheep_Lobart_08	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Sheep_Lobart_09	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Sheep_Lobart_10	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Sheep_Lobart_11	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Sheep_Lobart_12	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Sheep_Lobart_13	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Sheep_Lobart_14	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Sheep_Lobart_15	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Sheep_Lobart_16	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Hammel_Emma_01	(Mst_Default_Sheep)
{
	name	= "Hammel";

	B_SetVisuals_Hammel();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 1);
};

INSTANCE Hammel_Emma_02	(Mst_Default_Sheep)
{
	name	= "Hammel";

	B_SetVisuals_Hammel();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 1);
};

INSTANCE Schaf_Emma_01	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Schaf_Emma_02	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Schaf_Emma_03	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Schaf_Emma_04	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Schaf_Emma_05	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};