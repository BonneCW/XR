//***************************
//	 Ziegen Prototype		
//***************************

PROTOTYPE Mst_Default_Ziege(C_Npc)			
{
	//----- Maonster ----
	name							=	"Wildziege";
	guild							=	GIL_SHEEP;
	aivar[AIV_MM_REAL_ID]			= 	ID_ZIEGE;
	level							=	1;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	150;
	attribute	[ATR_DEXTERITY]		=	10;
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
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

func void B_SetVisuals_Ziege()
{
	Mdl_SetVisual			(self,	"Ziege.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ziege_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_CanyonZiege()
{
	Mdl_SetVisual			(self,	"Ziege.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ziege_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_SchneeZiege()
{
	Mdl_SetVisual			(self,	"Ziege.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ziege_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//***************
//	Sheep
//***************

INSTANCE Ziege	(Mst_Default_Ziege)
{
	B_SetVisuals_Ziege();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Canyon_Ziege	(Mst_Default_Ziege)
{
	B_SetVisuals_CanyonZiege();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);

	Mdl_SetModelScale(self, 1.5, 1.5, 1.5);
};

INSTANCE Canyon_Ziege_Euter	(Mst_Default_Ziege)
{
	name	=	"Wildziege mit fetten Eutern";
	B_SetVisuals_CanyonZiege();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);
	CreateInvItems (self, ItFo_Ziegenmilch_Bloody, 1);

	Mdl_SetModelScale(self, 1.5, 1.5, 1.5);
	Mdl_SetModelFatness	(self, 1.5);
};

INSTANCE Canyon_Ziege_Leitbock	(Mst_Default_Ziege)
{
	B_SetVisuals_CanyonZiege();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 3);

	attribute	[ATR_STRENGTH]		=	200;
	attribute	[ATR_DEXTERITY]		=	15;
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;

	damagetype	=	DAM_EDGE|DAM_FLY;
	damage[DAM_INDEX_FLY]	=	1;
	damage[DAM_INDEX_EDGE]	=	attribute[ATR_STRENGTH];

	Mdl_SetModelScale(self, 1.75, 1.75, 1.75);
};

INSTANCE Wild_Ziege	(Mst_Default_Ziege)
{
	B_SetVisuals_Ziege();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);

	Mdl_SetModelScale(self, 1.5, 1.5, 1.5);
};

INSTANCE Wild_Ziege_Leitbock	(Mst_Default_Ziege)
{
	B_SetVisuals_Ziege();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 3);

	attribute	[ATR_STRENGTH]		=	200;
	attribute	[ATR_DEXTERITY]		=	15;
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;

	damagetype	=	DAM_EDGE|DAM_FLY;
	damage[DAM_INDEX_FLY]	=	1;
	damage[DAM_INDEX_EDGE]	=	attribute[ATR_STRENGTH];

	Mdl_SetModelScale(self, 1.75, 1.75, 1.75);
};

INSTANCE Schnee_Ziege	(Mst_Default_Ziege)
{
	B_SetVisuals_SchneeZiege();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 2);

	Mdl_SetModelScale(self, 1.5, 1.5, 1.5);
};

INSTANCE Schnee_Ziege_Leitbock	(Mst_Default_Ziege)
{
	B_SetVisuals_SchneeZiege();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFo_MuttonRaw, 3);

	attribute	[ATR_STRENGTH]		=	200;
	attribute	[ATR_DEXTERITY]		=	15;
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;

	damagetype	=	DAM_EDGE|DAM_FLY;
	damage[DAM_INDEX_FLY]	=	1;
	damage[DAM_INDEX_EDGE]	=	attribute[ATR_STRENGTH];

	Mdl_SetModelScale(self, 1.75, 1.75, 1.75);
};