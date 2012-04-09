/*************************************************************************
**	Sleeper Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_Sleeper(C_Npc)			
{
	name							=	"Schläfer";
	guild							=	GIL_MINECRAWLER;
	level							=	2000;
	flags = 2;
//--------------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	500;
	attribute	[ATR_DEXTERITY]		=	50;
	
	attribute	[ATR_HITPOINTS_MAX]	=	1000;
	attribute	[ATR_HITPOINTS]		=	1000;

	attribute	[ATR_MANA_MAX] 		=	500;
	attribute	[ATR_MANA] 			=	500;
//--------------------------------------------------------------
	protection	[PROT_BLUNT]		=	500000;
	protection	[PROT_EDGE]			=	50000;
	protection	[PROT_POINT]		=	1000000;
	protection	[PROT_FIRE]			=	1000;
	protection	[PROT_FLY]			=	1000;
	protection	[PROT_MAGIC]		=	500;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
//--------------------------------------------------------------
	damagetype 						=	DAM_MAGIC;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//--------------------------------------------------------------
	fight_tactic					=	FAI_GIANT_BUG;
//--------------------------------------------------------------
//----- Senses & Ranges ----
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = FALSE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = FALSE;

	
//-------------------------------------------------------------
	daily_routine				= Rtn_start_Sleeper;

	//aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};
//-------------------------------------------------------------
func void Set_Sleeper_Visuals()
{
	Mdl_SetVisual			(self,	"Sleeper.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sle_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	Mdl_SetModelScale	(self, 0.5, 0.5, 0.5);
};


/*************************************************************************
**	Sleeper    															**
*************************************************************************/
INSTANCE Sleeper	(Mst_Default_Sleeper)
{
	Set_Sleeper_Visuals();
	Npc_SetToFistMode(self);
};

func void Rtn_start_Sleeper ()
{
	TA_Sleeper	(24,00,06,00,"FI_55");
  	TA_Sleeper	(06,00,24,00,"FI_55");
};
