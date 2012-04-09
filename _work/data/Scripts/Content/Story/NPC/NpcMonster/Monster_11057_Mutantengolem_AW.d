INSTANCE Monster_11057_Mutantengolem_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Mutantengolem";	
	guild							=	GIL_STONEGOLEM;
	level							=	50;
	id = 11057;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		= 155;
	attribute	[ATR_DEXTERITY]		= 125;
	attribute	[ATR_HITPOINTS_MAX]	= 3000;
	attribute	[ATR_HITPOINTS]		= 3000;
	attribute	[ATR_MANA_MAX] 		= 0;
	attribute	[ATR_MANA] 			= 0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	
	//----- Protections ----
	protection	[PROT_BLUNT]		= 90000;
	protection	[PROT_EDGE]			= 90000;
	protection	[PROT_POINT]		= -1;
	protection	[PROT_FIRE]			= -1;
	protection	[PROT_FLY]			= -1;	
	protection	[PROT_MAGIC]		= -1;
	
	//---- Damage Types ----
	damagetype 						=	DAM_BLUNT|DAM_FLY;
	damage		[DAM_INDEX_BLUNT]	=	154;
	damage		[DAM_INDEX_FLY]		=	1;																
		
	// ------ Kampf-Taktik ------
	fight_tactic	=	FAI_STONEGOLEM;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	Mdl_SetVisual			(self,	"SwampGolem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gol_Sumpf_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_11057;
};

FUNC VOID Rtn_Start_11057 ()
{	
	TA_Roam		(08,00,22,00,"BL_UP_PLACE_06");
	TA_Roam		(22,00,08,00,"BL_UP_PLACE_06");
};

FUNC VOID Rtn_Angriff_11057 ()
{	
	TA_Roam		(08,00,22,00,"BL_RAVEN_01");
	TA_Roam		(22,00,08,00,"BL_RAVEN_01");
};

FUNC VOID Rtn_Tor_11057 ()
{	
	TA_Roam		(08,00,22,00,"BL_RAVEN_CHECK");
	TA_Roam		(22,00,08,00,"BL_RAVEN_CHECK");
};