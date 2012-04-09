//***************************
//	Molerat Prototype	
//***************************

PROTOTYPE Mst_Default_Molerat(C_Npc)			
{
	//----- Monster ----
	name							=	"Molerat";
	guild							=	GIL_MOLERAT;
	aivar[AIV_MM_REAL_ID]			= 	ID_MOLERAT;
	level							=	5;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	25;
	attribute	[ATR_DEXTERITY]		=	5;
	attribute	[ATR_HITPOINTS_MAX]	=	50;
	attribute	[ATR_HITPOINTS]		=	50;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	25000;
	protection	[PROT_EDGE]			=	25000;
	protection	[PROT_POINT]		=	25000;	
	protection	[PROT_FIRE]			=	25;
	protection	[PROT_FLY]			=	25;	
	protection	[PROT_MAGIC]		=	0;

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
	fight_tactic	=	FAI_MOLERAT;
	
	//----- Senses & Ranges ----	
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= 6;
	aivar[AIV_MM_RoamEnd]		= 22;
	aivar[AIV_MM_SleepStart]	= 22;
	aivar[AIV_MM_SleepEnd]		= 6;
};


//*************
//	Visuals
//*************

func void B_SetVisuals_Molerat()
{
	Mdl_SetVisual			(self,	"Molerat.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Mol_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Molerat_Neu_01()
{
	Mdl_SetVisual			(self,	"Molerat.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Mol_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Molerat_Sumpf()
{
	Mdl_SetVisual			(self,	"Molerat.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Mol_Body",		2,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Molerat_Neu_02()
{
	Mdl_SetVisual			(self,	"Molerat.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Mol_Body",		3,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Molerat_Neu_03()
{
	Mdl_SetVisual			(self,	"Molerat.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Mol_Body",		4,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Mol()
{
	var int Randi;
	Randi = Hlp_Random(3);

	if (Randi == 0)
	{
		B_SetVisuals_Molerat();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Molerat_Neu_01();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Molerat_Neu_03();
	};
};

//*****************
//	Molerat	
//*****************
INSTANCE Molerat	(Mst_Default_Molerat)
{
	B_SetVisuals_Mol();

	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Molerat_Big	(Mst_Default_Molerat)
{
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	25;
	attribute	[ATR_HITPOINTS_MAX]	=	5000;
	attribute	[ATR_HITPOINTS]		=	5000;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	B_SetVisuals_Mol();

	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);

	Mdl_SetModelScale(self, 2.0, 2.0, 2.0);
};

INSTANCE Molerat_Henrik_01	(Mst_Default_Molerat)
{
	B_SetVisuals_Mol();

	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Molerat_Henrik_02	(Mst_Default_Molerat)
{
	B_SetVisuals_Mol();

	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Molerat_Henrik_03	(Mst_Default_Molerat)
{
	B_SetVisuals_Mol();

	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Molerat_Henrik_04	(Mst_Default_Molerat)
{
	B_SetVisuals_Mol();

	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Molerat_Henrik_05	(Mst_Default_Molerat)
{
	B_SetVisuals_Mol();

	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Molerat_Henrik_06	(Mst_Default_Molerat)
{
	B_SetVisuals_Mol();

	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Molerat_Henrik_07	(Mst_Default_Molerat)
{
	B_SetVisuals_Mol();

	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Molerat_Henrik_08	(Mst_Default_Molerat)
{
	B_SetVisuals_Mol();

	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Molerat_Henrik_09	(Mst_Default_Molerat)
{
	B_SetVisuals_Mol();

	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Molerat_Henrik_10	(Mst_Default_Molerat)
{
	B_SetVisuals_Mol();

	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Molerat_Henrik_11	(Mst_Default_Molerat)
{
	B_SetVisuals_Mol();

	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Molerat_Henrik_12	(Mst_Default_Molerat)
{
	B_SetVisuals_Mol();

	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Molerat_Neu_01	(Mst_Default_Molerat)
{
	B_SetVisuals_Molerat_Neu_01();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Molerat_Neu_02	(Mst_Default_Molerat)
{
	B_SetVisuals_Molerat_Neu_02();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Molerat_Sumpf	(Mst_Default_Molerat)
{
	B_SetVisuals_Molerat_Sumpf();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE YMolerat	(Mst_Default_Molerat)
{
	level							=	3;
	name							=	"Junge Molerat";
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	15;
	attribute	[ATR_HITPOINTS_MAX]	=	30;
	attribute	[ATR_HITPOINTS]		=	30;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	15000;
	protection	[PROT_EDGE]			=	15000;
	protection	[PROT_POINT]		=	15000;	
	protection	[PROT_FIRE]			=	15;
	protection	[PROT_FLY]			=	15;	
	protection	[PROT_MAGIC]		=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	B_SetVisuals_Molerat();
	Mdl_SetModelScale(self, 0.9, 0.9, 0.9);
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 1);
};

INSTANCE Molerat_Fett_01	(Mst_Default_Molerat)
{
	name = "Wohlgenährte Molerat";
	level = 6;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	30;
	attribute	[ATR_DEXTERITY]		=	30;
	attribute	[ATR_HITPOINTS_MAX]	=	60;
	attribute	[ATR_HITPOINTS]		=	60;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	30000;
	protection	[PROT_EDGE]			=	30000;
	protection	[PROT_POINT]		=	30000;	
	protection	[PROT_FIRE]			=	30;
	protection	[PROT_FLY]			=	30;	
	protection	[PROT_MAGIC]		=	5;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	B_SetVisuals_Molerat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Molerat_Fett_02	(Mst_Default_Molerat)
{
	name = "Wohlgenährte Molerat";
	level = 6;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	30;
	attribute	[ATR_DEXTERITY]		=	30;
	attribute	[ATR_HITPOINTS_MAX]	=	60;
	attribute	[ATR_HITPOINTS]		=	60;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	30000;
	protection	[PROT_EDGE]			=	30000;
	protection	[PROT_POINT]		=	30000;	
	protection	[PROT_FIRE]			=	30;
	protection	[PROT_FLY]			=	30;	
	protection	[PROT_MAGIC]		=	5;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	B_SetVisuals_Molerat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Molerat_Fett_03	(Mst_Default_Molerat)
{
	name = "Wohlgenährte Molerat";
	level = 6;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	30;
	attribute	[ATR_DEXTERITY]		=	30;
	attribute	[ATR_HITPOINTS_MAX]	=	60;
	attribute	[ATR_HITPOINTS]		=	60;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	30000;
	protection	[PROT_EDGE]			=	30000;
	protection	[PROT_POINT]		=	30000;	
	protection	[PROT_FIRE]			=	30;
	protection	[PROT_FLY]			=	30;	
	protection	[PROT_MAGIC]		=	5;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	B_SetVisuals_Molerat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Molerat_Fett_04	(Mst_Default_Molerat)
{
	name = "Wohlgenährte Molerat";
	level = 6;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	30;
	attribute	[ATR_DEXTERITY]		=	30;
	attribute	[ATR_HITPOINTS_MAX]	=	60;
	attribute	[ATR_HITPOINTS]		=	60;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	30000;
	protection	[PROT_EDGE]			=	30000;
	protection	[PROT_POINT]		=	30000;	
	protection	[PROT_FIRE]			=	30;
	protection	[PROT_FLY]			=	30;	
	protection	[PROT_MAGIC]		=	5;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	B_SetVisuals_Molerat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};

INSTANCE Molerat_Fett_05	(Mst_Default_Molerat)
{
	name = "Wohlgenährte Molerat";
	level = 6;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	30;
	attribute	[ATR_DEXTERITY]		=	30;
	attribute	[ATR_HITPOINTS_MAX]	=	60;
	attribute	[ATR_HITPOINTS]		=	60;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	30000;
	protection	[PROT_EDGE]			=	30000;
	protection	[PROT_POINT]		=	30000;	
	protection	[PROT_FIRE]			=	30;
	protection	[PROT_FLY]			=	30;	
	protection	[PROT_MAGIC]		=	5;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	B_SetVisuals_Molerat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFo_MuttonRaw, 2);
};