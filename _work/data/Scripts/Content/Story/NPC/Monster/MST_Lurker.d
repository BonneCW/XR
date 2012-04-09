//************************
//	Lurker Prototype
//************************

PROTOTYPE Mst_Default_Lurker(C_Npc)			
{
	//----- Monster ----
	name							=	"Lurker";
	guild							=	GIL_LURKER;
	aivar[AIV_MM_REAL_ID]			= 	ID_LURKER;
	level							=	12;
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	60;
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
	
	//----- Damage Types----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_LURKER;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;

	if (Hlp_Random(100) < 5)
	{
		CreateInvItems (self, ItAt_GoblinBone, 1);
	};
};

//**************
//	Visuals
//**************

//---------------------------------------------------
func void B_SetVisuals_Lurker()
{
	Mdl_SetVisual			(self,	"Lurker.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Lur_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Lurker01()
{
	Mdl_SetVisual			(self,	"Lurker.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Lur_Body",		6,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Lurker_Swamp()
{
	Mdl_SetVisual			(self,	"Lurker.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Lur_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Lurker_Wiese()
{
	Mdl_SetVisual			(self,	"Lurker.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Lur_Body",		2,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Lurker_Strand()
{
	Mdl_SetVisual			(self,	"Lurker.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Lur_Body",		3,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Lurker_Höhle()
{
	Mdl_SetVisual			(self,	"Lurker.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Lur_Body",		4,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Lurker_Wald()
{
	Mdl_SetVisual			(self,	"Lurker.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Lur_Body",		5,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

//*************
//	Lurker
//*************

INSTANCE Lurker	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
};

INSTANCE Lurker_Young	(Mst_Default_Lurker)
{
	level = 8;

	name = "Junger Lurker";
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	60;
	attribute	[ATR_HITPOINTS_MAX]	=	80;
	attribute	[ATR_HITPOINTS]		=	80;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	40000;
	protection	[PROT_EDGE]			=	40000;
	protection	[PROT_POINT]		=	40000;
	protection	[PROT_FIRE]			=	40;
	protection	[PROT_FLY]			=	40;
	protection	[PROT_MAGIC]		=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);

	Mdl_SetModelScale	(self, 0.8, 0.8, 0.8);

	CreateInvItems	(self, ItAt_LurkerSkin_Young, 1);
};

INSTANCE Lurker01	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker01();
	Npc_SetToFistMode(self);
};


INSTANCE Lurker_Swamp	(Mst_Default_Lurker)
{
	name	=	"Sumpflurker";

	B_SetVisuals_Lurker_Swamp();
	Npc_SetToFistMode(self);
};

INSTANCE Lurker_Wiese	(Mst_Default_Lurker)
{
	name	=	"Wiesenlurker";

	B_SetVisuals_Lurker_Wiese();
	Npc_SetToFistMode(self);
};

INSTANCE Lurker_Strand	(Mst_Default_Lurker)
{
	name	=	"Strandlurker";

	B_SetVisuals_Lurker_Strand();
	Npc_SetToFistMode(self);
};

INSTANCE Lurker_Höhle	(Mst_Default_Lurker)
{
	name	=	"Höhlenlurker";

	B_SetVisuals_Lurker_Höhle();
	Npc_SetToFistMode(self);
};

INSTANCE Lurker_Wald	(Mst_Default_Lurker)
{
	name	=	"Waldlurker";

	B_SetVisuals_Lurker_Wald();
	Npc_SetToFistMode(self);
};