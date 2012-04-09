//***********************
//	Snapper Prototype	
//***********************

PROTOTYPE Mst_Default_Snapper(C_Npc)			
{
	//---- Monster ----
	name							=	"Snapper";
	guild							=	GIL_SNAPPER;
	aivar[AIV_MM_REAL_ID]			= 	ID_SNAPPER;
	level							=	12;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	90;
	attribute	[ATR_DEXTERITY]		=	10;
	attribute	[ATR_HITPOINTS_MAX]	=	120;
	attribute	[ATR_HITPOINTS]		=	120;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----	
	protection	[PROT_BLUNT]		=	60000;
	protection	[PROT_EDGE]			=	60000;
	protection	[PROT_POINT]		=	60000;		
	protection	[PROT_FIRE]			=	60;
	protection	[PROT_FLY]			=	60;
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
	fight_tactic	=	FAI_SNAPPER;

	//----- Senses & Ranges ----	
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= TRUE;

	//----- Daily Routine ----	
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_RestStart]		= OnlyRoutine;

	if (Hlp_Random(100) < 5)
	{
		CreateInvItems (self, ItAt_GoblinBone, 1);
	};
};


//*******************
//	Visuals
//*******************

	
func void B_SetVisuals_Snapper()
{
	Mdl_SetVisual			(self,	"Snapper.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sna_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
	
func void B_SetVisuals_Snapper_06()
{
	Mdl_SetVisual			(self,	"Snapper.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sna_Body",		6,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
	
func void B_SetVisuals_FeuerSnapper()
{
	Mdl_SetVisual			(self,	"Snapper.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sna_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
	
func void B_SetVisuals_WasserSnapper()
{
	Mdl_SetVisual			(self,	"Snapper.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sna_Body",		2,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
	
func void B_SetVisuals_SchattenSnapper()
{
	Mdl_SetVisual			(self,	"Snapper.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sna_Body",		3,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
	
func void B_SetVisuals_JaegerSnapper()
{
	Mdl_SetVisual			(self,	"Snapper.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sna_Body",		4,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
	
func void B_SetVisuals_JaegerSnapper2()
{
	Mdl_SetVisual			(self,	"Snapper.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sna_Body",		5,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
	
func void B_SetVisuals_Snapper_Test01()
{
	Mdl_SetVisual			(self,	"Snapper.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"RennSna_Body",		0,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
	
func void B_SetVisuals_Snapper_Test02()
{
	Mdl_SetVisual			(self,	"Snapper.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"TranSna_Body",		0,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
	
func void B_SetVisuals_Sna()
{
	var int Randi;
	Randi = Hlp_Random(3);

	if (Randi == 0)
	{
		B_SetVisuals_Snapper();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_JaegerSnapper();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Snapper_06();
	};
};


//**************
//	Snapper    	
//**************

INSTANCE Snapper	(Mst_Default_Snapper)
{
	B_SetVisuals_Sna();

	Npc_SetToFistMode(self);
};

INSTANCE Snapper_Gaan	(Mst_Default_Snapper)
{
	B_SetVisuals_Sna();

	Npc_SetToFistMode(self);
};

INSTANCE Snapper_Test01	(Mst_Default_Snapper)
{
	B_SetVisuals_Snapper_Test01();
	Npc_SetToFistMode(self);
};

INSTANCE Snapper_Test02	(Mst_Default_Snapper)
{
	B_SetVisuals_Snapper_Test02();
	Npc_SetToFistMode(self);
};

INSTANCE JaegerSnapper	(Mst_Default_Snapper)
{
	B_SetVisuals_JaegerSnapper();
	Npc_SetToFistMode(self);
};

INSTANCE JaegerSnapper2	(Mst_Default_Snapper)
{
	B_SetVisuals_JaegerSnapper2();
	Npc_SetToFistMode(self);
};

INSTANCE FeuerSnapper	(Mst_Default_Snapper)
{
	name	= "Feuersnapper";

	level = 45;
	effect	= "SPELLFX_FIREARMOR";

	B_SetVisuals_FeuerSnapper();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItAt_Feuersnapperhaut, 1);
};

INSTANCE WasserSnapper	(Mst_Default_Snapper)
{
	name	= "Wassersnapper";

	level = 15;
	effect	= "SPELLFX_ICEARMOR";

	B_SetVisuals_WasserSnapper();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItAt_Wassersnapperhaut, 1);
};

INSTANCE WasserSnapper_Joe_01	(Mst_Default_Snapper)
{
	name	= "Wassersnapper";

	level = 15;
	effect	= "SPELLFX_ICEARMOR";

	B_SetVisuals_WasserSnapper();
	Npc_SetToFistMode(self);

	start_aistate = ZS_MM_Rtn_Summoned;

	aivar[AIV_Partymember] = TRUE;
};

INSTANCE WasserSnapper_Joe_02	(Mst_Default_Snapper)
{
	name	= "Wassersnapper";

	level = 15;
	effect	= "SPELLFX_ICEARMOR";

	B_SetVisuals_WasserSnapper();
	Npc_SetToFistMode(self);

	start_aistate = ZS_MM_Rtn_Summoned;

	aivar[AIV_Partymember] = TRUE;
};

INSTANCE WasserSnapper_Joe_03	(Mst_Default_Snapper)
{
	name	= "Wassersnapper";

	level = 15;
	effect	= "SPELLFX_ICEARMOR";

	B_SetVisuals_WasserSnapper();
	Npc_SetToFistMode(self);

	start_aistate = ZS_MM_Rtn_Summoned;

	aivar[AIV_Partymember] = TRUE;
};

INSTANCE SchattenSnapper	(Mst_Default_Snapper)
{
	name	= "Schattensnapper";

	level = 45;
	effect	= "SPELLFX_DARKARMOR";

	B_SetVisuals_SchattenSnapper();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItAt_Schattensnapperhaut, 1);
};

INSTANCE SnapperTransform	(Mst_Default_Snapper)
{
	Npc_PercEnable (self, PERC_ASSESSSURPRISE , B_StopMagicTransform);
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};