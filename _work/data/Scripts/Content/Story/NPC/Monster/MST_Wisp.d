//********************
//	Wisp Prototype
//********************

PROTOTYPE Mst_Default_Wisp(C_Npc)
{
	//----- Monster -----
	name							=	"Irrlicht";
	guild							=	GIL_BLOODFLY;
	aivar[AIV_MM_REAL_ID]			= 	ID_WISP;
	level							=	4;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	75;
	attribute	[ATR_DEXTERITY]		=	5;
	attribute	[ATR_HITPOINTS_MAX]	=	40; 
	attribute	[ATR_HITPOINTS]		=	40;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;
	
	//----- Ptotection ----
	protection	[PROT_BLUNT]		=	1000;
	protection	[PROT_EDGE]			=	1000;
	protection	[PROT_POINT]		=	1000;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//----- Damage Types ----	
	damagetype 						=	DAM_MAGIC;
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

//******************
//		Visuals
//******************

func void B_SetVisuals_Wisp()
{
	Mdl_SetVisual			(self,	"Irrlicht.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Irrlicht_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

//*************
//	Irrlicht   
//*************

INSTANCE Wisp (Mst_Default_Wisp)
{
	B_SetVisuals_Wisp();
	Npc_SetToFistMode(self);
};

INSTANCE Wisp_Zelar_01 (Mst_Default_Wisp)
{
	B_SetVisuals_Wisp();
	Npc_SetToFistMode(self);
};

INSTANCE Wisp_Zelar_02 (Mst_Default_Wisp)
{
	B_SetVisuals_Wisp();
	Npc_SetToFistMode(self);
};

INSTANCE Wisp_Zelar_03 (Mst_Default_Wisp)
{
	B_SetVisuals_Wisp();
	Npc_SetToFistMode(self);
};

//*************
//	Irrlicht   
//*************

INSTANCE Wisp_Detector (Mst_Default_Wisp)
{
	level				=	0;
	npctype		= NPCTYPE_MAIN;
	B_SetVisuals_Wisp();
	senses_range	=	3000;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	Npc_SetToFistMode(self);
	aivar[AIV_NoFightParker]	= 	TRUE;
	start_aistate				= ZS_MM_Rtn_Summoned;
};

INSTANCE Wisp_Helper (Mst_Default_Wisp)
{
	level				=	0;
	npctype		= NPCTYPE_MAIN;
	B_SetVisuals_Wisp();
	senses_range	=	3000;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_Rtn_Summoned;
};

INSTANCE RuheloseSeele_01 (Mst_Default_Wisp)
{
	name		= "Ruhelose Seele";
	level				=	0;
	B_SetVisuals_Wisp();
	senses_range	=	0;
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_Rtn_Rest;
};

INSTANCE RuheloseSeele_02 (Mst_Default_Wisp)
{
	name		= "Ruhelose Seele";
	level				=	0;
	B_SetVisuals_Wisp();
	senses_range	=	0;
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_Rtn_Rest;
};

INSTANCE RuheloseSeele_03 (Mst_Default_Wisp)
{
	name		= "Ruhelose Seele";
	level				=	0;
	B_SetVisuals_Wisp();
	senses_range	=	0;
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_Rtn_Rest;
};

INSTANCE RuheloseSeele_04 (Mst_Default_Wisp)
{
	name		= "Ruhelose Seele";
	level				=	0;
	B_SetVisuals_Wisp();
	senses_range	=	0;
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_Rtn_Rest;
};

INSTANCE RuheloseSeele_05 (Mst_Default_Wisp)
{
	name		= "Ruhelose Seele";
	level				=	0;
	B_SetVisuals_Wisp();
	senses_range	=	0;
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_Rtn_Rest;
};

INSTANCE RuheloseSeele_06 (Mst_Default_Wisp)
{
	name		= "Ruhelose Seele";
	level				=	0;
	B_SetVisuals_Wisp();
	senses_range	=	0;
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_Rtn_Rest;
};

INSTANCE RuheloseSeele_07 (Mst_Default_Wisp)
{
	name		= "Ruhelose Seele";
	level				=	0;
	B_SetVisuals_Wisp();
	senses_range	=	0;
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_Rtn_Rest;
};

INSTANCE RuheloseSeele_08 (Mst_Default_Wisp)
{
	name		= "Ruhelose Seele";
	level				=	0;
	B_SetVisuals_Wisp();
	senses_range	=	0;
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_Rtn_Rest;
};

INSTANCE RuheloseSeele_09 (Mst_Default_Wisp)
{
	name		= "Ruhelose Seele";
	level				=	0;
	B_SetVisuals_Wisp();
	senses_range	=	0;
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_Rtn_Rest;
};