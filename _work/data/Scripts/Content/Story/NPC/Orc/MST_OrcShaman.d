//****************************
//	Orc SHAMAN Prototype		
//****************************

PROTOTYPE Mst_Default_OrcShaman(C_Npc)			
{
	//----- Monster ----
	name							=	"Ork Schamane";
	guild							=	GIL_ORC;
	aivar[AIV_MM_REAL_ID]			= 	ID_ORCSHAMAN;
	voice							=	18;
	level							=	35;
	
	//----- Attributes ----	
	attribute	[ATR_STRENGTH]		=	100; //MIN 100! + ca. 70 Waffe
	attribute	[ATR_DEXTERITY]		=	170;
	attribute	[ATR_HITPOINTS_MAX]	=	350;
	attribute	[ATR_HITPOINTS]		=	350;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	130000;
	protection	[PROT_EDGE]			=	130000;
	protection	[PROT_POINT]		=	130000;
	protection	[PROT_FIRE]			=	130;
	protection	[PROT_FLY]			=	130;
	protection	[PROT_MAGIC]		=	65;
	
	//----- HitChances -----
	HitChance	[NPC_TALENT_1H]			= 60;
	HitChance	[NPC_TALENT_2H]			= 60;
	HitChance	[NPC_TALENT_BOW]		= 60;
	HitChance	[NPC_TALENT_CROSSBOW]	= 60;
	
	//----- Damage Types ----	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	fight_tactic	=	FAI_ORC;

	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE;
	senses_range	= 	PERC_DIST_ORC_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};

PROTOTYPE Mst_Default_OrcSlave(C_Npc)			
{
	name							=	"Orc Sklave";
	guild							=	GIL_FRIENDLY_ORC;
	level							=	15;
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	50;
	attribute	[ATR_DEXTERITY]		=	50;
	
	attribute	[ATR_HITPOINTS_MAX]	=	200;
	attribute	[ATR_HITPOINTS]		=	200;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	50000;
	protection	[PROT_EDGE]			=	50000;
	protection	[PROT_POINT]		=	25000;
	protection	[PROT_FIRE]			=	25;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;
//----------------------------------------------------------	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------
//---------------------------------------------------------
	fight_tactic					=	FAI_ORC;
//---------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

	//aivar[AIV_MM_Behaviour]		= ;
	
	//aivar[AIV_MM_PercRange]		= 1200;
	//aivar[AIV_MM_DrohRange]		= 1000;
	//aivar[AIV_MM_AttackRange]	= 700;
	//aivar[AIV_MM_DrohTime]		= 5;
	//aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	//aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};
//****************
//	Visuals
//****************

func void B_SetVisuals_OrcShaman()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Orc_BodyShaman",	DEFAULT,	DEFAULT,	"Orc_HeadShaman",	DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_OrcSlave()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Orc_BodySlave",	1,	1,	"Orc_HeadSlave",	1,  	1,	-1);
};
//****************
//	Orc Shaman    
//****************

INSTANCE Orc_Stonemill (Mst_Default_OrcSlave)
{
	//-------- visual --------
	B_SetVisuals_OrcSlave();
	guild							=	GIL_FRIENDLY_ORC;
	name			=	"Ork Sklave";

	//-------- inventory --------
	
	//----- Daily Routine ----
	start_aistate				= ZS_Orc_Stonemill;

	B_SetSchwierigkeit();
};

INSTANCE Orc_Stomper (Mst_Default_OrcSlave)
{
	//-------- visual --------
	B_SetVisuals_OrcSlave();
	guild							=	GIL_FRIENDLY_ORC;
	name			=	"Ork Sklave";

	//-------- inventory --------
	
	//----- Daily Routine ----
	start_aistate				= ZS_Orc_Stomper;

	B_SetSchwierigkeit();
};

INSTANCE OrcPeasantDance (Mst_Default_OrcSlave)
{
	//-------- general data --------
	guild			=	GIL_ORC;
	name			=	"Ork";

	//-------- visuals --------
	B_SetVisuals_OrcSlave();

	//-------- inventory --------

	//-------- ai --------
	start_aistate	= ZS_Orc_Dance;

	B_SetSchwierigkeit();

};

INSTANCE OrcPeasantDrum (Mst_Default_OrcSlave)
{
	//-------- general data --------
	guild			=	GIL_ORC;
	name			=	"Ork";

	//-------- visuals --------
	B_SetVisuals_OrcSlave();

	//-------- inventory --------

	//-------- ai --------
	start_aistate	= ZS_Orc_Drum;

	B_SetSchwierigkeit();

};

INSTANCE OrcShaman_Sit (Mst_Default_OrcShaman)
{
	// ------ visuals ------
	B_SetVisuals_OrcShaman();

	//-------- inventory --------
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcShaman_Pray (Mst_Default_OrcShaman)
{
	// ------ visuals ------
	B_SetVisuals_OrcShaman();
	
	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_Orc_Pray;

	B_SetSchwierigkeit();
};

//*********************
//	Hosh-Pak
//*********************

INSTANCE OrcShaman_Hosh_Pak (Mst_Default_OrcShaman)
{
	name							=	"Hosh-Pak";

	// ------ visuals ------
	B_SetVisuals_OrcShaman();
	
	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};
//****************
//	Orc Shaman    
//****************

INSTANCE OrcShaman_Sit_CanyonLibraryKey (Mst_Default_OrcShaman)
{
	name							=	"Anführer der Horde";
	// ------ visuals ------
	B_SetVisuals_OrcShaman();
	
	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	CreateInvItems (self, ITKE_CANYONLIBRARY_HIERARCHY_BOOKS_ADDON, 1);									
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

