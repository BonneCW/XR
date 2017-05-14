INSTANCE Monster_11060_Leitwolf_TUG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Leitwolf";	
	guild 		= GIL_WOLF;
	id 			= 11060;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	level = 9;
	
	// ------ Attribute ------
	attribute	[ATR_STRENGTH]		=	50;
	attribute	[ATR_DEXTERITY]		=	30;
	attribute	[ATR_HITPOINTS_MAX]	=	100;
	attribute	[ATR_HITPOINTS]		=	100;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	45000;
	protection	[PROT_EDGE]			=	45000;
	protection	[PROT_POINT]		=	10000;
	protection	[PROT_FIRE]			=	45;
	protection	[PROT_FLY]			=	45;
	protection	[PROT_MAGIC]		=	10;																
		
	// ------ Kampf-Taktik ------	
	
	damagetype 		=	DAM_EDGE;

	// ------ Equippte Waffen ------																
	fight_tactic	=	FAI_WOLF;

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;

	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] 	= FALSE;

	Npc_SetToFistMode(self);
	
	// ------ Inventory ------
		
	// ------ visuals ------																			
	Mdl_SetVisual			(self,"Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------	
	CreateInvItems	(self, ItFo_Mutton, 1);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_11060;
};

FUNC VOID Rtn_Start_11060 ()
{	
	TA_Roam		(08,00,22,00,"TUG_86");
	TA_Roam		(22,00,08,00,"TUG_86");
};

FUNC VOID Rtn_Tot_11060 ()
{	
	TA_Roam		(08,00,22,00,"TOT");
	TA_Roam		(22,00,08,00,"TOT");
};