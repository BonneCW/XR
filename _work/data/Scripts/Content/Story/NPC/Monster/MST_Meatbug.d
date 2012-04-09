//*************************
//	Meatbug Prototype
//*************************

PROTOTYPE Mst_Default_Meatbug(C_Npc)			
{
	//----- Monster ----
	name							=	"Fleischwanze";
	guild							=	GIL_MEATBUG;
	aivar[AIV_MM_REAL_ID]			= 	ID_MEATBUG;
	level							=	1;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	5;
	attribute	[ATR_DEXTERITY]		=	5;
	attribute	[ATR_HITPOINTS_MAX]	=	5;
	attribute	[ATR_HITPOINTS]		=	5;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	0;
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//----- Damage Types ----
	damagetype 						= 	DAM_EDGE;
	
	//----- Kampf-Taktik ----
//	fight_tactic					= ;		// kämpfen nicht!

	//----- Senses & Ranges ----
	Senses			= 	SENSE_SMELL|SENSE_SEE|SENSE_HEAR;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowInWater] = FALSE;

	//----- Daily Routine ----
	start_aistate					= ZS_MM_AllScheduler;
		
	aivar[AIV_MM_WuselStart] 		= OnlyRoutine;

	CreateInvItems (self, ItAt_MeatbugFlesh, 1);
};


//***********
//	Visuals
//***********

func void B_SetVisuals_Meatbug()
{
	Mdl_SetVisual			(self,	"Meatbug.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Mbg_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

};

func void B_SetVisuals_Stonebug()
{
	Mdl_SetVisual			(self,	"Meatbug.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sbg_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

};
//***************
//	Meatbug    	
//***************

INSTANCE Meatbug	(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};

INSTANCE Meatbug_KlosterTerrarium	(Mst_Default_Meatbug)
{
	flags = 2;

	B_SetVisuals_Meatbug();
};

INSTANCE Riesenbug	(Mst_Default_Meatbug)
{
	name	= "Riesenbug";

	guild = GIL_MINECRAWLER;

	level = 100;

	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	protection[PROT_EDGE] = 100000;
	protection[PROT_BLUNT] = 100000;
	protection[PROT_POINT] = 100000;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	B_SetVisuals_Meatbug();

	Mdl_SetModelScale(self, 5.0, 5.0, 5.0);
};

INSTANCE Stonebug	(Mst_Default_Meatbug)
{
	B_SetVisuals_Stonebug();
	
	name	=	"Steinwanze";
};

INSTANCE Meatbug_Edda_01	(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};

INSTANCE Meatbug_Edda_02	(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};

INSTANCE Meatbug_Edda_03	(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};

INSTANCE Meatbug_Edda_04	(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};

INSTANCE Meatbug_Edda_05	(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};

INSTANCE Meatbug_Edda_06	(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};

INSTANCE Meatbug_Edda_07	(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};

INSTANCE Meatbug_Edda_08	(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};

INSTANCE Meatbug_Edda_09	(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};

INSTANCE Meatbug_Edda_10	(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};

INSTANCE MeatbugTransform	(Mst_Default_Meatbug)
{
	Npc_PercEnable (self, PERC_ASSESSSURPRISE , B_StopMagicTransform);
	B_SetVisuals_Meatbug();
	Npc_SetToFistMode(self);
	attribute	[ATR_HITPOINTS_MAX]	=	50;
	attribute	[ATR_HITPOINTS]		=	50;
};
