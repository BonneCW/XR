INSTANCE Monster_11053_Demonlord_IR (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dämonenlord";	
	guild 		= GIL_DEMON;
	id 			= 11053;
	voice 		= 20;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	level = 150;
	
	// ------ Attribute ------
	attribute	[ATR_STRENGTH]		= 300;
	attribute	[ATR_DEXTERITY]		= 300;
	attribute	[ATR_HITPOINTS_MAX]	= 600;
	attribute	[ATR_HITPOINTS]		= 600;
	attribute	[ATR_MANA_MAX] 		= 200;
	attribute	[ATR_MANA] 			= 200;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	
	//------ Protections ----
	protection	[PROT_BLUNT]		= 200000;
	protection	[PROT_EDGE]			= 200000;
	protection	[PROT_POINT]		= 200000;
	protection	[PROT_FIRE]			= 200;		
	protection	[PROT_FLY]			= 200;	
	protection	[PROT_MAGIC]		= 200;																
		
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
	Mdl_SetVisualBody		(self,	"Dem2_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------	

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_11053;
};

FUNC VOID Rtn_Start_11053 ()
{	
	TA_Roam		(08,00,22,00,"DI_ORKOBERST");
	TA_Roam		(22,00,08,00,"DI_ORKOBERST");
};