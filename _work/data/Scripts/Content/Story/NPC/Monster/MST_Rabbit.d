PROTOTYPE Mst_Default_Rabbit (C_Npc)			
{
	//----- Monster ----
	name							=	"Hase";
	guild							=	GIL_MEATBUG;
	aivar[AIV_MM_REAL_ID]			= 	ID_Rabbit;
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
	damagetype 						=	DAM_EDGE|DAM_FIRE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
	damage		[DAM_INDEX_EDGE]	=	90;
//	damage		[DAM_INDEX_POINT]	=	0;
	damage		[DAM_INDEX_FIRE]	=	60;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	

	//----- Senses & Ranges ----
	senses			= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart]	= OnlyRoutine;
};

//***************
//	Visuals
//***************

func void B_SetVisuals_Rabbit ()
{
	Mdl_SetVisual			(self,"Zaic.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self, "Zaic",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_IceRabbit ()
{
	Mdl_SetVisual			(self,"Zaic.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self, "Zaic3",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

instance Rabbit (Mst_Default_Rabbit)
{
	B_SetVisuals_Rabbit();
	Npc_SetToFistMode(self);
};

instance IceRabbit (Mst_Default_Rabbit)
{
	//B_GiveAll();

	B_SetVisuals_IceRabbit();
	Npc_SetToFistMode(self);
};

INSTANCE RabbitTransform	(Mst_Default_Rabbit)
{
	Npc_PercEnable (self, PERC_ASSESSSURPRISE , B_StopMagicTransform);
	B_SetVisuals_Rabbit();
	Npc_SetToFistMode(self);
};

instance Rabbit_Gomez (Mst_Default_Rabbit)
{
	guild	=	GIL_MOLERAT;

	B_SetVisuals_Rabbit();
	Npc_SetToFistMode(self);
};