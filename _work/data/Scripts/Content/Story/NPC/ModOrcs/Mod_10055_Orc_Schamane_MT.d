INSTANCE Mod_10055_Orc_Schamane_MT (Npc_Default)			
{
	//----- Monster -----
	name							=	"Ork Shamane";
	guild							=	GIL_ORC;
	id			= 	10055;
	voice							=	18;
	level							=	30;
	Npctype 	=		NPCTYPE_MAIN;
	flags = 0;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;

	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	100; //+ca. 50-80 Waffe //MIN 100 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	130000;
	protection	[PROT_EDGE]			=	130000;
	protection	[PROT_POINT]		=	130000;
	protection	[PROT_FIRE]			=	130;
	protection	[PROT_FLY]			=	130;
	protection	[PROT_MAGIC]		=	65;
	
	//----- HitChances -----
	HitChance	[NPC_TALENT_1H]			= 60;
	HitChance	[NPC_TALENT_2H]			= 60;
	HitChance	[NPC_TALENT_BOW]		= 60;
	HitChance	[NPC_TALENT_CROSSBOW]	= 60;
	
	//----- Damage Types ----	
	damagetype 						=	DAM_EDGE;

	fight_tactic	=	FAI_ORC;

	EquipItem (self, ItMw_2H_OrcAxe_01);

	senses			= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	= PERC_DIST_ORC_ACTIVE_MAX;

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Orc_BodyShaman",	DEFAULT,	DEFAULT,	"Orc_HeadShaman",	DEFAULT,  	DEFAULT,	-1);

	
	daily_routine = Rtn_Start_10055;
};

FUNC VOID Rtn_Start_10055()
{
	TA_Sleep_Orc	(00,00,05,00,"OW_ORC_SHAMAN_ROOM3_3");
	TA_Pray_Orc		(05,00,07,00,"OW_ORC_SHAMAN_ROOM3_3");
	TA_Sit_Orc		(07,00,22,00,"OW_ORC_SHAMAN_ROOM3_3");
	TA_Pray_Orc		(22,00,24,00,"OW_ORC_SHAMAN_ROOM3_3");
};