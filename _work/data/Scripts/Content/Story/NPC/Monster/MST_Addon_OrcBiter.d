/*************************************************************************
**	OrcBiter Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_OrcBiter(C_Npc)			
{
	name							=	"Beisser";
	guild							=	GIL_SCAVENGER;
	aivar[AIV_MM_REAL_ID]			= 	ID_ORCBITER;
	level							=	12;
//----------------------------------------------------
	attribute	[ATR_STRENGTH]		= Hlp_Random(41) + 40;	// 40 - 80
	attribute	[ATR_DEXTERITY]		= Hlp_Random(21);	// 0 - 20
	attribute	[ATR_HITPOINTS_MAX]	= Hlp_Random(121) + 60;	// 60 - 180
	attribute	[ATR_HITPOINTS]		= attribute[ATR_HITPOINTS_MAX];
	attribute	[ATR_MANA_MAX] 		= 0;
	attribute	[ATR_MANA] 		= 0;
//----------------------------------------------------
	protection	[PROT_BLUNT]		= Hlp_Random(41)*1000 + 40000;	// 40 - 80
	protection	[PROT_EDGE]		= Hlp_Random(41)*1000 + 40000;	// 40 - 80
	protection	[PROT_POINT]		= Hlp_Random(41)*1000 + 40000;	// 40 - 80
	protection	[PROT_FIRE]		= Hlp_Random(41) + 40;		// 40 - 80
	protection	[PROT_FLY]		= 60;
	protection	[PROT_MAGIC]		= Hlp_Random(41) + 20;		// 20 - 60
//----------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//----------------------------------------------------
	fight_tactic					=	FAI_SCAVENGER;
//----------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = TRUE;
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	CreateInvItems (self, ItFo_MuttonRaw, 2);
};
//-------------------------------------------------------------
func void Set_OrcBiter_Visuals()
{
	Mdl_SetVisual			(self,	"Scavenger.mds");
	Mdl_ApplyOverlayMds 	(self,	"Orcbiter.mds"); // eigener Run-Loop
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sc2_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void Set_OrcBiter01_Visuals()
{
	Mdl_SetVisual			(self,	"Scavenger.mds");
	Mdl_ApplyOverlayMds 	(self,	"Orcbiter.mds"); // eigener Run-Loop
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sc2_Body",		2,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


func void Set_OrcBiter_Sumpf_Visuals()
{
	Mdl_SetVisual			(self,	"Scavenger.mds");
	Mdl_ApplyOverlayMds 	(self,	"Orcbiter.mds"); // eigener Run-Loop
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sc2_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
/*************************************************************************
**	OrcBiter    														**
*************************************************************************/

INSTANCE OrcBiter (Mst_Default_OrcBiter)
{
	var int rnd;
	rnd = r_max(2);

	if (rnd == 0)
	{
		Set_OrcBiter_Visuals();
	}
	else if (rnd == 1)
	{
		Set_OrcBiter01_Visuals();
	}
	else
	{
		Set_OrcBiter_Sumpf_Visuals();
	};

	Npc_SetToFistMode(self);
};