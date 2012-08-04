//*************************
//	Fire Waran Prototype  
//*************************

PROTOTYPE Mst_Default_FireWaran(C_Npc)			
{
	//----- Monster ----
	name							=	"Feuerwaran";
	guild							=	GIL_WARAN;
	aivar[AIV_MM_REAL_ID]			= 	ID_FIREWARAN;
	level							=	30;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	Hlp_Random(51) + 125;
	attribute	[ATR_DEXTERITY]		=	Hlp_Random(11) + 15;
	attribute	[ATR_HITPOINTS_MAX]	=	Hlp_Random(101) + 250;
	attribute	[ATR_HITPOINTS]		=	attribute[ATR_HITPOINTS_MAX];
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 		=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	Hlp_Random(51)*1000 + 125000;
	protection	[PROT_EDGE]		=	Hlp_Random(51)*1000 + 125000;
	protection	[PROT_POINT]		=	Hlp_Random(51)*1000 + 125000;
	protection	[PROT_FIRE]		=	-1;
	protection	[PROT_FLY]		=	150;
	protection	[PROT_MAGIC]		=	Hlp_Random(51) + 50;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//----- Damage Types ----
	damagetype 				=	DAM_FIRE; //Opfer fängt an zu brennen
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_WARAN;

	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;

	if (Hlp_Random(100) < 15)
	{
		CreateInvItems (self, ItAt_GoblinBone, 1+Hlp_Random(3));
	};
	if (Hlp_Random(100) < 10)
	{
		CreateInvItems (self, ItAt_SkeletonBone, 1+Hlp_Random(2));
	};
};


//***********
//	Visuals
//***********

func void B_Setvisuals_FlameWaran()
{
	Mdl_SetVisual			(self,	"Waran.mds");
	Mdl_ApplyOverlayMds 	(self,	"Firewaran.mds");

	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"War_Fire_Body",1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_Setvisuals_FireWaran()
{
	Mdl_SetVisual			(self,	"Waran.mds");
	Mdl_ApplyOverlayMds 	(self,	"Firewaran.mds");

	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"War_Fire_Body",DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_Setvisuals_EisWaran()
{
	Mdl_SetVisual			(self,	"Waran.mds");
	Mdl_ApplyOverlayMds 	(self,	"Eiswaran.mds");

	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"War_Eis_Body",DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//*****************
//	Fire Waran    	
//*****************
INSTANCE DemonEchse_BK	(Mst_Default_FireWaran)
{
	name = "Dämonenechse";

	CreateInvItems	(self, ItAt_WaranFireTongue, 2);

	protection	[PROT_MAGIC]		=	0;

	B_SetVisuals_FlameWaran();
	Npc_SetToFistMode(self);
};

INSTANCE FireWaran	(Mst_Default_FireWaran)
{
	B_SetVisuals_FireWaran();
	Npc_SetToFistMode(self);
};

INSTANCE EisWaran	(Mst_Default_FireWaran)
{
	name	= "Eiswaran";

	protection	[PROT_FIRE]		=	0;
	damagetype 				=	DAM_MAGIC;
	
	B_SetVisuals_EisWaran();
	Npc_SetToFistMode(self);
};