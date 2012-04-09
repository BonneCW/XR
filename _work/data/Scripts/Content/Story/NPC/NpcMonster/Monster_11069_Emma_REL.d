INSTANCE Monster_11069_Emma_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Emma";	
	guild 		= GIL_SHEEP;
	id 			= 11069;
	aivar[AIV_MM_REAL_ID]			= 	ID_SHEEP;
	voice 		= 20;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	level							=	1;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	5;
	attribute	[ATR_DEXTERITY]		=	5;
	attribute	[ATR_HITPOINTS_MAX]	=	5;
	attribute	[ATR_HITPOINTS]		=	5;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	0;
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	// ------ Equippte Waffen ------																
	fight_tactic	=	FAI_STONEGOLEM;

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;

	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] 	= FALSE;

	Npc_SetToFistMode(self);
	
	// ------ Inventory ------
		
	Mdl_SetVisual			(self,	"Sheep.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sheep_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	
	// ------ NSC-relevante Talente vergeben ------
	
	// ------ Kampf-Talente ------	

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_11069;
};

FUNC VOID Rtn_Start_11069 ()
{		
	TA_Roam		(08,00,22,00,"REL_SURFACE_224");
	TA_Roam		(22,00,08,00,"REL_SURFACE_224");
};

FUNC VOID Rtn_Follow_11069 ()
{		
	TA_Follow_Player	(08,00,22,00,"REL_SURFACE_224");
	TA_Follow_Player	(22,00,08,00,"REL_SURFACE_224");
};

FUNC VOID Rtn_Wild_11069 ()
{		
	TA_Roam		(08,00,22,00,"REL_SURFACE_225");
	TA_Roam		(22,00,08,00,"REL_SURFACE_225");
};

FUNC VOID Rtn_Metzger_11069 ()
{		
	TA_Roam		(08,00,22,00,"FLEISCHER_03");
	TA_Roam		(22,00,08,00,"FLEISCHER_03");
};

FUNC VOID Rtn_Tot_11069 ()
{		
	TA_Roam		(08,00,22,00,"TOT");
	TA_Roam		(22,00,08,00,"TOT");
};