//**************************
//	Scavenger Prototype
//**************************

PROTOTYPE Mst_Default_Scavenger(C_Npc)			
{
	//----- Monster ----
	name							=	"Scavenger";
	guild							=	GIL_SCAVENGER;
	aivar[AIV_MM_REAL_ID]			= 	ID_SCAVENGER;
	
	//----- Attribute ----
	level							=	7;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	30;
	attribute	[ATR_DEXTERITY]		=	5;
	attribute	[ATR_HITPOINTS_MAX]	=	60;
	attribute	[ATR_HITPOINTS]		=	60;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	30000;
	protection	[PROT_EDGE]			=	30000;
	protection	[PROT_POINT]		=	15000;
	protection	[PROT_FIRE]			=	30;
	protection	[PROT_FLY]			=	30;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//----- Protections ----
	
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;
	//damage		[DAM_INDEX_BLUNT]	=	0;
	//damage		[DAM_INDEX_EDGE]	=	30;	
	//damage		[DAM_INDEX_POINT]	=	0;
	//damage		[DAM_INDEX_FIRE]	=	0;
	//damage		[DAM_INDEX_FLY]		=	0;
	//damage		[DAM_INDEX_MAGIC]	=	0;
	
	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_SCAVENGER;

	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;

	//----- Dailay Routine ----	
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_SleepStart] 	= 22;	
	aivar[AIV_MM_SleepEnd]		= 6;
	aivar[AIV_MM_EatGroundStart]= 6;
	aivar[AIV_MM_EatGroundEnd]	= 22;

	CreateInvItems (self, ItFo_MuttonRaw, 2);

	if (Hlp_Random(100) < 8)
	{
		CreateInvItems (self, ItMi_Gold, Hlp_Random(3)+1);
	};
	if (Hlp_Random(100) < 2)
	{
		CreateInvItems (self, ItMi_SilverRing, 1);
	};
	if (Hlp_Random(100) < 1)
	{
		CreateInvItems (self, ItMi_GoldRing, 1);
	};
	if (Hlp_Random(100) < 1)
	{
		CreateInvItems (self, ItMi_GoldNugget_Addon, 1);
	};
	if (Hlp_Random(100) < 1)
	{
		CreateInvItems (self, ItMi_Nugget, 1);
	};
};


//****************
//	Visuals
//****************
	
func void B_SetVisuals_Scavenger()
{
	Mdl_SetVisual			(self,	"Scavenger.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sca_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Scavenger_6()
{
	Mdl_SetVisual			(self,	"Scavenger.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sca_Body",		6,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Scavenger_Blut()
{
	Mdl_SetVisual			(self,	"Scavenger.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sca_Body",		7,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Scavenger_8()
{
	Mdl_SetVisual			(self,	"Scavenger.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sca_Body",		8,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
	
func void B_SetVisuals_Scavenger_1()
{
	Mdl_SetVisual			(self,	"Scavenger.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sca_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
	
func void B_SetVisuals_Scavenger_3()
{
	Mdl_SetVisual			(self,	"Scavenger.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sca_Body",		3,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Scavenger_4()
{
	Mdl_SetVisual			(self,	"Scavenger.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sca_Body",		4,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Scavenger_9()
{
	Mdl_SetVisual			(self,	"Scavenger.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sca_Body",		9,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

FUNC VOID B_SetVisual_Scav()
{
	var int randi;
	randi = Hlp_Random(8);

	if (randi == 0)
	{
		B_SetVisuals_Scavenger();
	}
	else if (randi == 1)
	{
		B_SetVisuals_Scavenger_6();
	}
	else if (randi == 2)
	{
		B_SetVisuals_Scavenger_8();
	}
	else if (randi == 3)
	{
		B_SetVisuals_Scavenger_1();
	}
	else if (randi == 4)
	{
		B_SetVisuals_Scavenger_Blut();
	}
	else if (randi == 5)
	{
		B_SetVisuals_Scavenger_3();
	}
	else if (randi == 6)
	{
		B_SetVisuals_Scavenger_4();
	}
	else if (randi == 7)
	{
		B_SetVisuals_Scavenger_9();
	};
};
//***************
//	Scavenger 
//***************

INSTANCE Scavenger	(Mst_Default_Scavenger)
{
	B_SetVisual_Scav();
	Npc_SetToFistMode(self);
};

INSTANCE Scavenger_Gaan_01	(Mst_Default_Scavenger)
{
	B_SetVisual_Scav();

	Npc_SetToFistMode(self);
};

INSTANCE Scavenger_Gaan_02	(Mst_Default_Scavenger)
{
	B_SetVisual_Scav();

	Npc_SetToFistMode(self);
};

INSTANCE Scavenger_Gaan_03	(Mst_Default_Scavenger)
{
	B_SetVisual_Scav();

	Npc_SetToFistMode(self);
};

INSTANCE Scavenger_Gaan	(Mst_Default_Scavenger)
{
	B_SetVisual_Scav();

	Npc_SetToFistMode(self);
	CreateInvItems (self, ItMi_Ornament_Heiler, 1);
};

INSTANCE Scavenger_Breed	(Mst_Default_Scavenger)
{
	name	= 	"brütender Scavenger";

	B_SetVisual_Scav();

	Npc_SetToFistMode(self);
	CreateInvItems (self, ItMi_ScavengerEgg, Hlp_Random(2));
	CreateInvItems (self, ItMi_Ast, Hlp_Random(5));
	
	aivar[AIV_MM_BreedStart]= 0;
	aivar[AIV_MM_BreedEnd]	= 24;
};

INSTANCE Scavenger_Blut	(Mst_Default_Scavenger)
{
	name	= "Blutscavenger";

	B_SetVisuals_Scavenger_Blut();
	Npc_SetToFistMode(self);
};

INSTANCE Scavenger_6	(Mst_Default_Scavenger)
{
	B_SetVisuals_Scavenger_6();
	Npc_SetToFistMode(self);
};

INSTANCE YScavenger	(Mst_Default_Scavenger)
{
	level	=	3;

	name							=	"Junger Scavenger";

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	15;
	attribute	[ATR_HITPOINTS_MAX]	=	30;
	attribute	[ATR_HITPOINTS]		=	30;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	15000;
	protection	[PROT_EDGE]			=	15000;
	protection	[PROT_POINT]		=	1000;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	
	//----- Protections ----
	
	//----- Kampf-Taktik ----
	fight_tactic					= FAI_SCAVENGER;
	
	B_SetVisual_Scav();

	Mdl_SetModelScale(self, 0.9, 0.9, 0.9);
	Npc_SetToFistMode(self);
	Npc_RemoveInvItems (self, ItFo_MuttonRaw, 1);
};

INSTANCE GScavenger	(Mst_Default_Scavenger)
{
	level	=	15;

	name							=	"Riesenscavenger";
	//----- Attribute ----
	
	//----- Kampf-Taktik ----
	fight_tactic					= FAI_SCAVENGER;
	
	B_SetVisuals_Scavenger();
	Mdl_SetModelScale(self, 2.0, 2.0, 2.0);
	Npc_SetToFistMode(self);
};

INSTANCE Scavenger_Fett_01	(Mst_Default_Scavenger)
{
	level	=	8;
	name = "wohlgenährter Scavenger";

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	40;
	attribute	[ATR_HITPOINTS_MAX]	=	80;
	attribute	[ATR_HITPOINTS]		=	80;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	40000;
	protection	[PROT_EDGE]			=	40000;
	protection	[PROT_POINT]		=	40000;
	protection	[PROT_FIRE]			=	40;
	protection	[PROT_FLY]			=	40;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	B_SetVisual_Scav();

	Npc_SetToFistMode(self);
};

INSTANCE Scavenger_Fett_02	(Mst_Default_Scavenger)
{
	level	=	8;
	name = "wohlgenährter Scavenger";

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	40;
	attribute	[ATR_HITPOINTS_MAX]	=	80;
	attribute	[ATR_HITPOINTS]		=	80;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	40000;
	protection	[PROT_EDGE]			=	40000;
	protection	[PROT_POINT]		=	40000;
	protection	[PROT_FIRE]			=	40;
	protection	[PROT_FLY]			=	40;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	B_SetVisual_Scav();

	Npc_SetToFistMode(self);
};

INSTANCE Scavenger_Fett_03	(Mst_Default_Scavenger)
{
	level	=	8;
	name = "wohlgenährter Scavenger";

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	40;
	attribute	[ATR_HITPOINTS_MAX]	=	80;
	attribute	[ATR_HITPOINTS]		=	80;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	40000;
	protection	[PROT_EDGE]			=	40000;
	protection	[PROT_POINT]		=	40000;
	protection	[PROT_FIRE]			=	40;
	protection	[PROT_FLY]			=	40;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	B_SetVisual_Scav();

	Npc_SetToFistMode(self);
};

INSTANCE Scavenger_Fett_04	(Mst_Default_Scavenger)
{
	level	=	8;
	name = "wohlgenährter Scavenger";

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	40;
	attribute	[ATR_HITPOINTS_MAX]	=	80;
	attribute	[ATR_HITPOINTS]		=	80;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	40000;
	protection	[PROT_EDGE]			=	40000;
	protection	[PROT_POINT]		=	40000;
	protection	[PROT_FIRE]			=	40;
	protection	[PROT_FLY]			=	40;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	B_SetVisual_Scav();

	Npc_SetToFistMode(self);
};

INSTANCE Scavenger_Fett_05	(Mst_Default_Scavenger)
{
	level	=	8;
	name = "wohlgenährter Scavenger";

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	40;
	attribute	[ATR_HITPOINTS_MAX]	=	80;
	attribute	[ATR_HITPOINTS]		=	80;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	40000;
	protection	[PROT_EDGE]			=	40000;
	protection	[PROT_POINT]		=	40000;
	protection	[PROT_FIRE]			=	40;
	protection	[PROT_FLY]			=	40;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	B_SetVisual_Scav();

	Npc_SetToFistMode(self);
};