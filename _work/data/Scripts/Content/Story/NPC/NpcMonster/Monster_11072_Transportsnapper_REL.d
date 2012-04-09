INSTANCE Monster_11072_Transportsnapper_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Transportsnapper";	
	guild 		= GIL_SHEEP;
	id 			= 11072;
	aivar[AIV_MM_REAL_ID]			= 	ID_SNAPPER;
	voice 		= 20;
	flags       = 2;																	
	npctype		= NPCTYPE_MAIN;
	level							=	12;
	
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
		
	Mdl_SetVisual			(self,	"Snapper.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"TranSna_Body",		0,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	
	// ------ NSC-relevante Talente vergeben ------
	
	// ------ Kampf-Talente ------	

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_11072;
};

FUNC VOID Rtn_Start_11072 ()
{		
	TA_Roam			(07,00,07,30,"REL_129");
	TA_Roam			(07,30,08,00,"REL_116");
	TA_Roam			(08,00,18,00,"REL_SURFACE_206");
	TA_Roam			(18,00,18,30,"REL_116");
	TA_Roam			(18,30,19,00,"REL_129");
	TA_Roam			(19,00,07,00,"REL_CITY_363");
};