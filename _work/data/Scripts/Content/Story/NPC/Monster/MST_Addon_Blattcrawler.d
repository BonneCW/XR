//*****************************
//	Minecrawler Prototype
//*****************************

PROTOTYPE Mst_Default_Blattcrawler(C_Npc)			
{
	//----- Monster ----
	name							=	"Fangheuschrecke";
	guild							=	GIL_MINECRAWLER;
	aivar[AIV_MM_REAL_ID]			= 	ID_BLATTCRAWLER;
	level							=	15;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		= Hlp_Random(41)+75;	// 75 - 115
	attribute	[ATR_DEXTERITY]		= Hlp_Random(21)+5;	// 5 - 25
	attribute	[ATR_HITPOINTS_MAX]	= Hlp_Random(101)+100;	// 100 - 200
	attribute	[ATR_HITPOINTS]		= attribute[ATR_HITPOINTS_MAX];
	attribute	[ATR_MANA_MAX] 		= 0;
	attribute	[ATR_MANA] 		= 0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		= Hlp_Random(41)*1000+65000;	// 65 - 105
	protection	[PROT_EDGE]		= Hlp_Random(41)*1000+65000;	// 65 - 105
	protection	[PROT_POINT]		= Hlp_Random(41)*1000+65000;	// 65 - 105
	protection	[PROT_FIRE]		= Hlp_Random(41)+65;		// 65 - 105
	protection	[PROT_FLY]		= Hlp_Random(41)+65;		// 65 - 105
	protection	[PROT_MAGIC]		= Hlp_Random(16);		// 0 - 15

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
	fight_tactic	=	FAI_MINECRAWLER;
	
	//----- Sense & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_WuselStart] 	= OnlyRoutine;

	CreateInvItems (self, ItAt_Addon_BCKopf, 1);
};

PROTOTYPE Mst_Default_Erznager(C_Npc)			
{
	//----- Monster ----
	name							=	"Erznager";
	guild							=	GIL_MINECRAWLER;
	aivar[AIV_MM_REAL_ID]			= 	ID_BLATTCRAWLER;
	level							=	20;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		= Hlp_Random(81) + 100;		// 100 - 180
	attribute	[ATR_DEXTERITY]		= Hlp_Random(21) + 5;		// 5 - 25
	attribute	[ATR_HITPOINTS_MAX]	= Hlp_Random(151) + 200;	// 200 - 350
	attribute	[ATR_HITPOINTS]		= attribute[ATR_HITPOINTS_MAX];
	attribute	[ATR_MANA_MAX] 		= 0;
	attribute	[ATR_MANA] 		= 0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		= Hlp_Random(41)*1000 + 55000;	// 55 - 95
	protection	[PROT_EDGE]		= Hlp_Random(41)*1000 + 55000;	// 55 - 95
	protection	[PROT_POINT]		= Hlp_Random(41)*1000 + 55000;	// 55 - 95
	protection	[PROT_FIRE]		= Hlp_Random(41) + 55;		// 55 - 95
	protection	[PROT_FLY]		= 75;
	protection	[PROT_MAGIC]		= Hlp_Random(41) + 20;		// 20 - 60

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
	fight_tactic	=	FAI_MINECRAWLER;
	
	//----- Sense & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_WuselStart] 	= OnlyRoutine;

	CreateInvItems (self, ItAt_Addon_BCKopf		, 1);
};


//***********
// Visuals
//***********

func void B_SetVisuals_Blattcrawler()
{
	Mdl_SetVisual			(self,	"Blattcrawler.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"BlattCrawler_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Erznager()
{
	Mdl_SetVisual			(self,	"Blattcrawler.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Erznager_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//*****************
//	Minecrawler
//*****************

INSTANCE Blattcrawler	(Mst_Default_Blattcrawler)
{
	B_SetVisuals_Blattcrawler();
	Npc_SetToFistMode(self);
};

INSTANCE Erznager	(Mst_Default_Erznager)
{
	B_SetVisuals_Erznager();
	Npc_SetToFistMode(self);
};

INSTANCE Insekt_01	(Mst_Default_Blattcrawler)
{
	level							=	1;

	aivar[AIV_MM_REAL_ID]			= 	ID_INSEKT;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		= 10;
	attribute	[ATR_DEXTERITY]		= 0;
	attribute	[ATR_HITPOINTS_MAX]	= 10;
	attribute	[ATR_HITPOINTS]		= 10;
	attribute	[ATR_MANA_MAX] 		= 0;
	attribute	[ATR_MANA] 			= 0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		= 0;
	protection	[PROT_EDGE]			= 0;
	protection	[PROT_POINT]		= 0;
	protection	[PROT_FIRE]			= 0;
	protection	[PROT_FLY]			= 0;
	protection	[PROT_MAGIC]		= 0;

	B_SetVisuals_Blattcrawler();
	Npc_SetToFistMode(self);

	Mdl_SetModelScale(self, 0.2, 0.2, 0.2);
};

INSTANCE Insekt_04	(Mst_Default_Blattcrawler)
{
	level							=	1;

	aivar[AIV_MM_REAL_ID]			= 	ID_INSEKT;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		= 10;
	attribute	[ATR_DEXTERITY]		= 0;
	attribute	[ATR_HITPOINTS_MAX]	= 10;
	attribute	[ATR_HITPOINTS]		= 10;
	attribute	[ATR_MANA_MAX] 		= 0;
	attribute	[ATR_MANA] 			= 0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		= 0;
	protection	[PROT_EDGE]			= 0;
	protection	[PROT_POINT]		= 0;
	protection	[PROT_FIRE]			= 0;
	protection	[PROT_FLY]			= 0;
	protection	[PROT_MAGIC]		= 0;

	B_SetVisuals_Blattcrawler();
	Npc_SetToFistMode(self);

	Mdl_SetModelScale(self, 0.2, 0.2, 0.2);
};