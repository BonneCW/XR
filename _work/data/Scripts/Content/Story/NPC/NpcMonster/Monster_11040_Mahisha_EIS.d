INSTANCE Monster_11040_Mahisha_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Mahisha";	
	guild 		= GIL_DEMON;
	id 			= 11040;
	voice 		= 20;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	level = 400;
	
	// ------ Attribute ------
	attribute[ATR_HITPOINTS_MAX] = 20000;
	attribute[ATR_HITPOINTS] = 20000;
	attribute[ATR_STRENGTH] = 800;	

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];																
		
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
	Mdl_SetVisual		(self,	"Minotaurus.mds");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody	(self,	"Mino_Body",	DEFAULT,	DEFAULT,	"",	DEFAULT,  	DEFAULT,	-1);
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------	

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_11040;
};

FUNC VOID Rtn_Start_11040 ()
{	
	TA_Roam		(08,00,22,00,"EIS_258");
	TA_Roam		(22,00,08,00,"EIS_258");
};

FUNC VOID Rtn_Tot_11040 ()
{	
	TA_Roam		(08,00,22,00,"TOT");
	TA_Roam		(22,00,08,00,"TOT");
};