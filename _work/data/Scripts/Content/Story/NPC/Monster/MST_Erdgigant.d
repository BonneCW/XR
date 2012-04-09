//***************************
//	Erdgigant Prototype			
//***************************

PROTOTYPE Mst_Default_Erdgigant(C_Npc)			
{
	//----- Monster ----
	name							=	"Erdgewachsener Gigant";
	guild							=	GIL_STONEGOLEM;
	aivar[AIV_MM_REAL_ID]			= 	ID_ERDGIGANT;
	level							=	100;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	140;
	attribute	[ATR_DEXTERITY]		=	25;
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	150000;
	protection	[PROT_EDGE]			=	-1;
	protection	[PROT_POINT]		=	-1;
	protection	[PROT_FIRE]			=	-1;
	protection	[PROT_FLY]			=	-1;	
	protection	[PROT_MAGIC]		=	-1;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//---- Damage Types ----
	damagetype 						=	DAM_BLUNT;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_STONEGOLEM;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

//-------------------------------------------------------------
func void B_SetVisuals_Erdgigant()
{
	Mdl_SetVisual			(self,	"Golem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Erdgigant_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//******************
//	Stone Golem   	
//******************

INSTANCE Erdgigant	(Mst_Default_Erdgigant)
{
	B_SetVisuals_Erdgigant();
	Npc_SetToFistMode	(self);

	//Mdl_SetModelScale(self, 1.5, 1.5, 1.5);

	protection	[PROT_EDGE]			=	100000;
	protection	[PROT_BLUNT]			=	10000;
	protection	[PROT_POINT]		=	100000;
	protection	[PROT_FIRE]			=	-1;
	protection	[PROT_FLY]			=	-1;	
	protection	[PROT_MAGIC]		=	-1;
};