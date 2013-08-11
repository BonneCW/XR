prototype Mst_Default_Gobbo_Eis (C_NPC)			
{
	// ------ Monster -----
	name							=	"Eisgoblin";
	guild							=	GIL_GOBBO;
	aivar[AIV_MM_REAL_ID]			= 	ID_GOBBO_GREEN;
	level							=	14;
	
	// ------ Attribute ------
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	// ------ Protection ------
	protection	[PROT_BLUNT]		=	90000;
	protection	[PROT_EDGE]			=	90000;
	protection	[PROT_POINT]		=	90000;
	protection	[PROT_FIRE]			=	60;
	protection	[PROT_FLY]			=	60;
	protection	[PROT_MAGIC]		=	50;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	// ------ Damage Types ------						//entweder EIN damagetype oder mehrere damage[x], die dann addiert werden und getrennten Rüstungsabzug bekommen
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	// ------ Kampf-Taktik ------
	fight_tactic	=	FAI_GOBBO;
	
	// ------ senses & ranges ------
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_MM_Packhunter]	= TRUE;
	
	// ------ Daily Routine ------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;	
};


// *****************
// 		Visuals
// *****************

func void B_SetVisuals_Gobbo_Eis()
{
	Mdl_SetVisual			(self,	"Gobbo.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gob_Body",		4,			DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Gobbo_Eis_Schamane()
{
	Mdl_SetVisual			(self,	"Gobbo.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Goboscham_Body",		4,			DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
// ***********
// Green Gobbo
// ***********

INSTANCE Gobbo_Eis (Mst_Default_Gobbo_Eis)
{
	B_SetVisuals_Gobbo_Eis();
	
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};

INSTANCE Gobbo_Eis_Beschwoerer (Mst_Default_Gobbo_Eis)
{
	name		= "Dämonenbeschwörer";
	guild							=	GIL_GOBBO_SKELETON;

	B_SetVisuals_Gobbo_Eis_Schamane();

	level							=	30;
	
	// ------ Attribute ------
	attribute	[ATR_STRENGTH]		=	200;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	1000;
	attribute	[ATR_HITPOINTS]		=	1000;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	// ------ Protection ------
	protection	[PROT_BLUNT]		=	90000;
	protection	[PROT_EDGE]			=	90000;
	protection	[PROT_POINT]		=	90000;
	protection	[PROT_FIRE]			=	60;
	protection	[PROT_FLY]			=	60;
	protection	[PROT_MAGIC]		=	50;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};

INSTANCE Eisgoblin (Mst_Default_Gobbo_Eis)
{
	B_SetVisuals_Gobbo_Eis();
	
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};

INSTANCE Summoned_Gobbo_Eis (Mst_Default_Gobbo_Eis)
{
	name							= "Beschworenes Eisgoblin";
	guild							= GIL_SUMMONED_GOBBO_SKELETON;
	aivar[AIV_MM_REAL_ID]			= ID_SUMMONED_GOBBO_EIS;
	level							= 0;

	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_Gobbo_Eis();

	Npc_SetToFightMode (self, ItMw_1H_Bau_Mace); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};