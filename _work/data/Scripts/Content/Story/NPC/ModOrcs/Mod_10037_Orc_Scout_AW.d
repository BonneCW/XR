INSTANCE Mod_10037_Orc_Scout_AW (Npc_Default)			
{
	//----- Monster -----
	name							=	"Ork Späher";
	guild							=	GIL_ORC;
	id			= 	10037;
	voice							=	18;
	level							=	30;
	Npctype 	=		NPCTYPE_MAIN;

	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	75; //+ca. 50-80 Waffe //MIN 100 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	200;
	attribute	[ATR_HITPOINTS]		=	200;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	80000;
	protection	[PROT_EDGE]			=	80000;
	protection	[PROT_POINT]		=	80000;
	protection	[PROT_FIRE]			=	80;
	protection	[PROT_FLY]			=	80;
	protection	[PROT_MAGIC]		=	20;
	
	//----- HitChances -----
	HitChance	[NPC_TALENT_1H]			= 40;
	HitChance	[NPC_TALENT_2H]			= 40;
	HitChance	[NPC_TALENT_BOW]		= 40;
	HitChance	[NPC_TALENT_CROSSBOW]	= 40;
	
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
	Mdl_SetVisualBody		(self,	"Orc_BodyScout",	DEFAULT,	DEFAULT,	"Orc_HeadWarrior",	DEFAULT,  	DEFAULT,	-1);
	
	daily_routine	=	Rtn_Start_10037;
};

FUNC VOID Rtn_Start_10037()
{
	TA_Stand_WP_Orc		(05,00,00,00,"ADW_CANYON_PATH_TO_LIBRARY_16");
	TA_Stand_WP_Orc		(00,00,05,00,"ADW_CANYON_PATH_TO_LIBRARY_16");
};