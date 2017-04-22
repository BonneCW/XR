//***************************
//	Demon LORD Prototype	
//***************************

PROTOTYPE Mst_Default_DemonLord(C_Npc)			
{
	//----- Monster -----
	name							= "Dämonenlord";
	guild							= GIL_DEMON;
	aivar[AIV_MM_REAL_ID]			= ID_DEMON_LORD;
	level							= 150;
	
	//------ Attribute ----	
	attribute	[ATR_STRENGTH]		= Hlp_Random(101) + 150;	// 150 - 250
	attribute	[ATR_DEXTERITY]		= Hlp_Random(21) + 30;		// 30 - 50
	attribute	[ATR_HITPOINTS_MAX]	= Hlp_Random(201) + 650;	// 650 - 850
	attribute	[ATR_HITPOINTS]		= attribute[ATR_HITPOINTS_MAX];
	attribute	[ATR_MANA_MAX] 		= 200;
	attribute	[ATR_MANA] 		= 200;
	
	//------ Protections ----
	protection	[PROT_BLUNT]		= Hlp_Random(101)*1000 + 125000;	// 125 - 225
	protection	[PROT_EDGE]		= Hlp_Random(101)*1000 + 125000;	// 125 - 225
	protection	[PROT_POINT]		= Hlp_Random(101)*1000 + 125000;	// 125 - 225
	protection	[PROT_FIRE]		= Hlp_Random(101) + 125;	// 125 - 225		
	protection	[PROT_FLY]		= 150;	
	protection	[PROT_MAGIC]		= Hlp_Random(101) + 125;	// 125 - 225

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

func void B_SetVisuals_DemonLord()
{
	Mdl_SetVisual			(self,	"Demon.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dem2_Body",	1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_DemonHigh()
{
	Mdl_SetVisual			(self,	"Demon.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dem2_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//****************
//	DemonLord    														
//****************

INSTANCE DemonLord	(Mst_Default_DemonLord)
{
	B_SetVisuals_DemonLord();
	Npc_SetToFistMode(self);
};

INSTANCE DemonLord_Xeres	(Mst_Default_DemonLord)
{
	name		= "Xeres";

	attribute	[ATR_STRENGTH]		= 400;
	attribute	[ATR_HITPOINTS_MAX]	= 1000;
	attribute	[ATR_HITPOINTS]		= 1000;

	B_SetVisuals_DemonLord();
	Npc_SetToFistMode(self);
};

INSTANCE DemonHigh	(Mst_Default_DemonLord)
{
	name	=	"Hoher Dämon";

	level	=	200;

	B_SetVisuals_DemonHigh();
	Npc_SetToFistMode(self);
};

INSTANCE DemonHigh_Randolph	(Mst_Default_DemonLord)
{
	name	=	"Hoher Dämon";

	level	=	200;

	B_SetVisuals_DemonHigh();
	Npc_SetToFistMode(self);
};

INSTANCE DemonLord_Balrog	(Mst_Default_DemonLord)
{
	B_SetVisuals_DemonLord();
	Npc_SetToFistMode(self);
};