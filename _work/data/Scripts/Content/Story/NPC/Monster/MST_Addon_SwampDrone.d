//**********************
//	SwampDrone Prototype
//**********************

PROTOTYPE Mst_Default_SwampDrone(C_Npc)			
{
	//----- Monster -----
	name							= "Sumpfgasdrohne";
	guild							= GIL_BLOODFLY;
	aivar[AIV_MM_REAL_ID]			= ID_SWAMPDRONE;
	level							= 10;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		= Hlp_Random(51) + 25;	// 25 - 75
	attribute	[ATR_DEXTERITY]		= Hlp_Random(11);	// 0 - 10
	attribute	[ATR_HITPOINTS_MAX]	= Hlp_Random(51) + 75;	// 75 - 125
	attribute	[ATR_HITPOINTS]		= attribute[ATR_HITPOINTS_MAX];
	attribute	[ATR_MANA_MAX] 		= 0;
	attribute	[ATR_MANA] 		= 0;
	
	//----- Ptotection ----
	protection	[PROT_BLUNT]		= Hlp_Random(51)*1000 + 25000;	// 25 - 75
	protection	[PROT_EDGE]		= Hlp_Random(51)*1000 + 25000;	// 25 - 75
	protection	[PROT_POINT]		= Hlp_Random(21);		// 0 - 20
	protection	[PROT_FIRE]		= Hlp_Random(51) + 25;		// 25 - 75
	protection	[PROT_FLY]		= 50;
	protection	[PROT_MAGIC]		= Hlp_Random(21);		// 0 - 20

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
	fight_tactic	= 	FAI_BLOODFLY;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= FALSE;
	
	//----- Daily Routine ----	
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_WuselStart] 	= OnlyRoutine;	
};

//******************
//		Visuals
//******************

func void B_SetVisuals_SwampDrone()
{
	Mdl_SetVisual			(self,	"SwampDrone.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"SwampDrone_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

//*************
//	Bloodfly   
//*************

INSTANCE SwampDrone	(Mst_Default_SwampDrone)
{
	B_SetVisuals_SwampDrone();
	Npc_SetToFistMode(self);
};