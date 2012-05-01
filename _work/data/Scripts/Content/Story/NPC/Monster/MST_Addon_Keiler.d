//********************
//	Keiler Prototype														
//********************

PROTOTYPE Mst_Default_Keiler(C_Npc)			
{
	//----- Monster ----
	name							=	"Keiler";
	guild							=	GIL_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_Keiler;
	level							=	10;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	Hlp_Random(41) + 30;	// 30 - 70
	attribute	[ATR_DEXTERITY]		=	Hlp_Random(21) + 5;	// 5 - 25
	attribute	[ATR_HITPOINTS_MAX]	=	Hlp_Random(81) + 60;	// 60 - 140
	attribute	[ATR_HITPOINTS]		=	attribute[ATR_HITPOINTS_MAX];
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 		=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	Hlp_Random(41)*1000 + 30000;	// 30 - 70
	protection	[PROT_EDGE]		=	Hlp_Random(41)*1000 + 30000;	// 30 - 70
	protection	[PROT_POINT]		=	Hlp_Random(21);			// 0 - 20
	protection	[PROT_FIRE]		=	Hlp_Random(41) + 30;		// 30 - 70
	protection	[PROT_FLY]		=	50;
	protection	[PROT_MAGIC]		=	Hlp_Random(21);			// 0 - 20

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	//---- Damage Types ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf Taktik ----
	fight_tactic	=	FAI_WOLF;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= TRUE;

	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= 6;	
	aivar[AIV_MM_RoamEnd]		= 22;
	aivar[AIV_MM_SleepStart]	= 22;
	aivar[AIV_MM_SleepEnd]		= 6;	

	CreateInvItems (self, ItFo_MuttonRaw, 2);
};


//************
//	Visuals
//************


func void B_SetVisuals_Keiler()
{
	Mdl_SetVisual			(self,"Keiler.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Keiler_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Keiler01()
{
	Mdl_SetVisual			(self,"Keiler.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Keiler01_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Riesenkeiler()
{
	Mdl_SetVisual			(self,"Riesenkeiler.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Riesenkeiler",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//************
//	Keiler    	
//************

INSTANCE Keiler	(Mst_Default_Keiler)
{
	if (Hlp_Random(2) == 0)
	{
		B_SetVisuals_Keiler();
	}
	else
	{
		B_SetVisuals_Keiler01();
	};

	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Riesenkeiler	(Mst_Default_Keiler)
{
	level					=	30;
	name					=	"Riesenkeiler";
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	Hlp_Random(201) + 100;	// 100 - 300
	attribute	[ATR_DEXTERITY]		=	Hlp_Random(31) + 15;	// 15 + 45
	attribute	[ATR_HITPOINTS_MAX]	=	Hlp_Random(301) + 300;	// 300 - 600	
	attribute	[ATR_HITPOINTS]		=	attribute[ATR_HITPOINTS_MAX];
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	Hlp_Random(101)*1000 + 100000;	// 100 - 200
	protection	[PROT_EDGE]		=	Hlp_Random(101)*1000 + 100000;	// 100 - 200
	protection	[PROT_POINT]		=	Hlp_Random(101)*1000 + 100000;	// 100 - 200
	protection	[PROT_FIRE]		=	Hlp_Random(101) + 100;		// 100 - 200
	protection	[PROT_FLY]		=	150;
	protection	[PROT_MAGIC]		=	Hlp_Random(101) + 50;		// 50 - 150

	B_SetVisuals_Riesenkeiler();
	Npc_SetToFistMode(self);
};

INSTANCE KeilerTransform	(Mst_Default_Keiler)
{
	attribute	[ATR_STRENGTH]		=	50 + Npc_KnowsInfo(hero, Info_Mod_AlterWaldMann_Hi)*50;
	attribute	[ATR_DEXTERITY]		=	50;
	attribute	[ATR_HITPOINTS_MAX]	=	100 + Npc_KnowsInfo(hero, Info_Mod_AlterWaldMann_Hi)*100;
	attribute	[ATR_HITPOINTS]		=	100 + Npc_KnowsInfo(hero, Info_Mod_AlterWaldMann_Hi)*100;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 		=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	50000 + Npc_KnowsInfo(hero, Info_Mod_AlterWaldMann_Hi)*50000;
	protection	[PROT_EDGE]		=	50000 + Npc_KnowsInfo(hero, Info_Mod_AlterWaldMann_Hi)*50000;
	protection	[PROT_POINT]		=	50000 + Npc_KnowsInfo(hero, Info_Mod_AlterWaldMann_Hi)*50000;
	protection	[PROT_FIRE]		=	50 + Npc_KnowsInfo(hero, Info_Mod_AlterWaldMann_Hi)*50;
	protection	[PROT_FLY]		=	50 + Npc_KnowsInfo(hero, Info_Mod_AlterWaldMann_Hi)*50;
	protection	[PROT_MAGIC]		=	0 + Npc_KnowsInfo(hero, Info_Mod_AlterWaldMann_Hi)*50;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	Npc_PercEnable (self, PERC_ASSESSSURPRISE , B_StopMagicTransform);
	B_SetVisuals_Keiler();
	Npc_SetToFistMode(self);
};

INSTANCE Keiler_Ramsi	(Mst_Default_Keiler)
{
	B_SetVisuals_Keiler();
	Npc_SetToFistMode(self);
};