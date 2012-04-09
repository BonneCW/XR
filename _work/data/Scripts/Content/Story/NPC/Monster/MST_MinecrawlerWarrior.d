//************************************
//	Minecrawler WARRIOR Prototype		
//************************************

PROTOTYPE Mst_Default_MinecrawlerWarrior(C_Npc)			
{
	//----- Monster -----
	name							=	"Minecrawler Warrior";
	guild							=	GIL_MINECRAWLER;
	aivar[AIV_MM_REAL_ID]			= 	ID_MINECRAWLERWARRIOR;
	level							=	18;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	90;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	180;
	attribute	[ATR_HITPOINTS]		=	180;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	90000;
	protection	[PROT_EDGE]			=	90000;
	protection	[PROT_POINT]		=	90000;
	protection	[PROT_FIRE]			=	90;
	protection	[PROT_FLY]			=	90;
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
	fight_tactic		=	FAI_MINECRAWLER;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- DAily Routine -----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_WuselStart] 	= OnlyRoutine;
};


//************
//	Visuals
//************


func void B_SetVisuals_MinecrawlerWarrior()
{
	Mdl_SetVisual			(self,	"Crawler.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Cr2_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_OTMinecrawlerWarrior()
{
	Mdl_SetVisual			(self,	"Crawler.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Cr2_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_RedCrab()
{
	Mdl_SetVisual			(self,	"Crawler.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Cr2_Body",		2,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_MinecrawlerWarriorUndead()
{
	Mdl_SetVisual			(self,	"Crawler.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Cr2_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_SwampCrawler()
{
	Mdl_SetVisual			(self,	"Crawler.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Cr2_Body",		3,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//************************
//	MinecrawlerWarrior    
//************************

INSTANCE MinecrawlerWarrior	(Mst_Default_MinecrawlerWarrior)
{
	B_SetVisuals_MinecrawlerWarrior();
	Npc_SetToFistMode(self);
};

INSTANCE MinecrawlerWarrior_Undead	(Mst_Default_MinecrawlerWarrior)
{
	name = "stinkender Minecrawler";

	B_SetVisuals_MinecrawlerWarriorUndead();
	Npc_SetToFistMode(self);
};

INSTANCE SwampCrawler	(Mst_Default_MinecrawlerWarrior)
{
	name = "Sumpfcrawler";

	level							=	26;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	150;
	attribute	[ATR_DEXTERITY]		=	90;
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	15000;
	protection	[PROT_EDGE]			=	150000;
	protection	[PROT_POINT]		=	150000;
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	60;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	CreateInvItems	(self, ItAt_Wirbelsaeule, 1);

	B_SetVisuals_MinecrawlerWarriorUndead();
	Npc_SetToFistMode(self);
};

instance OTMinecrawler(Mst_Default_MinecrawlerWarrior)			
{
	name							=	"Tempel Minecrawler";
	level							=	25;

	B_SetVisuals_OTMinecrawlerWarrior();
	Npc_SetToFistMode(self);
//------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	120;
	attribute	[ATR_DEXTERITY]		=	120;
	
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//------------------------------------------------------
	protection	[PROT_BLUNT]		=	70000;
	protection	[PROT_EDGE]			=	70000;
	protection	[PROT_POINT]		=	35000;
	protection	[PROT_FIRE]			=	30;
	protection	[PROT_FLY]			=	70;
	protection	[PROT_MAGIC]		=	30;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
//------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
};

instance RedCrab (Mst_Default_MinecrawlerWarrior)			
{
	name							=	"Rote Krabbe";
	level							=	1;

	B_SetVisuals_RedCrab();
	Npc_SetToFistMode(self);

	Mdl_SetModelScale(self, 0.1, 0.1, 0.1);
//------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	10;
	attribute	[ATR_DEXTERITY]		=	10;
	
	attribute	[ATR_HITPOINTS_MAX]	=	10;
	attribute	[ATR_HITPOINTS]		=	10;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
//------------------------------------------------------
	protection	[PROT_BLUNT]		=	0;
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;
//------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
};