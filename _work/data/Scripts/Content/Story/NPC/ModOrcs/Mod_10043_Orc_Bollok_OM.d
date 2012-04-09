INSTANCE Mod_10043_Orc_Bollok_OM (Npc_Default)			
{
	//----- Monster -----
	name							=	"Bollok";
	guild							=	GIL_FRIENDLY_ORC;
	id			= 	10043;
	voice							=	18;
	level							=	30;
	Npctype 	=		NPCTYPE_MAIN;

	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	150; //+ca. 50-80 Waffe //MIN 100 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	150000;
	protection	[PROT_EDGE]			=	150000;
	protection	[PROT_POINT]		=	150000;
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	20;
	
	//----- HitChances -----
	HitChance	[NPC_TALENT_1H]			= 60;
	HitChance	[NPC_TALENT_2H]			= 60;
	HitChance	[NPC_TALENT_BOW]		= 60;
	HitChance	[NPC_TALENT_CROSSBOW]	= 60;
	
	//----- Damage Types ----	
	damagetype 						=	DAM_EDGE;

	fight_tactic	=	FAI_ORC;

	senses			= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	= PERC_DIST_ORC_ACTIVE_MAX;

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Orc_BodySlave",	1,	1,	"Orc_HeadSlave",	1,  	1,	-1);
	
	daily_routine	=	Rtn_Start_10043;
};

FUNC VOID Rtn_Start_10043()
{
	TA_Sit_Orc		(07,00,22,00,"OM_CAVE1_83");
	TA_Sit_Orc		(22,00,07,00,"OM_CAVE1_83");
};

FUNC VOID Rtn_Tot_10043()
{
	TA_Sit_Orc		(07,00,22,00,"TOT");
	TA_Sit_Orc		(22,00,07,00,"TOT");
};