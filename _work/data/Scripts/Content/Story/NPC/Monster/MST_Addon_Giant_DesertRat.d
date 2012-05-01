//*************************
//	Giant_DesertRat Prototype		
//*************************

PROTOTYPE Mst_Default_Giant_DesertRat(C_Npc)			
{
	//----- Monster ----
	name							=	"Wüstenratte";
	guild							=	GIL_Giant_Rat;
	aivar[AIV_MM_REAL_ID]			= 	ID_Giant_Rat;
	level							=	10;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	Hlp_Random(41) + 55;	// 55 - 95
	attribute	[ATR_DEXTERITY]		=	Hlp_Random(21);		// 0 - 20
	attribute	[ATR_HITPOINTS_MAX]	=	Hlp_Random(61) + 55;	// 55 - 115
	attribute	[ATR_HITPOINTS]		=	attribute[ATR_HITPOINTS_MAX];
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 		=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	Hlp_Random(41)*1000 + 55000;	// 55 - 95
	protection	[PROT_EDGE]		=	Hlp_Random(41)*1000 + 55000;	// 55 - 95
	protection	[PROT_POINT]		=	Hlp_Random(51)*1000;		// 0 - 50
	protection	[PROT_FIRE]		=	Hlp_Random(41) + 55;		// 55 - 95
	protection	[PROT_FLY]		=	75;
	protection	[PROT_MAGIC]		=	Hlp_Random(21);			// 0 - 20

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

	CreateInvItems (self, ItFo_MuttonRaw, 1);
};


//************
//	Visuals
//************

func void B_SetVisuals_Giant_DesertRat()
{
	Mdl_SetVisual			(self,	"Giant_Rat.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Giant_DesertRat_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Mdl_SetModelScale(self,	1.30,	1.30, 	1);
};


//***************
//	Giant_DesertRat    
//***************

INSTANCE Giant_DesertRat	(Mst_Default_Giant_DesertRat)
{
	B_SetVisuals_Giant_DesertRat();
	Npc_SetToFistMode(self);
};