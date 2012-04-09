INSTANCE Mod_10002_Orc_HoshPak_MT (Npc_Default)			
{
	//----- Monster -----
	name							=	"Hosh Pak";
	guild							=	GIL_ORC;
	id			= 	10002;
	voice							=	18;
	level							=	30;
	Npctype 	=		NPCTYPE_MAIN;
	flags = 2;
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

	senses			= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	= PERC_DIST_ORC_ACTIVE_MAX;

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;

	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Orc_BodyShaman",	DEFAULT,	DEFAULT,	"Orc_HeadShaman",	DEFAULT,  	DEFAULT,	-1);

	
	daily_routine = Rtn_Start_10002;
};

FUNC VOID Rtn_Start_10002()
{
	TA_Stand_WP_Orc		(08,00,20,00,"ORKSTADT_HOSHPAK");
	TA_Stand_WP_Orc		(20,00,08,00,"ORKSTADT_HOSHPAK");
};

FUNC VOID Rtn_Friedhof_10002()
{
	TA_Stand_WP_Orc		(08,00,20,00,"TOT");
	TA_Stand_WP_Orc		(20,00,08,00,"TOT");
};