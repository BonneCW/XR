//************************
//	Skeleton Prototype
//************************

PROTOTYPE Mst_Default_Skeleton(C_Npc)			
{
	//----- Monster ----
	name							=	"Skelett";
	guild							=	GIL_SKELETON;
	aivar[AIV_MM_REAL_ID]			= 	ID_SKELETON;
	level							=	30;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	100; //+50 Waffe
	attribute	[ATR_DEXTERITY]		=	50;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	50000;
	protection	[PROT_EDGE]			=	125000;
	protection	[PROT_POINT]		=	-1; 
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
	fight_tactic	=	FAI_HUMAN_STRONG;
	
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

func void B_SetVisuals_Skeleton()
{
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_1hST1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_2hST2.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_BowT2.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Body2",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Lesser_Skeleton()
{
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_1hST1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_2hST2.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_BowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

//-------------------------------------------------------------
func void Set_SkeletonWarrior_Visuals()
{
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_1hST1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_2hST2.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_BowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Body3",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//**************
//	Skeleton    
//**************

INSTANCE Skeleton			(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);
};

INSTANCE Skeleton_Weg			(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);
};

INSTANCE SkeletonTransform			(Mst_Default_Skeleton)
{
	Npc_PercEnable (self, PERC_ASSESSSURPRISE , B_StopMagicTransform);
	B_SetVisuals_Skeleton();
	EquipItem (self, ItMw_2H_Sword_M_01);
};

INSTANCE Skeleton_Anf¸hrer			(Mst_Default_Skeleton)
{
	name	=	"Skelett-Anf¸hrer";

	level = 50;

	Set_SkeletonWarrior_Visuals();

	attribute	[ATR_STRENGTH]		=	150; //+50 Waffe
	attribute	[ATR_DEXTERITY]		=	50;
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	50000;
	protection	[PROT_EDGE]			=	150000;
	protection	[PROT_POINT]		=	-1; 
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	EquipItem (self, ItMw_BeliarWeapon_2H_01);
};

INSTANCE SkeletonWarrior	(Mst_Default_Skeleton)
{
	name							=	"Skelettkrieger";
	Set_SkeletonWarrior_Visuals();
	level							=	40;
	attribute	[ATR_STRENGTH]		=	140;
	aivar		[AIV_MM_REAL_ID]	= 	ID_SKELETONWARRIOR;

	EquipItem		(self, ItMw_2H_Sword_M_01);
};

INSTANCE SkeletonWarrior_Weg	(Mst_Default_Skeleton)
{
	name							=	"Skelettkrieger";
	Set_SkeletonWarrior_Visuals();
	level							=	40;
	attribute	[ATR_STRENGTH]		=	140;
	aivar		[AIV_MM_REAL_ID]	= 	ID_SKELETONWARRIOR;

	EquipItem		(self, ItMw_2H_Sword_M_01);
};

INSTANCE Skeleton_Halfmar	(Mst_Default_Skeleton)
{
	name							=	"Skelettkrieger";
	Set_SkeletonWarrior_Visuals();
	level							=	40;
	attribute	[ATR_STRENGTH]		=	140;
	aivar		[AIV_MM_REAL_ID]	= 	ID_SKELETONWARRIOR;

	EquipItem		(self, ItMw_2H_Sword_M_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
};

INSTANCE Skeleton_Costa	(Mst_Default_Skeleton)
{
	name							=	"Skelettkrieger";
	Set_SkeletonWarrior_Visuals();
	level							=	40;
	attribute	[ATR_STRENGTH]		=	140;
	aivar		[AIV_MM_REAL_ID]	= 	ID_SKELETONWARRIOR;

	EquipItem		(self, ItMw_2H_Sword_M_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!

	CreateInvItems	(self, ItKe_Costa, 1);
};
//**************
//	Skeleton    
//**************

INSTANCE Summoned_Skeleton (Mst_Default_Skeleton)
{
	name							=	"Beschworenes Skelett";
	guild							=	GIL_SUMMONED_SKELETON;
	aivar[AIV_MM_REAL_ID]			= 	ID_SUMMONED_SKELETON;
	level							=	0; //30

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	100; //+50 Waffe
	attribute	[ATR_DEXTERITY]		=	50;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	125000;
	protection	[PROT_EDGE]			=	125000;
	protection	[PROT_POINT]		=	175000; 
	protection	[PROT_FIRE]			=	125;
	protection	[PROT_FLY]			=	125;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	fight_tactic	=	FAI_HUMAN_NORMAL;
	
	// ------ visual ------
	B_SetVisuals_Lesser_Skeleton();
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_Lesser_Skeleton();

	//protection	[PROT_POINT]		=	-1; 

	EquipItem (self, ItMw_2H_Sword_M_01);
	//EquipItem (self, ItRw_Sld_Bow); //FIXME Carsten: Bogen schieﬂt beim Skelett in Zeitlupe...
};

INSTANCE Skeleton_Albert_MT (Mst_Default_Skeleton)
{
	name							=	"Beschworenes Skelett";
	guild							=	GIL_SUMMONED_SKELETON;
	aivar[AIV_MM_REAL_ID]			= 	ID_SUMMONED_SKELETON;
	level							=	0; //30

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	100; //+50 Waffe
	attribute	[ATR_DEXTERITY]		=	50;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	125000;
	protection	[PROT_EDGE]			=	125000;
	protection	[PROT_POINT]		=	175000; 
	protection	[PROT_FIRE]			=	125;
	protection	[PROT_FLY]			=	125;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	fight_tactic	=	FAI_HUMAN_NORMAL;
	
	// ------ visual ------
	B_SetVisuals_Lesser_Skeleton();
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_Lesser_Skeleton();

	protection	[PROT_POINT]		=	-1; 

	EquipItem (self, ItMw_2H_Sword_M_01);
	//EquipItem (self, ItRw_Sld_Bow); //FIXME Carsten: Bogen schieﬂt beim Skelett in Zeitlupe...
};

INSTANCE Skeleton_Albert_OC (Mst_Default_Skeleton)
{
	name							=	"Beschworenes Skelett";
	guild							=	GIL_SUMMONED_SKELETON;
	aivar[AIV_MM_REAL_ID]			= 	ID_SUMMONED_SKELETON;
	level							=	0; //30

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	100; //+50 Waffe
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	125000;
	protection	[PROT_EDGE]			=	125000;
	protection	[PROT_POINT]		=	175000; 
	protection	[PROT_FIRE]			=	125;
	protection	[PROT_FLY]			=	125;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	fight_tactic	=	FAI_HUMAN_NORMAL;
	
	// ------ visual ------
	B_SetVisuals_Lesser_Skeleton();
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_Lesser_Skeleton();

	protection	[PROT_POINT]		=	-1; 

	EquipItem (self, ItMw_2H_Sword_M_01);
	//EquipItem (self, ItRw_Sld_Bow); //FIXME Carsten: Bogen schieﬂt beim Skelett in Zeitlupe...
};

INSTANCE Skeleton_Thorge_MT (Mst_Default_Skeleton)
{
	name							=	"Beschworenes Skelett";
	guild							=	GIL_SUMMONED_SKELETON;
	aivar[AIV_MM_REAL_ID]			= 	ID_SUMMONED_SKELETON;
	level							=	0; //30

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	100; //+50 Waffe
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	125000;
	protection	[PROT_EDGE]			=	125000;
	protection	[PROT_POINT]		=	175000; 
	protection	[PROT_FIRE]			=	125;
	protection	[PROT_FLY]			=	125;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	fight_tactic	=	FAI_HUMAN_NORMAL;
	
	// ------ visual ------
	B_SetVisuals_Lesser_Skeleton();
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_Lesser_Skeleton();

	protection	[PROT_POINT]		=	-1; 

	EquipItem (self, ItMw_2H_Sword_M_01);
	//EquipItem (self, ItRw_Sld_Bow); //FIXME Carsten: Bogen schieﬂt beim Skelett in Zeitlupe...
};

INSTANCE Skeleton_Thorge_TUG (Mst_Default_Skeleton)
{
	name							=	"Beschworenes Skelett";
	guild							=	GIL_SUMMONED_SKELETON;
	aivar[AIV_MM_REAL_ID]			= 	ID_SUMMONED_SKELETON;
	level							=	0; //30

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	100; //+50 Waffe
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	125000;
	protection	[PROT_EDGE]			=	125000;
	protection	[PROT_POINT]		=	175000; 
	protection	[PROT_FIRE]			=	125;
	protection	[PROT_FLY]			=	125;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	fight_tactic	=	FAI_HUMAN_NORMAL;
	
	// ------ visual ------
	B_SetVisuals_Lesser_Skeleton();
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_Lesser_Skeleton();

	protection	[PROT_POINT]		=	-1; 

	EquipItem (self, ItMw_2H_Sword_M_01);
	//EquipItem (self, ItRw_Sld_Bow); //FIXME Carsten: Bogen schieﬂt beim Skelett in Zeitlupe...
};

//**************
//	Lesser Skeleton    
//**************

INSTANCE Lesser_Skeleton	(Mst_Default_Skeleton)
{
	name							=	"Niederes Skelett";
	
	level							=	15;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	45; //+30 Waffe
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	40000;
	protection	[PROT_EDGE]			=	80000;
	protection	[PROT_POINT]		=	130000; 
	protection	[PROT_FIRE]			=	80;
	protection	[PROT_FLY]			=	80;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	fight_tactic	=	FAI_HUMAN_NORMAL;
	
	// ------ visual ------
	B_SetVisuals_Lesser_Skeleton();

	protection	[PROT_POINT]		=	-1; 
	// ------ Waffe ------
	EquipItem (self, ItMw_1h_MISC_Sword);
};

INSTANCE Lesser_Skeleton_Diebe_01	(Mst_Default_Skeleton)
{
	name							=	"Niederes Skelett";
	
	level							=	15;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	45; //+30 Waffe
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	40000;
	protection	[PROT_EDGE]			=	80000;
	protection	[PROT_POINT]		=	130000; 
	protection	[PROT_FIRE]			=	80;
	protection	[PROT_FLY]			=	80;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	fight_tactic	=	FAI_HUMAN_NORMAL;
	
	// ------ visual ------
	B_SetVisuals_Lesser_Skeleton();

	protection	[PROT_POINT]		=	-1; 
	// ------ Waffe ------
	EquipItem (self, ItMw_1h_MISC_Sword);
};

INSTANCE Lesser_Skeleton_Diebe_02	(Mst_Default_Skeleton)
{
	name							=	"Niederes Skelett";
	
	level							=	15;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	45; //+30 Waffe
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	40000;
	protection	[PROT_EDGE]			=	80000;
	protection	[PROT_POINT]		=	130000; 
	protection	[PROT_FIRE]			=	80;
	protection	[PROT_FLY]			=	80;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	fight_tactic	=	FAI_HUMAN_NORMAL;
	
	// ------ visual ------
	B_SetVisuals_Lesser_Skeleton();

	protection	[PROT_POINT]		=	-1; 
	// ------ Waffe ------
	EquipItem (self, ItMw_1h_MISC_Sword);
};

INSTANCE Lesser_Skeleton_Diebe_03	(Mst_Default_Skeleton)
{
	name							=	"Niederes Skelett";
	
	level							=	15;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	45; //+30 Waffe
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	40000;
	protection	[PROT_EDGE]			=	80000;
	protection	[PROT_POINT]		=	130000; 
	protection	[PROT_FIRE]			=	80;
	protection	[PROT_FLY]			=	80;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	fight_tactic	=	FAI_HUMAN_NORMAL;
	
	// ------ visual ------
	B_SetVisuals_Lesser_Skeleton();

	protection	[PROT_POINT]		=	-1; 
	// ------ Waffe ------
	EquipItem (self, ItMw_1h_MISC_Sword);
};

INSTANCE Lesser_Skeleton_Diebe_04	(Mst_Default_Skeleton)
{
	name							=	"Niederes Skelett";
	
	level							=	15;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	45; //+30 Waffe
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	40000;
	protection	[PROT_EDGE]			=	80000;
	protection	[PROT_POINT]		=	130000; 
	protection	[PROT_FIRE]			=	80;
	protection	[PROT_FLY]			=	80;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	fight_tactic	=	FAI_HUMAN_NORMAL;
	
	// ------ visual ------
	B_SetVisuals_Lesser_Skeleton();

	protection	[PROT_POINT]		=	-1; 
	// ------ Waffe ------
	EquipItem (self, ItMw_1h_MISC_Sword);
};

INSTANCE Lesser_Skeleton_Diebe_05	(Mst_Default_Skeleton)
{
	name							=	"Niederes Skelett";
	
	level							=	15;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	45; //+30 Waffe
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	40000;
	protection	[PROT_EDGE]			=	80000;
	protection	[PROT_POINT]		=	130000; 
	protection	[PROT_FIRE]			=	80;
	protection	[PROT_FLY]			=	80;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	fight_tactic	=	FAI_HUMAN_NORMAL;
	
	// ------ visual ------
	B_SetVisuals_Lesser_Skeleton();

	protection	[PROT_POINT]		=	-1; 
	// ------ Waffe ------
	EquipItem (self, ItMw_1h_MISC_Sword);
};


INSTANCE Skeleton_DienerDesBoesen_01_01			(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);

	protection	[PROT_POINT]		=	-1; 
};

INSTANCE Skeleton_DienerDesBoesen_01_02			(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);

	protection	[PROT_POINT]		=	-1; 
};

INSTANCE Skeleton_DienerDesBoesen_01_03			(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);

	protection	[PROT_POINT]		=	-1; 
};

INSTANCE Skeleton_DienerDesBoesen_01_04			(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);

	protection	[PROT_POINT]		=	-1; 
};

INSTANCE Skeleton_DienerDesBoesen_01_05			(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);

	protection	[PROT_POINT]		=	-1; 
};

INSTANCE Skeleton_DienerDesBoesen_01_06			(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);

	protection	[PROT_POINT]		=	-1; 
};

INSTANCE Skeleton_DienerDesBoesen_02_01			(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);

	protection	[PROT_POINT]		=	-1; 
};

INSTANCE Skeleton_DienerDesBoesen_02_02			(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);

	protection	[PROT_POINT]		=	-1; 
};

INSTANCE Skeleton_DienerDesBoesen_02_03			(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);

	protection	[PROT_POINT]		=	-1; 
};

INSTANCE Skeleton_DienerDesBoesen_02_04			(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);

	protection	[PROT_POINT]		=	-1; 
};

INSTANCE Skeleton_DienerDesBoesen_02_05			(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);

	protection	[PROT_POINT]		=	-1; 
};

INSTANCE Skeleton_DienerDesBoesen_02_06			(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);

	protection	[PROT_POINT]		=	-1; 
};