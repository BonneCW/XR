//***************************
//	Demon LORD Prototype	
//***************************

PROTOTYPE Mst_Default_Balrog(C_Npc)			
{
	//----- Monster -----
	name							= "Balrog";
	guild							= GIL_TROLL;
	aivar[AIV_MM_REAL_ID]			= ID_BALROG;
	level							= 150;
	
	//------ Attribute ----	
	attribute	[ATR_STRENGTH]		= 300;
	attribute	[ATR_DEXTERITY]		= 40;
	attribute	[ATR_HITPOINTS_MAX]	= 1000;
	attribute	[ATR_HITPOINTS]		= 1000;
	attribute	[ATR_MANA_MAX] 		= 200;
	attribute	[ATR_MANA] 		= 200;
	
	//------ Protections ----
	protection	[PROT_BLUNT]		= 150000;
	protection	[PROT_EDGE]		= 150000;
	protection	[PROT_POINT]		= 150000;
	protection	[PROT_FIRE]		= IMMUNE;		
	protection	[PROT_FLY]		= 150;	
	protection	[PROT_MAGIC]		= 100;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//----- Damage Types -----
	damagetype 						=	DAM_EDGE|DAM_FIRE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//------ Fight-Tatik ----
	fight_tactic	=	FAI_DEMON;
	
	//------ Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] 	= FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};


//*****************
//	Visuals
//*****************

func void B_SetVisuals_Balrog()
{
	Mdl_SetVisual			(self,	"Balrog.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Balrog_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

//****************
//	Balrog    														
//****************

INSTANCE Balrog	(Mst_Default_Balrog)
{
	B_SetVisuals_Balrog();
	Npc_SetToFistMode(self);
};

INSTANCE Balrog_Xeres	(Mst_Default_Balrog)
{
	name		= "Xeres";

	attribute	[ATR_STRENGTH]		= 600;
	attribute	[ATR_HITPOINTS_MAX]	= 2000;
	attribute	[ATR_HITPOINTS]		= 2000;

	B_SetVisuals_Balrog();
	Npc_SetToFistMode(self);
};