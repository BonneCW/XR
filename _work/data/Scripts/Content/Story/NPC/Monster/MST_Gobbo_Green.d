// *********************
// Gobbo_Green Prototype
// *********************

prototype Mst_Default_Gobbo_Green (C_NPC)			
{
	// ------ Monster -----
	name							=	"Goblin";
	guild							=	GIL_GOBBO;
	aivar[AIV_MM_REAL_ID]			= 	ID_GOBBO_GREEN;
	level							=	4;
	
	// ------ Attribute ------
	attribute	[ATR_STRENGTH]		=	20;
	attribute	[ATR_DEXTERITY]		=	5;
	attribute	[ATR_HITPOINTS_MAX]	=	20;
	attribute	[ATR_HITPOINTS]		=	20;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	// ------ Protection ------
	protection	[PROT_BLUNT]		=	20000;
	protection	[PROT_EDGE]			=	20000;
	protection	[PROT_POINT]		=	20000;
	protection	[PROT_FIRE]			=	20;
	protection	[PROT_FLY]			=	20;
	protection	[PROT_MAGIC]		=	0;

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

prototype Mst_Default_YGobbo_Green (C_NPC)
{
	name	= "Junger Goblin";
	guild							=	GIL_GOBBO;
	aivar[AIV_MM_REAL_ID]			= 	ID_GOBBO_GREEN;
	level							=	2;
	
	// ------ Attribute ------
	attribute	[ATR_STRENGTH]		=	10;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	20;
	attribute	[ATR_HITPOINTS]		=	20;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	// ------ Protection ------
	protection	[PROT_BLUNT]		=	10000;
	protection	[PROT_EDGE]			=	10000;
	protection	[PROT_POINT]		=	10000;
	protection	[PROT_FIRE]			=	10;
	protection	[PROT_FLY]			=	10;
	protection	[PROT_MAGIC]		=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	// ------ Damage Types ------						//entweder EIN damagetype oder mehrere damage[x], die dann addiert werden und getrennten Rüstungsabzug bekommen
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

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
	
	// ------ Attribute ------

	fight_tactic	=	FAI_MONSTER_COWARD;
};

prototype Mst_Default_Matrone (C_NPC)			
{	
	name							=	"Goblin-Matrone";
	guild							=	GIL_GOBBO;
	aivar[AIV_MM_REAL_ID]			= 	ID_GOBBO_GREEN;
	level							=	8;
	
	// ------ Attribute ------
	attribute	[ATR_STRENGTH]		=	125;
	attribute	[ATR_DEXTERITY]		=	35;
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;
	
	// ------ Protection ------
	protection	[PROT_BLUNT]		=	90000;
	protection	[PROT_EDGE]			=	90000;
	protection	[PROT_POINT]		=	90000;
	protection	[PROT_FIRE]			=	60;
	protection	[PROT_FLY]			=	40;
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

func void B_SetVisuals_Gobbo_Green()
{
	Mdl_SetVisual			(self,	"Gobbo.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gob_Body",		0,			DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Gobbo_Matrone()
{
	Mdl_SetVisual			(self,	"Gobbo.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gob_Body",		5,			DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Menschenfresser()
{
	Mdl_SetVisual			(self,	"Gobbo.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gob_Body",		6,			DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


// ***********
// Green Gobbo
// ***********

INSTANCE Gobbo_Green (Mst_Default_Gobbo_Green)
{
	B_SetVisuals_Gobbo_Green();
	
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};

INSTANCE Gobbo_Green_Mario_01 (Mst_Default_Gobbo_Green)
{
	B_SetVisuals_Gobbo_Green();
	
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};

INSTANCE Gobbo_Green_Mario_02 (Mst_Default_Gobbo_Green)
{
	B_SetVisuals_Gobbo_Green();
	
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};

INSTANCE Gobbo_Green_Mario_03 (Mst_Default_Gobbo_Green)
{
	B_SetVisuals_Gobbo_Green();
	
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};

INSTANCE Gobbo_Green_Mario_04 (Mst_Default_Gobbo_Green)
{
	B_SetVisuals_Gobbo_Green();
	
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};

INSTANCE Gobbo_Green_Mario_05 (Mst_Default_Gobbo_Green)
{
	B_SetVisuals_Gobbo_Green();
	
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};

INSTANCE Gobbo_Green_Mario_06 (Mst_Default_Gobbo_Green)
{
	B_SetVisuals_Gobbo_Green();
	
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};

INSTANCE Gobbo_Matrone (Mst_Default_Matrone)
{
	B_SetVisuals_Gobbo_Matrone();

	Mdl_SetModelScale(self, 1.2, 1.2, 1.2);
	
	Npc_SetToFightMode (self, ItMw_Matronenkeule); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};

INSTANCE Gobbo_Matrone_01 (Mst_Default_Gobbo_Green)
{
	B_SetVisuals_Gobbo_Matrone();

	Mdl_SetModelScale(self, 1.2, 1.2, 1.2);
	
	Npc_SetToFightMode (self, ItMw_Matronenkeule); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};

INSTANCE Gobbo_Matrone_02 (Mst_Default_Gobbo_Green)
{
	B_SetVisuals_Gobbo_Matrone();

	Mdl_SetModelScale(self, 1.2, 1.2, 1.2);
	
	Npc_SetToFightMode (self, ItMw_Matronenkeule); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};

INSTANCE Gobbo_Matrone_03 (Mst_Default_Gobbo_Green)
{
	B_SetVisuals_Gobbo_Matrone();

	Mdl_SetModelScale(self, 1.2, 1.2, 1.2);
	
	Npc_SetToFightMode (self, ItMw_Matronenkeule); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};

INSTANCE Gobbo_Matrone_04 (Mst_Default_Gobbo_Green)
{
	B_SetVisuals_Gobbo_Matrone();

	Mdl_SetModelScale(self, 1.2, 1.2, 1.2);
	
	Npc_SetToFightMode (self, ItMw_Matronenkeule); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};

INSTANCE Gobbo_Matrone_Summoned (Mst_Default_Matrone)
{
	name		= "Beschworene Goblin-Matrone";
	level = 0;

	B_SetVisuals_Gobbo_Matrone();

	Mdl_SetModelScale(self, 1.2, 1.2, 1.2);
	
	Npc_SetToFightMode (self, ItMw_Matronenkeule); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};

INSTANCE Menschenfresser (Mst_Default_Gobbo_Green)
{
	name							=	"Menschenfresser";
	level							=	16;
	
	// ------ Attribute ------
	attribute	[ATR_STRENGTH]		=	80;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	160;
	attribute	[ATR_HITPOINTS]		=	160;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	// ------ Protection ------
	protection	[PROT_BLUNT]		=	80000;
	protection	[PROT_EDGE]			=	80000;
	protection	[PROT_POINT]		=	80000;
	protection	[PROT_FIRE]			=	80;
	protection	[PROT_FLY]			=	80;
	protection	[PROT_MAGIC]		=	30;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	B_SetVisuals_Menschenfresser();

	Mdl_SetModelScale(self, 1.2, 1.2, 1.2);
	
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};

// *****************
// Young Green Gobbo
// *****************

INSTANCE YGobbo_Green (Mst_Default_YGobbo_Green)
{
	B_SetVisuals_Gobbo_Green();
	
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};

INSTANCE Gobbo_Fester_01 (Mst_Default_Gobbo_Green)
{
	name	= "Junger Goblin";

	level							=	2;
	
	// ------ Attribute ------
	attribute	[ATR_STRENGTH]		=	10;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	20;
	attribute	[ATR_HITPOINTS]		=	20;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	// ------ Protection ------
	protection	[PROT_BLUNT]		=	10000;
	protection	[PROT_EDGE]			=	10000;
	protection	[PROT_POINT]		=	10000;
	protection	[PROT_FIRE]			=	10;
	protection	[PROT_FLY]			=	10;
	protection	[PROT_MAGIC]		=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	// ------ Attribute ------

	fight_tactic	=	FAI_MONSTER_COWARD;

	B_SetVisuals_Gobbo_Green();
	
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};

INSTANCE Gobbo_Fester_02 (Mst_Default_Gobbo_Green)
{
	name	= "Junger Goblin";

	level							=	2;
	
	// ------ Attribute ------
	attribute	[ATR_STRENGTH]		=	10;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	20;
	attribute	[ATR_HITPOINTS]		=	20;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	// ------ Protection ------
	protection	[PROT_BLUNT]		=	10000;
	protection	[PROT_EDGE]			=	10000;
	protection	[PROT_POINT]		=	10000;
	protection	[PROT_FIRE]			=	10;
	protection	[PROT_FLY]			=	10;
	protection	[PROT_MAGIC]		=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	// ------ Attribute ------

	fight_tactic	=	FAI_MONSTER_COWARD;

	B_SetVisuals_Gobbo_Green();
	
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};

INSTANCE Gobbo_Fester_03 (Mst_Default_Gobbo_Green)
{
	name	= "Junger Goblin";

	level							=	2;
	
	// ------ Attribute ------
	attribute	[ATR_STRENGTH]		=	10;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	20;
	attribute	[ATR_HITPOINTS]		=	20;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	// ------ Protection ------
	protection	[PROT_BLUNT]		=	10000;
	protection	[PROT_EDGE]			=	10000;
	protection	[PROT_POINT]		=	10000;
	protection	[PROT_FIRE]			=	10;
	protection	[PROT_FLY]			=	10;
	protection	[PROT_MAGIC]		=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	// ------ Attribute ------

	fight_tactic	=	FAI_MONSTER_COWARD;

	B_SetVisuals_Gobbo_Green();
	
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};

INSTANCE Gobbo_Fester_04 (Mst_Default_Gobbo_Green)
{
	name	= "Junger Goblin";

	level							=	2;
	
	// ------ Attribute ------
	attribute	[ATR_STRENGTH]		=	10;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	20;
	attribute	[ATR_HITPOINTS]		=	20;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	// ------ Protection ------
	protection	[PROT_BLUNT]		=	10000;
	protection	[PROT_EDGE]			=	10000;
	protection	[PROT_POINT]		=	10000;
	protection	[PROT_FIRE]			=	10;
	protection	[PROT_FLY]			=	10;
	protection	[PROT_MAGIC]		=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	// ------ Attribute ------

	fight_tactic	=	FAI_MONSTER_COWARD;

	B_SetVisuals_Gobbo_Green();
	
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};