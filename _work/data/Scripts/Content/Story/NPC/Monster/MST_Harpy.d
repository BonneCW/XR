//**************************
//	Harpie Prototype
//**************************

PROTOTYPE Mst_Default_Harpie(C_Npc)			
{
	//----- Monster ----
	name							=	"Harpie";
	guild							=	GIL_HARPY;
	aivar[AIV_MM_REAL_ID]			= 	ID_HARPY;
	level							=	18;
	
	//-----Attribute ----	
	attribute	[ATR_STRENGTH]		=	90;
	attribute	[ATR_DEXTERITY]		=	10;
	attribute	[ATR_HITPOINTS_MAX]	=	180;
	attribute	[ATR_HITPOINTS]		=	180;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	90000;
	protection	[PROT_EDGE]			=	90000;
	protection	[PROT_POINT]		=	40000;
	protection	[PROT_FIRE]			=	90;
	protection	[PROT_FLY]			=	90;
	protection	[PROT_MAGIC]		=	30;

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
	fight_tactic	= 	FAI_HARPY;
	
	//----- Senses & Ranges ----	
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	
	//----- Daily Routine ----	
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;	
};


//**************
//	Visuals
//**************


func void B_SetVisuals_Harpie()
{
	Mdl_SetVisual			(self,	"Harpie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Har_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//************
//	Harpie
//************

INSTANCE Harpie	(Mst_Default_Harpie)
{
	B_SetVisuals_Harpie();	
	Npc_SetToFistMode(self);
};

INSTANCE Harpie_Eremit_01	(Mst_Default_Harpie)
{
	B_SetVisuals_Harpie();	
	Npc_SetToFistMode(self);
};

INSTANCE Harpie_Eremit_02	(Mst_Default_Harpie)
{
	B_SetVisuals_Harpie();	
	Npc_SetToFistMode(self);
};

INSTANCE Harpie_Eremit_03	(Mst_Default_Harpie)
{
	B_SetVisuals_Harpie();	
	Npc_SetToFistMode(self);
};

INSTANCE Harpie_Eremit_04	(Mst_Default_Harpie)
{
	B_SetVisuals_Harpie();	
	Npc_SetToFistMode(self);
};

INSTANCE Harpie_Eremit_05	(Mst_Default_Harpie)
{
	B_SetVisuals_Harpie();	
	Npc_SetToFistMode(self);
};

INSTANCE Harpie_Griselda	(Mst_Default_Harpie)
{
	attribute	[ATR_STRENGTH]		=	180;
	attribute	[ATR_DEXTERITY]		=	90;
	attribute	[ATR_HITPOINTS_MAX]	=	360;
	attribute	[ATR_HITPOINTS]		=	360;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	120000;
	protection	[PROT_EDGE]			=	120000;
	protection	[PROT_POINT]		=	80000;
	protection	[PROT_FIRE]			=	120;
	protection	[PROT_FLY]			=	120;
	protection	[PROT_MAGIC]		=	50;

	CreateInvItems	(self, ItWr_Rezept_FolgsamkeitSnapper, 1);

	B_SetVisuals_Harpie();
	
	Npc_SetToFistMode(self);
};

INSTANCE HarpieTransform	(Mst_Default_Harpie)
{
	Npc_PercEnable (self, PERC_ASSESSSURPRISE , B_StopMagicTransform);
	B_SetVisuals_Harpie();
	Npc_SetToFistMode(self);
};

INSTANCE Summoned_Harpie	(Mst_Default_Harpie)
{
	name							=	"Beschworene Harpie";
	guild							=	GIL_SUMMONED_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_SUMMONED_HARPIE;
	level							=	0; //10
	flags       = NPC_FLAG_GHOST;
	effect	= "SPELLFX_DARKARMOR";

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_Harpie();
	Npc_SetToFistMode(self);
};