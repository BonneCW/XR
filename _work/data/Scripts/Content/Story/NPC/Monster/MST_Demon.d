//********************
//	Demon Prototype		
//********************

PROTOTYPE Mst_Default_Demon(C_Npc)			
{
	//---- Monster ----
	name							=	"Dämon";
	guild							=	GIL_DEMON;
	aivar[AIV_MM_REAL_ID]			= 	ID_DEMON;
	level							=	60;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	150;
	attribute	[ATR_DEXTERITY]		=	30;
	attribute	[ATR_HITPOINTS_MAX]	=	350;
	attribute	[ATR_HITPOINTS]		=	350;
	attribute	[ATR_MANA_MAX] 		=	200;
	attribute	[ATR_MANA] 			=	200;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	125000;
	protection	[PROT_EDGE]			=	125000;
	protection	[PROT_POINT]		=	125000;
	protection	[PROT_FIRE]			=	125;
	protection	[PROT_FLY]			=	125;
	protection	[PROT_MAGIC]		=	125;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik -----
	fight_tactic	=	FAI_DEMON;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	=	FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] =	TRUE;
	aivar[AIV_MM_Packhunter] 	=	FALSE;
	
	//----- Daily Routine ----
	start_aistate				=	ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	=	OnlyRoutine;
};


//****************
//	Visual
//****************

func void B_SetVisuals_Demon()
{
	Mdl_SetVisual			(self,	"Demon.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dem_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Demon_01()
{
	Mdl_SetVisual			(self,	"Demon.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dem_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//**********
//	Demon
//**********

INSTANCE Demon (Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

INSTANCE Demon_AtEremit (Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

INSTANCE Demon_BK (Mst_Default_Demon)
{
	CreateInvItems	(self, ItAt_DemonHeart, 1);

	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

INSTANCE Demon_Novize (Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

INSTANCE Demon_01 (Mst_Default_Demon)
{
	B_SetVisuals_Demon_01();
	Npc_SetToFistMode(self);
};

INSTANCE Demon_GDG (Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

INSTANCE LessDemon (Mst_Default_Demon)
{
	name	=	"Niederer Dämon";

	level	=	40;

	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

INSTANCE WeakDemon (Mst_Default_Demon)
{
	name	=	"Schwacher Dämon";

	level	=	25;

	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

//******************
//	Summoned_Demon    															
//******************

INSTANCE Summoned_Demon (Mst_Default_Demon)
{
	name							= "Beschworener Dämon";
	guild							= GIL_SUMMONED_DEMON;
	aivar[AIV_MM_REAL_ID]			= ID_SUMMONED_DEMON;
	level							= 0;
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

INSTANCE Demon_Faice (Mst_Default_Demon)
{
	name							= "Beschworener Dämon";
	guild							= GIL_SUMMONED_DEMON;
	aivar[AIV_MM_REAL_ID]			= ID_SUMMONED_DEMON;
	level							= 0;
	
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};


INSTANCE Demon_Balrog (Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

INSTANCE Demon_Shivar_01 (Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

INSTANCE Demon_Shivar_02 (Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

INSTANCE Demon_Shivar_03 (Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

INSTANCE Demon_Shivar_04 (Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

INSTANCE Demon_Shivar_05 (Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};