INSTANCE Mod_4021_Orc_Gobshak_MT (Npc_Default)			
{
	//----- Monster -----
	name							=	"Gobshak";
	guild							=	GIL_FRIENDLY_ORC;
	id			= 	4021;
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
	Mdl_SetVisualBody		(self,	"Orc_BodyWarrior",	DEFAULT,	DEFAULT,	"Orc_HeadWarrior",	DEFAULT,  	DEFAULT,	-1);
	
	EquipItem	(self, ItMw_1H_Eminem_Eisenklinge_02);

	daily_routine	=	Rtn_Start_4021;
};

FUNC VOID Rtn_Start_4021()
{
	TA_Stand_WP_Orc		(08,00,20,00,"LOCATION_19_03_ROOM6");
	TA_Stand_WP_Orc		(20,00,08,00,"LOCATION_19_03_ROOM6");
};