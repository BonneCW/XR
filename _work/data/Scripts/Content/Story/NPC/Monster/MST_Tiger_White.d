PROTOTYPE Mst_Default_Tiger_Weiﬂ(C_Npc)			
{
	//----- Monster ----
	name							=	"Weiﬂer Tiger";
	guild							=	GIL_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_WOLF;
	level							=	300;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	300;
	attribute	[ATR_DEXTERITY]		=	30;
	attribute	[ATR_HITPOINTS_MAX]	=	500;
	attribute	[ATR_HITPOINTS]		=	500;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	180000;
	protection	[PROT_EDGE]			=	180000;
	protection	[PROT_POINT]		=	180000;
	protection	[PROT_FIRE]			=	90;
	protection	[PROT_FLY]			=	30;
	protection	[PROT_MAGIC]		=	90;

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

	aivar[AIV_MM_RoamStart] 	= 6;	
	aivar[AIV_MM_RoamEnd]		= 22;
	aivar[AIV_MM_SleepStart]	= 22;
	aivar[AIV_MM_SleepEnd]		= 6;

	if (Hlp_Random(100) < 15)
	{
		CreateInvItems (self, ItAt_GoblinBone, 1+Hlp_Random(3));
	};
	if (Hlp_Random(100) < 10)
	{
		CreateInvItems (self, ItAt_SkeletonBone, 1+Hlp_Random(2));
	};
};


//************
//	Visuals
//************


func void B_SetVisuals_Tiger_Weiﬂ()
{
	Mdl_SetVisual			(self,"Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//************
//	Weiﬂer Tiger    	
//************

INSTANCE Tiger_Weiﬂ	(Mst_Default_Tiger_Weiﬂ)
{
	B_SetVisuals_Tiger_Weiﬂ();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
	CreateInvItems	(self, ItAt_TigerFur, 1);

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	Mdl_SetModelFatness(self,5);
};