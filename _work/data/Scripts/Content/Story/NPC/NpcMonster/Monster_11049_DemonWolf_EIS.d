INSTANCE Monster_11049_DemonWolf_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dämonischer Wolf";	
	guild 		= GIL_DEMON;
	id 			= 11049;
	voice 		= 20;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	effect	= "SPELLFX_DARKARMOR";
	level = 30;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	200;
	attribute	[ATR_DEXTERITY]		=	30;
	attribute	[ATR_HITPOINTS_MAX]	=	360;
	attribute	[ATR_HITPOINTS]		=	360;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	30000;
	protection	[PROT_EDGE]			=	30000;
	protection	[PROT_POINT]		=	1000;
	protection	[PROT_FIRE]			=	30;
	protection	[PROT_FLY]			=	30;
	protection	[PROT_MAGIC]		=	0;

	//---- Damage Types ----
	damagetype 						=	DAM_EDGE;	

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
	Mdl_SetVisualBody		(self,	"DemonWolf_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	Mdl_SetModelScale(self, 1.5, 1.5, 1.5);
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------	

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_11049;
};

FUNC VOID Rtn_Start_11049 ()
{		
	TA_Roam		(08,00,22,00,"EIS_258");
	TA_Roam		(22,00,08,00,"EIS_258");
};

FUNC VOID Rtn_Tot_11049 ()
{	
	TA_Roam		(08,00,22,00,"TOT");
	TA_Roam		(22,00,08,00,"TOT");
};