/*************************************************************************
**	Stoneguardian Prototype												**
*************************************************************************/

prototype Mst_Addon_Stoneguardian	(C_NPC)
{
	//----- Monster ----
	name							= "Steinwächter";
	guild							= GIL_STONEGUARDIAN;
	aivar[AIV_MM_REAL_ID]			= ID_STONEGUARDIAN;
	level							= 18;
	
	bodyStateInterruptableOverride  = TRUE;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	Hlp_Random(101) + 150;	// 150 - 250
	attribute	[ATR_DEXTERITY]		=	Hlp_Random(21);		// 0 - 20
	attribute	[ATR_HITPOINTS_MAX]	=	Hlp_Random(201) + 300;	// 300 - 500
	attribute	[ATR_HITPOINTS]		=	attribute[ATR_HITPOINTS_MAX];
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 		=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		= Hlp_Random(61)*1000 + 20000;		// 20 - 80
	protection	[PROT_EDGE]		= Hlp_Random(101)*1000 + 100000;	// 100 - 200
	protection	[PROT_POINT]		= Hlp_Random(101)*1000 + 100000; 	// 100 - 200
	protection	[PROT_FIRE]		= Hlp_Random(101) + 100;		// 100 - 200
	protection	[PROT_FLY]		= 150;
	protection	[PROT_MAGIC]		= Hlp_Random(61) + 80;			// 80 - 140

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
		
	//----- Damage Types ----
	damagetype 						=	DAM_BLUNT;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_STONEGUARDIAN;	
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	Npc_SetToFistMode(self);
};


//***************
//	Visuals
//***************

func void B_SetVisuals_Stoneguardian()
{
	Mdl_SetVisual			(self,"StoneGuardian.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"StG_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Erzguardian()
{
	Mdl_SetVisual			(self,"StoneGuardian.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"EStG_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

//**************************************************************
//	Beschworener Steinwächter	
//**************************************************************

INSTANCE Summoned_Guardian	(Mst_Addon_Stoneguardian)
{
	name							= NAME_Addon_Summoned_Guardian;
	guild							= GIL_SUMMONEDGuardian;
	aivar[AIV_MM_REAL_ID]			= ID_SUMMONEDGuardian;
	level							=	0;	//30

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
		
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_Stoneguardian ();
};

//**************************************************************
//	Steinwächter	
//**************************************************************


INSTANCE Stoneguardian	(Mst_Addon_Stoneguardian)
{
	B_SetVisuals_Stoneguardian ();
};

INSTANCE Stoneguardian_AdanosTempel	(Mst_Addon_Stoneguardian)
{
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	Hlp_Random(101) + 200;	// 200 - 300
	attribute	[ATR_DEXTERITY]		=	Hlp_Random(26);		// 0 - 25
	attribute	[ATR_HITPOINTS_MAX]	=	Hlp_Random(201) + 500;	// 500 - 700
	attribute	[ATR_HITPOINTS]		=	attribute[ATR_HITPOINTS_MAX];
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 		=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		= Hlp_Random(61)*1000 + 40000;		// 40 - 100
	protection	[PROT_EDGE]		= Hlp_Random(101)*1000 + 130000;	// 130 - 230
	protection	[PROT_POINT]		= Hlp_Random(101)*1000 + 130000; 	// 130 - 230
	protection	[PROT_FIRE]		= Hlp_Random(101) + 130;		// 130 - 230
	protection	[PROT_FLY]		= 150;
	protection	[PROT_MAGIC]		= Hlp_Random(61) + 100;			// 100 - 160

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	B_SetVisuals_Stoneguardian ();
};

INSTANCE Stoneguardian_Bergwelt	(Mst_Addon_Stoneguardian)
{
	B_SetVisuals_Stoneguardian ();
};

INSTANCE Erzguardian	(Mst_Addon_Stoneguardian)
{
	name = "Erzwächter";

	B_SetVisuals_Erzguardian ();

	if (Hlp_Random(100) < 40)
	{
		CreateInvItems (self, ItMi_Nugget, 1+Hlp_Random(3));
	};
};

INSTANCE Erzguardian_Special_01	(Mst_Addon_Stoneguardian)
{
	name = "Erzwächter";

	B_SetVisuals_Erzguardian ();

	if (Hlp_Random(100) < 40)
	{
		CreateInvItems (self, ItMi_Nugget, 1+Hlp_Random(3));
	};
};

INSTANCE Stoneguardian_Giant	(Mst_Addon_Stoneguardian)
{
	B_SetVisuals_Stoneguardian ();

	level							= 23;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	270; 
	attribute	[ATR_DEXTERITY]		=	200;
	attribute	[ATR_HITPOINTS_MAX]	=	1000;
	attribute	[ATR_HITPOINTS]		=	1000;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		= 80000;
	protection	[PROT_EDGE]			= 180000;
	protection	[PROT_POINT]		= 180000; 
	protection	[PROT_FIRE]			= 180;
	protection	[PROT_FLY]			= 180;
	protection	[PROT_MAGIC]		= 140;	

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	Mdl_SetModelScale(self, 3.0, 3.0, 3.0);
};