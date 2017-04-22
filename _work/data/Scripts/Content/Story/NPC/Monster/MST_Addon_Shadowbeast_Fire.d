////////////////////////////////////////////////////////////////////////////////
//
//	Shadowbeast_Addon_Fire
//

PROTOTYPE Mst_Default_Shadowbeast_Addon_Fire (C_Npc)			
{
	//----- Monster ----
	name							=	"Feuerteufel";
	guild							=	GIL_Gargoyle;
	aivar[AIV_MM_REAL_ID]			= 	ID_Gargoyle;
	level							=	30;

	flags	= NPC_FLAG_GHOST;

	effect	= "SPELLFX_FIREARMOR";
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		= Hlp_Random(101) + 150;	// 150 - 250
	attribute	[ATR_DEXTERITY]		= Hlp_Random(21) + 5;		// 5 - 25
	attribute	[ATR_HITPOINTS_MAX]	= Hlp_Random(301) + 250;	// 250 - 550
	attribute	[ATR_HITPOINTS]		= attribute[ATR_HITPOINTS_MAX];
	attribute	[ATR_MANA_MAX] 		= 0;
	attribute	[ATR_MANA] 		= 0;

	//----- Protections ----
	protection	[PROT_BLUNT]		= Hlp_Random(101)*1000 + 100000;	// 100 - 200
	protection	[PROT_EDGE]		= Hlp_Random(101)*1000 + 100000;	// 100 - 200
	protection	[PROT_POINT]		= Hlp_Random(101)*1000 + 150000;	// 150 - 250
	protection	[PROT_FIRE]		= -1;
	protection	[PROT_FLY]		= 150;
	protection	[PROT_MAGIC]		= Hlp_Random(51) + 50;			// 50 - 100

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	//----- Damage Types ----
	damagetype 						=	DAM_EDGE|DAM_FIRE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
	damage		[DAM_INDEX_EDGE]	=	(attribute[ATR_STRENGTH]*3)/5;
//	damage		[DAM_INDEX_POINT]	=	0;
	damage		[DAM_INDEX_FIRE]	=	(attribute[ATR_STRENGTH]*2)/5;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_GARGOYLE;

	//----- Senses & Ranges ----
	senses			= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_SleepStart] 	= 6;	
	aivar[AIV_MM_SleepEnd]		= 20;
	aivar[AIV_MM_RoamStart]		= 20;
	aivar[AIV_MM_RoamEnd]		= 6;
};

//***************
//	Visuals
//***************

func void B_SetVisuals_Shadowbeast_Fire ()
{
	Mdl_SetVisual			(self,"FireShadow.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self, "Shadowbeast_Skeleton_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

instance Shadowbeast_Fire (Mst_Default_Shadowbeast_Addon_Fire)
{
	B_SetVisuals_Shadowbeast_Fire();
	Npc_SetToFistMode(self);
};

instance Shadowbeast_Addon_Fire_CanyonLib (Mst_Default_Shadowbeast_Addon_Fire)
{
	B_SetVisuals_Shadowbeast_Fire();
	Npc_SetToFistMode(self);

	aivar[AIV_EnemyOverride] 		= TRUE;
	aivar[AIV_MaxDistToWp]			= 900; 
	aivar[AIV_OriginalFightTactic] 	= FAI_GARGOYLE;
};

instance Feuerteufel_Balrog (Mst_Default_Shadowbeast_Addon_Fire)
{
	B_SetVisuals_Shadowbeast_Fire();
	Npc_SetToFistMode(self);
};