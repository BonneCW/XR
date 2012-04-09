/*************************************************************************
**	Razor Prototype		(Anims wie Snapper)								**
*************************************************************************/

PROTOTYPE Mst_Default_Razor(C_Npc)			
{
	name							= "Razor";
	guild							= GIL_SNAPPER;
	aivar[AIV_MM_REAL_ID]			= ID_RAZOR;
	level							= 18;
//--------------------------------------------------------------
	attribute	[ATR_STRENGTH]		= 180;
	attribute	[ATR_DEXTERITY]		= 15;
	attribute	[ATR_HITPOINTS_MAX]	= 180;
	attribute	[ATR_HITPOINTS]		= 180;
	attribute	[ATR_MANA_MAX] 		= 0;
	attribute	[ATR_MANA] 			= 0;
//--------------------------------------------------------------
	protection	[PROT_BLUNT]		= 90000;
	protection	[PROT_EDGE]			= 90000;
	protection	[PROT_POINT]		= 90000;
	protection	[PROT_FIRE]			= 90;
	protection	[PROT_FLY]			= 90;
	protection	[PROT_MAGIC]		= 0;
//--------------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//--------------------------------------------------------------
	fight_tactic					=	FAI_SNAPPER;
//--------------------------------------------------------------	
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

//	aivar[AIV_MM_Behaviour]		= HUNTER;
	
//	aivar[AIV_MM_PercRange]		= 1400;
//	aivar[AIV_MM_DrohRange]		= 1200;
//	aivar[AIV_MM_AttackRange]	= 700;
//	aivar[AIV_MM_DrohTime]		= 4;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = TRUE;
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};
//-------------------------------------------------------------
func void Set_Razor_Visuals()
{
	Mdl_SetVisual			(self,	"Razor.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Raz_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	if (Hlp_Random(100) < 5)
	{
		CreateInvItems (self, ItAt_GoblinBone, 1);
	};
};


/*************************************************************************
**	Razor    															**
*************************************************************************/

// in den Instanz-Scripten bitte NUR die Werte eintragen, die vom Prototyp abweichen sollen!

INSTANCE Razor (Mst_Default_Razor)
{
	Set_Razor_Visuals();
	Npc_SetToFistMode(self);
};