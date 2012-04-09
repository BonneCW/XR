
/*************************************************************************
**	Minecrawler QUEEN Prototype											**
*************************************************************************/

PROTOTYPE Mst_Default_Truhe(C_Npc)			
{
	name							=	"Truhe";
	guild							=	GIL_SUMMONEDGUARDIAN;
	aivar[AIV_MM_REAL_ID]			= 	ID_Truhe;
	level							=	10;		// SN: wegen XP, real nur Level 15!
//------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	10;
	
	attribute	[ATR_HITPOINTS_MAX]	=	100;
	attribute	[ATR_HITPOINTS]		=	100;

	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;
//------------------------------------------------------
	protection	[PROT_BLUNT]		=	90000;
	protection	[PROT_EDGE]			=	90000;
	protection	[PROT_POINT]		=	160000;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	1000;
	protection	[PROT_MAGIC]		=	40;

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
	fight_tactic					=	FAI_MINECRAWLER;
//------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
//---------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;
};
//---------------------------------------------------
func void Set_Truhe_Visuals()
{
	Mdl_SetVisual			(self,"Truhe.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Truhe_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void Set_Muschel_Visuals()
{
	Mdl_SetVisual			(self,"Truhe.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Muschel_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void Set_Schwert_Visuals()
{
	Mdl_SetVisual			(self,"Schneemann.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Schneemann_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void Set_CRWQ2_Visuals()
{
	Mdl_SetVisual			(self,"CRWQ2.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"CRWQ2_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void Set_Drake_Visuals()
{
	Mdl_SetVisual			(self,"Drake.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Drake_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void Set_Gnore_Visuals()
{
	Mdl_SetVisual			(self,"Gnore.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gnore_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void Set_GnoreW_Visuals()
{
	Mdl_SetVisual			(self,"Gnore.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"GNOREWARIOR_BODY",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void Set_Karakus_Visuals()
{
	Mdl_SetVisual			(self,"Karakus.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"KARAKUS_BODY1",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void Set_Piranha_Visuals()
{
	Mdl_SetVisual			(self,"Piranha.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Piranha_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Truhe    												**
*************************************************************************/

INSTANCE Truhe	(Mst_Default_Truhe)
{
	Set_Truhe_Visuals();
	Npc_SetToFistMode(self);
};

INSTANCE Truhe_Deppenhans	(Mst_Default_Truhe)
{
	name				=	"Deppenhans' Truhe";

	level				=	5;
//------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	50;
	attribute	[ATR_DEXTERITY]		=	5;
	
	attribute	[ATR_HITPOINTS_MAX]	=	50;
	attribute	[ATR_HITPOINTS]		=	50;

	protection	[PROT_BLUNT]		=	20000;
	protection	[PROT_EDGE]			=	20000;
	protection	[PROT_POINT]		=	40000;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	10;
	protection	[PROT_MAGIC]		=	5;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	Set_Truhe_Visuals();
	Npc_SetToFistMode(self);
};

INSTANCE Muschel	(Mst_Default_Truhe)
{
	Set_Muschel_Visuals();
	Npc_SetToFistMode(self);
};

INSTANCE Schwert	(Mst_Default_Truhe)
{
	Set_Schwert_Visuals();
	Npc_SetToFistMode(self);
};

INSTANCE CRWQ2	(Mst_Default_Truhe)
{
	Set_CRWQ2_Visuals();
	Npc_SetToFistMode(self);
};

INSTANCE Drake	(Mst_Default_Truhe)
{
	Set_Drake_Visuals();
	//Npc_SetToFistMode(self);
};

INSTANCE Gnore	(Mst_Default_Truhe)
{
	Set_Gnore_Visuals();
	Npc_SetToFistMode(self);
};

INSTANCE GnoreW	(Mst_Default_Truhe)
{
	Set_GnoreW_Visuals();
	Npc_SetToFistMode(self);
};

INSTANCE Karakus	(Mst_Default_Truhe)
{
	Set_Karakus_Visuals();
	//Npc_SetToFistMode(self);
};

INSTANCE Piranha	(Mst_Default_Truhe)
{
	Set_Piranha_Visuals();
	Npc_SetToFistMode(self);
};