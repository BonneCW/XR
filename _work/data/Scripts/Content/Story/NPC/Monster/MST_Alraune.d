
/*************************************************************************
**	Minecrawler QUEEN Prototype											**
*************************************************************************/

PROTOTYPE Mst_Default_Alraune(C_Npc)			
{
	name							=	"Alraune";
	guild							=	GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID]			= 	ID_Alraune;
	level							=	50;		// SN: wegen XP, real nur Level 15!
//------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	350;
	attribute	[ATR_DEXTERITY]		=	50;
	
	attribute	[ATR_HITPOINTS_MAX]	=	3000;
	attribute	[ATR_HITPOINTS]		=	3000;

	attribute	[ATR_MANA_MAX] 		=	1000;
	attribute	[ATR_MANA] 		=	1000;
//------------------------------------------------------
	protection	[PROT_BLUNT]		=	IMMUNE;
	protection	[PROT_EDGE]		=	160000;
	protection	[PROT_POINT]		=	IMMUNE;
	protection	[PROT_FIRE]		=	0;
	protection	[PROT_FLY]		=	1000;
	protection	[PROT_MAGIC]		=	60;

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
func void Set_Alraune_Visuals()
{
	Mdl_SetVisual			(self,"Alraune.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Alraune_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Alraune    												**
*************************************************************************/

INSTANCE Alraune	(Mst_Default_Alraune)
{
	Set_Alraune_Visuals();
	Npc_SetToFistMode(self);
};

INSTANCE Alraune_Sumpfis	(Mst_Default_Alraune)
{
	name	=	"hartnäckige Staude";
	
	attribute	[ATR_HITPOINTS_MAX]	=	100;
	attribute	[ATR_HITPOINTS]		=	100;

	protection	[PROT_BLUNT]		=	1000;
	protection	[PROT_EDGE]			=	1000;
	protection	[PROT_POINT]		=	1000;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	Set_Alraune_Visuals();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItPl_SwampHerb, 2);

	if (Hlp_Random(100) < 70)
	{
		CreateInvItems	(self, ItPl_Sumpfbeeren_XR, 1);
	};
	if (Hlp_Random(100) < 20)
	{
		CreateInvItems	(self, ItPl_Mana_Herb_03, 1);
	};
	if (Hlp_Random(100) < 60)
	{
		CreateInvItems	(self, ItPl_Weed, 1);
	};
	if (Hlp_Random(100) < 10)
	{
		CreateInvItems	(self, ItPl_Zwillingsdorn, 1);
	};
	if (Hlp_Random(100) < 20)
	{
		CreateInvItems	(self, ItPl_Heilknospe, 1);
	};
};

INSTANCE Alraune_Echsis	(Mst_Default_Alraune)
{
	level							=	100;

	Set_Alraune_Visuals();
	Npc_SetToFistMode(self);

	Mdl_SetModelScale	(self, 1.3, 1.3, 1.3);

	CreateInvItems	(self, ItPl_SwampHerb, 2);

	if (Hlp_Random(100) < 70)
	{
		CreateInvItems	(self, ItPl_Sumpfbeeren_XR, 1);
	};
	if (Hlp_Random(100) < 20)
	{
		CreateInvItems	(self, ItPl_Mana_Herb_03, 1);
	};
	if (Hlp_Random(100) < 60)
	{
		CreateInvItems	(self, ItPl_Weed, 1);
	};
	if (Hlp_Random(100) < 10)
	{
		CreateInvItems	(self, ItPl_Zwillingsdorn, 1);
	};
	if (Hlp_Random(100) < 20)
	{
		CreateInvItems	(self, ItPl_Heilknospe, 1);
	};
};

INSTANCE Alraune_Moor	(Mst_Default_Alraune)
{
	name	=	"Besessene Pflanze";

	level		=	20;

	attribute	[ATR_STRENGTH]		=	Hlp_Random(101) + 150;	// 150 - 250
	attribute	[ATR_DEXTERITY]		=	Hlp_Random(21) + 10;	// 10 - 30
	
	attribute	[ATR_HITPOINTS_MAX]	=	Hlp_Random(201) + 400;	// 400 - 600
	attribute	[ATR_HITPOINTS]		=	attribute[ATR_HITPOINTS_MAX];

	attribute	[ATR_MANA_MAX] 		=	1000;
	attribute	[ATR_MANA] 		=	1000;
//------------------------------------------------------
	protection	[PROT_BLUNT]		=	IMMUNE;
	protection	[PROT_EDGE]		=	Hlp_Random(101)*1000 + 100000;	// 100 - 200
	protection	[PROT_POINT]		=	IMMUNE;
	protection	[PROT_FIRE]		=	0;
	protection	[PROT_FLY]		=	1000;
	protection	[PROT_MAGIC]		=	Hlp_Random(41) + 40;		// 40 - 80

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	Set_Alraune_Visuals();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItPl_SwampHerb, 2);

	if (Hlp_Random(100) < 70)
	{
		CreateInvItems	(self, ItPl_Sumpfbeeren_XR, 1);
	};
	if (Hlp_Random(100) < 20)
	{
		CreateInvItems	(self, ItPl_Mana_Herb_03, 1);
	};
	if (Hlp_Random(100) < 60)
	{
		CreateInvItems	(self, ItPl_Weed, 1);
	};
	if (Hlp_Random(100) < 10)
	{
		CreateInvItems	(self, ItPl_Zwillingsdorn, 1);
	};
	if (Hlp_Random(100) < 20)
	{
		CreateInvItems	(self, ItPl_Heilknospe, 1);
	};
};

INSTANCE Alraune_Botschek_01	(Mst_Default_Alraune)
{
	name	=	"Aggressives Unkraut";

	level		=	10;

	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	10;
	
	attribute	[ATR_HITPOINTS_MAX]	=	1000;
	attribute	[ATR_HITPOINTS]		=	1000;

	attribute	[ATR_MANA_MAX] 		=	1000;
	attribute	[ATR_MANA] 			=	1000;
//------------------------------------------------------
	protection	[PROT_BLUNT]		=	IMMUNE;
	protection	[PROT_EDGE]			=	90000;
	protection	[PROT_POINT]		=	IMMUNE;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	1000;
	protection	[PROT_MAGIC]		=	60;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	Set_Alraune_Visuals();
	Npc_SetToFistMode(self);

	Mdl_SetModelScale	(self, 0.4, 0.4, 0.4);

	CreateInvItems	(self, ItPl_SwampHerb, 2);

	if (Hlp_Random(100) < 70)
	{
		CreateInvItems	(self, ItPl_Sumpfbeeren_XR, 1);
	};
	if (Hlp_Random(100) < 20)
	{
		CreateInvItems	(self, ItPl_Mana_Herb_03, 1);
	};
	if (Hlp_Random(100) < 60)
	{
		CreateInvItems	(self, ItPl_Weed, 1);
	};
	if (Hlp_Random(100) < 10)
	{
		CreateInvItems	(self, ItPl_Zwillingsdorn, 1);
	};
	if (Hlp_Random(100) < 20)
	{
		CreateInvItems	(self, ItPl_Heilknospe, 1);
	};
};

INSTANCE Alraune_Botschek_02	(Mst_Default_Alraune)
{
	name	=	"Aggressives Unkraut";

	level		=	10;

	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	10;
	
	attribute	[ATR_HITPOINTS_MAX]	=	1000;
	attribute	[ATR_HITPOINTS]		=	1000;

	attribute	[ATR_MANA_MAX] 		=	1000;
	attribute	[ATR_MANA] 			=	1000;
//------------------------------------------------------
	protection	[PROT_BLUNT]		=	IMMUNE;
	protection	[PROT_EDGE]			=	90000;
	protection	[PROT_POINT]		=	IMMUNE;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	1000;
	protection	[PROT_MAGIC]		=	60;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	Set_Alraune_Visuals();
	Npc_SetToFistMode(self);

	Mdl_SetModelScale	(self, 0.4, 0.4, 0.4);

	CreateInvItems	(self, ItPl_SwampHerb, 2);

	if (Hlp_Random(100) < 70)
	{
		CreateInvItems	(self, ItPl_Sumpfbeeren_XR, 1);
	};
	if (Hlp_Random(100) < 20)
	{
		CreateInvItems	(self, ItPl_Mana_Herb_03, 1);
	};
	if (Hlp_Random(100) < 60)
	{
		CreateInvItems	(self, ItPl_Weed, 1);
	};
	if (Hlp_Random(100) < 10)
	{
		CreateInvItems	(self, ItPl_Zwillingsdorn, 1);
	};
	if (Hlp_Random(100) < 20)
	{
		CreateInvItems	(self, ItPl_Heilknospe, 1);
	};
};

INSTANCE Alraune_Botschek_03	(Mst_Default_Alraune)
{
	name	=	"Aggressives Unkraut";

	level		=	10;

	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	10;
	
	attribute	[ATR_HITPOINTS_MAX]	=	1000;
	attribute	[ATR_HITPOINTS]		=	1000;

	attribute	[ATR_MANA_MAX] 		=	1000;
	attribute	[ATR_MANA] 			=	1000;
//------------------------------------------------------
	protection	[PROT_BLUNT]		=	IMMUNE;
	protection	[PROT_EDGE]			=	90000;
	protection	[PROT_POINT]		=	IMMUNE;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	1000;
	protection	[PROT_MAGIC]		=	60;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	Set_Alraune_Visuals();
	Npc_SetToFistMode(self);

	Mdl_SetModelScale	(self, 0.4, 0.4, 0.4);

	CreateInvItems	(self, ItPl_SwampHerb, 2);

	if (Hlp_Random(100) < 70)
	{
		CreateInvItems	(self, ItPl_Sumpfbeeren_XR, 1);
	};
	if (Hlp_Random(100) < 20)
	{
		CreateInvItems	(self, ItPl_Mana_Herb_03, 1);
	};
	if (Hlp_Random(100) < 60)
	{
		CreateInvItems	(self, ItPl_Weed, 1);
	};
	if (Hlp_Random(100) < 10)
	{
		CreateInvItems	(self, ItPl_Zwillingsdorn, 1);
	};
	if (Hlp_Random(100) < 20)
	{
		CreateInvItems	(self, ItPl_Heilknospe, 1);
	};
};