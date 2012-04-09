//*************************
//	Giant_Rat Prototype		
//*************************

PROTOTYPE Mst_Default_Giant_Rat(C_Npc)			
{
	//----- Monster ----
	name							=	"Riesenratte";
	guild							=	GIL_Giant_Rat;
	aivar[AIV_MM_REAL_ID]			= 	ID_Giant_Rat;
	level							=	3;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	5;
	attribute	[ATR_HITPOINTS_MAX]	=	30;
	attribute	[ATR_HITPOINTS]		=	30;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	15000;
	protection	[PROT_EDGE]			=	15000;
	protection	[PROT_POINT]		=	15000;
	protection	[PROT_FIRE]			=	15;
	protection	[PROT_FLY]			=	15;
	protection	[PROT_MAGIC]		=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//----- Damage TYpes ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	= 	FAI_GIANT_RAT;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
};

PROTOTYPE Mst_Default_Rat(C_Npc)			
{
	//----- Monster ----
	level = 1;

	name							=	"Ratte";
	guild							=	GIL_Meatbug;

	attribute[ATR_HITPOINTS_MAX]	=	5;
	attribute[ATR_HITPOINTS]		=	5;

	protection	[PROT_BLUNT]		=	0;
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	15;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//----- Damage TYpes ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	= 	FAI_GIANT_RAT;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
};


//************
//	Visuals
//************

func void B_SetVisuals_Giant_Rat()
{
	Mdl_SetVisual			(self,	"Giant_Rat.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Giant_Rat_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Giant_EisRat()
{
	Mdl_SetVisual			(self,	"Giant_Rat.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Giant_EisRat_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//***************
//	Giant_Rat    
//***************

INSTANCE Giant_Rat	(Mst_Default_Giant_Rat)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);
};

INSTANCE Giant_Rat_Rosi_01	(Mst_Default_Giant_Rat)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);
};

INSTANCE Giant_Rat_Rosi_02	(Mst_Default_Giant_Rat)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);
};

INSTANCE Giant_EisRat	(Mst_Default_Giant_Rat)
{
	B_SetVisuals_Giant_EisRat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);
};

INSTANCE Giant_Rat_Cirio	(Mst_Default_Giant_Rat)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);
};

INSTANCE Giant_Rat_Friedel	(Mst_Default_Giant_Rat)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);
};

INSTANCE Ratte_Cirio	(Mst_Default_Giant_Rat)
{
	name	=	"Cirio";

	CreateInvItems	(self, ItWr_CirioNotiz, 1);

	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);
	Mdl_SetModelScale(self, 2.0, 2.0, 2.0);
};

INSTANCE Ratte_Richard	(Mst_Default_Giant_Rat)
{
	name	=	"Richard";

	CreateInvItems	(self, ItMi_Gold, 400);
	CreateInvItems	(self, ItRi_Prot_Fire_02, 1);
	CreateInvItems	(self, ItPl_Temp_Herb, 1);

	B_SetVisuals_Giant_EisRat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);
	Mdl_SetModelScale(self, 2.0, 2.0, 2.0);
};

INSTANCE Rat	(Mst_Default_Rat)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self, 0.2, 0.2, 0.2);
};

INSTANCE Rat_Rosi_01	(Mst_Default_Rat)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self, 0.2, 0.2, 0.2);
};

INSTANCE Rat_Rosi_02	(Mst_Default_Rat)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self, 0.2, 0.2, 0.2);
};

INSTANCE Rat_Rosi_03	(Mst_Default_Rat)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self, 0.2, 0.2, 0.2);
};

INSTANCE Rat_Rosi_04	(Mst_Default_Rat)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self, 0.2, 0.2, 0.2);
};

INSTANCE Rat_Rosi_05	(Mst_Default_Rat)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self, 0.2, 0.2, 0.2);
};

INSTANCE Rat_Sekob_01	(Mst_Default_Giant_Rat)
{
	level = 1;

	name							=	"Ratte";
	guild							=	GIL_Meatbug;

	attribute[ATR_HITPOINTS_MAX]	=	5;
	attribute[ATR_HITPOINTS]		=	5;

	protection	[PROT_BLUNT]		=	0;
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;

	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self, 0.2, 0.2, 0.2);
};

INSTANCE Rat_Sekob_02	(Mst_Default_Giant_Rat)
{
	level = 1;

	name							=	"Ratte";
	guild							=	GIL_Meatbug;

	attribute[ATR_HITPOINTS_MAX]	=	5;
	attribute[ATR_HITPOINTS]		=	5;

	protection	[PROT_BLUNT]		=	0;
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;

	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self, 0.2, 0.2, 0.2);
};

INSTANCE Rat_Sekob_03	(Mst_Default_Giant_Rat)
{
	level = 1;

	name							=	"Ratte";
	guild							=	GIL_Meatbug;

	attribute[ATR_HITPOINTS_MAX]	=	5;
	attribute[ATR_HITPOINTS]		=	5;

	protection	[PROT_BLUNT]		=	0;
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;

	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self, 0.2, 0.2, 0.2);
};

INSTANCE Rat_Flora	(Mst_Default_Giant_Rat)
{
	level = 1;

	name							=	"Ratte";
	guild							=	GIL_Meatbug;

	attribute[ATR_HITPOINTS_MAX]	=	5;
	attribute[ATR_HITPOINTS]		=	5;

	protection	[PROT_BLUNT]		=	0;
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;

	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self, 0.2, 0.2, 0.2);
};


//**************************************
//	junge Giant_Rat   (für Spielstart) 	
//**************************************

INSTANCE YGiant_Rat	(Mst_Default_Giant_Rat)
{
	//----- Monster ----
	name							=	"junge Riesenratte";
	level							=	2;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	5;
	attribute	[ATR_DEXTERITY]		=	5;
	attribute	[ATR_HITPOINTS_MAX]	=	10;
	attribute	[ATR_HITPOINTS]		=	10;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	5000;
	protection	[PROT_EDGE]			=	5000;
	protection	[PROT_POINT]		=	5000;
	protection	[PROT_FIRE]			=	5;
	protection	[PROT_FLY]			=	5;
	protection	[PROT_MAGIC]		=	0;
	
	//----- Kampf-Taktik ----
	fight_tactic					= FAI_MONSTER_COWARD;

	//----- Visuals ----
	B_SetVisuals_Giant_Rat();
	Mdl_SetModelScale(self, 0.9, 0.9, 0.9);
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);
};