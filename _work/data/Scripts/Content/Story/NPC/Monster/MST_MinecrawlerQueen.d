
/*************************************************************************
**	Minecrawler QUEEN Prototype											**
*************************************************************************/

PROTOTYPE Mst_Default_MinecrawlerQueen(C_Npc)			
{
	name							=	"Minecrawler-Königin";
	guild							=	GIL_MINECRAWLER;
	aivar[AIV_MM_REAL_ID]			= 	ID_MINECRAWLERQUEEN;
	level							=	50;		// SN: wegen XP, real nur Level 15!
//------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	250;
	attribute	[ATR_DEXTERITY]		=	40;
	
	attribute	[ATR_HITPOINTS_MAX]	=	800;
	attribute	[ATR_HITPOINTS]		=	800;

	attribute	[ATR_MANA_MAX] 		=	1000;
	attribute	[ATR_MANA] 			=	1000;
//------------------------------------------------------
	protection	[PROT_BLUNT]		=	120000;
	protection	[PROT_EDGE]			=	120000;
	protection	[PROT_POINT]		=	120000;
	protection	[PROT_FIRE]			=	120;
	protection	[PROT_FLY]			=	1000;
	protection	[PROT_MAGIC]		=	80;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
//------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//------------------------------------------------------
	fight_tactic					=	FAI_MINECRAWLERQUEEN;
//------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
//---------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;
};
//---------------------------------------------------
func void Set_MinecrawlerQueen_Visuals()
{
	Mdl_SetVisual			(self,"CrwQueen.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"CrQ_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void Set_ErznagerQueen_Visuals()
{
	Mdl_SetVisual			(self,"CrwQueen.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"ErznagerQueen_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	MinecrawlerQueen    												**
*************************************************************************/

INSTANCE MinecrawlerQueen	(Mst_Default_MinecrawlerQueen)
{
	Set_MinecrawlerQueen_Visuals();
	//Npc_SetToFistMode(self);
};

INSTANCE ErznagerQueen	(Mst_Default_MinecrawlerQueen)
{
	name			=	"Erznager-Königin";
	Set_ErznagerQueen_Visuals();
	Npc_SetToFistMode(self);
};