//******************************
//	Schwarzer Troll Prototype	
//******************************

PROTOTYPE Mst_Default_Troll_Black(C_Npc)			
{
	//----- Monster ----
	name							=	"Schwarzer Troll";
	guild							=	GIL_TROLL;
	aivar[AIV_MM_REAL_ID]			= 	ID_TROLL_BLACK;
	level							=	200; //40
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	300;
	attribute	[ATR_DEXTERITY]		=	50;
	attribute	[ATR_HITPOINTS_MAX]	=	4000;
	attribute	[ATR_HITPOINTS]		=	4000;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----	
	protection	[PROT_BLUNT]		=	200000;
	protection	[PROT_EDGE]			=	200000;
	protection	[PROT_POINT]		=	IMMUNE;	
	protection	[PROT_FIRE]			=	200;
	protection	[PROT_FLY]			=	IMMUNE;	
	protection	[PROT_MAGIC]		=	IMMUNE;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//------------------------------------------------------	
	damagetype 						=	DAM_FLY;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----	
	fight_tactic	=	FAI_TROLL;

	//----- Daily Routine ----	
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
	
	//***************************************************
	bodyStateInterruptableOverride 	= TRUE;
	//***************************************************

	if (Hlp_Random(100) < 15)
	{
		CreateInvItems (self, ItAt_GoblinBone, 1+Hlp_Random(3));
	};
	if (Hlp_Random(100) < 10)
	{
		CreateInvItems (self, ItAt_SkeletonBone, 1+Hlp_Random(2));
	};
};


//****************
//	Visuals
//****************



func void B_SetVisuals_Troll_Black()
{
	Mdl_SetVisual			(self,	"Troll.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Troll_Black_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Troll_Silber()
{
	Mdl_SetVisual			(self,	"Troll.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Troll_Black_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//************************
//	Schwarzer Troll    		
//************************
INSTANCE Troll_Black	(Mst_Default_Troll_Black)
{
	B_SetVisuals_Troll_Black();
	Npc_SetToFistMode(self);
};

INSTANCE BlackTrollTransform	(Mst_Default_Troll_Black)
{
	Npc_PercEnable (self, PERC_ASSESSSURPRISE , B_StopMagicTransform);
	B_SetVisuals_Troll_Black();
	Npc_SetToFistMode(self);
};

INSTANCE Troll_Silber	(Mst_Default_Troll_Black)
{
	name	= "Silbertroll";

	aivar[AIV_MM_REAL_ID]			= 	ID_TROLL_SILBER;
	level							=	300; //40
	//aivar[AIV_MaxDistToWp]			= 1000;
	//aivar[AIV_OriginalFightTactic] 	= FAI_TROLL;
	B_SetVisuals_Troll_Silber();
	Npc_SetToFistMode(self);

	attribute	[ATR_STRENGTH]		=	400;

	//----- Protections ----	
	protection	[PROT_BLUNT]		=	300000;
	protection	[PROT_EDGE]			=	300000;
	protection	[PROT_POINT]		=	IMMUNE;	
	protection	[PROT_FIRE]			=	300;
	protection	[PROT_FLY]			=	IMMUNE;	
	protection	[PROT_MAGIC]		=	250;

	CreateInvItems	(self, ItAt_TrollSilberFur, 1);
};