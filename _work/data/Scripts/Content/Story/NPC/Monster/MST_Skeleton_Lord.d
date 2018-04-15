PROTOTYPE Mst_Skeleton_Lord	(C_NPC)
{
	//----- Monster ----
	name							=	"Schattenkrieger";
	guild							=	GIL_SKELETON;
	aivar[AIV_MM_REAL_ID]			= 	ID_SKELETONLORD;
	level							=	60;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	105; //+ 105 Waffe
	attribute	[ATR_DEXTERITY]		=	750;
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_MANA_MAX] 		=	200;
	attribute	[ATR_MANA] 			=	200;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	0; //hat RS!
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	0; 
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;	//so lassen!

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
	fight_tactic	=	FAI_HUMAN_STRONG;	
	
	EquipItem	(self,ItMw_Zweihaender2);
	
	B_SetFightSkills	(self, 80);

	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	CreateInvItems (self, ItAt_SkeletonBone	, 1);
};


//***************
//	Visuals
//***************

func void B_SetVisuals_Skeleton_Lord()
{
	Mdl_SetVisual		(self,	"HumanS.mds");
	//Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds"); //FIXME s.Skeleton.
	Mdl_ApplyOverlayMds 	(self,	"humans_1hST1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_2hST2.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_BowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_CBowT1.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	B_SetNpcVisual 		(self, MALE, "Ske_Head", 0, 0, ITAR_PAL_SKEL);
};


//**************************************************************
//	Schattenlord 	
//**************************************************************

INSTANCE Skeleton_Lord	(Mst_Skeleton_Lord)
{
	B_SetVisuals_Skeleton_Lord ();
};

INSTANCE Skeleton_Lord_Weg	(Mst_Skeleton_Lord)
{
	B_SetVisuals_Skeleton_Lord ();
};

INSTANCE Skeleton_Lord_Ghost	(Mst_Skeleton_Lord)
{
	B_SetVisuals_Skeleton_Lord ();

	name							=	"Geist eines Schattenkriegers";

	flags = NPC_FLAG_GHOST;
	//effect							=	"spellfx_undead_skeletonlord";
	aivar[AIV_MM_REAL_ID]			= 	ID_GEISTERKRIEGER;

	level							=	75;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	145; //+ 105 Waffe
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	500;
	attribute	[ATR_HITPOINTS]		=	500;
	attribute	[ATR_MANA_MAX] 		=	300;
	attribute	[ATR_MANA] 			=	300;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	50000; //hat RS!
	protection	[PROT_EDGE]			=	-1;
	protection	[PROT_POINT]		=	-1; 
	protection	[PROT_FIRE]			=	140;
	protection	[PROT_FLY]			=	140;
	protection	[PROT_MAGIC]		=	50;	//so lassen!

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	CreateInvItems	(self, ItMi_OldCoin, Hlp_Random(4));
	CreateInvItems	(self, ItMi_Gold, Hlp_Random(16));
	CreateInvItems	(self, ItMi_Aquamarine, Hlp_Random(3));
};

INSTANCE Summoned_Skeleton_Lord_Ghost_Xeres	(Mst_Skeleton_Lord)
{
	B_SetVisuals_Skeleton_Lord ();

	name							=	"Geist eines Schattenkriegers";

	flags = NPC_FLAG_GHOST;
	aivar[AIV_MM_REAL_ID]			= 	ID_GEISTERKRIEGER;

	level							=	75;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	145; //+ 105 Waffe
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	500;
	attribute	[ATR_HITPOINTS]		=	500;
	attribute	[ATR_MANA_MAX] 		=	300;
	attribute	[ATR_MANA] 			=	300;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	50000; //hat RS!
	protection	[PROT_EDGE]			=	50000;
	protection	[PROT_POINT]		=	50000; 
	protection	[PROT_FIRE]			=	140;
	protection	[PROT_FLY]			=	140;
	protection	[PROT_MAGIC]		=	50;	//so lassen!

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
};

INSTANCE Summoned_Skeleton_Lord_Ghost	(Mst_Skeleton_Lord)
{
	B_SetVisuals_Skeleton_Lord ();

	name							=	"Geist eines Schattenkriegers";

	flags = NPC_FLAG_GHOST;
	//effect							=	"spellfx_undead_skeletonlord";
	aivar[AIV_MM_REAL_ID]			= 	ID_GEISTERKRIEGER;

	level							=	0;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	145; //+ 105 Waffe
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	500;
	attribute	[ATR_HITPOINTS]		=	500;
	attribute	[ATR_MANA_MAX] 		=	300;
	attribute	[ATR_MANA] 			=	300;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	50000; //hat RS!
	protection	[PROT_EDGE]			=	-1;
	protection	[PROT_POINT]		=	-1; 
	protection	[PROT_FIRE]			=	140;
	protection	[PROT_FLY]			=	140;
	protection	[PROT_MAGIC]		=	50;	//so lassen!

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
};


INSTANCE Skeleton_Lord_DienerDesBoesen_01_01	(Mst_Skeleton_Lord)
{
	B_SetVisuals_Skeleton_Lord ();
};

INSTANCE Skeleton_Lord_DienerDesBoesen_01_02	(Mst_Skeleton_Lord)
{
	B_SetVisuals_Skeleton_Lord ();
};

INSTANCE Skeleton_Lord_DienerDesBoesen_02_01	(Mst_Skeleton_Lord)
{
	B_SetVisuals_Skeleton_Lord ();
};

INSTANCE Skeleton_Lord_DienerDesBoesen_02_02	(Mst_Skeleton_Lord)
{
	B_SetVisuals_Skeleton_Lord ();
};

INSTANCE Crypt_Skeleton_Lord	(Mst_Skeleton_Lord)
{
	name		=	"Schattenlord Inubis";

	B_SetVisuals_Skeleton_Lord ();
	
	CreateInvItems	(self,ItMi_Gold,500);
	CreateInvItems 	(self,ItPo_Mana_03,2);
	CreateInvItems 	(self,ItPo_Health_03,2);
};