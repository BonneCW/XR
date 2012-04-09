INSTANCE Monster_11068_Eisriese_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Eisriese";	
	guild 		= GIL_ICEGOLEM;
	id 			= 11068;
	aivar[AIV_MM_REAL_ID]			= 	ID_ICEGOLEM;
	voice 		= 20;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	level							=	300;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	225;
	attribute	[ATR_DEXTERITY]		=	225;
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	-1;
	protection	[PROT_EDGE]			=	-1;
	protection	[PROT_POINT]		=	-1;
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	-1;
	protection	[PROT_MAGIC]		=	100;
	
	//----- Damage Types ----
	damagetype 						=	DAM_BLUNT|DAM_FLY;	

	// ------ Equippte Waffen ------																
	fight_tactic	=	FAI_STONEGOLEM;

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;

	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] 	= FALSE;

	Npc_SetToFistMode(self);
	
	// ------ Inventory ------
		
	// ------ visuals ------																			
	Mdl_SetVisual			(self,	"Golem.mds");
	Mdl_ApplyOverlayMds 	(self,	"Golem_Icegolem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gol_Ice_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------	

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_11068;
};

FUNC VOID Rtn_Start_11068 ()
{		
	TA_Roam		(08,00,22,00,"EISRIESE_01");
	TA_Roam		(22,00,08,00,"EISRIESE_01");
};