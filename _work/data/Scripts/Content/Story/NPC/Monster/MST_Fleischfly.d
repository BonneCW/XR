//********************
//	Bloodfly Prototype
//********************

PROTOTYPE Mst_Default_Fleischfly(C_Npc)			
{
	//----- Monster -----
	name							=	"Fleischfliege";
	guild							=	GIL_BLOODFLY;
	aivar[AIV_MM_REAL_ID]			= 	ID_FLEISCHFLY;
	level							=	6;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	Hlp_Random(21) + 10;	// 10 - 30
	attribute	[ATR_DEXTERITY]		=	Hlp_Random(11);		// 0 - 10
	attribute	[ATR_HITPOINTS_MAX]	=	Hlp_Random(41) + 20; 	// 20 - 60
	attribute	[ATR_HITPOINTS]		=	attribute[ATR_HITPOINTS_MAX];
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 		=	0;
	
	//----- Ptotection ----
	protection	[PROT_BLUNT]		=	Hlp_Random(21)*1000 + 10000;	// 10 - 30
	protection	[PROT_EDGE]		=	Hlp_Random(21)*1000 + 10000;	// 10 - 30
	protection	[PROT_POINT]		=	Hlp_Random(21)*1000 + 10000;	// 10 - 30
	protection	[PROT_FIRE]		=	Hlp_Random(21) + 10;		// 10 - 30
	protection	[PROT_FLY]		=	20;
	protection	[PROT_MAGIC]		=	Hlp_Random(6);

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//----- Damage Types ----	
	damagetype 						=	DAM_POINT;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
	
	//----- Kampf-Taktik ----
	fight_tactic	= 	FAI_BLOODFLY;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= FALSE;
	
	//----- Daily Routine ----	
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_WuselStart] 	= OnlyRoutine;	
};

PROTOTYPE Mst_Default_YFleischfly(C_Npc)			
{
	//----- Monster -----
	name							=	"Kleine Fleischfliege";
	guild							=	GIL_BLOODFLY;
	aivar[AIV_MM_REAL_ID]			= 	ID_FLEISCHFLY;
	level							=	3;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	Hlp_Random(16) + 7;	// 7 - 23
	attribute	[ATR_DEXTERITY]		=	Hlp_Random(6);		// 0 - 5
	attribute	[ATR_HITPOINTS_MAX]	=	Hlp_Random(25) + 12;	// 12 - 37
	attribute	[ATR_HITPOINTS]		=	attribute[ATR_HITPOINTS_MAX];
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 		=	0;
	
	//----- Ptotection ----
	protection	[PROT_BLUNT]		=	Hlp_Random(15)*1000 + 1000;	// 0 - 15
	protection	[PROT_EDGE]		=	Hlp_Random(15)*1000 + 1000;	// 0 - 15
	protection	[PROT_POINT]		=	Hlp_Random(15)*1000 + 1000;	// 0 - 15
	protection	[PROT_FIRE]		=	Hlp_Random(15);			// 0 - 15
	protection	[PROT_FLY]		=	10;
	protection	[PROT_MAGIC]		=	Hlp_Random(6);			// 0 - 5

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//----- Damage Types ----	
	damagetype 						=	DAM_POINT;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
	
	//----- Kampf-Taktik ----
	fight_tactic	= 	FAI_BLOODFLY;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= FALSE;
	
	//----- Daily Routine ----	
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_WuselStart] 	= OnlyRoutine;	
};

func void B_SetVisuals_Fleischfly()
{
	Mdl_SetVisual			(self,	"Bloodfly.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Blo_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

INSTANCE Fleischfly	(Mst_Default_Fleischfly)
{
	B_SetVisuals_Fleischfly();
	Npc_SetToFistMode(self);
};

INSTANCE YFleischfly	(Mst_Default_YFleischfly)
{
	B_SetVisuals_Fleischfly();
	Mdl_SetModelScale(self, 0.9, 0.9, 0.9);
	Npc_SetToFistMode(self);
};

INSTANCE YFleischfly_Weg	(Mst_Default_YFleischfly)
{
	B_SetVisuals_Fleischfly();
	Mdl_SetModelScale(self, 0.9, 0.9, 0.9);
	Npc_SetToFistMode(self);
};