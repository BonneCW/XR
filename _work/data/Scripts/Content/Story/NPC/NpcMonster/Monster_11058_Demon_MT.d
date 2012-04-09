INSTANCE Monster_11058_Demon_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dämon";	
	guild 		= GIL_DEMON;
	id 			= 11058;
	voice 		= 20;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	level = 60;
	
	// ------ Attribute ------
	attribute	[ATR_STRENGTH]		=	150;
	attribute	[ATR_DEXTERITY]		=	250;
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;
	attribute	[ATR_MANA_MAX] 		=	200;
	attribute	[ATR_MANA] 			=	200;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	7500;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	75000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	protection	[PROT_MAGIC]		=	75;																	
		
	// ------ Kampf-Taktik ------	
	
	damagetype 		=	DAM_FIRE;

	// ------ Equippte Waffen ------																
	fight_tactic	=	FAI_DEMON;

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;

	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] 	= FALSE;

	Npc_SetToFistMode(self);
	
	// ------ Inventory ------
		
	// ------ visuals ------																			
	Mdl_SetVisual			(self,	"Demon.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dem_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------	
	CreateInvItems	(self, theriddle2, 1);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_11058;
};

FUNC VOID Rtn_Start_11058 ()
{	
	TA_Roam		(08,00,22,00,"LOCATION_19_03_ROOM3");
	TA_Roam		(22,00,08,00,"LOCATION_19_03_ROOM3");
};