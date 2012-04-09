//*********************************
//	Undead Orc Warrior Prototype	
//*********************************

PROTOTYPE Mst_Default_UndeadOrcWarrior (C_Npc)			
{
	//----- Monster ----
	name							=	"Untoter Ork";
	guild							=	GIL_UNDEADORC;
	aivar[AIV_MM_REAL_ID]			= 	ID_UNDEADORCWARRIOR;
	level							=	40;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	100; //+100 Waffe //MIN 120!
	attribute	[ATR_DEXTERITY]		=	200; 
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_MANA_MAX] 		=	500;
	attribute	[ATR_MANA] 			=	500;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	150000;
	protection	[PROT_EDGE]			=	150000;
	protection	[PROT_POINT]		=	150000;
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	0;
	
	//----- HitChances -----
	HitChance	[NPC_TALENT_1H]			= 80;
	HitChance	[NPC_TALENT_2H]			= 80;
	HitChance	[NPC_TALENT_BOW]		= 80;
	HitChance	[NPC_TALENT_CROSSBOW]	= 80;

	//----- Damage Types -----	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf Taktik ----
	fight_tactic	=	FAI_ORC;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
		
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};


//*************
//	Visuals
//*************

func void B_SetVisuals_UndeadOrcWarrior()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"UOW_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_UndeadOrcPriest()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"UOS2_Body",		0,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
/*************************************************************************
**	Orc Warrior Undead    												**
*************************************************************************/

INSTANCE UndeadOrcWarrior (Mst_Default_UndeadOrcWarrior)
{
	// ------ visuals ------
	B_SetVisuals_UndeadOrcWarrior();
	
	// ------ Inventory ------
	EquipItem (self, ItMw_2H_OrcAxe_02);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE UndeadOrcPriest (Mst_Default_UndeadOrcWarrior)
{
	// ------ visuals ------
	B_SetVisuals_UndeadOrcPriest();
	
	// ------ Inventory ------
	EquipItem (self, ItMw_2H_OrcAxe_02);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE UndeadOWH (Mst_Default_UndeadOrcWarrior)
{
	name							=	"Hoher Tempelwächter";
	level							=	70;

	attribute	[ATR_STRENGTH]		=	150;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	170000;
	protection	[PROT_EDGE]			=	170000;
	protection	[PROT_POINT]		=	170000;
	protection	[PROT_FIRE]			=	170;
	protection	[PROT_FLY]			=	170;
	protection	[PROT_MAGIC]		=	50;
	
	B_SetVisuals_UndeadOrcWarrior();
	EquipItem 				(self, ItMw2hOrcMace01);

	fight_tactic					=	FAI_ORC;

	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};


INSTANCE UndeadOrc_OGY_01 (Mst_Default_UndeadOrcWarrior)
{
	// ------ visuals ------
	B_SetVisuals_UndeadOrcWarrior();
	
	// ------ Inventory ------
	EquipItem (self, ItMw_2H_OrcAxe_02);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE UndeadOrc_OGY_02 (Mst_Default_UndeadOrcWarrior)
{
	// ------ visuals ------
	B_SetVisuals_UndeadOrcWarrior();
	
	// ------ Inventory ------
	EquipItem (self, ItMw_2H_OrcAxe_02);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE UndeadOrc_OGY_03 (Mst_Default_UndeadOrcWarrior)
{
	// ------ visuals ------
	B_SetVisuals_UndeadOrcWarrior();
	
	// ------ Inventory ------
	EquipItem (self, ItMw_2H_OrcAxe_02);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE UndeadOrc_OGY_04 (Mst_Default_UndeadOrcWarrior)
{
	// ------ visuals ------
	B_SetVisuals_UndeadOrcWarrior();
	
	// ------ Inventory ------
	EquipItem (self, ItMw_2H_OrcAxe_02);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};


INSTANCE UndeadOrcWarrior_Geiselwache_01 (Mst_Default_UndeadOrcWarrior)
{
	// ------ visuals ------
	B_SetVisuals_UndeadOrcWarrior();
	
	// ------ Inventory ------
	EquipItem (self, ItMw_2H_OrcAxe_02);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE UndeadOrcWarrior_Geiselwache_02 (Mst_Default_UndeadOrcWarrior)
{
	// ------ visuals ------
	B_SetVisuals_UndeadOrcWarrior();
	
	// ------ Inventory ------
	EquipItem (self, ItMw_2H_OrcAxe_02);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE UndeadOrcWarrior_Geiselwache_03 (Mst_Default_UndeadOrcWarrior)
{
	// ------ visuals ------
	B_SetVisuals_UndeadOrcWarrior();
	
	// ------ Inventory ------
	EquipItem (self, ItMw_2H_OrcAxe_02);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE UndeadOrcWarrior_Geiselwache_04 (Mst_Default_UndeadOrcWarrior)
{
	// ------ visuals ------
	B_SetVisuals_UndeadOrcWarrior();
	
	// ------ Inventory ------
	EquipItem (self, ItMw_2H_OrcAxe_02);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE UndeadOrcWarrior_Geiselwache_05 (Mst_Default_UndeadOrcWarrior)
{
	// ------ visuals ------
	B_SetVisuals_UndeadOrcWarrior();
	
	// ------ Inventory ------
	EquipItem (self, ItMw_2H_OrcAxe_02);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE UndeadOrcWarrior_Geiselwache_06 (Mst_Default_UndeadOrcWarrior)
{
	// ------ visuals ------
	B_SetVisuals_UndeadOrcWarrior();
	
	// ------ Inventory ------
	EquipItem (self, ItMw_2H_OrcAxe_02);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};