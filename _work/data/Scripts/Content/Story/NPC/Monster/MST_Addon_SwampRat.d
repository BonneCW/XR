//***************************
//	Molerat Prototype	
//***************************

PROTOTYPE Mst_Default_Swamprat (C_Npc)			
{
	//----- Monster ----
	name							=	"Sumpfratte";
	guild							=	GIL_MOLERAT;
	aivar[AIV_MM_REAL_ID]			= 	ID_SWAMPRAT;
	level							=	12;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	Hlp_Random(41) + 40;	// 40 - 80
	attribute	[ATR_DEXTERITY]		=	Hlp_Random(21);		// 0 - 20
	attribute	[ATR_HITPOINTS_MAX]	=	Hlp_Random(81) + 80;	// 80 - 160
	attribute	[ATR_HITPOINTS]		=	attribute[ATR_HITPOINTS_MAX];
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 		=	0;

	//----- Protections ----	
	protection	[PROT_BLUNT]		=	Hlp_Random(41)*1000 + 40000;	// 40 - 80
	protection	[PROT_EDGE]		=	Hlp_Random(41)*1000 + 40000;	// 40 - 80
	protection	[PROT_POINT]		=	Hlp_Random(21)*1000;		// 0 - 20
	protection	[PROT_FIRE]		=	Hlp_Random(41) + 40;		// 40 - 80
	protection	[PROT_FLY]		=	60;
	protection	[PROT_MAGIC]		=	Hlp_Random(21);			// 0 - 20

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
	fight_tactic	=	FAI_MOLERAT;
	
	//----- Senses & Ranges ----	
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;

	CreateInvItems (self, ItFo_MuttonRaw, 2);
};


//*************
//	Visuals
//*************

func void B_SetVisuals_Swamprat ()
{
	Mdl_SetVisual			(self,	"Swamprat.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Swamprat_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//*****************
//	Molerat	
//*****************
INSTANCE Swamprat	(Mst_Default_Swamprat)
{
	B_SetVisuals_Swamprat();
	Npc_SetToFistMode(self);
};