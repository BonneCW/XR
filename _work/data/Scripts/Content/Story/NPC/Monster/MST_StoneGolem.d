//***************************
//	Stonegolem Prototype			
//***************************

PROTOTYPE Mst_Default_StoneGolem(C_Npc)			
{
	//----- Monster ----
	name							=	"Steingolem";
	guild							=	GIL_STONEGOLEM;
	aivar[AIV_MM_REAL_ID]			= 	ID_STONEGOLEM;
	level							=	100;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	125;
	attribute	[ATR_DEXTERITY]		=	25;
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	100000;
	protection	[PROT_EDGE]			=	-1;
	protection	[PROT_POINT]		=	-1;
	protection	[PROT_FIRE]			=	-1;
	protection	[PROT_FLY]			=	-1;	
	protection	[PROT_MAGIC]		=	-1;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//---- Damage Types ----
	damagetype 						=	DAM_FLY;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_STONEGOLEM;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

//-------------------------------------------------------------
func void B_SetVisuals_StoneGolem()
{
	Mdl_SetVisual			(self,	"Golem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gol_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
func void B_SetVisuals_ErzGolem()
{
	Mdl_SetVisual			(self,	"Golem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"ErzGol_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
func void B_SetVisuals_EisenGolem()
{
	Mdl_SetVisual			(self,	"Golem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Eisengolem",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//******************
//	Stone Golem   	
//******************

INSTANCE StoneGolem	(Mst_Default_StoneGolem)
{
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode	(self);
};

INSTANCE ErzGolem	(Mst_Default_StoneGolem)
{
	name = "Erzgolem";
	aivar[AIV_MM_REAL_ID]			= 	ID_ERZGOLEM;

	B_SetVisuals_ErzGolem();
	Npc_SetToFistMode	(self);

	protection	[PROT_EDGE]			=	130;
	protection	[PROT_POINT]		=	130;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	-1;	
	protection	[PROT_MAGIC]		=	75;
};

INSTANCE ErzGolem_01	(Mst_Default_StoneGolem)
{
	name = "Erzgolem";
	aivar[AIV_MM_REAL_ID]			= 	ID_ERZGOLEM;

	B_SetVisuals_ErzGolem();
	Npc_SetToFistMode	(self);

	protection	[PROT_EDGE]			=	130;
	protection	[PROT_POINT]		=	130;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	-1;	
	protection	[PROT_MAGIC]		=	75;
};

INSTANCE ErzGolem_02	(Mst_Default_StoneGolem)
{
	name = "Erzgolem";
	aivar[AIV_MM_REAL_ID]			= 	ID_ERZGOLEM;

	B_SetVisuals_ErzGolem();
	Npc_SetToFistMode	(self);

	protection	[PROT_EDGE]			=	130;
	protection	[PROT_POINT]		=	130;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	-1;	
	protection	[PROT_MAGIC]		=	75;
};

INSTANCE ErzGolem_03	(Mst_Default_StoneGolem)
{
	name = "Erzgolem";
	aivar[AIV_MM_REAL_ID]			= 	ID_ERZGOLEM;

	B_SetVisuals_ErzGolem();
	Npc_SetToFistMode	(self);

	protection	[PROT_EDGE]			=	130;
	protection	[PROT_POINT]		=	130;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	-1;	
	protection	[PROT_MAGIC]		=	75;
};

INSTANCE ErzGolem_04	(Mst_Default_StoneGolem)
{
	name = "Erzgolem";
	aivar[AIV_MM_REAL_ID]			= 	ID_ERZGOLEM;

	B_SetVisuals_ErzGolem();
	Npc_SetToFistMode	(self);

	protection	[PROT_EDGE]			=	130;
	protection	[PROT_POINT]		=	130;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	-1;	
	protection	[PROT_MAGIC]		=	75;
};

INSTANCE ErzGolem_05	(Mst_Default_StoneGolem)
{
	name = "Erzgolem";
	aivar[AIV_MM_REAL_ID]			= 	ID_ERZGOLEM;

	B_SetVisuals_ErzGolem();
	Npc_SetToFistMode	(self);

	protection	[PROT_EDGE]			=	130;
	protection	[PROT_POINT]		=	130;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	-1;	
	protection	[PROT_MAGIC]		=	75;
};

INSTANCE ErzGolem_06	(Mst_Default_StoneGolem)
{
	name = "Erzgolem";
	aivar[AIV_MM_REAL_ID]			= 	ID_ERZGOLEM;

	B_SetVisuals_ErzGolem();
	Npc_SetToFistMode	(self);

	protection	[PROT_EDGE]			=	130;
	protection	[PROT_POINT]		=	130;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	-1;	
	protection	[PROT_MAGIC]		=	75;
};

INSTANCE ErzGolem_07	(Mst_Default_StoneGolem)
{
	name = "Erzgolem";
	aivar[AIV_MM_REAL_ID]			= 	ID_ERZGOLEM;

	B_SetVisuals_ErzGolem();
	Npc_SetToFistMode	(self);

	protection	[PROT_EDGE]			=	130;
	protection	[PROT_POINT]		=	130;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	-1;	
	protection	[PROT_MAGIC]		=	75;
};

INSTANCE ErzGolem_08	(Mst_Default_StoneGolem)
{
	name = "Erzgolem";
	aivar[AIV_MM_REAL_ID]			= 	ID_ERZGOLEM;

	B_SetVisuals_ErzGolem();
	Npc_SetToFistMode	(self);

	protection	[PROT_EDGE]			=	130;
	protection	[PROT_POINT]		=	130;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	-1;	
	protection	[PROT_MAGIC]		=	75;
};

INSTANCE EisenGolem	(Mst_Default_StoneGolem)
{
	name = "Eisengolem";
	aivar[AIV_MM_REAL_ID]			= 	ID_ERZGOLEM;

	B_SetVisuals_EisenGolem();
	Npc_SetToFistMode	(self);

	protection	[PROT_EDGE]			=	130;
	protection	[PROT_POINT]		=	130;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	-1;	
	protection	[PROT_MAGIC]		=	75;
};

INSTANCE GolemTransform	(Mst_Default_StoneGolem)
{
	Npc_PercEnable (self, PERC_ASSESSSURPRISE , B_StopMagicTransform);
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode	(self);
};

//******************
//	Summoned Golem   	
//******************

INSTANCE Summoned_Golem (Mst_Default_StoneGolem)
{
	name							=	"Beschworener Golem";
	guild							=	GIL_SUMMONED_GOLEM;
	aivar[AIV_MM_REAL_ID]			= 	ID_SUMMONED_GOLEM;
	level							=	0;
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode	(self);

	attribute	[ATR_STRENGTH]		=	125;
	attribute	[ATR_DEXTERITY]		=	25;
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	50000;
	protection	[PROT_EDGE]			=	-1;
	protection	[PROT_POINT]		=	-1;
	protection	[PROT_FIRE]			=	-1;
	protection	[PROT_FLY]			=	-1;	
	protection	[PROT_MAGIC]		=	-1;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
};

INSTANCE StoneGolem_Turendil (Mst_Default_StoneGolem)
{
	name							=	"Beschworener Golem";
	guild							=	GIL_SUMMONED_GOLEM;
	aivar[AIV_MM_REAL_ID]			= 	ID_SUMMONED_GOLEM;
	level							=	0;
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode	(self);

	attribute	[ATR_STRENGTH]		=	125;
	attribute	[ATR_DEXTERITY]		=	125;
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	50000;
	protection	[PROT_EDGE]			=	-1;
	protection	[PROT_POINT]		=	-1;
	protection	[PROT_FIRE]			=	-1;
	protection	[PROT_FLY]			=	-1;	
	protection	[PROT_MAGIC]		=	-1;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
};

//###########################
//##
//##	Shattered Golem
//##
//###########################

//**************
//ZS_GolemDown
//**************

func void ZS_GolemDown ()
{
	self.senses			=	SENSE_SMELL ;
	self.senses_range	=	2000;	
	Npc_SetPercTime		(self, 1);	
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER	, 	B_GolemRise	); 

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};
		
func int ZS_GolemDown_LOOP ()	
{
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
  	{
  		AI_PlayAni (self,"T_DEAD");
  		self.aivar[AIV_TAPOSITION] = ISINPOS;
  	};
	return LOOP_CONTINUE;
};

func void ZS_GolemDown_END()
{
	
};

func void B_GolemRise ()
{
	if (Npc_GetDistToNpc (self,hero) <= 700)
	&& (Mob_HasItems ("NW_GOLEMCHEST",ItSe_GolemChest_Mis) == 0)
	{
		AI_PlayAni (self,"T_RISE");
		self.NoFocus	= FALSE;
		self.name			=	"Steingolem";
		self.flags				   			= 	0;
		
		AI_StartState 		(self, ZS_MM_Attack, 0, "");
		self.bodyStateInterruptableOverride 	= FALSE;
		self.start_aistate				= ZS_MM_AllScheduler;
		self.aivar[AIV_MM_RestStart] 	= OnlyRoutine;
	};
		
};

//************************************************************************************
//	Shattered_Golem ->liegt am Boden und setzt sich bei Annäherung des Hero zusammen
//************************************************************************************

INSTANCE Shattered_Golem (Mst_Default_StoneGolem)
{
	name							=	"";
	guild							=	GIL_STONEGOLEM;
	aivar[AIV_MM_REAL_ID]			= 	ID_STONEGOLEM;
	level							=	18;
	
	NoFocus	= TRUE;
	
	flags				   			= 	NPC_FLAG_IMMORTAL;
	bodyStateInterruptableOverride = TRUE;
	
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode	(self);
	
	start_aistate				= ZS_GolemDown;
	
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE Golem_Trador_01	(Mst_Default_StoneGolem)
{
	name = "Beschworener Steingolem";

	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode	(self);

	attribute	[ATR_STRENGTH]		=	95;
	attribute	[ATR_DEXTERITY]		=	10;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;

	protection	[PROT_EDGE]			=	30000;
	protection	[PROT_POINT]		=	30000;
	protection	[PROT_FIRE]			=	30000;
	protection	[PROT_FLY]			=	-1;	
	protection	[PROT_MAGIC]		=	30;

	CreateInvItems	(self, ItPo_Health_02, 1);
};

INSTANCE Golem_Trador_02	(Mst_Default_StoneGolem)
{
	name = "Beschworener Steingolem";

	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode	(self);

	attribute	[ATR_STRENGTH]		=	95;
	attribute	[ATR_DEXTERITY]		=	10;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;

	protection	[PROT_EDGE]			=	30000;
	protection	[PROT_POINT]		=	30000;
	protection	[PROT_FIRE]			=	30000;
	protection	[PROT_FLY]			=	-1;	
	protection	[PROT_MAGIC]		=	30;

	CreateInvItems	(self, ItPo_Mana_02, 1);
};

INSTANCE Golem_Trador_03	(Mst_Default_StoneGolem)
{
	name = "Beschworener Steingolem";

	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode	(self);

	attribute	[ATR_STRENGTH]		=	95;
	attribute	[ATR_DEXTERITY]		=	10;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;

	protection	[PROT_EDGE]			=	30000;
	protection	[PROT_POINT]		=	30000;
	protection	[PROT_FIRE]			=	30000;
	protection	[PROT_FLY]			=	-1;	
	protection	[PROT_MAGIC]		=	30;

	CreateInvItems	(self, ItPo_Health_03, 1);
	CreateInvItems	(self, ItPo_Mana_03, 1);
};

INSTANCE Golem_DeanKiller	(Mst_Default_StoneGolem)
{
	name = "Beschworener Steingolem";

	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode	(self);

	CreateInvItems	(self, ItWr_DeanGekillt, 1);

	protection	[PROT_EDGE]			=	50000;
	protection	[PROT_POINT]		=	50000;
	protection	[PROT_FIRE]			=	50000;
	protection	[PROT_FLY]			=	-1;	
	protection	[PROT_MAGIC]		=	50;
};