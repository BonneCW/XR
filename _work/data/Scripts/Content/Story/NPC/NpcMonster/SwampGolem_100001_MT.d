INSTANCE SwampGolem_100001_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Heulender Sumpfmensch";
	guild 		= GIL_SUMMONED_GOLEM;
	id 			= 100001;
	voice 		= 18;
	npctype		= NPCTYPE_MAIN;
	flags		= 2;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		= Hlp_Random(81) + 115;	// 115 - 195
	attribute	[ATR_DEXTERITY]		= Hlp_Random(21) + 10;	// 10 - 30
	attribute	[ATR_HITPOINTS_MAX]	= Hlp_Random(201) + 200;	// 200 - 400
	attribute	[ATR_HITPOINTS]		= attribute[ATR_HITPOINTS_MAX];
	attribute	[ATR_MANA_MAX] 		= 0;
	attribute	[ATR_MANA] 		= 0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		= Hlp_Random(41)*1000 + 70000;	// 70 - 110
	protection	[PROT_EDGE]		= Hlp_Random(41)*1000 + 70000;	// 70 - 110
	protection	[PROT_POINT]		= -1;
	protection	[PROT_FIRE]		= -1;
	protection	[PROT_FLY]		= -1;	
	protection	[PROT_MAGIC]		= -1;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//---- Damage Types ----
	damagetype 						=	DAM_BLUNT|DAM_FLY;
	damage		[DAM_INDEX_BLUNT]	=	attribute[ATR_STRENGTH]-1;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
	damage		[DAM_INDEX_FLY]		=	1;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_STONEGOLEM;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	
	Mdl_SetVisual			(self,	"SwampGolem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gol_Sumpf_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_11023;
};

FUNC VOID Rtn_Start_100001 ()
{	
	TA_Roam		(05,00,00,00,"OW_PATH_BLOODFLY11_SPAWN01");
	TA_Roam		(00,00,05,00,"OW_PATH_BLOODFLY11_SPAWN01");
};

FUNC VOID Rtn_AtJoru_100001 ()
{	
	TA_Roam		(05,00,00,00,"PSI_11_HUT_EX");
	TA_Roam		(00,00,05,00,"PSI_11_HUT_EX");
};