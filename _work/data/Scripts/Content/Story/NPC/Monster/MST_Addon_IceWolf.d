//*************************
//	Eiswolf Prototype
//*************************

PROTOTYPE Mst_Default_Icewolf(C_Npc)			
{
	//----- Monster ----
	name							=	"Eiswolf";
	guild							=	GIL_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_Icewolf;
	level							=	12;		
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	Hlp_Random(61) + 90;	// 90 - 150
	attribute	[ATR_DEXTERITY]		=	Hlp_Random(21);		// 0 - 20
	attribute	[ATR_HITPOINTS_MAX]	=	Hlp_Random(201) + 150;	// 150 - 350
	attribute	[ATR_HITPOINTS]		=	attribute[ATR_HITPOINTS_MAX];
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 		=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	Hlp_Random(61)*1000 + 90000;	// 90 - 150
	protection	[PROT_EDGE]		=	Hlp_Random(61)*1000 + 90000;	// 90 - 150
	protection	[PROT_POINT]		=	Hlp_Random(41)*1000 + 50000;	// 50 - 90
	protection	[PROT_FIRE]		=	Hlp_Random(41) + 30;		// 30 - 70
	protection	[PROT_FLY]		=	50;
	protection	[PROT_MAGIC]		=	Hlp_Random(41) + 30;		// 30 - 70

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
};


//*************
//	Visuals
//*************


func void B_SetVisuals_Icewolf()
{
	Mdl_SetVisual			(self, "Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"SnoWol_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//************
//	Eiswolf
//************

INSTANCE Icewolf	(Mst_Default_Icewolf)
{
	B_SetVisuals_Icewolf();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);
};

INSTANCE Summoned_EisWolf	(Mst_Default_IceWolf)
{
	name							=	"Beschworener Eiswolf";
	guild							=	GIL_SUMMONED_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_SUMMONED_WOLF;
	level							=	0; //10	

	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_IceWolf();
	Npc_SetToFistMode(self);
};