//***************************
//	Kroete Prototype	
//***************************

PROTOTYPE Mst_Default_Kroete(C_Npc)			
{
	//----- Monster ----
	name							=	"Kröte";
	guild							=	GIL_MOLERAT;
	aivar[AIV_MM_REAL_ID]			= 	ID_Kroete;
	level							=	5;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	25;
	attribute	[ATR_DEXTERITY]		=	5;
	attribute	[ATR_HITPOINTS_MAX]	=	50;
	attribute	[ATR_HITPOINTS]		=	50;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	25000;
	protection	[PROT_EDGE]			=	25000;
	protection	[PROT_POINT]		=	25000;	
	protection	[PROT_FIRE]			=	25;
	protection	[PROT_FLY]			=	25;	
	protection	[PROT_MAGIC]		=	0;

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

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= 6;
	aivar[AIV_MM_RoamEnd]		= 22;
	aivar[AIV_MM_SleepStart]	= 22;
	aivar[AIV_MM_SleepEnd]		= 6;
};


//*************
//	Visuals
//*************

func void B_SetVisuals_Kroete()
{
	Mdl_SetVisual			(self,	"Molerat.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Mol_Body",		5,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

//*****************
//	Kroete	
//*****************
INSTANCE Kroete	(Mst_Default_Kroete)
{
	B_SetVisuals_Kroete();

	Npc_SetToFistMode(self);
};