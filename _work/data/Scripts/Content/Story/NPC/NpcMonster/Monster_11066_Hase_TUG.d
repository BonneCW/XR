INSTANCE Monster_11066_Hase_TUG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Hase";	
	guild							=	GIL_SHEEP;
	aivar[AIV_MM_REAL_ID]			= 	ID_Rabbit;
	id 			= 11066;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	level = 1;
	
	// ------ Attribute ------
	attribute	[ATR_STRENGTH]		=	5;
	attribute	[ATR_DEXTERITY]		=	5;
	attribute	[ATR_HITPOINTS_MAX]	=	5;
	attribute	[ATR_HITPOINTS]		=	5;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

	//----- Protection ----
	protection	[PROT_BLUNT]		=	1000;
	protection	[PROT_EDGE]			=	1000;
	protection	[PROT_POINT]		=	1000;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;																
		
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
	Mdl_SetVisual			(self,"Zaic.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self, "Zaic",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_11066;
};

FUNC VOID Rtn_Start_11066 ()
{	
	TA_Roam		(08,00,22,00,"TUG_90");
	TA_Roam		(22,00,08,00,"TUG_90");
};