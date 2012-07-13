//**********************
//	Troll Prototype		
//**********************

PROTOTYPE Mst_Default_Troll(C_Npc)			
{
	//----- Monster ----
	name							=	"Troll";
	guild							=	GIL_TROLL;
	aivar[AIV_MM_REAL_ID]			= 	ID_TROLL;
	level							=	50; //30
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	150;	//FlyDamage
	attribute	[ATR_DEXTERITY]		=	40;
	attribute	[ATR_HITPOINTS_MAX]	=	500;
	attribute	[ATR_HITPOINTS]		=	500;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	180000;
	protection	[PROT_EDGE]			=	180000;
	protection	[PROT_POINT]		=	IMMUNE;
	protection	[PROT_FIRE]			=	125;
	protection	[PROT_FLY]			=	IMMUNE;
	protection	[PROT_MAGIC]		=	125;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//----- Damage Types ----	
	damagetype 						=	DAM_FLY;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----	
	fight_tactic	=	FAI_TROLL;

	//----- Senses & Ranges ----	
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//***************************************************
	bodyStateInterruptableOverride 	= TRUE;
	//***************************************************
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	if (Hlp_Random(100) < 15)
	{
		CreateInvItems (self, ItAt_GoblinBone, 1+Hlp_Random(3));
	};
	if (Hlp_Random(100) < 10)
	{
		CreateInvItems (self, ItAt_SkeletonBone, 1+Hlp_Random(2));
	};
};


//*************
//	Visuals
//*************


func void B_SetVisuals_Troll()
{
	Mdl_SetVisual			(self,	"Troll.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Tro_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_SilverTroll()
{
	Mdl_SetVisual			(self,	"Troll.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Tro_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Troll_s()
{
	Mdl_SetVisual			(self,	"Troll.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Tro_Body",		2,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Troll_howy()
{
	Mdl_SetVisual			(self,	"Troll.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Tro_Body",		3,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//***********
//	Troll    
//***********
INSTANCE Troll	(Mst_Default_Troll)
{
	B_SetVisuals_Troll();
	Npc_SetToFistMode(self);
};
INSTANCE Krauttroll	(Mst_Default_Troll)
{
	B_SetVisuals_Troll();
	Npc_SetToFistMode(self);
};

INSTANCE SilverTroll	(Mst_Default_Troll)
{
	name = "Silbertroll";

	Mdl_SetModelScale(self, 1.5, 1.5, 1.5);

	attribute	[ATR_STRENGTH]		=	300;
	attribute	[ATR_HITPOINTS_MAX]	=	500;
	attribute	[ATR_HITPOINTS]		=	500;
	attribute	[ATR_DEXTERITY]		=	30;

	//----- Protections ----	
	protection	[PROT_BLUNT]		=	180000;
	protection	[PROT_EDGE]			=	180000;
	protection	[PROT_POINT]		=	IMMUNE;	
	protection	[PROT_FIRE]			=	90;
	protection	[PROT_FLY]			=	30;	
	protection	[PROT_MAGIC]		=	90;

	B_SetVisuals_SilverTroll();
	Npc_SetToFistMode(self);
};

INSTANCE Troll_s	(Mst_Default_Troll)
{
	aivar[AIV_MM_REAL_ID]			= 	ID_TROLL_HÖHLE;
	level							=	250; //30

	name = "Höhlentroll";

	protection	[PROT_POINT]		=	IMMUNE;	
	protection	[PROT_FLY]			=	IMMUNE;
	
	B_SetVisuals_Troll_s();
	Npc_SetToFistMode(self);
};

INSTANCE Troll_s_Pat	(Mst_Default_Troll)
{
	aivar[AIV_MM_REAL_ID]			= 	ID_TROLL_HÖHLE;
	level							=	250; //30

	name = "Höhlentroll";

	protection	[PROT_POINT]		=	IMMUNE;	
	protection	[PROT_FLY]			=	IMMUNE;
	protection	[PROT_MAGIC]		=	100;
	
	B_SetVisuals_Troll_s();
	Npc_SetToFistMode(self);
};

INSTANCE Troll_Howy	(Mst_Default_Troll)
{
	protection	[PROT_POINT]		=	IMMUNE;	
	protection	[PROT_FLY]			=	IMMUNE;
	
	B_SetVisuals_Troll_Howy();
	Npc_SetToFistMode(self);
};

INSTANCE YTroll	(Mst_Default_Troll)
{
	level							=	25;
	name							=	"Junger Troll";
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	75;	//FlyDamage
	attribute	[ATR_DEXTERITY]		=	50;
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	90000;
	protection	[PROT_EDGE]			=	90000;
	protection	[PROT_POINT]		=	IMMUNE;	
	protection	[PROT_FIRE]			=	70;
	protection	[PROT_FLY]			=	IMMUNE;
	protection	[PROT_MAGIC]		=	60;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	B_SetVisuals_Troll();
	Mdl_SetModelScale(self, 0.8, 0.8, 0.8);
	Npc_SetToFistMode(self);
};