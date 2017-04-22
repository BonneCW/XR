//*****************************
//	Spider Prototype
//*****************************

PROTOTYPE Mst_Default_Spider(C_Npc)			
{
	//----- Monster ----
	name							=	"Spinne";
	guild							=	GIL_MINECRAWLER;
	aivar[AIV_MM_REAL_ID]			= 	ID_SPIDER;
	level							=	10;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	60;
	attribute	[ATR_DEXTERITY]		=	15;
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
	protection	[PROT_MAGIC]		=	10;

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
	fight_tactic	=	FAI_LURKER;
	
	//----- Sense & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};

PROTOTYPE Mst_Default_Spider_Mini(C_Npc)			
{
	//----- Monster ----
	name							=	"Spinne";
	guild							=	GIL_MEATBUG;
	aivar[AIV_MM_REAL_ID]			= 	ID_SPIDER;
	level							=	1;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	10;
	attribute	[ATR_DEXTERITY]		=	15;
	attribute	[ATR_HITPOINTS_MAX]	=	10;
	attribute	[ATR_HITPOINTS]		=	10;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	1000;
	protection	[PROT_EDGE]			=	1000;
	protection	[PROT_POINT]		=	1000;
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
	fight_tactic	=	FAI_LURKER;
	
	//----- Sense & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};


//***********
// Visuals
//***********

func void B_SetVisuals_Spider()
{
	Mdl_SetVisual			(self,	"Spider.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Spider_Body_01",		0,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Spider_01()
{
	Mdl_SetVisual			(self,	"Spider.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Spider_Body_01",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Spider_Big()
{
	Mdl_SetVisual			(self,	"Spider.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Spider_Body_01",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Mdl_SetModelScale(self,	3.0,	3.0, 	3.0);
};

func void B_SetVisuals_Spider_Big_Eis()
{
	Mdl_SetVisual			(self,	"Spider.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Spider_Body_01",		2,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Mdl_SetModelScale(self,	3.0,	3.0, 	3.0);
};

func void B_SetVisuals_Spider_Mini()
{
	Mdl_SetVisual			(self,	"Spider.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Spider_Body_01",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Mdl_SetModelScale(self,	0.2,	0.2, 	0.2);
};


//*****************
//	Spider
//*****************

INSTANCE Spider	(Mst_Default_Spider)
{
	B_SetVisuals_Spider();
	Npc_SetToFistMode(self);
};

INSTANCE Spider_01	(Mst_Default_Spider)
{
	B_SetVisuals_Spider_01();
	Npc_SetToFistMode(self);
};

INSTANCE Spider_Lib	(Mst_Default_Spider)
{
	level					=	5;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	30;
	attribute	[ATR_DEXTERITY]		=	15;
	attribute	[ATR_HITPOINTS_MAX]	=	50;
	attribute	[ATR_HITPOINTS]		=	50;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	18000;
	protection	[PROT_EDGE]		=	18000;
	protection	[PROT_POINT]		=	18000;
	protection	[PROT_FIRE]		=	18;
	protection	[PROT_FLY]		=	18;
	protection	[PROT_MAGIC]		=	0;

	B_SetVisuals_Spider_01();
	Npc_SetToFistMode(self);
};

INSTANCE Spinne_Griselda_01	(Mst_Default_Spider)
{
	B_SetVisuals_Spider_01();
	Npc_SetToFistMode(self);
};

INSTANCE Spinne_Griselda_02	(Mst_Default_Spider)
{
	B_SetVisuals_Spider_01();
	Npc_SetToFistMode(self);
};

INSTANCE Spider_Big	(Mst_Default_Spider)
{
	name		= "Riesenspinne";

	level							=	50;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	370;
	attribute	[ATR_DEXTERITY]		=	50;
	attribute	[ATR_HITPOINTS_MAX]	=	1500;
	attribute	[ATR_HITPOINTS]		=	1500;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	150000;
	protection	[PROT_EDGE]			=	150000;
	protection	[PROT_POINT]		=	150000;
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	75;

	B_SetVisuals_Spider_Big();
	Npc_SetToFistMode(self);
};

INSTANCE Riesenspinne_XW_01	(Mst_Default_Spider)
{
	name		= "Riesenspinne";

	level							=	50;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	370;
	attribute	[ATR_DEXTERITY]		=	50;
	attribute	[ATR_HITPOINTS_MAX]	=	1500;
	attribute	[ATR_HITPOINTS]		=	1500;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	150000;
	protection	[PROT_EDGE]			=	150000;
	protection	[PROT_POINT]		=	150000;
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	75;

	B_SetVisuals_Spider_Big();
	Npc_SetToFistMode(self);

	start_aistate	= ZS_MM_Rtn_XWArena;
};

INSTANCE Riesenspinne_XW_02	(Mst_Default_Spider)
{
	name		= "Riesenspinne";

	level							=	50;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	370;
	attribute	[ATR_DEXTERITY]		=	50;
	attribute	[ATR_HITPOINTS_MAX]	=	1500;
	attribute	[ATR_HITPOINTS]		=	1500;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	150000;
	protection	[PROT_EDGE]			=	150000;
	protection	[PROT_POINT]		=	150000;
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	75;

	B_SetVisuals_Spider_Big();
	Npc_SetToFistMode(self);

	start_aistate	= ZS_MM_Rtn_XWArena;
};

INSTANCE Riesenspinne_XW_03	(Mst_Default_Spider)
{
	name		= "Riesenspinne";

	level							=	50;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	370;
	attribute	[ATR_DEXTERITY]		=	50;
	attribute	[ATR_HITPOINTS_MAX]	=	1500;
	attribute	[ATR_HITPOINTS]		=	1500;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	150000;
	protection	[PROT_EDGE]			=	150000;
	protection	[PROT_POINT]		=	150000;
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	75;

	B_SetVisuals_Spider_Big();
	Npc_SetToFistMode(self);

	start_aistate	= ZS_MM_Rtn_XWArena;
};

INSTANCE Riesenspinne_XW_04	(Mst_Default_Spider)
{
	name		= "Riesenspinne";

	level							=	50;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	370;
	attribute	[ATR_DEXTERITY]		=	50;
	attribute	[ATR_HITPOINTS_MAX]	=	1500;
	attribute	[ATR_HITPOINTS]		=	1500;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	150000;
	protection	[PROT_EDGE]			=	150000;
	protection	[PROT_POINT]		=	150000;
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	75;

	B_SetVisuals_Spider_Big();
	Npc_SetToFistMode(self);

	start_aistate	= ZS_MM_Rtn_XWArena;
};

INSTANCE Spider_Queen	(Mst_Default_Spider)
{
	name		=	"Spinnenkönigin";

	level							=	50;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	370;
	attribute	[ATR_DEXTERITY]		=	50;
	attribute	[ATR_HITPOINTS_MAX]	=	1500;
	attribute	[ATR_HITPOINTS]		=	1500;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	150000;
	protection	[PROT_EDGE]			=	150000;
	protection	[PROT_POINT]		=	150000;
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	75;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	B_SetVisuals_Spider_Big();
	Npc_SetToFistMode(self);
};

INSTANCE Dalma	(Mst_Default_Spider)
{
	name		= "Dalma";

	level							=	50;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	370;
	attribute	[ATR_DEXTERITY]		=	50;
	attribute	[ATR_HITPOINTS_MAX]	=	1500;
	attribute	[ATR_HITPOINTS]		=	1500;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	150000;
	protection	[PROT_EDGE]			=	150000;
	protection	[PROT_POINT]		=	150000;
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	75;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	B_SetVisuals_Spider_Big_Eis();
	Npc_SetToFistMode(self);
};

INSTANCE Spider_Mini_01	(Mst_Default_Spider_Mini)
{
	B_SetVisuals_Spider_Mini();
	Npc_SetToFistMode(self);
};

INSTANCE Spider_Mini_02	(Mst_Default_Spider_Mini)
{
	B_SetVisuals_Spider_Mini();
	Npc_SetToFistMode(self);
};

INSTANCE Spider_Mini_03	(Mst_Default_Spider_Mini)
{
	B_SetVisuals_Spider_Mini();
	Npc_SetToFistMode(self);
};

INSTANCE Spider_Mini_04	(Mst_Default_Spider_Mini)
{
	B_SetVisuals_Spider_Mini();
	Npc_SetToFistMode(self);
};

INSTANCE Spider_Mini_05	(Mst_Default_Spider_Mini)
{
	B_SetVisuals_Spider_Mini();
	Npc_SetToFistMode(self);
};

INSTANCE Spider_Mini_06	(Mst_Default_Spider_Mini)
{
	B_SetVisuals_Spider_Mini();
	Npc_SetToFistMode(self);
};

INSTANCE Spider_Mini_07	(Mst_Default_Spider_Mini)
{
	B_SetVisuals_Spider_Mini();
	Npc_SetToFistMode(self);
};

INSTANCE Spider_Mini_08	(Mst_Default_Spider_Mini)
{
	B_SetVisuals_Spider_Mini();
	Npc_SetToFistMode(self);
};

INSTANCE Spider_Mini_09	(Mst_Default_Spider_Mini)
{
	B_SetVisuals_Spider_Mini();
	Npc_SetToFistMode(self);
};

INSTANCE Spider_Mini_10	(Mst_Default_Spider_Mini)
{
	B_SetVisuals_Spider_Mini();
	Npc_SetToFistMode(self);
};

INSTANCE Spider_Mini_11	(Mst_Default_Spider_Mini)
{
	B_SetVisuals_Spider_Mini();
	Npc_SetToFistMode(self);
};

INSTANCE Spider_Mini_12	(Mst_Default_Spider_Mini)
{
	B_SetVisuals_Spider_Mini();
	Npc_SetToFistMode(self);
};

INSTANCE Spider_Mini_13	(Mst_Default_Spider_Mini)
{
	B_SetVisuals_Spider_Mini();
	Npc_SetToFistMode(self);
};

INSTANCE Spider_Mini_14	(Mst_Default_Spider_Mini)
{
	B_SetVisuals_Spider_Mini();
	Npc_SetToFistMode(self);
};

INSTANCE Spider_Mini_15	(Mst_Default_Spider_Mini)
{
	B_SetVisuals_Spider_Mini();
	Npc_SetToFistMode(self);
};

INSTANCE Spider_Mini_16	(Mst_Default_Spider_Mini)
{
	B_SetVisuals_Spider_Mini();
	Npc_SetToFistMode(self);
};