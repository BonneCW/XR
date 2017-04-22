//********************
//	Wolf Prototype														
//********************

PROTOTYPE Mst_Default_Wolf(C_Npc)			
{
	//----- Monster ----
	name							=	"Wolf";
	guild							=	GIL_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_WOLF;
	level							=	6;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	25;
	attribute	[ATR_DEXTERITY]		=	4;
	attribute	[ATR_HITPOINTS_MAX]	=	55;
	attribute	[ATR_HITPOINTS]		=	55;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	25000;
	protection	[PROT_EDGE]			=	25000;
	protection	[PROT_POINT]		=	1000;
	protection	[PROT_FIRE]			=	25;
	protection	[PROT_FLY]			=	250;
	protection	[PROT_MAGIC]		=	10;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	//---- Damage Types ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf Taktik ----
	fight_tactic	=	FAI_WOLF;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= TRUE;

	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	if (Hlp_Random(100) < 5)
	{
		CreateInvItems (self, ItAt_GoblinBone, 1);
	};

	CreateInvItems (self, ItFo_MuttonRaw, 1);

	aivar[AIV_MM_RoamStart] 	= 6;	
	aivar[AIV_MM_RoamEnd]		= 22;
	aivar[AIV_MM_SleepStart]	= 22;
	aivar[AIV_MM_SleepEnd]		= 6;
};


//************
//	Visuals
//************


func void B_SetVisuals_Wolf()
{
	Mdl_SetVisual			(self,"Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Schaeferhund()
{
	Mdl_SetVisual			(self,"Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		2,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	Mdl_SetModelScale(self, 0.7, 0.7, 0.7);
};

func void B_SetVisuals_Aggressiv()
{
	Mdl_SetVisual			(self,"Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		3,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Riesenwolf()
{
	Mdl_SetVisual			(self,"Riesenwolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"RIESENWOLF_BODY",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//************
//	Wolf    	
//************

INSTANCE Wolf	(Mst_Default_Wolf)
{
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
};

INSTANCE Riesenwolf	(Mst_Default_Wolf)
{
	level							=	30;
	name							=	"Riesenwolf";
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	150;
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	150000;
	protection	[PROT_EDGE]			=	150000;
	protection	[PROT_POINT]		=	150000;
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	150;

	B_SetVisuals_Riesenwolf();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);

	if (Hlp_Random(100) < 15)
	{
		CreateInvItems (self, ItAt_GoblinBone, 1+Hlp_Random(3));
	};
	if (Hlp_Random(100) < 10)
	{
		CreateInvItems (self, ItAt_SkeletonBone, 1+Hlp_Random(2));
	};
};

INSTANCE Wolf_Griselda_01	(Mst_Default_Wolf)
{
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);
};

INSTANCE Wolf_Verletzt	(Mst_Default_Wolf)
{
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);

	attribute	[ATR_HITPOINTS_MAX]	=	60;
	attribute	[ATR_HITPOINTS]		=	20;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	aivar[AIV_MM_RoamStart] 	= 6;	
	aivar[AIV_MM_RoamEnd]		= 22;
	aivar[AIV_MM_SleepStart]	= 22;
	aivar[AIV_MM_SleepEnd]		= 6;
};

INSTANCE Wolf_Seltsam_01	(Mst_Default_Wolf)
{
	B_SetVisuals_Aggressiv();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);

	aivar[AIV_MM_RoamStart] 	= 6;	
	aivar[AIV_MM_RoamEnd]		= 22;
	aivar[AIV_MM_SleepStart]	= 22;
	aivar[AIV_MM_SleepEnd]		= 6;
};

INSTANCE Wolf_Seltsam_02	(Mst_Default_Wolf)
{
	B_SetVisuals_Aggressiv();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);

	aivar[AIV_MM_RoamStart] 	= 6;	
	aivar[AIV_MM_RoamEnd]		= 22;
	aivar[AIV_MM_SleepStart]	= 22;
	aivar[AIV_MM_SleepEnd]		= 6;
};

INSTANCE Wolf_Seltsam_03	(Mst_Default_Wolf)
{
	B_SetVisuals_Aggressiv();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);

	aivar[AIV_MM_RoamStart] 	= 6;	
	aivar[AIV_MM_RoamEnd]		= 22;
	aivar[AIV_MM_SleepStart]	= 22;
	aivar[AIV_MM_SleepEnd]		= 6;
};

INSTANCE Wolf_Seltsam_04	(Mst_Default_Wolf)
{
	B_SetVisuals_Aggressiv();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);

	aivar[AIV_MM_RoamStart] 	= 6;	
	aivar[AIV_MM_RoamEnd]		= 22;
	aivar[AIV_MM_SleepStart]	= 22;
	aivar[AIV_MM_SleepEnd]		= 6;
};

INSTANCE Wolf_Seltsam_05	(Mst_Default_Wolf)
{
	B_SetVisuals_Aggressiv();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);

	aivar[AIV_MM_RoamStart] 	= 6;	
	aivar[AIV_MM_RoamEnd]		= 22;
	aivar[AIV_MM_SleepStart]	= 22;
	aivar[AIV_MM_SleepEnd]		= 6;
};

INSTANCE Wolf_Rotkaeppchen	(Mst_Default_Wolf)
{
	name		= "Großer böser Wolf";

	B_SetVisuals_Riesenwolf();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);
};

INSTANCE Schaeferhund_Pepe	(Mst_Default_Wolf)
{
	name	=	"Schäferhund";
	B_SetVisuals_Schaeferhund();
	guild							=	GIL_SUMMONED_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_SCHAEFERHUND;
	Npc_SetToFistMode(self);

	start_aistate				= ZS_MM_RTN_Schaeferhund;
};

INSTANCE Schaeferhund_Maleth	(Mst_Default_Wolf)
{
	name	=	"Schäferhund";
	B_SetVisuals_Schaeferhund();
	guild							=	GIL_SUMMONED_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_SCHAEFERHUND;
	Npc_SetToFistMode(self);

	start_aistate				= ZS_MM_RTN_Schaeferhund;
};

INSTANCE Schaeferhund_Malak	(Mst_Default_Wolf)
{
	name	=	"Schäferhund";
	B_SetVisuals_Schaeferhund();
	guild							=	GIL_SUMMONED_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_SCHAEFERHUND;
	Npc_SetToFistMode(self);

	start_aistate				= ZS_MM_RTN_Schaeferhund;
};

INSTANCE Schaeferhund_Balthasar	(Mst_Default_Wolf)
{
	name	=	"Schäferhund";
	B_SetVisuals_Schaeferhund();
	guild							=	GIL_SUMMONED_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_SCHAEFERHUND;
	Npc_SetToFistMode(self);

	start_aistate				= ZS_MM_RTN_Schaeferhund;
};

INSTANCE Schaeferhund_Lobart_01	(Mst_Default_Wolf)
{
	name	=	"Sherome";
	B_SetVisuals_Schaeferhund();
	guild							=	GIL_SUMMONED_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_SCHAEFERHUND;
	id = 7173;
	Npc_SetToFistMode(self);

	daily_routine = Rtn_Start_7173;
	
};

FUNC VOID Rtn_Start_7173()
{
	TA_Roam	(08,00,20,00,"NW_FARM1_CITYWALL_FOREST_14");
	TA_Roam	(20,00,08,00,"NW_FARM1_CITYWALL_FOREST_14");
};

FUNC VOID Rtn_Farm_7173()
{
	TA_Schaeferhund	(07,30,23,00,"NW_FARM1_LOBART");
	TA_Schaeferhund	(23,00,07,30,"NW_FARM1_INHOUSE_BED_01");
};



INSTANCE AdanosDog	(Mst_Default_Wolf)
{
	name	=	"Blauer Hund";
	B_SetVisuals_Schaeferhund();
	guild							=	GIL_SUMMONED_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_SCHAEFERHUND;
	id = 7204;
	flags       = NPC_FLAG_GHOST|NPC_FLAG_IMMORTAL;	
	effect	= "SPELLFX_ICEARMOR";
	Npc_SetToFistMode(self);

	daily_routine = Rtn_Start_7204;
	
};

FUNC VOID Rtn_Start_7204()
{
	TA_Roam	(08,00,20,00,Npc_GetNearestWP(hero));
	TA_Roam	(20,00,08,00,Npc_GetNearestWP(hero));
};

FUNC VOID Rtn_Tot_7204()
{
	TA_Roam	(08,00,20,00,"TOT");
	TA_Roam	(20,00,08,00,"TOT");
};


//*****************
//	Summoned Wolf    	
//*****************

INSTANCE Summoned_Wolf	(Mst_Default_Wolf)
{
	name							=	"Beschworener Wolf";
	guild							=	GIL_SUMMONED_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_SUMMONED_WOLF;
	level							=	0; //10
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	50;
	attribute	[ATR_DEXTERITY]		=	50;
	attribute	[ATR_HITPOINTS_MAX]	=	100;
	attribute	[ATR_HITPOINTS]		=	100;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	75000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	25000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	Npc_RemoveInvItems (self, ItAt_GoblinBone, Npc_HasItems(self, ItAt_GoblinBone));
	Npc_RemoveInvItems (self, ItFo_MuttonRaw, Npc_HasItems(self, ItFo_MuttonRaw));
	
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
};

INSTANCE BegleiterWolf	(Mst_Default_Wolf)
{
	name							=	"Beschworener Wolf";
	guild							=	GIL_SUMMONED_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_SUMMONED_WOLF;
	level							=	0; //10
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	50;
	attribute	[ATR_DEXTERITY]		=	50;
	attribute	[ATR_HITPOINTS_MAX]	=	100;
	attribute	[ATR_HITPOINTS]		=	100;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	75000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	25000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
};


//************
//	YWolf    	
//************

INSTANCE YWolf	(Mst_Default_Wolf)
{
	level							=	3;
	name							=	"Junger Wolf";
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	10;
	attribute	[ATR_DEXTERITY]		=	5;
	attribute	[ATR_HITPOINTS_MAX]	=	25;
	attribute	[ATR_HITPOINTS]		=	25;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	10000;
	protection	[PROT_EDGE]			=	10000;
	protection	[PROT_POINT]		=	1000;
	protection	[PROT_FIRE]			=	15;
	protection	[PROT_FLY]			=	15;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//----- Kampf-Taktik ----
	fight_tactic					= FAI_MONSTER_COWARD;
	
	B_SetVisuals_Wolf();
	Mdl_SetModelScale(self, 0.9, 0.9, 0.9);
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);

	aivar[AIV_MM_RoamStart] 	= 6;	
	aivar[AIV_MM_RoamEnd]		= 22;
	aivar[AIV_MM_SleepStart]	= 22;
	aivar[AIV_MM_SleepEnd]		= 6;
};

INSTANCE YWolf_Weg	(Mst_Default_Wolf)
{
	level							=	3;
	name							=	"Junger Wolf";
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	10;
	attribute	[ATR_HITPOINTS_MAX]	=	30;
	attribute	[ATR_HITPOINTS]		=	30;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	15000;
	protection	[PROT_EDGE]			=	15000;
	protection	[PROT_POINT]		=	1000;
	protection	[PROT_FIRE]			=	15;
	protection	[PROT_FLY]			=	15;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//----- Kampf-Taktik ----
	fight_tactic					= FAI_MONSTER_COWARD;
	
	B_SetVisuals_Wolf();
	Mdl_SetModelScale(self, 0.9, 0.9, 0.9);
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);

	aivar[AIV_MM_RoamStart] 	= 6;	
	aivar[AIV_MM_RoamEnd]		= 22;
	aivar[AIV_MM_SleepStart]	= 22;
	aivar[AIV_MM_SleepEnd]		= 6;
};

INSTANCE Balthi_YWolf1	(Mst_Default_Wolf)
{
	name							=	"Junger Wolf";
	level							=	3;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	15;
	attribute	[ATR_HITPOINTS_MAX]	=	30;
	attribute	[ATR_HITPOINTS]		=	30;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	15000;
	protection	[PROT_EDGE]			=	15000;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	15;
	protection	[PROT_FLY]			=	15;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);

	aivar[AIV_MM_RoamStart] 	= 6;	
	aivar[AIV_MM_RoamEnd]		= 22;
	aivar[AIV_MM_SleepStart]	= 22;
	aivar[AIV_MM_SleepEnd]		= 6;
};

INSTANCE Balthi_YWolf2	(Mst_Default_Wolf)
{
	name							=	"Junger Wolf";
	level							=	3;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	15;
	attribute	[ATR_HITPOINTS_MAX]	=	30;
	attribute	[ATR_HITPOINTS]		=	30;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	15000;
	protection	[PROT_EDGE]			=	15000;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	15;
	protection	[PROT_FLY]			=	15;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);

	aivar[AIV_MM_RoamStart] 	= 6;	
	aivar[AIV_MM_RoamEnd]		= 22;
	aivar[AIV_MM_SleepStart]	= 22;
	aivar[AIV_MM_SleepEnd]		= 6;
};

INSTANCE Balthi_YWolf3	(Mst_Default_Wolf)
{
	name							=	"Junger Wolf";
	level							=	3;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	15;
	attribute	[ATR_HITPOINTS_MAX]	=	30;
	attribute	[ATR_HITPOINTS]		=	30;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	15000;
	protection	[PROT_EDGE]			=	15000;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	15;
	protection	[PROT_FLY]			=	15;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);

	aivar[AIV_MM_RoamStart] 	= 6;	
	aivar[AIV_MM_RoamEnd]		= 22;
	aivar[AIV_MM_SleepStart]	= 22;
	aivar[AIV_MM_SleepEnd]		= 6;
};