/*************************************************************************
**	Bloodhound Prototype	(Anims wie Shadowbeast)						**
*************************************************************************/

PROTOTYPE Mst_Default_Bloodhound(C_Npc)			
{
	name							=	"Bluthund";
	guild							=	GIL_SHADOWBEAST;
	aivar[AIV_MM_REAL_ID]			= 	ID_Bloodhound;
	level							=	22;
//----------------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	Hlp_Random(61) + 150;	// 150 - 210
	attribute	[ATR_DEXTERITY]		=	Hlp_Random(21) + 5;	// 5 - 25
	attribute	[ATR_HITPOINTS_MAX]	=	Hlp_Random(101) + 150;	// 150 - 250
	attribute	[ATR_HITPOINTS]		=	attribute[ATR_HITPOINTS_MAX];
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 		=	0;
//----------------------------------------------------------------
	protection	[PROT_BLUNT]		=	Hlp_Random(31)*1000+75000;	// 75 - 105
	protection	[PROT_EDGE]		=	Hlp_Random(31)*1000+75000;	// 75 - 105
	protection	[PROT_POINT]		=	Hlp_Random(31)*1000+25000;	// 75 - 105
	protection	[PROT_FIRE]		=	Hlp_Random(31)+75;		// 75 - 105
	protection	[PROT_FLY]		=	90;
	protection	[PROT_MAGIC]		=	Hlp_Random(31);			// 0 - 30

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
//----------------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//-------------------------------------------------------------
//-------------------------------------------------------------
	fight_tactic					=	FAI_SHADOWBEAST;
//-------------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

//	aivar[AIV_MM_Behaviour]		= HUNTER;
	
//	aivar[AIV_MM_PercRange]		= 2500;
//	aivar[AIV_MM_DrohRange]		= 2000;
//	aivar[AIV_MM_AttackRange]	= 1800;
//	aivar[AIV_MM_DrohTime]		= 2;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
//-------------------------------------------------------------
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
//-------------------------------------------------------------
func void Set_Bloodhound_Visuals()
{
	Mdl_SetVisual			(self,	"Shadow.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Bhd_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Bloodhound    															**
*************************************************************************/

INSTANCE Bloodhound	(Mst_Default_Bloodhound)
{
	Set_Bloodhound_Visuals();
	Npc_SetToFistMode(self);
};

INSTANCE Bloodhound_Untier	(Mst_Default_Bloodhound)
{
	name = "verfluchtes Untier";

	level							=	100;

	flags = 2;

//----------------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	108;
	attribute	[ATR_DEXTERITY]		=	108;
	attribute	[ATR_HITPOINTS_MAX]	=	216;
	attribute	[ATR_HITPOINTS]		=	216;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//----------------------------------------------------------------
	protection	[PROT_BLUNT]		=	0;
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;

	CreateInvItems	(self, ItMi_GoldCup, 2);
	CreateInvItems	(self, ItMi_silverPlate, 3);
	CreateInvItems	(self, ItMi_Gold, 329);
	CreateInvItems	(self, ItAt_GoblinBone, 1);
	CreateInvItems	(self, ItAt_Sting, 1);
	CreateInvItems	(self, ItAt_Claw, 4);
	CreateInvItems	(self, ItAt_SheepFur, 1);
	CreateInvItems	(self, ItAt_WolfFur, 1);
	CreateInvItems	(self, ItFo_Booze, 1);

	Set_Bloodhound_Visuals();
	Npc_SetToFistMode(self);

	Mdl_SetModelScale(self, 1.2, 1.2, 1.2);
	effect	= "SPELLFX_FIREARMOR";
};

INSTANCE BloodhoundTransform	(Mst_Default_Bloodhound)
{
	Npc_PercEnable (self, PERC_ASSESSSURPRISE , B_StopMagicTransform);
	Set_Bloodhound_Visuals();
	Npc_SetToFistMode(self);
};